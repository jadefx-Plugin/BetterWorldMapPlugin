-- quest_requirements.lua
-- Used by: pin_tooltip.lua.
-- Formats exposed quest checks without treating unknown state as completed.

--[[
Builds requirement rows from the client's exposed quest/skill checks.
Does not infer prerequisite completion from location, inventory or unexposed conditions.
Unknown checks remain explicitly unknown. Returns a new presentation record and a revision
signature so hover cards can refresh only when their displayed content changes.
]]

-- Read the client's own checks; no network, persistence or inferred completion.
local M = {}

local assets = require("quest_hover_assets")
local GREEN, RED, GOLD, GREY = 0x91D68AFF, 0xF08080FF, 0xF2C66DFF, 0xBDB29BFF
local skills = {
    [0] = "Attack",
    "Defence",
    "Strength",
    "Constitution",
    "Ranged",
    "Prayer",
    "Magic",
    "Cooking",
    "Woodcutting",
    "Fletching",
    "Fishing",
    "Firemaking",
    "Crafting",
    "Smithing",
    "Mining",
    "Herblore",
    "Agility",
    "Thieving",
    "Slayer",
    "Farming",
    "Runecrafting",
    "Hunter",
    "Construction",
    "Summoning",
    "Dungeoneering",
    "Divination",
    "Invention",
    "Archaeology",
    "Necromancy",
}
-- Convert unavailable client properties into unknown status, not an assumed pass/fail.

-- Private protected accessor; fn reads a client property. Returns its value or nil on error,
-- keeping unknown distinct from confirmed false.
local function get(fn)
    local ok, value = pcall(fn)
    if ok then
        return value
    end
end

-- Private text helper; strips client formatting tags and returns plain prerequisite-name text.
local function safe(value)
    return tostring(value or ""):gsub("<[^>]*>", "")
end

-- Private row builder; appends a label with true/false/unknown prefix/color to rows and returns
-- no value.
local function check(rows, label, status)
    local prefix, colour = "[?] ", GREY
    if status == true then
        prefix, colour = "[OK] ", GREEN
    elseif status == false then
        prefix, colour = "[X] ", RED
    end
    rows[#rows + 1] = { name = prefix .. label, colour = colour }
end
-- Construct display-only requirement rows; the returned signature drives hover-card invalidation.

-- pin_tooltip.lua supplies a quest or other typed record; returns a new requirement presentation
-- and revision signature. Non-quest records pass through unchanged with an empty signature.
function M.render(record)
    if not record or record.kind ~= "quest" then
        return record, ""
    end
    local rows, signature = {}, {}
    local membership
    local available = get(function()
        return Player.IsAvailable()
    end) == true
    for _, entry in ipairs(record.rows) do
        rows[#rows + 1] = { name = entry.name, detail = entry.detail, colour = GOLD }
        local q = get(function()
            return config.Quest.FromID(entry.questID)
        end)
        local members = q and get(function()
            return q.isMembers
        end)
        if members == true then
            membership = "members"
        elseif members == false and not membership then
            membership = "free"
        end
        if not available or not q then
            check(rows, "Live quest requirements unavailable", nil)
        else
            local finished = get(function()
                return q.hasFinishedQuest
            end)
            local started = get(function()
                return q.hasStartedQuest
            end)
            if finished == true then
                check(rows, "Quest completed", true)
            elseif started == true then
                rows[#rows + 1] = { name = "Quest in progress", colour = GOLD }
            else
                rows[#rows + 1] = { name = "Not started", colour = GOLD }
            end
            do
                local prereqs = get(function()
                    return q.preReqQuests
                end)
                local questChecks = get(function()
                    return q.completedPreReqQuests
                end)
                if prereqs then
                    if #prereqs > 0 then
                        rows[#rows + 1] = { name = "Quests required", colour = GOLD }
                    end
                    for index, required in ipairs(prereqs) do
                        local name = get(function()
                            return required.name
                        end) or "Prerequisite quest"
                        local done = get(function()
                            return questChecks[index]
                        end)
                        check(rows, safe(name), done)
                    end
                end
                local levels = get(function()
                    return q.preReqSkills
                end)
                local skillChecks = get(function()
                    return q.completedPreReqSkills
                end)
                if levels then
                    if #levels > 0 then
                        rows[#rows + 1] = { name = "Skills required", colour = GOLD }
                    end
                    for index, required in ipairs(levels) do
                        local kind = get(function()
                            return required.skillType
                        end)
                        local minimum = get(function()
                            return required.minimumLevel
                        end)
                        local label = tostring(minimum or "?") .. " " .. (skills[kind] or "Skill")
                        check(
                            rows,
                            label,
                            get(function()
                                return skillChecks[index]
                            end)
                        )
                        rows[#rows].spriteID = assets.skillIcons[kind]
                    end
                end
            end
        end
    end
    for _, r in ipairs(rows) do
        signature[#signature + 1] = r.name
            .. ":"
            .. tostring(r.colour)
            .. ":"
            .. tostring(r.spriteID)
            .. ":"
            .. (r.detail or "")
    end
    signature[#signature + 1] = membership or "unknown"
    return {
        title = record.title,
        kind = "quest",
        rows = rows,
        membership = membership,
        note = "Quest and skill checks only. Other start conditions and items may apply.",
    },
        table.concat(signature, "|")
end
return M
