-- travel_requirements.lua
-- Used by: teleport_filter.lua, travel_groups.lua.
-- Looks up bundled teleport requirements and formats readable reference descriptions.

--[=[
BEGINNER WALKTHROUGH: travel_requirements.lua

Describe(point) supplies requirement text for travel_groups.lua hover rows.
Spell levels, spellbooks and rune quantities below are exported from native ability
params 2807/2871 and COMBATV2_REQUIRES_*_RUNES. They are reference requirements,
not a live check of the player. Item/tablet requirements deliberately differ from
casting a spell: tablets do not inherit its Magic level or rune costs.
An explicit point.requirements string overrides these defaults. Unknown extra
requirements are omitted, never presented as "none". Add verified exceptions here.
]=]

local spells = {
    ["anachronia teleport"] = "72 Magic; Runes: 1 earth, 3 nature, 1 law",
    ["annakarl teleport"] = "90 Magic; Ancient Magicks; Desert Treasure; Runes: 2 blood, 2 law",
    ["ape atoll teleport"] = "64 Magic; Runes: 2 water, 2 fire, 2 law",
    ["ardougne teleport"] = "51 Magic; Runes: 2 water, 2 law",
    ["barbarian teleport"] = "75 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 3 fire, 2 astral, 2 law",
    ["blooming burrow teleport"] = "",
    ["camelot teleport"] = "45 Magic; Runes: 5 air, 1 law",
    ["carrallangar teleport"] = "84 Magic; Ancient Magicks; Desert Treasure; Runes: 2 soul, 2 law",
    ["catherby teleport"] = "87 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 10 water, 3 astral, 3 law",
    ["christmas village teleport"] = "",
    ["city of um teleport"] = "24 Magic",
    ["dareeyak teleport"] = "78 Magic; Ancient Magicks; Desert Treasure; Runes: 2 air, 3 fire, 2 law",
    ["dungeon home teleport"] = "",
    ["eastern anachronia teleport"] = "78 Magic; Runes: 2 nature, 1 law, 1 time",
    ["falador teleport"] = "37 Magic; Runes: 3 air, 1 water, 1 law",
    ["fishing guild teleport"] = "85 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 8 water, 3 astral, 3 law",
    ["gatestone 2 teleport"] = "90 Magic",
    ["gatestone teleport"] = "32 Magic",
    ["ghorrock teleport"] = "96 Magic; Ancient Magicks; Desert Treasure; Runes: 8 water, 2 law",
    ["god wars dungeon teleport"] = "61 Magic; Runes: 2 fire, 2 law",
    ["group gatestone teleport"] = "42 Magic; Runes: 3 law",
    ["harvest hollow teleport"] = "",
    ["home teleport"] = "",
    ["house teleport"] = "1 Magic",
    ["ice plateau teleport"] = "89 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 8 water, 3 astral, 3 law",
    ["kandarin monastery teleport"] = "",
    ["kharyrll teleport"] = "66 Magic; Ancient Magicks; Desert Treasure; Runes: 1 blood, 2 law",
    ["khazard teleport"] = "78 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 4 water, 2 astral, 2 law",
    ["lassar teleport"] = "72 Magic; Ancient Magicks; Desert Treasure; Runes: 4 water, 2 law",
    ["lumbridge teleport"] = "31 Magic; Runes: 3 air, 1 earth, 1 law",
    ["manor farm teleport"] = "",
    ["max guild teleport"] = "",
    ["mazcab teleport"] = "70 Magic; Runes: 1 soul, 3 cosmic, 1 law",
    ["moonclan teleport"] = "69 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 2 earth, 2 astral, 1 law",
    ["mountain camp teleport"] = "83 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 3 astral, 3 law, 1 time",
    ["north ardougne teleport"] = "76 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 5 water, 2 astral, 1 law",
    ["north-western anachronia teleport"] = "75 Magic; Runes: 2 nature, 1 law, 1 time",
    ["northern lost grove teleport"] = "85 Magic; Runes: 4 nature, 3 law, 1 time",
    ["ourania teleport"] = "71 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 6 earth, 2 astral, 1 law",
    ["paddewwa teleport"] = "54 Magic; Ancient Magicks; Desert Treasure; Runes: 1 air, 1 fire, 2 law",
    ["senntisten teleport"] = "60 Magic; Ancient Magicks; Desert Treasure; Runes: 1 soul, 2 law",
    ["skeletal horror teleport"] = "",
    ["south falador teleport"] = "72 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 2 air, 2 astral, 1 law",
    ["south feldip hills teleport"] = "10 Magic; Runes: 1 air, 1 water, 1 law",
    ["sunlight sands teleport"] = "",
    ["taverley teleport"] = "19 Magic; Runes: 3 air, 1 fire, 1 law",
    ["the heart teleport"] = "61 Magic; Runes: 2 fire, 2 law",
    ["trollheim farm teleport"] = "92 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 10 water, 3 astral, 3 law",
    ["trollheim teleport"] = "61 Magic; Runes: 2 fire, 2 law",
    ["ungael teleport"] = "75 Magic",
    ["varrock teleport"] = "25 Magic; Runes: 3 air, 1 fire, 1 law",
    ["war's retreat teleport"] = "",
    ["watchtower teleport"] = "58 Magic; Runes: 2 earth, 2 law",
    ["waterbirth teleport"] = "72 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 1 water, 2 astral, 1 law",
    ["wendlewick teleport"] = "28 Magic; Runes: 3 air, 1 water, 1 law",
    ["western kharazi jungle teleport"] = "81 Magic; Lunar spellbook; Lunar Diplomacy; Runes: 3 astral, 2 law, 1 time",
}
-- Additional quest/unlock requirements are independent of cached rune costs.
local quests = {
    ["trollheim teleport"] = "Eadgar's Ruse",
    ["ardougne teleport"] = "Plague City",
    ["watchtower teleport"] = "Watchtower",
    ["ape atoll teleport"] = "Recipe for Disaster: Freeing King Awowogei",
    ["god wars dungeon teleport"] = "The Mighty Fall and Eadgar's Ruse",
    ["mazcab teleport"] = "Mazcab teleport codex unlock",
    ["city of um teleport"] = "Rune Mythos",
}
local lunarTablets = {
    moonclan = true,
    ourania = true,
    waterbirth = true,
    barbarian = true,
    khazard = true,
    catherby = true,
}
local M = {}
-- Called for an enabled destination method when the shared tooltip is built.
function M.Describe(point)
    if point.requirements then
        return point.requirements
    end
    local name = point.record and point.record.title or ""
    local lower = name:lower()
    if point.category == 100002 then
        local text = spells[lower] or ""
        if quests[lower] then
            text = text .. (text ~= "" and "; " or "") .. quests[lower]
        end
        return text
    end
    if point.category == 100003 then
        if
            lower:find("paddewwa")
            or lower:find("senntisten")
            or lower:find("kharyrll")
            or lower:find("lassar")
            or lower:find("dareeyak")
            or lower:find("carrallangar")
            or lower:find("annakarl")
            or lower:find("ghorrock")
        then
            return "Requires Desert Treasure; consumes one tablet."
        end
        for prefix in pairs(lunarTablets) do
            if lower:find(prefix, 1, true) then
                return "Requires Lunar Diplomacy; consumes one tablet."
            end
        end
        if lower:find("chipped") then
            return "Requires Evil Dave's Big Day Out; consumes one tablet."
        end
        return "Requires the tablet; consumed on use."
    end
    if lower:find("slayer cape") then
        return "Requires 99 Slayer and access to the Slayer master."
    end
    if lower:find("dungeoneering cape") then
        return "Requires 99 Dungeoneering and destination access."
    end
    if lower:find("master archaeologist") then
        return "Requires 99 Archaeology, Guildmaster qualification and the full outfit."
    end
    if point.category == 100005 then
        return "Requires the corresponding outfit or modified headgear; destination unlocks and daily limits apply."
    end
    if point.category == 100010 then
        return "Requires the corresponding Slayer mask or helm; daily teleport limit applies."
    end
    if point.category == 100009 then
        return "Requires the corresponding summoned familiar and its teleport ability."
    end
    if point.category == 100008 then
        return "Requires the teleport scroll; consumed on use."
    end
    if point.category == 100001 then
        if
            lower:find("fortune")
            or lower:find("luck of the dwarves")
            or lower:find("hazelmere")
        then
            return ""
        end
        return "Requires remaining teleport charges and any destination unlocks."
    end
    if lower == "ectophial" then
        return "Requires Ghosts Ahoy and a filled ectophial."
    end
    if lower:find("drakan") then
        return "Requires The Branches of Darkmeyer and medallion destination unlocks."
    end
    if lower:find("crystal teleport seed") then
        return "Requires Mourning's End Part I; Prifddinas destinations require Plague's End."
    end
    if lower:find("enchanted lyre") then
        return "Requires The Fremennik Trials; additional destinations require Fremennik achievements."
    end
    if lower:find("wicked hood") then
        return "Requires the hood, the destination altar unlock and available teleport charges."
    end
    if lower:find("max cape") then
        return "Requires access to the Max Guild."
    end
    if lower:find("quest cape") then
        return "Requires the Quest Cape perk and destination access."
    end
    if lower:find("ardougne cloak") then
        return "Monastery: easy Ardougne achievements. Manor Farm: medium or higher."
    end
    if lower:find("desert amulet") then
        return "Nardah: medium Desert achievements. Uzer: elite Desert achievements."
    end
    if lower:find("varrock armour") then
        return "Requires elite Varrock achievements."
    end
    if lower:find("fremennik sea boots") then
        return "Requires elite Fremennik achievements."
    end
    if lower:find("explorer") then
        return "Requires medium or higher Lumbridge achievements."
    end
    if point.category == 100006 then
        return ""
    end
    if lower == "archaeology teleport" then
        return "Consumed on use; destination Archaeology level and unlocks required."
    end
    if lower == "ancient seed" then
        return "Consumed on use."
    end
    if point.category == 100007 then
        return ""
    end
    return ""
end
return M
