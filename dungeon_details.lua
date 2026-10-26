-- dungeon_details.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: dungeon_navigation.lua, pin_tooltip.lua.
--[=[
BEGINNER WALKTHROUGH: dungeon_details.lua

Each [surface pin INDEX] block describes ONE entrance hover card:
title is its heading, kind="navigation" chooses a simple layout, width is preferred UI
width, and rows is an ordered list of destination-name records. A name is not a click link.

Example reuse:
  local info = require('dungeon_details')[1312]
  if info then for _, row in ipairs(info.rows) do print(row.name) end end
pin_tooltip.lua joins by the stable surface marker index. dungeon_links must separately
provide an available area to make it clickable. Later assignments below the main table
override specific entries; the last assignment to a key wins.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: pin_tooltip.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Dungeon-entrance hover names keyed by stable surface-marker array index.
Values use {title, kind = navigation, width?, rows = {{name}, ...}} presentation records.
A named entrance may have no local destination image; only dungeon_links grants map clicks.
Native-cache names are retained independently of whether a destination can be displayed.
]]

-- Exact entrance targets mapped to locally cached map area bounds.
local details = {
    [1] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Orthen Oubliette",
            },
        },
    },
    [2] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Senntisten",
            },
        },
    },
    [24] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Highweald Ruins",
            },
        },
    },
    [25] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Hermit Cave",
            },
        },
    },
    [26] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Blighted Cave",
            },
        },
    },
    [27] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Hollow Hill",
            },
        },
    },
    [30] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Crypt",
            },
        },
    },
    [31] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Fort Forinthry Prison",
            },
        },
    },
    [32] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Fort Forinthry Grove Cave",
            },
        },
    },
    [33] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Zolarea",
            },
        },
    },
    [582] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ancient cavern",
            },
        },
    },
    [588] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "TzHaar City",
            },
        },
    },
    [589] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Grotworm Lair 1",
            },
        },
    },
    [590] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Menaphos and Sophanem Underground",
            },
        },
    },
    [591] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Menaphos and Sophanem Underground",
            },
        },
    },
    [592] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Slayer Tower Resource Dungeon",
            },
        },
    },
    [593] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Kal'gerion Resource Dungeon",
            },
        },
    },
    [594] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Clocktower Dungeon",
            },
        },
    },
    [595] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Southern Ardougne sewer",
            },
        },
    },
    [596] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Eastern Ardougne sewer",
            },
        },
    },
    [597] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Witchaven Dungeon",
            },
        },
    },
    [598] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Druid Tower Dungeon",
            },
        },
    },
    [599] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Eastern Ardougne sewer",
            },
        },
    },
    [600] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Eastern Ardougne sewer",
            },
        },
    },
    [601] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [602] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [603] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [604] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [605] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [606] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [607] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [608] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [609] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [610] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [611] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [612] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Taverley Dungeon",
            },
        },
    },
    [613] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Taverley Dungeon",
            },
        },
    },
    [614] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarven Mine",
            },
        },
    },
    [615] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarven Mine",
            },
        },
    },
    [616] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarven Mine",
            },
        },
    },
    [617] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarven Mine",
            },
        },
    },
    [618] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Mole Lair",
            },
        },
    },
    [619] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Keldagrim",
            },
        },
    },
    [620] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Tunnels",
            },
        },
    },
    [621] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Tunnels",
            },
        },
    },
    [622] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Tunnels",
            },
        },
    },
    [623] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Tunnels",
            },
        },
    },
    [624] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Chaos Tunnels",
            },
        },
    },
    [625] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Karamja Underground",
            },
        },
    },
    [627] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Elvarg's Lair",
            },
        },
    },
    [628] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Elvarg's Lair",
            },
        },
    },
    [629] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Pothole Dungeon",
            },
        },
    },
    [631] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Fremennik Dungeon",
            },
        },
    },
    [632] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Tolna's Rift",
            },
        },
    },
    [634] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Mos Le'Harmless cave",
            },
        },
    },
    [635] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Pollnivneach Dungeon",
            },
        },
    },
    [636] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Stronghold",
            },
        },
    },
    [637] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Stronghold of Security Peace",
            },
        },
    },
    [638] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Asgarnian Ice Dungeon",
            },
        },
    },
    [640] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Waterbirth Island Dungeon",
            },
        },
    },
    [641] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Waterbirth Island Dungeon",
            },
        },
    },
    [642] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Yanille Dungeon",
            },
        },
    },
    [643] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Yanille Dungeon",
            },
        },
    },
    [644] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Burthorpe Underground",
            },
        },
    },
    [645] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ice Queen's Lair",
            },
        },
    },
    [646] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarf tunnel",
            },
        },
    },
    [647] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dwarf tunnel",
            },
        },
    },
    [648] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Miscellania Underground",
            },
        },
    },
    [649] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Miscellania Underground",
            },
        },
    },
    [650] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Miscellania Underground",
            },
        },
    },
    [651] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Miscellania Underground",
            },
        },
    },
    [652] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ourania Altar",
            },
        },
    },
    [653] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Troll Stronghold",
            },
        },
    },
    [654] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Troll Stronghold",
            },
        },
    },
    [655] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Troll Stronghold",
            },
        },
    },
    [656] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Wilderness Dungeons",
            },
        },
    },
    [657] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Deep Wilderness Dungeon",
            },
        },
    },
    [658] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Agility course pit",
            },
        },
    },
    [659] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Wilderness Dungeons",
            },
        },
    },
    [660] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Wilderness Dungeons",
            },
        },
    },
    [661] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Misthalin Underground",
            },
        },
    },
    [662] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Mos Le'Harmless cave",
            },
        },
    },
    [663] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Keldagrim",
            },
        },
    },
    [664] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Asgarnian Ice Dungeon",
            },
        },
    },
    [665] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Forinthry Dungeon",
            },
        },
    },
    [666] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Forinthry Dungeon",
            },
        },
    },
    [667] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Jadinko Lair",
            },
        },
    },
    [668] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Jadinko Lair",
            },
        },
    },
    [669] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Morytania Underground",
            },
        },
    },
    [671] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Morytania Underground",
            },
        },
    },
    [672] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Morytania Underground",
            },
        },
    },
    [673] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Morytania Underground",
            },
        },
    },
    [674] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Morytania Underground",
            },
        },
    },
    [675] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Burthorpe Underground",
            },
        },
    },
    [676] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Burthorpe Underground",
            },
        },
    },
    [677] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Burthorpe Underground",
            },
        },
    },
    [678] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Exiled Kalphite Hive",
            },
        },
    },
    [679] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ascension Dungeon",
            },
        },
    },
    [681] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Hall of Memories",
            },
        },
    },
    [682] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Empty Throne Room",
            },
        },
    },
    [683] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Silverlight Crypt",
            },
        },
    },
    [684] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Zamorakian Crypt",
            },
        },
    },
    [685] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Wilderness Dungeons",
            },
        },
    },
    [694] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "V's Island (interior)",
            },
        },
    },
    [695] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Paddlington",
            },
        },
    },
    [743] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Kalphite Hive",
            },
        },
    },
    [744] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ungael Ritual Site",
            },
        },
    },
    [745] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Ramarno's forge",
            },
        },
    },
    [746] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Everlight",
            },
        },
    },
    [747] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Infernal Source",
            },
        },
    },
    [748] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Kharid-et",
            },
        },
    },
    [749] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Moonrise",
            },
        },
    },
    [750] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Orthen",
            },
        },
    },
    [751] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Orthen",
            },
        },
    },
    [752] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Orthen",
            },
        },
    },
    [753] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Orthen",
            },
        },
    },
    [758] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Stormguard Citadel",
            },
        },
    },
    [759] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Dig Site: Warforge",
            },
        },
    },
    [760] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Porcelain Clay Mine",
            },
        },
    },
    [761] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Crafting Guild Mine",
            },
        },
    },
    [1312] = {
        ["title"] = "Dungeon",
        ["kind"] = "navigation",
        ["width"] = 300,
        ["rows"] = {
            {
                ["name"] = "Scabarite Cavern",
            },
        },
    },
}
details[639] = {
    title = "Dungeon",
    kind = "navigation",
    width = 300,
    rows = {
        {
            name = "God Wars Dungeon",
        },
    },
}
details[680] = {
    title = "Dungeon",
    kind = "navigation",
    width = 300,
    rows = {
        {
            name = "The Heart",
        },
    },
}
details[626] = {
    title = "Dungeon",
    kind = "navigation",
    width = 300,
    rows = {
        {
            name = "Karamja Underground",
        },
    },
}
details[630] = {
    title = "Dungeon",
    kind = "navigation",
    width = 300,
    rows = {
        {
            name = "Braindeath Island",
        },
    },
}
details[633] = {
    title = "Dungeon",
    kind = "navigation",
    width = 300,
    rows = {
        {
            name = "Kalphite Hive",
        },
    },
}
return details
