-- teleport_filter.lua
-- Used by: main.lua.
-- Caches teleport visibility using exposed skills and quest completion only when filtering is enabled.

-- Main refreshes this read-only eligibility snapshot when options change and
-- periodically while the map is open. world_map_icons filters individual methods
-- BEFORE travel_groups combines them, so tooltips contain only remaining methods.
-- Unknown skill or quest state is kept visible.
local Points = require("teleport_data").points
local Requirements = require("travel_requirements")
local questIDs = {}
for id, q in pairs(require("quest_card_data")) do
    local name = q.name:lower()
    questIDs[name] = questIDs[name] or {}
    table.insert(questIDs[name], id)
end
local skills = {
    attack = 0,
    defence = 1,
    strength = 2,
    constitution = 3,
    ranged = 4,
    prayer = 5,
    magic = 6,
    cooking = 7,
    woodcutting = 8,
    fletching = 9,
    fishing = 10,
    firemaking = 11,
    crafting = 12,
    smithing = 13,
    mining = 14,
    herblore = 15,
    agility = 16,
    thieving = 17,
    slayer = 18,
    farming = 19,
    runecrafting = 20,
    hunter = 21,
    construction = 22,
    summoning = 23,
    dungeoneering = 24,
    divination = 25,
    invention = 26,
    archaeology = 27,
    necromancy = 28,
}
local M = {}
function M.new(options)
    local self = { options = options, allowed = {} }
    function self:Refresh()
        -- With requirements filtering off, every bundled method is eligible.
        if not self.options.hideTeleportRequirements then
            local changed = next(self.allowed) ~= nil
            self.allowed = {}
            return changed
        end
        local snapshot, levels, quests = {}, {}, {}
        local available = false
        pcall(function()
            available = Player.IsAvailable()
        end)
        local function finished(name)
            if quests[name] ~= nil then
                return quests[name]
            end
            local ids = questIDs[name]
            if not ids then
                return
            end
            local allKnown = true
            for _, id in ipairs(ids) do
                local ok, value = pcall(function()
                    return config.Quest.FromID(id).hasFinishedQuest
                end)
                if ok and value == true then
                    quests[name] = true
                    return true
                end
                if not ok or type(value) ~= "boolean" then
                    allKnown = false
                end
            end
            if allKnown then
                quests[name] = false
                return false
            end
        end
        for _, point in ipairs(Points) do
            local allowed = true
            if available and self.options.hideTeleportRequirements then
                local text = Requirements.Describe(point):lower()
                -- Do not interpret alternative requirements as a mandatory skill.
                if not text:find("%f[%a]or%f[%A]") then
                    for skill, id in pairs(skills) do
                        local required = tonumber(text:match("(%d+)%s+" .. skill .. "%f[%A]"))
                        if required then
                            if levels[id] == nil then
                                local ok, value = pcall(Player.GetLevelGameplay, id)
                                levels[id] = ok and type(value) == "number" and value or false
                            end
                            if levels[id] and levels[id] < required then
                                allowed = false
                            end
                        end
                    end
                end
                local title = (point.record and point.record.title or ""):lower()
                -- Spell/tablet descriptions contain verified mandatory quest names.
                if point.category == 100002 or point.category == 100003 then
                    for name in pairs(questIDs) do
                        if #name > 3 and text:find(name, 1, true) and finished(name) == false then
                            allowed = false
                        end
                    end
                else
                    local quest = title == "ectophial" and "ghosts ahoy"
                        or title:find("drakan", 1, true) and "the branches of darkmeyer"
                        or title:find("enchanted lyre", 1, true) and "the fremennik trials"
                        or title:find("crystal teleport seed", 1, true)
                            and "mourning's end part i"
                    if quest and finished(quest) == false then
                        allowed = false
                    end
                end
            end
            snapshot[point] = allowed
        end
        local changed = false
        for point, value in pairs(snapshot) do
            if self.allowed[point] ~= value then
                changed = true
                break
            end
        end
        self.allowed = snapshot
        return changed
    end
    function self:Allows(point)
        return self.allowed[point] ~= false
    end
    return self
end
return M
