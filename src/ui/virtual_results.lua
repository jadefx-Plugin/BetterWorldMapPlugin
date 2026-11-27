-- virtual_results.lua
-- Used by: main.lua.
-- Keeps complete search results in Lua while allocating only visible native list rows.

--[=[
BEGINNER WALKTHROUGH: virtual_results.lua

This adapter saves PrettyUI methods before replacing methods on ONE list object. Colon calls
automatically supply self. A full-result ID always addresses the original matches array, even
when its physical row is not currently built.

Function comments below state the caller, what inputs represent, and the return value
or side effects. For coordinates, distinguish world map tiles from UI pixels/units.
A nil result means unavailable/no match; it is different from valid numeric ID 0.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: main.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Virtual scrolling adapter for the PrettyUI list used by both catalogues.
Retains the native wheel/scrollbar behavior and full scroll extent while constructing
only the visible row range plus a small buffer. Entry IDs remain full-result indices,
so selection callbacks still address the correct record after scrolling.
The recursion guard is required because PrettyUI SetEntries itself sets scroll position.
]]

-- Keep the native list scrollbar, but construct only the rows around its viewport.
local M = {}

-- main.lua supplies an existing PrettyUI List; returns an adapter with SetResults and replaces
-- only that list's scrolling/selection methods.
function M.new(list)
    local self = { items = {}, first = 0, last = 0 }
    local setEntries = list.SetEntries
    local setScroll = list.SetScrollPosition
    local onChange = list.onChange
    local unselect = list.UnselectAll
    if unselect then
        -- main.lua's catalogue clearing calls this; clears the remembered full-results
        -- selection, delegates to the original PrettyUI method and returns its result.
        function list:UnselectAll(...)
            self.virtualResults.selected = nil
            return unselect(self, ...)
        end
    end
    -- Callback/function list.onChange; inputs: control,id,selected,....
    -- PrettyUI calls when a visible row changes selection; remembers its original
    -- full-results id and forwards control/id/selected/extra arguments to main.lua's
    -- original callback.
    list.onChange = function(control, id, selected, ...)
        if selected then
            self.selected = id
        end
        if onChange then
            return onChange(control, id, selected, ...)
        end
    end
    -- Use global scroll coordinates while rebuilding just the visible slice of logical entries.

    -- Native wheel/scrollbar/resize handling supplies a logical pixel offset; constructs
    -- just the visible result slice, restores full scroll extent and delegates layout to the
    -- saved method.
    function list:SetScrollPosition(value)
        if self._virtualBuilding then
            return setScroll(self, value)
        end
        local h = self:_ViewportHeight()
        local total = math.max(1, #self.virtualResults.items * self.entryHeight)
        local y = math.max(0, math.min(math.floor(value or 0), math.max(0, total - h)))
        local first = math.max(1, math.floor(y / self.entryHeight))
        local last = math.min(#self.virtualResults.items, math.ceil((y + h) / self.entryHeight) + 1)
        local state = self.virtualResults
        if first ~= state.first or last ~= state.last then
            state.first, state.last = first, last
            local entries = {}
            for i = first, last do
                entries[#entries + 1] =
                    { label = state.items[i].name, id = i, selected = state.selected == i }
            end
            -- PrettyUI SetEntries re-enters SetScrollPosition; delegate that nested
            -- call to the original method.
            self._virtualBuilding = true
            setEntries(self, entries)
            self._virtualBuilding = false
            for i, row in ipairs(self.rows) do
                row.root:SetPos(0, (first + i - 2) * self.entryHeight)
            end
        end
        -- Restore the full logical extent after PrettyUI measured the short physical row slice.
        self.contentHeight = total
        self.viewport:SetScrollSize(math.max(1, self:_ResolvedWidth() - 2), math.max(h, total))
        return setScroll(self, y)
    end
    list.virtualResults = self
    -- A new query resets scroll and selection; all matching records remain reachable.

    -- main.lua.refreshResults supplies all ordered matches; resets selection/scroll and asks
    -- the adapted list to build the first visible slice.
    function self:SetResults(items)
        self.items = items
        self.first, self.last = 0, 0
        self.selected = nil
        list:SetScrollPosition(0)
    end
    return self
end
return M
