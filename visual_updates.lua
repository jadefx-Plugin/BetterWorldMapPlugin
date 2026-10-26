-- visual_updates.lua
-- Used by: main.lua, nearby_npcs.lua, pin_tooltip.lua, world_map_icons.lua.
-- Avoids native position and visibility writes when plugin-owned visuals have not changed.

-- Avoid repeating native layout writes for unchanged plugin-owned visuals.
-- Callers retain their components; weak keys let destroyed components be collected.
-- Use only for absolute pixel layout controlled by this plugin, never native game UI.
local M = {}
local positions = setmetatable({}, { __mode = "k" })
function M.Position(component, x, y)
    local old = positions[component]
    if old and old.x == x and old.y == y then
        return false
    end
    component:SetPos(x, y)
    positions[component] = { x = x, y = y }
    return true
end
-- Visibility is read back because other handlers can hide the same tooltip/marker.
function M.Hidden(component, hidden)
    if component.hidden == hidden then
        return false
    end
    component.hidden = hidden
    return true
end
return M
