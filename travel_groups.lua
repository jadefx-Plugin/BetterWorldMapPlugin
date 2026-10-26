-- travel_groups.lua
-- Used by: world_map_icons.lua.
-- Combines enabled teleport methods sharing the same destination into one map marker.

--[=[
BEGINNER WALKTHROUGH: travel_groups.lua

world_map_icons.lua calls Build after category/quest filtering. Entries are ordinary
{index,point} records; the returned list preserves native entries and replaces
custom teleports at identical map coordinates with one destination marker.

Coordinates are map tiles, never screen pixels. Area ID is part of the key, so two
different maps cannot share a group. No zoom-dependent grid or marker limit is used.
Distinct nearby landing points stay separate. Each group's members retains the
original records; its hover rows list the enabled travel methods with their artwork
and verified requirement text from travel_requirements.lua. Data modules are never modified here.
]=]

local Requirements = require("travel_requirements")
local M = {}

-- Build(entries) returns display entries from the renderer's eligible records.
-- Called only when eligibility changes, not on every pan/zoom. The first enabled
-- method provides the group's artwork; its native index remains the sprite key.
function M.Build(entries)
    local result, locations = {}, {}
    for _, entry in ipairs(entries) do
        local point = entry.point
        if not point.custom then
            result[#result + 1] = entry
        else
            local key = tostring(point.areaID or 28) .. ":" .. point.x .. ":" .. point.z
            local group = locations[key]
            if not group then
                local copy = {}
                for k, v in pairs(point) do
                    copy[k] = v
                end
                copy.offsetX = nil
                copy.offsetY = nil
                group = { index = entry.index, point = copy, members = {} }
                locations[key] = group
                result[#result + 1] = group
            end
            group.members[#group.members + 1] = entry
        end
    end
    for _, group in ipairs(result) do
        if group.members then
            local first = group.members[1].point
            local destination = first.record and first.record.rows and first.record.rows[1]
            destination = destination and destination.name
                or first.tooltip:match("<br>(.*)$")
                or "Travel destination"
            local rows, seen, keys = {}, {}, {}
            for _, entry in ipairs(group.members) do
                local point = entry.point
                local name = point.record and point.record.title
                    or point.tooltip:match("^(.-)<br>")
                    or point.tooltip
                local key = name .. ":" .. tostring(point.itemID or point.sprite)
                if not seen[key] then
                    seen[key] = true
                    keys[#keys + 1] = key
                    rows[#rows + 1] = {
                        name = name,
                        item = point.itemID,
                        spriteID = point.sprite,
                        detail = Requirements.Describe(point),
                    }
                end
            end
            group.point.record = {
                title = destination,
                kind = "navigation",
                width = 340,
                rows = rows,
                travelKey = table.concat(keys, "|"),
                maxRows = 4,
            }
            group.point.tooltip = destination
                .. "<br>"
                .. #rows
                .. (#rows == 1 and " travel method" or " travel methods")
        end
    end
    return result
end

return M
