-- map_key_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: map_key.lua, world_map_icons.lua.
--[=[
BEGINNER WALKTHROUGH: map_key_data.lua

Each native record is ONE selectable marker type {name,sprite,id,group}.
Plugin-local teleport categories are appended from teleport_data.lua at the bottom;
their optional itemID selects actual item/outfit artwork instead of a sprite ID.
name labels the checkbox, sprite is native artwork, id is the CATEGORY ID (not row index),
and group chooses a heading in map_key.lua. id must match a world_map_data pin.category.

Example reuse:
  for _, kind in ipairs(require('map_key_data')) do print(kind.id, kind.name) end
map_key.lua emits [category ID]=boolean filters for world_map_icons.lua.SetFilters;
map_settings.lua saves those same category IDs, so do not renumber them when changing labels.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: map_key.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Native map-key category catalogue used by map_key and marker filters.
Schema: ordered array of {name, sprite, id, group}; id is a native marker category ID,
not a row index. group selects a display heading and sprite supplies the native key icon.
Category IDs are also persisted in map_settings, so preserve IDs when editing names/order.
]]

-- Native map data; unclassified Other markers excluded.
local categories = {
    {
        name = "Dungeon Exit",
        sprite = 20903,
        id = 948,
        group = 1,
    },
    {
        name = "Bank",
        sprite = 22458,
        id = 1156,
        group = -1,
    },
    {
        name = "Bank Deposit",
        sprite = 10834,
        id = 4632,
        group = -1,
    },
    {
        name = "Grand Exchange",
        sprite = 20761,
        id = 1228,
        group = -1,
    },
    {
        name = "Fairy Ring",
        sprite = 34781,
        id = 4476,
        group = 1,
    },
    {
        name = "Lodestone",
        sprite = 25254,
        id = 2613,
        group = 1,
    },
    {
        name = "Shortcut",
        sprite = 22462,
        id = 1217,
        group = 1,
    },
    {
        name = "Transportation",
        sprite = 20764,
        id = 1206,
        group = 1,
    },
    {
        name = "Agility Training",
        sprite = 22495,
        id = 1199,
        group = 2,
    },
    {
        name = "Agility Tutor",
        sprite = 22495,
        id = 2560,
        group = 2,
    },
    {
        name = "Boss Encounter",
        sprite = 22477,
        id = 5102,
        group = 2,
    },
    {
        name = "Clans: Guard",
        sprite = 22575,
        id = 2175,
        group = 2,
    },
    {
        name = "Clans: Portal",
        sprite = 22576,
        id = 2174,
        group = 2,
    },
    {
        name = "Clans: Scribe",
        sprite = 22579,
        id = 2177,
        group = 2,
    },
    {
        name = "Clans: Sergeant-At-Arms",
        sprite = 22580,
        id = 2176,
        group = 2,
    },
    {
        name = "Clans: Vexillum stands",
        sprite = 22581,
        id = 2173,
        group = 2,
    },
    {
        name = "Combat Training",
        sprite = 22479,
        id = 4383,
        group = 2,
    },
    {
        name = "Cooking Tutor",
        sprite = 22480,
        id = 2574,
        group = 2,
    },
    {
        name = "Crafting Training",
        sprite = 22489,
        id = 4386,
        group = 2,
    },
    {
        name = "Distractions & Diversions",
        sprite = 22468,
        id = 1226,
        group = 2,
    },
    {
        name = "Divination Tutor",
        sprite = 22491,
        id = 4404,
        group = 2,
    },
    {
        name = "Dungeon",
        sprite = 20902,
        id = 949,
        group = 2,
    },
    {
        name = "Dungeoneering Tutor",
        sprite = 22485,
        id = 2578,
        group = 2,
    },
    {
        name = "Elite Dungeon",
        sprite = 22477,
        id = 5104,
        group = 2,
    },
    {
        name = "Farming Training",
        sprite = 22481,
        id = 4389,
        group = 2,
    },
    {
        name = "Farming Tutor",
        sprite = 22481,
        id = 2564,
        group = 2,
    },
    {
        name = "Firemaking Training",
        sprite = 22482,
        id = 4390,
        group = 2,
    },
    {
        name = "Fishing Tutor",
        sprite = 22487,
        id = 2573,
        group = 2,
    },
    {
        name = "Fletching Training",
        sprite = 22492,
        id = 4392,
        group = 2,
    },
    {
        name = "God Emissary",
        sprite = 22474,
        id = 2935,
        group = 2,
    },
    {
        name = "Heist",
        sprite = 14182,
        id = 5632,
        group = 2,
    },
    {
        name = "Herblore Tutor",
        sprite = 22483,
        id = 2561,
        group = 2,
    },
    {
        name = "Hunter Training",
        sprite = 35680,
        id = 4394,
        group = 2,
    },
    {
        name = "Hunter Tutor",
        sprite = 35680,
        id = 2566,
        group = 2,
    },
    {
        name = "Hunting Site",
        sprite = 35686,
        id = 5699,
        group = 2,
    },
    {
        name = "Minigame",
        sprite = 22470,
        id = 1188,
        group = 2,
    },
    {
        name = "POH Portal",
        sprite = 22461,
        id = 1214,
        group = 2,
    },
    {
        name = "Prayer Tutor",
        sprite = 22494,
        id = 2577,
        group = 2,
    },
    {
        name = "Quest Map Hint",
        sprite = 22449,
        id = 1399,
        group = 2,
    },
    {
        name = "Quest Start",
        sprite = 22471,
        id = 1157,
        group = 2,
    },
    {
        name = "Runecrafting Tutor",
        sprite = 22496,
        id = 2570,
        group = 2,
    },
    {
        name = "Slayer Master",
        sprite = 22497,
        id = 1201,
        group = 2,
    },
    {
        name = "Smithing Tutor",
        sprite = 22493,
        id = 2571,
        group = 2,
    },
    {
        name = "Summoning Tutor",
        sprite = 22484,
        id = 2567,
        group = 2,
    },
    {
        name = "Taskmaster",
        sprite = 22473,
        id = 1221,
        group = 2,
    },
    {
        name = "Thieving Spot",
        sprite = 14183,
        id = 4301,
        group = 2,
    },
    {
        name = "Woodcutting Tutor",
        sprite = 22498,
        id = 2576,
        group = 2,
    },
    {
        name = "Amulet Shop",
        sprite = 22508,
        id = 1158,
        group = 3,
    },
    {
        name = "Archery Shop",
        sprite = 22501,
        id = 1167,
        group = 3,
    },
    {
        name = "Axe Shop",
        sprite = 22514,
        id = 954,
        group = 3,
    },
    {
        name = "Brewery",
        sprite = 22536,
        id = 1209,
        group = 3,
    },
    {
        name = "Candle Shop",
        sprite = 22537,
        id = 1174,
        group = 3,
    },
    {
        name = "Chainmail Shop",
        sprite = 22516,
        id = 1195,
        group = 3,
    },
    {
        name = "Clothes Shop",
        sprite = 22528,
        id = 1177,
        group = 3,
    },
    {
        name = "Cookery Shop",
        sprite = 22525,
        id = 1187,
        group = 3,
    },
    {
        name = "Crafting Shop",
        sprite = 22526,
        id = 1173,
        group = 3,
    },
    {
        name = "Divination Shop",
        sprite = 22491,
        id = 4403,
        group = 3,
    },
    {
        name = "Estate Agent",
        sprite = 22544,
        id = 1215,
        group = 3,
    },
    {
        name = "Farming Shop",
        sprite = 22524,
        id = 1207,
        group = 3,
    },
    {
        name = "Fishing Shop",
        sprite = 22521,
        id = 1175,
        group = 3,
    },
    {
        name = "Food Shop",
        sprite = 22530,
        id = 1186,
        group = 3,
    },
    {
        name = "Fur Trader",
        sprite = 22529,
        id = 1197,
        group = 3,
    },
    {
        name = "Gem Shop",
        sprite = 22510,
        id = 1172,
        group = 3,
    },
    {
        name = "General Store",
        sprite = 22500,
        id = 951,
        group = 3,
    },
    {
        name = "Gravestone exchange",
        sprite = 22532,
        id = 2442,
        group = 3,
    },
    {
        name = "Hairdresser",
        sprite = 22539,
        id = 1202,
        group = 3,
    },
    {
        name = "Helmet Shop",
        sprite = 22515,
        id = 955,
        group = 3,
    },
    {
        name = "Herbalist",
        sprite = 22522,
        id = 1170,
        group = 3,
    },
    {
        name = "Hunter Store",
        sprite = 35684,
        id = 4382,
        group = 3,
    },
    {
        name = "Jewellery Shop",
        sprite = 22512,
        id = 1171,
        group = 3,
    },
    {
        name = "Kebab Seller",
        sprite = 22531,
        id = 1180,
        group = 3,
    },
    {
        name = "Lamp Trader",
        sprite = 31145,
        id = 4122,
        group = 3,
    },
    {
        name = "Mace Shop",
        sprite = 22507,
        id = 1182,
        group = 3,
    },
    {
        name = "Magic Shop",
        sprite = 22506,
        id = 953,
        group = 3,
    },
    {
        name = "Mattock Shop",
        sprite = 10828,
        id = 4631,
        group = 3,
    },
    {
        name = "Pet Shop",
        sprite = 22541,
        id = 1225,
        group = 3,
    },
    {
        name = "Photo Booth",
        sprite = 22540,
        id = 1369,
        group = 3,
    },
    {
        name = "Platebody Shop",
        sprite = 22517,
        id = 1164,
        group = 3,
    },
    {
        name = "Platelegs Shop",
        sprite = 22518,
        id = 1165,
        group = 3,
    },
    {
        name = "Plateskirt Shop",
        sprite = 22519,
        id = 1191,
        group = 3,
    },
    {
        name = "Pub / Bar",
        sprite = 22535,
        id = 1181,
        group = 3,
    },
    {
        name = "Scimitar Shop",
        sprite = 22503,
        id = 1166,
        group = 3,
    },
    {
        name = "Shield Shop",
        sprite = 22505,
        id = 1168,
        group = 3,
    },
    {
        name = "Silk Trader",
        sprite = 22538,
        id = 1179,
        group = 3,
    },
    {
        name = "Silver Shop",
        sprite = 22511,
        id = 1196,
        group = 3,
    },
    {
        name = "Spice Shop",
        sprite = 22534,
        id = 1198,
        group = 3,
    },
    {
        name = "Summoning Store",
        sprite = 22523,
        id = 1224,
        group = 3,
    },
    {
        name = "Sword Shop",
        sprite = 22502,
        id = 952,
        group = 3,
    },
    {
        name = "Tools for Games",
        sprite = 22543,
        id = 1270,
        group = 3,
    },
    {
        name = "Vegetable Store",
        sprite = 22533,
        id = 1200,
        group = 3,
    },
    {
        name = "Altar",
        sprite = 22405,
        id = 1169,
        group = 4,
    },
    {
        name = "Anvil",
        sprite = 22548,
        id = 1161,
        group = 4,
    },
    {
        name = "Apothecary",
        sprite = 22546,
        id = 1178,
        group = 4,
    },
    {
        name = "Archaeological Research",
        sprite = 10831,
        id = 4628,
        group = 4,
    },
    {
        name = "Archaeologist's Workbench",
        sprite = 10832,
        id = 4626,
        group = 4,
    },
    {
        name = "Birdhouse Plot",
        sprite = 35685,
        id = 5698,
        group = 4,
    },
    {
        name = "Bonfire",
        sprite = 31147,
        id = 4125,
        group = 4,
    },
    {
        name = "Collector",
        sprite = 10829,
        id = 4629,
        group = 4,
    },
    {
        name = "Construction Workbench",
        sprite = 36558,
        id = 5805,
        group = 4,
    },
    {
        name = "Cooking Range",
        sprite = 22416,
        id = 1190,
        group = 4,
    },
    {
        name = "Dairy Churn",
        sprite = 22549,
        id = 1210,
        group = 4,
    },
    {
        name = "Empowered Obelisks",
        sprite = 22572,
        id = 5696,
        group = 4,
    },
    {
        name = "Fired Up Beacon",
        sprite = 22561,
        id = 1227,
        group = 4,
    },
    {
        name = "Fletching Workbench",
        sprite = 34630,
        id = 5508,
        group = 4,
    },
    {
        name = "Furnace",
        sprite = 22411,
        id = 1160,
        group = 4,
    },
    {
        name = "Guide",
        sprite = 22554,
        id = 1204,
        group = 4,
    },
    {
        name = "Inventor's Workbench",
        sprite = 26559,
        id = 3761,
        group = 4,
    },
    {
        name = "Loom",
        sprite = 22555,
        id = 1208,
        group = 4,
    },
    {
        name = "Makeover Mage",
        sprite = 22562,
        id = 1203,
        group = 4,
    },
    {
        name = "Mini Obelisk",
        sprite = 22573,
        id = 1223,
        group = 4,
    },
    {
        name = "Pottery Wheel",
        sprite = 22553,
        id = 1192,
        group = 4,
    },
    {
        name = "Resting Spot",
        sprite = 22547,
        id = 1240,
        group = 4,
    },
    {
        name = "Sawmill",
        sprite = 22557,
        id = 1216,
        group = 4,
    },
    {
        name = "Screening Station",
        sprite = 10833,
        id = 4627,
        group = 4,
    },
    {
        name = "Slayer Contracts",
        sprite = 22560,
        id = 2873,
        group = 4,
    },
    {
        name = "Spinning Wheel",
        sprite = 22556,
        id = 1185,
        group = 4,
    },
    {
        name = "Summoning Obelisk",
        sprite = 22572,
        id = 1222,
        group = 4,
    },
    {
        name = "Tannery",
        sprite = 22550,
        id = 1183,
        group = 4,
    },
    {
        name = "Windmill",
        sprite = 22558,
        id = 1193,
        group = 4,
    },
    {
        name = "Woodcutting Stump",
        sprite = 22563,
        id = 1218,
        group = 4,
    },
    {
        name = "Archaeological Dig Site",
        sprite = 10839,
        id = 4624,
        group = 5,
    },
    {
        name = "Excavation Site",
        sprite = 10840,
        id = 4625,
        group = 5,
    },
    {
        name = "Farming Patch",
        sprite = 22570,
        id = 1205,
        group = 5,
    },
    {
        name = "Fishing Spot",
        sprite = 22564,
        id = 1176,
        group = 5,
    },
    {
        name = "Mining Site",
        sprite = 22566,
        id = 1159,
        group = 5,
    },
    {
        name = "Runecrafting Altar",
        sprite = 22571,
        id = 2579,
        group = 5,
    },
    {
        name = "Sandpit",
        sprite = 22569,
        id = 1220,
        group = 5,
    },
    {
        name = "Trees - Rare",
        sprite = 22565,
        id = 1184,
        group = 5,
    },
    {
        name = "Trees - Uncommon",
        sprite = 9938,
        id = 5121,
        group = 5,
    },
    {
        name = "Water Source",
        sprite = 22567,
        id = 1189,
        group = 5,
    },
    {
        name = "Wisp Colony",
        sprite = 22574,
        id = 3032,
        group = 5,
    },
}

-- Append plugin-local teleport categories from teleport_data.lua. Native IDs stay unchanged.
for _, category in ipairs(require("teleport_data").categories) do
    categories[#categories + 1] = category
end
categories[#categories + 1] = { name = "Ladders / stairs", id = 100020, sprite = 1610, group = 1 }
return categories
