-- dungeon_routes.lua
-- Used by: map_areas_data.lua.
-- Builds local ladder/obstacle links and hover connection lines.

-- Adds audited ladder artwork and route metadata to area definitions at load time.
-- Called once by map_areas_data.lua after its hidden-map modules have been merged.
-- This helper accepts the data table rather than requiring map_areas, avoiding a
-- circular require. Existing marker indices on the surface are never touched.
local additions = require("dungeon_routes_data")
local M = {}
-- Merge into a nearby existing dungeon symbol instead of drawing two hit targets.
-- routeTarget takes precedence over the older generic exit/back behavior.
function M.Apply(areas)
    for areaID, points in pairs(additions) do
        local area = areas[areaID]
        if area then
            for _, point in ipairs(points) do
                local existing
                for _, candidate in ipairs(area.points) do
                    if
                        math.abs(candidate.x - point.x) <= 1
                        and math.abs(candidate.z - point.z) <= 1
                        and (
                            candidate.category == 948
                            or candidate.category == 949
                            or candidate.category == 100020
                        )
                    then
                        existing = candidate
                        break
                    end
                end
                if existing then
                    if point.routeTarget then
                        existing.routeTarget = point.routeTarget
                        existing.connector = point.connector
                        existing.record = point.record
                        existing.tooltip = point.tooltip
                    end
                else
                    area.points[#area.points + 1] = point
                end
            end
        end
    end
end
return M
