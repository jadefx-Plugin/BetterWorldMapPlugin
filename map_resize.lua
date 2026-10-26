-- map_resize.lua
-- Used by: main.lua.
-- Captures window edge/corner dragging and updates plugin-owned layout.

--[[
Invisible edge/corner resize handles for the plugin-owned map window.
Pointer origin and interface scale are frozen when a drag starts to prevent feedback as
the handle moves. Bounds keep the window usable on-screen. Handles are registered as
PrettyUI overlays so they hide with their window; no native game click zones are resized.
]]

-- Freeze pointer scale/origin for a drag; moving handles must not feed back
-- into the next delta. Uses the same raw-pointer calibration as PrettyUI drag.
local M = {}

-- main.lua supplies its PrettyUI window and an onResize callback; returns a controller owning
-- invisible edge/corner handles and pointer subscriptions.
function M.new(window, onResize)
    local self = { handles = {}, start = nil }
    local root = window.root
    local eventID = "better_world_map_resize_pointer"
    -- Raw pointer pixels and UI units differ under interface scaling.

    -- Private helper; reads configured interface scaling and returns the pointer-pixel to
    -- UI-unit conversion ratio.
    local function interfaceScale()
        local setting = game and game.options and game.options.InterfaceScale
        return math.max(1, tonumber(setting and setting.setting) or 100) / 100
    end

    -- Private helper; returns Mouse.GetPosition when exposed, otherwise nil so dragging can
    -- fall back to local UI event coordinates.
    local function rawPosition()
        return Mouse and Mouse.GetPosition and Mouse.GetPosition() or nil
    end

    -- Private drag-start helper; compares raw pointer and event coordinates, returning a
    -- calibrated scale ratio or the configured fallback.
    local function dragScale(raw, x, y)
        if not raw then
            return interfaceScale()
        end
        local sx = math.abs(x) >= 32 and raw.x / x or nil
        local sy = math.abs(y) >= 32 and raw.y / y or nil
        if sx and sy and sx > 0 and sy > 0 and math.abs(sx - sy) < (sx + sy) * 0.05 then
            return (sx + sy) / 2
        end
        return interfaceScale()
    end

    -- Private coordinate helper; component is a handle and x/y is pointer position inside
    -- it. Returns pointer x/y in its parent coordinate system.
    local function parentPosition(component, x, y)
        -- Handles and the capture layer share a parent; do not mix xyGlobal
        -- screen pixels with local interface units.
        return component.x + x, component.y + y
    end

    -- Release, focus loss, hiding and cleanup call this; cancels active drag and
    -- resynchronizes window overlays/title input. Returns false for hook use.
    function self:Stop()
        self.start = nil
        window:_SyncOverlays(root.hidden == true)
        if window.titleDrag then
            window.titleDrag:SetPos(root.x, root.y)
            window.titleDrag:SetSize(root.width - 34, 32)
        end
        return false
    end
    -- Apply pointer deltas against frozen starting geometry and clamp to usable client bounds.

    -- Hold/frame handlers call during a drag; combines frozen start geometry with current
    -- pointer deltas, clamps the window and calls onResize if it changed.
    local function move(component, x, y)
        local s = self.start
        if not s then
            return false
        end
        local raw = rawPosition()
        local dx, dy
        if raw and s.raw then
            dx = (raw.x - s.raw.x) / s.scale
            dy = (raw.y - s.raw.y) / s.scale
        else
            -- Freeze the original handle origin for clients without raw input.
            local px, py
            if not component or not x or not y then
                return false
            end
            px, py = parentPosition(component, x, y)
            dx = px - s.px
            dy = py - s.py
        end
        local w = s.w + (s.horizontal or 0) * dx
        local h = s.h + (s.vertical or 0) * dy
        local minW, minH = window.minWidth or 820, window.minHeight or 600
        local maxW = s.horizontal == -1 and s.x + s.w or window.parent.width - s.x
        local maxH = s.vertical == -1 and s.y + s.h or window.parent.height - s.y
        w = math.max(minW, math.min(math.floor(w + 0.5), math.max(minW, maxW)))
        h = math.max(minH, math.min(math.floor(h + 0.5), math.max(minH, maxH)))
        local nx = s.x + (s.horizontal == -1 and s.w - w or 0)
        local ny = s.y + (s.vertical == -1 and s.h - h or 0)
        if root.x == nx and root.y == ny and root.width == w and root.height == h then
            return false
        end
        root:SetPos(nx, ny)
        window:SetSize(w, h)
        if window.titleDrag then
            window.titleDrag:SetPos(nx, ny)
            window.titleDrag:SetSize(root.width - 34, 32)
        end
        if onResize then
            onResize()
        end
        s.handle:MoveToFront()
        return false
    end
    -- Poll independently of mouse-over/hold events. The pressed component itself
    -- covers the client during the gesture so it still receives button release.
    Event.Draw.Subscribe(eventID, function()
        if self.start then
            if root.hidden then
                self:Stop()
            else
                move()
            end
        end
    end)
    Event.WindowFocusChanged.Subscribe(eventID, function()
        if self.start then
            self:Stop()
        end
    end)
    local specs = {
        { -1, -1, 0, 0, 16, 16, 0, 0, 0, 0 },
        { 1, -1, -16, 0, 16, 16, 1, 0, 0, 0 },
        { -1, 1, 0, -16, 16, 16, 0, 1, 0, 0 },
        { 1, 1, -16, -16, 16, 16, 1, 1, 0, 0 },
        { -1, 0, 0, 16, 8, -32, 0, 0, 0, 1 },
        { 1, 0, -8, 16, 8, -32, 1, 0, 0, 1 },
        { 0, -1, 16, 0, -32, 6, 0, 0, 1, 0 },
        { 0, 1, 16, -8, -32, 8, 0, 1, 1, 0 },
    }
    -- Native TOPLEVEL_V2_SCALE_* cursor IDs, verified in local cursor configs.
    local cursors = { 192, 193, 193, 192, 191, 191, 190, 190 }
    for index, s in ipairs(specs) do
        local handle = ui.Layer.new(window.parent)

        -- Private resize-handle layout helper; positions its hit regions against current
        -- window dimensions without changing game interfaces.
        local function layout()
            if self.grip then
                self.grip.hidden = self.start ~= nil
            end
            if self.start and self.start.handle == handle then
                handle:SetPos(0, 0)
                handle:SetSize(0, 0, 1, 1)
            else
                handle:SetPos(root.x + s[3] + root.width * s[7], root.y + s[4] + root.height * s[8])
                handle:SetSize(s[5] + root.width * s[9], s[6] + root.height * s[10])
            end
        end
        layout()
        window:_RegisterOverlay(handle, function()
            return not self.start or self.start.handle == handle
        end, layout)
        handle:MoveToFront()
        handle.clickthrough = false
        handle.cursorConfig.mouseOverCursor = cursors[index]
        handle.opConfig:SetOpCursor(0, cursors[index])
        -- UI event: handle invokes the handler on ONCLICK. Pointer coordinates, when
        -- supplied, are local to this component.
        handle:Subscribe(ui.Hook.ONCLICK, function(component, x, y)
            local px, py = parentPosition(component, x, y)
            local raw = rawPosition()
            self.start = {
                px = px,
                py = py,
                raw = raw and { x = raw.x, y = raw.y } or nil,
                scale = dragScale(raw, px, py),
                handle = component,
                handleX = component.x,
                handleY = component.y,
                x = root.x,
                y = root.y,
                w = root.width,
                h = root.height,
                horizontal = s[1],
                vertical = s[2],
            }
            window:_SyncOverlays(false)
            handle:MoveToFront()
            return false
        end)
        -- UI event: handle invokes the handler on ONHOLD. Pointer coordinates, when
        -- supplied, are local to this component.
        handle:Subscribe(ui.Hook.ONHOLD, move)
        -- UI event: handle invokes the handler on ONRELEASE. Pointer coordinates, when
        -- supplied, are local to this component.
        handle:Subscribe(ui.Hook.ONRELEASE, function()
            return self:Stop()
        end)
        self.handles[#self.handles + 1] = handle
    end
    -- Remove frame/focus hooks and overlay handles so plugin reloads cannot retain active drags.

    -- main.lua.PluginShutdown calls this; removes frame/focus handlers and
    -- unregisters/destroys all owned resize overlays.
    function self:Destroy()
        Event.Draw.Unsubscribe(eventID)
        Event.WindowFocusChanged.Unsubscribe(eventID)
        self:Stop()
        for _, handle in ipairs(self.handles) do
            window:_UnregisterOverlay(handle)
            handle:Destroy()
        end
        self.handles = {}
    end
    return self
end
return M
