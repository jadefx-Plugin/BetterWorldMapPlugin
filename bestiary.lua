-- bestiary.lua
-- Used by: main.lua.
-- Searches the bundled monster/NPC catalogues and chooses a nearby reference position.

--[=[
BEGINNER WALKTHROUGH: bestiary.lua

This is a reusable helper module: require returns M, so another file calls helpers.search(...)
with a dot. The records returned are references to the original data; this file does not copy,
mutate or fetch the catalogue.

Function comments below state the caller, what inputs represent, and the return value
or side effects. For coordinates, distinguish world map tiles from UI pixels/units.
A nil result means unavailable/no match; it is different from valid numeric ID 0.

Cross-file connections:
  require("bestiary_data") loads bestiary_data.lua and uses the table it returns.
  Required directly by: main.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Pure search and nearest-reference-location helpers for the Bestiary and NPC catalogue.
Input records are bundled historical/reference positions, not live detections.
A plain substring search (not a Lua pattern) ranks prefix matches before other matches.
Distances are squared map-tile distances; no route, accessibility or pathfinding is inferred.
]]

local data = require("bestiary_data")
local M = {}
local lowerNames = setmetatable({}, { __mode = "k" })
-- Empty queries intentionally return no results; names are matched literally and
-- case-insensitively.

-- main.lua.refreshResults supplies typed query text and optionally npc_data records; returns
-- matching record references, prefix matches first. Blank/no-match input returns an empty list.
function M.search(query, records)
    -- Accept nil/other values safely, compare lowercase names, and trim outer whitespace.
    query = tostring(query or ""):lower():match("^%s*(.-)%s*$")
    -- #query is string length here; a blank search intentionally shows no catalogue rows.
    if #query == 0 then
        return {}
    end
    -- Keep prefix and middle-of-name matches in separate lists so starts-with results rank first.
    local prefix, other = {}, {}
    for _, entry in ipairs(records or data) do
        local name = lowerNames[entry]
        if not name then
            name = entry.name:lower()
            lowerNames[entry] = name
        end
        -- The final true requests a literal substring search: punctuation is not a Lua pattern.
        local start = name:find(query, 1, true)
        if start then
            -- A match beginning at character 1 goes into prefix; other matches go into other.
            local list = start == 1 and prefix or other
            list[#list + 1] = entry
        end
    end
    -- Append the second list without changing the order of records inside either group.
    for _, entry in ipairs(other) do
        prefix[#prefix + 1] = entry
    end
    return prefix
end
-- Choose the closest reference position in straight-line map space, not a traversable route.

-- main.lua.selectMonster supplies one catalogue entry and a comparison x/z position; returns its
-- closest reference location on the preferred map, or on the first available map when
-- that map has no locations. Straight-line proximity does not establish a walkable
-- route.
function M.nearest(entry, x, z, areaID)
    local chosen = (entry.locations[1] and (entry.locations[1].areaID or 28))
    for _, point in ipairs(entry.locations) do
        if (point.areaID or 28) == (areaID or 28) then
            chosen = areaID or 28
            break
        end
    end
    local best, distance
    for _, point in ipairs(entry.locations) do
        if (point.areaID or 28) == chosen then
            local d = (point.x - x) ^ 2 + (point.z - z) ^ 2
            if not distance or d < distance then
                best = point
                distance = d
            end
        end
    end
    return best
end

return M
