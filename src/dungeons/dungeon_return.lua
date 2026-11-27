-- dungeon_return.lua
-- Used by: main.lua.
-- Keeps the previous-map stack and prepares return markers for underground maps.

-- main.selectArea calls Build to supply a return link for the displayed dungeon.
-- The link belongs to the current visit, not the shared map data: nested visits
-- can have different parents. entry is a verified destination DISPLAY tile.
local M = {}
function M.Build(area, entry, previousID, areas)
    if area.id == 28 then
        return area.points
    end
    local position = entry
    local navigationOnly = false
    if not position then
        for _, point in ipairs(area.points) do
            if
                point.returnToPrevious
                or point.category == 948
                or point.routeTarget and point.routeTarget.areaID == previousID
            then
                position = { x = point.x, z = point.z }
                break
            end
        end
    end
    if not position then
        -- Maps with no exported exit still have an exact incoming destination.
        local ids = {}
        for id in pairs(areas) do
            ids[#ids + 1] = id
        end
        table.sort(ids)
        if previousID then
            table.insert(ids, 1, previousID)
        end
        for _, id in ipairs(ids) do
            for _, point in ipairs(areas[id] and areas[id].points or {}) do
                if point.routeTarget and point.routeTarget.areaID == area.id then
                    position = point.routeTarget
                    break
                end
            end
            if position then
                break
            end
        end
    end
    if not position then
        -- Some supported areas have no native entrance/exit metadata at all.
        -- Supply a map-navigation return pin, without claiming a physical exit.
        navigationOnly = true
        local segment = area.segments and area.segments[1]
        position = {
            x = segment and segment.dx + segment.w / 2 or area.x + area.w / 2,
            z = segment and segment.dz + segment.h / 2 or area.z + area.h / 2,
        }
    end
    local result = {}
    local back = {
        x = position.x,
        z = position.z,
        category = 948,
        sprite = 20903,
        background = 18946,
        tooltip = "Return to previous map",
        returnToPrevious = true,
        mapNavigationOnly = navigationOnly,
    }
    for _, point in ipairs(area.points) do
        local overlaps = math.abs(point.x - position.x) <= 2
            and math.abs(point.z - position.z) <= 2
            and (point.category == 948 or point.category == 949 or point.category == 100020)
        if overlaps then
            -- Reuse ladder artwork without keeping its forward navigation target.
            if point.sprite == 1610 then
                back.sprite = point.sprite
                back.background = nil
                back.iconWidth = point.iconWidth
                back.iconHeight = point.iconHeight
            end
        else
            if point.category == 948 then
                -- Every native exit uses visit history, including older exports
                -- that attached a forward map target to an exit symbol.
                local copy = {}
                for key, value in pairs(point) do
                    copy[key] = value
                end
                copy.returnToPrevious = true
                copy.routeTarget = nil
                result[#result + 1] = copy
            else
                result[#result + 1] = point
            end
        end
    end
    result[#result + 1] = back
    return result
end
return M
