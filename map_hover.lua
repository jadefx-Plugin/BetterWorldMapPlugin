-- map_hover.lua
-- Used by: main.lua.
-- Opens local drop-reference windows and handles clicks on searched monster pins.

--[[
Local monster-drop popup and selected-Bestiary-pin click handling.
Reads bundled Wiki-derived records and cached item-ID mappings; no runtime Wiki requests.
Rates and quantities are reference text, not loot predictions. Unknown item artwork is
shown explicitly. This module owns and disposes its popup, grid and fallback tooltips.
]]

local data = require("monster_drops")

local itemIDs = require("drop_item_ids")
local M = {}

-- Private markup helper; returns text with angle brackets escaped so item names/rates are not
-- interpreted as UI markup.
local function escape(s)
    return tostring(s or ""):gsub("<", "&lt;"):gsub(">", "&gt;")
end

-- The drop-grid builder supplies one drop row; returns its formatted name/rate/quantity text
-- with Unknown fallbacks.
function M.tooltip(drop)
    return escape(drop.name)
        .. "<br>Drop rate: "
        .. escape(drop.rarity ~= "" and drop.rarity or "Unknown")
        .. "<br>Quantity: "
        .. escape(drop.quantity ~= "" and drop.quantity or "Unknown")
end

-- main.lua supplies PrettyUI, map/window objects and getSelection (a function returning the
-- current catalogue entry); returns the local drop-popup controller.
function M.new(P, view, input, root, window, parent, getSelection)
    local self = { pins = {}, popup = nil, grid = nil, fallbacks = {} }

    -- main.lua calls on selection/visibility changes; closes the existing popup without
    -- destroying the controller.
    function self:Hide()
        if self.popup then
            self.popup:Close()
        end
    end

    -- main.lua.draw supplies screen-space selected-catalogue pin positions; stores them for
    -- Click hit testing.
    function self:SetPins(pins)
        self.pins = pins
    end

    -- Open and Shutdown call this; destroys fallback tooltips, item grid and popup in
    -- ownership order.
    function self:Clear()
        for _, tooltip in ipairs(self.fallbacks) do
            tooltip:Destroy()
        end
        self.fallbacks = {}
        if self.grid then
            self.grid:Destroy()
            self.grid = nil
        end
        if self.popup then
            self.popup:Destroy()
            self.popup = nil
        end
    end
    -- Recreate only the selected monster popup and clamp its placement to the client surface.

    -- Menu/dot/pin handlers supply an entry whose name indexes monster_drops; reads
    -- drop_item_ids and builds a bounded PrettyUI popup. Missing records produce explanatory
    -- UI instead.
    function self:Open(entry)
        self:Clear()
        local record = data[entry.name]
        local drops = record and record.drops or {}
        local rows = math.max(1, math.ceil(#drops / 7))
        local x = (window.root.x or 0) + window.root.width + 8
        local y = window.root.y or 0
        local width, height = 348, math.min(460, math.max(240, rows * 44 + 100))
        x = math.max(0, math.min(x, math.max(0, parent.width - width)))
        y = math.max(0, math.min(y, math.max(0, parent.height - height)))
        self.popup = P.Window.new(parent, {
            title = entry.name,
            x = x,
            y = y,
            width = width,
            height = height,
            minWidth = 348,
            minHeight = 240,
            resizable = true,
            scrollable = true,
            contentHeight = rows * 44 + 70,
            destroyOnClose = false,
        })
        local caption = ui.Text.new(self.popup.content)
        caption:SetPos(8, 4)
        caption:SetSize(304, 26)
        caption.font = id.Font.MUSEO_SANS_15PT_REGULAR
        caption.rgba = 0xE7D7B0FF
        caption.clickthrough = true
        caption.content = "Combat level: " .. tostring(record and record.level or "Unknown")
        if #drops == 0 then
            caption.content = "No drop information recorded."
            return
        end
        local objects = {}
        for index, drop in ipairs(drops) do
            local itemID = itemIDs[drop.name]
            objects[index] =
                { object = itemID and { id = itemID } or nil, tooltip = M.tooltip(drop) }
        end
        self.grid = P.ItemGrid.new(self.popup.content, objects, {
            x = 8,
            y = 34,
            columns = 7,
            rows = rows,
            gap = 4,
            dragDrop = false,
            _onScrollWheel = self.popup._onScrollWheel,
        })
        -- Wiki table categories and unlocks have no inventory icon; retain their
        -- rates in an explicitly marked slot instead of silently dropping them.
        for index, drop in ipairs(drops) do
            if not itemIDs[drop.name] then
                local slot = self.grid:GetSlot(index)
                local label = ui.Text.new(slot.root)
                label:SetPos(10, 6)
                label:SetSize(24, 28)
                label.content = "?"
                label.font = id.Font.MUSEO_SANS_15PT_REGULAR
                label.rgba = 0xE7D7B0FF
                label.clickthrough = true
                slot.root.clickthrough = false
                self.fallbacks[#self.fallbacks + 1] = P.Tooltip.attach(
                    slot.root,
                    slot.parent,
                    M.tooltip(drop) .. "<br>No inventory icon available."
                )
            end
        end
        local note = ui.Text.new(self.popup.content)
        note:SetPos(8, rows * 44 + 40)
        note:SetSize(304, 24)
        note.content = "Hover an item for its drop rate."
        note.font = id.Font.MUSEO_SANS_15PT_REGULAR
        note.rgba = 0xE7D7B0FF
        note.clickthrough = true
    end
    -- A selected catalogue pin is a local click target; NPC catalogue pins do not open
    -- monster drops.

    -- main.lua supplies map-local pointer x/y; returns true after opening a selected
    -- Bestiary pin, or false so other map input can continue.
    function self:Click(x, y)
        local entry = getSelection()
        if not entry or entry.catalog ~= "Bestiary" then
            return false
        end
        for _, pin in ipairs(self.pins) do
            if math.abs(x - pin.x) <= 9 and math.abs(y - pin.y) <= 9 then
                self:Open(entry)
                return true
            end
        end
        return false
    end

    -- main.lua.PluginShutdown calls this; delegates to Clear to release popup-owned resources.
    function self:Shutdown()
        self:Clear()
    end
    return self
end
return M
