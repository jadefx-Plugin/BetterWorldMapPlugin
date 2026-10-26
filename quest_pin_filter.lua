-- quest_pin_filter.lua
-- Used by: main.lua.
-- Caches the quest marker visibility selected in Filters.

--[[
Read-only quest-marker eligibility cache for map filters.
Queries exposed quest completion/startability, reusing a per-refresh cache for shared pins.
Unknown status leaves the marker visible rather than incorrectly declaring requirements
met or hiding relevant information. Refresh returns whether cached eligibility changed.
]]

local details = require("pin_details")
local M = {}

-- main.lua supplies the shared options table; returns an eligibility controller that reads those
-- live option values on the next refresh.
function M.new(options)
    local self = { options = options, allowed = {} }
    -- A shared marker is visible if any associated quest passes the selected status filters.

    -- main.lua calls at startup/filter changes/periodic checks; caches exposed quest states,
    -- recomputes marker eligibility and returns whether results changed.
    function self:Refresh()
        -- All statuses are visible: no quest API reads or per-marker scan needed.
        if
            self.options.showCompleted
            and self.options.showRequirementsMet
            and self.options.showRequirementsUnmet
        then
            local changed = next(self.allowed) ~= nil
            self.allowed = {}
            self.extraStatus = {}
            return changed
        end
        local previousExtra = self.extraStatus or {}
        self.extraStatus = {}
        local changed = false
        local cache = {}
        for index, record in pairs(details) do
            if record.kind == "quest" then
                local visible = false
                for _, entry in ipairs(record.rows) do
                    local status = cache[entry.questID]
                    if not status then
                        local ok, value = pcall(function()
                            if not Player.IsAvailable() then
                                return "unknown"
                            end
                            local q = config.Quest.FromID(entry.questID)
                            if q.hasFinishedQuest then
                                return "completed"
                            end
                            if q.canStartQuest == true then
                                return "met"
                            end
                            if q.canStartQuest == false then
                                return "unmet"
                            end
                            return "unknown"
                        end)
                        status = ok and value or "unknown"
                        cache[entry.questID] = status
                    end
                    if
                        status == "unknown"
                        or status == "completed" and self.options.showCompleted
                        or status == "met" and self.options.showRequirementsMet
                        or status == "unmet" and self.options.showRequirementsUnmet
                    then
                        visible = true
                    end
                end
                if self.allowed[index] ~= visible then
                    changed = true
                end
                self.allowed[index] = visible
            end
        end
        for id, status in pairs(previousExtra) do
            self:AllowsQuest(id)
            if self.extraStatus[id] ~= status then
                changed = true
            end
        end
        return changed
    end
    -- Non-surface records carry direct quest IDs rather than surface marker-index references.

    -- world_map_icons.lua supplies a direct quest config ID for a non-surface point; returns
    -- whether status/options allow it, keeping unknown state visible.
    function self:AllowsQuest(id)
        if
            self.options.showCompleted
            and self.options.showRequirementsMet
            and self.options.showRequirementsUnmet
        then
            return true
        end
        self.extraStatus = self.extraStatus or {}
        local status = self.extraStatus[id]
        if not status then
            local ok, value = pcall(function()
                if not Player.IsAvailable() then
                    return "unknown"
                end
                local q = config.Quest.FromID(id)
                if q.hasFinishedQuest then
                    return "completed"
                end
                if q.canStartQuest == true then
                    return "met"
                end
                if q.canStartQuest == false then
                    return "unmet"
                end
                return "unknown"
            end)
            status = ok and value or "unknown"
            self.extraStatus[id] = status
        end
        return status == "unknown"
            or status == "completed" and self.options.showCompleted
            or status == "met" and self.options.showRequirementsMet
            or status == "unmet" and self.options.showRequirementsUnmet
    end

    -- world_map_icons.lua supplies a surface marker array index; returns false only for
    -- explicitly excluded cached eligibility, leaving non-quest/unclassified markers
    -- visible.
    function self:Allows(index)
        return self.allowed[index] ~= false
    end
    return self
end
return M
