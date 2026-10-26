-- dungeon_navigation.lua
-- Used by: pin_tooltip.lua, world_map_icons.lua.
-- Decides which dungeon markers may open another map.

-- Dungeon links are reference associations; they do not all permit browsing.
-- A generic "Dungeon" pin keeps its associated map for automatic player-area
-- detection but cannot open that map from a surface click. Named destinations
-- retain their click navigation. Both renderer hit tests and tooltip hints use
-- this policy so they cannot disagree about whether a pin can be opened.
local links = require("dungeon_links")
local details = require("dungeon_details")
local M = {}
local function named(value)
    local text = tostring(value or ""):gsub("<[^>]*>", ""):lower():match("^%s*(.-)%s*$")
    return text ~= ""
        and text ~= "dungeon"
        and text ~= "dungeon entrance"
        and text ~= "unknown dungeon"
end
function M.CanNavigate(index)
    if links[index] == nil then
        return false
    end
    local record = details[index]
    if record and record.rows then
        for _, row in ipairs(record.rows) do
            if named(row.name) then
                return true
            end
        end
    end
    return false -- A heading alone is not a destination row.
end
return M
