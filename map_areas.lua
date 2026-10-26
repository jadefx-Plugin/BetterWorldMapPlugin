-- map_areas.lua
-- Used by: main.lua, nearby_npcs.lua.
-- Finds supported maps and converts exposed world coordinates into each map layout.

--[[
Public area lookup and coordinate conversion over bundled map definitions.
native_map_list is the supported catalogue; selectable_map_list is the smaller public dropdown. Hidden maps remain available to detection and named links.
Unknown saved area IDs fall back to surface area 28. Project rejects coordinates/floors
outside an area's source segments rather than mixing separate dungeon/instance maps.
]]

local source = require("map_areas_data")

local native = require("native_map_list")
local data = {}
for _, id in ipairs(native) do
    if source[id] then
        data[id] = source[id]
    end
end
local selectable = {}
for _, id in ipairs(require("selectable_map_list")) do
    selectable[id] = true
end
local M = { data = data, SURFACE = 28 }
function M.IsSelectable(id)
    return selectable[id] == true
end

-- main.lua supplies a saved/selected area ID; returns the matching definition, falling back to
-- surface ID 28 for unknown IDs.
function M.Get(id)
    return data[id] or data[28]
end
-- Source segments use half-open bounds here and accept only the configured floor range.

-- main.lua and nearby_npcs.lua supply area ID, source x/z and floor; returns two projected
-- coordinates, or no values when that point/floor is outside the area.
function M.Project(id, x, z, level)
    local area = data[id]
    if not area then
        return
    end
    for _, b in ipairs(area.segments) do
        if
            level >= b.level
            and level < b.level + b.levels
            and x >= b.sx
            and x < b.sx + b.w
            and z >= b.sz
            and z < b.sz + b.h
        then
            return x + b.dx - b.sx, z + b.dz - b.sz
        end
    end
end
-- Find the supported native map containing a player's source tile and floor.
-- main.lua uses this for automatic player-area detection. Prefer the most specific underground
-- segment over the broad surface catalogue; retain current map on equal-size ties.
-- Unknown positions return nil, never a guessed surface map.
function M.Find(x, z, level, currentID)
    local best, bestSize, mx, mz
    for id, area in pairs(data) do
        if id ~= M.SURFACE then
            for _, segment in ipairs(area.segments) do
                if
                    level >= segment.level
                    and level < segment.level + segment.levels
                    and x >= segment.sx
                    and x < segment.sx + segment.w
                    and z >= segment.sz
                    and z < segment.sz + segment.h
                then
                    local size = segment.w * segment.h
                    if
                        not bestSize
                        or size < bestSize
                        or size == bestSize
                            and (id == currentID and best ~= currentID or best ~= currentID and id < best)
                    then
                        best, bestSize = id, size
                        mx, mz = x + segment.dx - segment.sx, z + segment.dz - segment.sz
                    end
                end
            end
        end
    end
    if best then
        return best, mx, mz
    end
    mx, mz = M.Project(M.SURFACE, x, z, level)
    if mx then
        return M.SURFACE, mx, mz
    end
end
-- Surface stays first; other names sort alphabetically and duplicate names include area IDs.

-- main.lua calls for the dropdown choices; returns an ordered list of id/label/order records,
-- with surface first and other names sorted.
function M.Entries()
    local entries = { { id = 28, label = "RuneScape Surface" } }
    local counts = {}
    for _, area in pairs(data) do
        counts[area.name] = (counts[area.name] or 0) + 1
    end
    for id, area in pairs(data) do
        if id ~= 28 and selectable[id] then
            entries[#entries + 1] = {
                id = id,
                label = area.name .. (counts[area.name] > 1 and (" (" .. id .. ")") or ""),
            }
        end
    end
    table.sort(entries, function(a, b)
        if a.id == 28 then
            return true
        elseif b.id == 28 then
            return false
        end
        if a.label ~= b.label then
            return a.label < b.label
        end
        return a.id < b.id
    end)
    -- Explicit order keeps PrettyUI from applying native alphabetical sorting.
    for index, entry in ipairs(entries) do
        entry.order = index
    end
    return entries
end
return M
