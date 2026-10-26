-- dungeon_exits.lua
-- Used by: map_areas_data.lua.
-- Joins bundled underground exits to their local map markers.

-- Called by map_areas_data after all area modules are merged. Native exit
-- labels can be omitted from older exports; merge every checked surface-bound
-- endpoint rather than adding only one marker to an entire composite map.
local M = {}
function M.Apply(areas)
    for id, points in pairs(require("dungeon_exits_data")) do
        local area = areas[id]
        if area then
            for _, point in ipairs(points) do
                local existing
                for _, q in ipairs(area.points) do
                    if
                        math.abs(q.x - point.x) <= 1
                        and math.abs(q.z - point.z) <= 1
                        and (q.category == 948 or q.category == 949 or q.category == 100020)
                    then
                        existing = q
                        break
                    end
                end
                if existing then
                    existing.returnToPrevious = true
                else
                    area.points[#area.points + 1] = point
                end
            end
        end
    end
end
return M
