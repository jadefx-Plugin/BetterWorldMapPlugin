-- movement_opacity.lua
-- Used by: main.lua.
-- Detects local player movement and applies the selected window transparency.

--[[
BEGINNER WALKTHROUGH: movement_opacity.lua

main.lua creates this controller once and calls Update on each Logic event.
Only Player.GetEntity/IsAvailable are read. routeEnd differs from coordGrid while
the player's exposed route is active; fine position changes cover movement when
routeEnd is unavailable. This does not inspect other players or issue actions.

The native UI alpha range is 0 (invisible) to 1 (opaque). A moving factor of 0.5
is the default walking setting. Configurable normal/walking factors are applied
once to drawable controls/sprites below each plugin window. Layout
containers stay unchanged to avoid multiplying nested opacity. Container
alpha alone did not fade their child artwork in the client. The pin Canvas is
excluded here: world_map_icons.lua applies matching alpha to its draw commands.
Existing component opacity is preserved and restored, not overwritten.
No per-pin updates or extra UI components are needed. Transparency is temporary
presentation state, so nothing is written to PersistentDB.

Example call flow:
  local fade = require('movement_opacity').new()
  fade:Update(mapWindow, dropWindow) -- dropWindow can be nil
  fade:Restore()                    -- main.lua calls this on plugin shutdown
]]
local M = {}
-- Native alpha may be stored in an 8-bit channel. Treat a one-step rounding
-- difference as the same value, not as a control changing its own style.
local ALPHA_EPSILON = 1 / 255 + 0.000001
-- Private comparison helper: returns whether two native alpha values differ
-- by no more than one 8-bit channel step, avoiding false style-change detection.
local function sameAlpha(a, b)
    return type(a) == "number" and type(b) == "number" and math.abs(a - b) <= ALPHA_EPSILON
end

-- Constructor; called by main.lua. Returns a controller with movement history
-- and tracked component records. Missing/closed popup descendants are restored
-- and discarded during the next traversal, avoiding long-lived proxy retention.
function M.new(options)
    local self = { moving = false, quiet = 0, components = {}, options = options or {}, factor = 1 }

    -- Private sampler. Returns whether the local player is moving. Invalid player
    -- reads, login changes and floor changes reset the baseline to full opacity.
    -- This part checks whether the local character is moving.
    local function sample()
        local ok, state = pcall(function()
            if not Player.IsAvailable() then
                return
            end
            local entity = Player.GetEntity()
            if not entity or not entity.isValid then
                return
            end
            local tile = entity.coordGrid
            if not tile then
                return
            end
            local value = {
                uid = entity.uid,
                level = tile.level,
                x = tile.x * 512,
                z = tile.z * 512,
                routed = false,
            }
            pcall(function()
                local position = entity.position
                if position then
                    value.x, value.z = position.x, position.z
                end
            end)
            pcall(function()
                local destination = entity.routeEnd
                value.routed = destination ~= nil
                    and destination.level == tile.level
                    and (destination.x ~= tile.x or destination.z ~= tile.z)
            end)
            return value
        end)
        if not ok or not state then
            self.previous = nil
            self.quiet = 0
            return false
        end
        local previous = self.previous
        self.previous = state
        local samePlayer = previous and previous.uid == state.uid and previous.level == state.level
        local distance = samePlayer
                and math.max(math.abs(state.x - previous.x), math.abs(state.z - previous.z))
            or 0
        -- Large discontinuities are teleports/region changes, not walking.
        local changed = samePlayer and distance > 1 and distance <= 2048
        if state.routed or changed then
            self.quiet = 0
            return true
        end
        -- Two quiet samples avoid toggling on a single unchanged render position.
        self.quiet = self.quiet + 1
        return samePlayer and self.moving and self.quiet < 2 or false
    end

    -- Visit only descendants of plugin-owned windows, never the native host.
    -- Stable IDs recognize the same component even if iteration returns a new
    -- userdata proxy. The seen set prevents duplicated or recursive visitation.
    local function componentKey(component)
        local key = component
        pcall(function()
            if component.interfaceID ~= nil and component.dynamicID ~= nil then
                key = table.concat({
                    component.interfaceID,
                    component.staticID or -1,
                    component.categoryID or -1,
                    component.dynamicID,
                }, ":")
            end
        end)
        return key
    end
    -- This part fades drawable children once, preserving their original alpha.
    local function apply(window, factor, excluded, seen)
        if not window or not window.root or window.root.hidden then
            return
        end
        local excludedKeys = {}
        if type(excluded) == "table" and excluded[1] ~= nil then
            for _, owned in ipairs(excluded) do
                excludedKeys[componentKey(owned)] = true
            end
        elseif excluded then
            excludedKeys[componentKey(excluded)] = true
        end
        local function visit(component)
            local key = componentKey(component)
            if excludedKeys[key] then
                return false
            end
            if seen[key] then
                return false
            end
            seen[key] = true
            local iterate
            pcall(function()
                iterate = component.IterateDynamicComponents
            end)
            -- Containers are traversal/layout only. Fade the actual drawable
            -- children once, avoiding multiplication through nested UI layers.
            if iterate then
                pcall(iterate, component, visit)
                return false
            end
            pcall(function()
                local alpha = component.alpha
                if type(alpha) == "number" then
                    local record = self.components[key]
                    if not record then
                        record = { base = alpha }
                        self.components[key] = record
                    elseif record.applied ~= nil and not sameAlpha(alpha, record.applied) then
                        -- Hover/disabled styling may deliberately set a new alpha.
                        record.base = alpha
                    end
                    record.component = component
                    local desired = record.base * factor
                    if not sameAlpha(alpha, desired) then
                        component.alpha = desired
                    end
                    -- Remember the actual native read-back, rather than the
                    -- unrounded request, so a stable fade never compounds.
                    record.applied = component.alpha
                end
            end)
            return false -- native iteration continues when the callback is false
        end
        visit(window.root)
    end

    -- Restore actual visual components, then discard their proxy references.
    local function restore()
        for _, record in pairs(self.components) do
            pcall(function()
                if sameAlpha(record.component.alpha, record.applied) then
                    record.component.alpha = record.base
                end
            end)
        end
        self.components = {}
    end

    -- main.lua calls this after drawing/restyling controls in the same tick.
    -- Do not sample movement again: only reconcile newly created/reset leaves
    -- before the client renders, preventing one-frame opaque text flashes.
    -- This part reconciles alpha after UI controls have changed.
    function self:Refresh(mapWindow, dropWindow, pinCanvas)
        if self.factor == 1 then
            if next(self.components) then
                restore()
            end
            return
        end
        local seen = {}
        apply(mapWindow, self.factor, pinCanvas, seen)
        apply(dropWindow, self.factor, pinCanvas, seen)
        for key, record in pairs(self.components) do
            if not seen[key] then
                pcall(function()
                    if sameAlpha(record.component.alpha, record.applied) then
                        record.component.alpha = record.base
                    end
                end)
                self.components[key] = nil
            end
        end
    end

    -- Called each Logic tick. Normal and walking transparency are absolute settings.
    -- Excludes pinCanvas, whose commands receive alpha
    -- from world_map_icons.lua.SetOpacity. Returns whether movement changed so
    -- main.lua can request one redraw for the new pin-command color.
    -- This part chooses normal or walking transparency.
    function self:Update(mapWindow, dropWindow, pinCanvas, deferRefresh)
        local previous, oldFactor = self.moving, self.factor
        self.moving = sample()
        local transparency = self.moving and (self.options.walkingTransparency or 50)
            or (self.options.transparency or 0)
        self.factor = 1 - math.max(0, math.min(100, transparency)) / 100
        -- Main defers this until after its UI updates, avoiding two full tree
        -- traversals in the same tick. Other callers retain the original behavior.
        if not deferRefresh then
            self:Refresh(mapWindow, dropWindow, pinCanvas)
        end
        return previous ~= self.moving or oldFactor ~= self.factor
    end

    -- Called before main.lua destroys windows on shutdown. Restores any surviving
    -- components to their original alpha; protected writes tolerate already-closed UI.
    function self:Restore()
        restore()
        self.previous = nil
        self.moving = false
        self.quiet = 0
        self.factor = 1
    end
    return self
end
return M
