-- teleport_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: map_key_data.lua, teleport_filter.lua, world_map_icons.lua.
--[=[
BEGINNER WALKTHROUGH: teleport_data.lua

This file returns two lists: categories adds Navigation checkboxes, and points
contains reference teleport-destination pins. It does not cast spells or use items.

categories uses stable plugin-local IDs starting at 100001, outside the bundled native marker
IDs. Each point uses one of those same IDs so existing key filters/persistence work.
sprite is a native spellbook icon ID. itemID requests native inventory artwork for
that particular jewellery/tablet, not a generic transport icon.
custom=true tells the marker renderer to use the record embedded here for hover text,
rather than looking up a native surface-marker index in pin_details.lua.
offsetX separates overlapping spell/tablet icons in UI units; x/z stay map-world tiles.

Example reuse:
  local teleports = require('teleport_data')
  for _, point in ipairs(teleports.points) do print(point.tooltip,point.category) end

Spell coordinates/icons and tablet identities come from the local cache exports.
Jewellery coordinates identify destination areas, not guaranteed exact landing tiles;
native item-option names and public references identify their destinations.
Conditional/variable destinations and unverified tablet matches are omitted.
This data module performs no network request, inventory scan or game action.
teleport_filter.lua separately checks exposed skills/quests and item containers when enabled.
world_map_icons.lua selects these by areaID (default 28, surface), preserving all original
world_map_data.lua indices and their dungeon/quest/detail cross-file links.
]=]

local data = {
    categories = {
        {
            id = 100001,
            name = "Jewelry",
            group = 1,
            itemID = 1712,
        },
        {
            id = 100002,
            name = "Spells",
            group = 1,
            sprite = 36137,
        },
        {
            id = 100003,
            name = "Tablets",
            group = 1,
            itemID = 8007,
        },
    },
    points = {
        {
            x = 3087,
            z = 3496,
            category = 100001,
            custom = true,
            tooltip = "Amulet of glory<br>Edgeville",
            record = {
                title = "Amulet of glory",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Edgeville",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 1712,
        },
        {
            x = 2918,
            z = 3176,
            category = 100001,
            custom = true,
            tooltip = "Amulet of glory<br>Karamja",
            record = {
                title = "Amulet of glory",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Karamja",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 1712,
        },
        {
            x = 3104,
            z = 3250,
            category = 100001,
            custom = true,
            tooltip = "Amulet of glory<br>Draynor Village",
            record = {
                title = "Amulet of glory",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Draynor Village",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 1712,
        },
        {
            x = 3305,
            z = 3125,
            category = 100001,
            custom = true,
            tooltip = "Amulet of glory<br>Al Kharid / Shantay Pass",
            record = {
                title = "Amulet of glory",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Al Kharid / Shantay Pass",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 1712,
        },
        {
            x = 2882,
            z = 3546,
            category = 100001,
            custom = true,
            tooltip = "Combat bracelet<br>Warriors' Guild",
            record = {
                title = "Combat bracelet",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Warriors' Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11118,
        },
        {
            x = 3191,
            z = 3368,
            category = 100001,
            custom = true,
            tooltip = "Combat bracelet<br>Champions' Guild",
            record = {
                title = "Combat bracelet",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Champions' Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11118,
        },
        {
            x = 3052,
            z = 3487,
            category = 100001,
            custom = true,
            tooltip = "Combat bracelet<br>Edgeville Monastery",
            record = {
                title = "Combat bracelet",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Edgeville Monastery",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11118,
        },
        {
            x = 2658,
            z = 3438,
            category = 100001,
            custom = true,
            tooltip = "Combat bracelet<br>Ranging Guild",
            record = {
                title = "Combat bracelet",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ranging Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11118,
        },
        {
            x = 2610,
            z = 3390,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Fishing Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Fishing Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 3020,
            z = 3338,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Mining Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Mining Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 2936,
            z = 3290,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Crafting Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Crafting Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 3141,
            z = 3440,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Cooks' Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Cooks' Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 3056,
            z = 3443,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Invention Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Invention Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 2649,
            z = 3340,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Farming Guild",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Farming Guild",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 3106,
            z = 3162,
            category = 100001,
            custom = true,
            tooltip = "Skills necklace<br>Runecrafting Guild / Wizards Tower",
            record = {
                title = "Skills necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Runecrafting Guild / Wizards Tower",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 11105,
        },
        {
            x = 3316,
            z = 3235,
            category = 100001,
            custom = true,
            tooltip = "Ring of duelling<br>Het's Oasis",
            record = {
                title = "Ring of duelling",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Het's Oasis",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 2552,
        },
        {
            x = 2440,
            z = 3090,
            category = 100001,
            custom = true,
            tooltip = "Ring of duelling<br>Castle Wars",
            record = {
                title = "Ring of duelling",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Castle Wars",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 2552,
        },
        {
            x = 2413,
            z = 2847,
            category = 100001,
            custom = true,
            tooltip = "Ring of duelling<br>Warforge",
            record = {
                title = "Ring of duelling",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Warforge",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 2552,
            offsetX = -12,
        },
        {
            x = 2970,
            z = 3407,
            category = 100001,
            custom = true,
            tooltip = "Ring of duelling<br>Fist of Guthix entrance",
            record = {
                title = "Ring of duelling",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Fist of Guthix entrance",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 2552,
            offsetX = -12,
        },
        {
            x = 2870,
            z = 3550,
            category = 100001,
            custom = true,
            tooltip = "Games necklace<br>Troll Invasion",
            record = {
                title = "Games necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Troll Invasion",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 3853,
        },
        {
            x = 2533,
            z = 3575,
            category = 100001,
            custom = true,
            tooltip = "Games necklace<br>Barbarian Outpost",
            record = {
                title = "Games necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Barbarian Outpost",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 3853,
        },
        {
            x = 2970,
            z = 3407,
            category = 100001,
            custom = true,
            tooltip = "Games necklace<br>Gamers Grotto entrance",
            record = {
                title = "Games necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Gamers Grotto entrance",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 3853,
            offsetX = 12,
        },
        {
            x = 3498,
            z = 3220,
            category = 100001,
            custom = true,
            tooltip = "Games necklace<br>Burgh de Rott",
            record = {
                title = "Games necklace",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Burgh de Rott",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 3853,
        },
        {
            x = 2535,
            z = 3868,
            category = 100001,
            custom = true,
            tooltip = "Ring of Wealth<br>Miscellania",
            record = {
                title = "Ring of Wealth",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Miscellania",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 20659,
        },
        {
            x = 3164,
            z = 3479,
            category = 100001,
            custom = true,
            tooltip = "Ring of Wealth<br>Grand Exchange",
            record = {
                title = "Ring of Wealth",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Grand Exchange",
                        detail = "Jewelry teleport destination",
                    },
                },
                note = "Destination-area reference, not an exact landing tile. Charges and unlocks may apply.",
            },
            source = "Local item options and public destination-area references",
            itemID = 20659,
        },
        {
            x = 3288,
            z = 3886,
            category = 100002,
            custom = true,
            tooltip = "Annakarl Teleport<br>Annakarl",
            record = {
                title = "Annakarl Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Annakarl",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14821",
            sprite = 36122,
            offsetX = -12,
        },
        {
            x = 2797,
            z = 2798,
            category = 100002,
            custom = true,
            tooltip = "Ape Atoll Teleport<br>Ape Atoll",
            record = {
                title = "Ape Atoll Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ape Atoll",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14781",
            sprite = 35027,
        },
        {
            x = 2661,
            z = 3302,
            category = 100002,
            custom = true,
            tooltip = "Ardougne Teleport<br>Ardougne",
            record = {
                title = "Ardougne Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ardougne",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14768",
            sprite = 35028,
            offsetX = -12,
        },
        {
            x = 2543,
            z = 3569,
            category = 100002,
            custom = true,
            tooltip = "Barbarian Teleport<br>Barbarian",
            record = {
                title = "Barbarian Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Barbarian",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14841",
            sprite = 14406,
            offsetX = -12,
        },
        {
            x = 2757,
            z = 3478,
            category = 100002,
            custom = true,
            tooltip = "Camelot Teleport<br>Camelot",
            record = {
                title = "Camelot Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Camelot",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14763",
            sprite = 36130,
            offsetX = -12,
        },
        {
            x = 3222,
            z = 3666,
            category = 100002,
            custom = true,
            tooltip = "Carrallangar Teleport<br>Carrallangar",
            record = {
                title = "Carrallangar Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Carrallangar",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14818",
            sprite = 36123,
            offsetX = -12,
        },
        {
            x = 2790,
            z = 3452,
            category = 100002,
            custom = true,
            tooltip = "Catherby Teleport<br>Catherby",
            record = {
                title = "Catherby Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Catherby",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14860",
            sprite = 14415,
            offsetX = -12,
        },
        {
            x = 2968,
            z = 3696,
            category = 100002,
            custom = true,
            tooltip = "Dareeyak Teleport<br>Dareeyak",
            record = {
                title = "Dareeyak Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Dareeyak",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14815",
            sprite = 36124,
            offsetX = -12,
        },
        {
            x = 4064,
            z = 4251,
            category = 100002,
            custom = true,
            tooltip = "Eastern Anachronia Teleport<br>Eastern Anachronia",
            record = {
                title = "Eastern Anachronia Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Eastern Anachronia",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 51277",
            sprite = 10369,
            offsetX = -12,
        },
        {
            x = 2965,
            z = 3378,
            category = 100002,
            custom = true,
            tooltip = "Falador Teleport<br>Falador",
            record = {
                title = "Falador Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Falador",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14759",
            sprite = 36132,
            offsetX = -12,
        },
        {
            x = 2613,
            z = 3383,
            category = 100002,
            custom = true,
            tooltip = "Fishing Guild Teleport<br>Fishing Guild",
            record = {
                title = "Fishing Guild Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Fishing Guild",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14857",
            sprite = 14414,
            offsetX = -12,
        },
        {
            x = 2976,
            z = 3872,
            category = 100002,
            custom = true,
            tooltip = "Ghorrock Teleport<br>Ghorrock",
            record = {
                title = "Ghorrock Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ghorrock",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14824",
            sprite = 36125,
            offsetX = -12,
        },
        {
            x = 2910,
            z = 3713,
            category = 100002,
            custom = true,
            tooltip = "God Wars Dungeon Teleport<br>God Wars Dungeon",
            record = {
                title = "God Wars Dungeon Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "God Wars Dungeon",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 28493",
            sprite = 35029,
        },
        {
            x = 2975,
            z = 3938,
            category = 100002,
            custom = true,
            tooltip = "Ice Plateau Teleport<br>Ice Plateau",
            record = {
                title = "Ice Plateau Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ice Plateau",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14863",
            sprite = 14416,
            offsetX = -12,
        },
        {
            x = 3501,
            z = 3484,
            category = 100002,
            custom = true,
            tooltip = "Kharyrll Teleport<br>Kharyrll",
            record = {
                title = "Kharyrll Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Kharyrll",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14809",
            sprite = 36126,
            offsetX = -12,
        },
        {
            x = 2636,
            z = 3167,
            category = 100002,
            custom = true,
            tooltip = "Khazard Teleport<br>Khazard",
            record = {
                title = "Khazard Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Khazard",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14847",
            sprite = 14408,
            offsetX = -12,
        },
        {
            x = 3004,
            z = 3470,
            category = 100002,
            custom = true,
            tooltip = "Lassar Teleport<br>Lassar",
            record = {
                title = "Lassar Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Lassar",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14812",
            sprite = 36127,
            offsetX = -12,
        },
        {
            x = 3219,
            z = 3248,
            category = 100002,
            custom = true,
            tooltip = "Lumbridge Teleport<br>Lumbridge",
            record = {
                title = "Lumbridge Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Lumbridge",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14756",
            sprite = 36135,
            offsetX = -12,
        },
        {
            x = 2114,
            z = 3915,
            category = 100002,
            custom = true,
            tooltip = "Moonclan Teleport<br>Moonclan",
            record = {
                title = "Moonclan Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Moonclan",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14831",
            sprite = 14403,
            offsetX = -12,
        },
        {
            x = 2785,
            z = 3664,
            category = 100002,
            custom = true,
            tooltip = "Mountain Camp Teleport<br>Mountain Camp",
            record = {
                title = "Mountain Camp Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Mountain Camp",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 51275",
            sprite = 1780,
            offsetX = -12,
        },
        {
            x = 2665,
            z = 3375,
            category = 100002,
            custom = true,
            tooltip = "North Ardougne Teleport<br>North Ardougne",
            record = {
                title = "North Ardougne Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "North Ardougne",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14843",
            sprite = 14446,
            offsetX = -12,
        },
        {
            x = 3780,
            z = 4414,
            category = 100002,
            custom = true,
            tooltip = "North-western Anachronia Teleport<br>North-western Anachronia",
            record = {
                title = "North-western Anachronia Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "North-western Anachronia",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 51276",
            sprite = 10370,
            offsetX = -12,
        },
        {
            x = 1980,
            z = 3229,
            category = 100002,
            custom = true,
            tooltip = "Northern Lost Grove Teleport<br>Northern Lost Grove",
            record = {
                title = "Northern Lost Grove Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Northern Lost Grove",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 51278",
            sprite = 11316,
            offsetX = -12,
        },
        {
            x = 2467,
            z = 3245,
            category = 100002,
            custom = true,
            tooltip = "Ourania Teleport<br>Ourania",
            record = {
                title = "Ourania Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ourania",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14833",
            sprite = 14442,
            offsetX = -12,
        },
        {
            x = 3377,
            z = 3402,
            category = 100002,
            custom = true,
            tooltip = "Senntisten Teleport<br>Senntisten",
            record = {
                title = "Senntisten Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Senntisten",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Ancient spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14806",
            sprite = 36129,
            offsetX = -12,
        },
        {
            x = 3055,
            z = 3310,
            category = 100002,
            custom = true,
            tooltip = "South Falador Teleport<br>South Falador",
            record = {
                title = "South Falador Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "South Falador",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14836",
            sprite = 14444,
            offsetX = -12,
        },
        {
            x = 2413,
            z = 2847,
            category = 100002,
            custom = true,
            tooltip = "South Feldip Hills Teleport<br>South Feldip Hills",
            record = {
                title = "South Feldip Hills Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "South Feldip Hills",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14744",
            sprite = 36136,
            offsetX = 12,
        },
        {
            x = 2912,
            z = 3423,
            category = 100002,
            custom = true,
            tooltip = "Taverley Teleport<br>Taverley",
            record = {
                title = "Taverley Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Taverley",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 11762",
            sprite = 35031,
        },
        {
            x = 3378,
            z = 2876,
            category = 100002,
            custom = true,
            tooltip = "The Heart Teleport<br>The Heart",
            record = {
                title = "The Heart Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "The Heart",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 33163",
            sprite = 35029,
            offsetX = -12,
        },
        {
            x = 2817,
            z = 3676,
            category = 100002,
            custom = true,
            tooltip = "Trollheim Farm Teleport<br>Trollheim Farm",
            record = {
                title = "Trollheim Farm Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Trollheim Farm",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14867",
            sprite = 14453,
            offsetX = -12,
        },
        {
            x = 2882,
            z = 3668,
            category = 100002,
            custom = true,
            tooltip = "Trollheim Teleport<br>Trollheim",
            record = {
                title = "Trollheim Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Trollheim",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14778",
            sprite = 35032,
        },
        {
            x = 3212,
            z = 3434,
            category = 100002,
            custom = true,
            tooltip = "Varrock Teleport<br>Varrock",
            record = {
                title = "Varrock Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Varrock",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14753",
            sprite = 36137,
            offsetX = -12,
        },
        {
            x = 2546,
            z = 3756,
            category = 100002,
            custom = true,
            tooltip = "Waterbirth Teleport<br>Waterbirth",
            record = {
                title = "Waterbirth Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Waterbirth",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 14837",
            sprite = 14404,
            offsetX = -12,
        },
        {
            x = 4185,
            z = 3346,
            category = 100002,
            custom = true,
            tooltip = "Wendlewick Teleport<br>Wendlewick",
            record = {
                title = "Wendlewick Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Wendlewick",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Standard spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 53006",
            sprite = 35665,
            offsetX = -12,
        },
        {
            x = 2803,
            z = 2917,
            category = 100002,
            custom = true,
            tooltip = "Western Kharazi Jungle Teleport<br>Western Kharazi Jungle",
            record = {
                title = "Western Kharazi Jungle Teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Western Kharazi Jungle",
                        detail = "Spells teleport destination",
                    },
                    {
                        name = "Lunar spellbook",
                        detail = "Cached spell destination; availability is not inferred.",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native ability struct 51274",
            sprite = 1779,
            offsetX = -12,
        },
        {
            x = 3212,
            z = 3434,
            category = 100003,
            custom = true,
            tooltip = "Varrock teleport<br>Varrock",
            record = {
                title = "Varrock teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Varrock",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14753",
            itemID = 8007,
            offsetX = 12,
        },
        {
            x = 4185,
            z = 3346,
            category = 100003,
            custom = true,
            tooltip = "Wendlewick teleport<br>Wendlewick",
            record = {
                title = "Wendlewick teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Wendlewick",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 53006",
            itemID = 60475,
            offsetX = 12,
        },
        {
            x = 3219,
            z = 3248,
            category = 100003,
            custom = true,
            tooltip = "Lumbridge teleport<br>Lumbridge",
            record = {
                title = "Lumbridge teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Lumbridge",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14756",
            itemID = 8008,
            offsetX = 12,
        },
        {
            x = 2965,
            z = 3378,
            category = 100003,
            custom = true,
            tooltip = "Falador teleport<br>Falador",
            record = {
                title = "Falador teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Falador",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14759",
            itemID = 8009,
            offsetX = 12,
        },
        {
            x = 2757,
            z = 3478,
            category = 100003,
            custom = true,
            tooltip = "Camelot teleport<br>Camelot",
            record = {
                title = "Camelot teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Camelot",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14763",
            itemID = 8010,
            offsetX = 12,
        },
        {
            x = 2661,
            z = 3302,
            category = 100003,
            custom = true,
            tooltip = "Ardougne teleport<br>Ardougne",
            record = {
                title = "Ardougne teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ardougne",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14768",
            itemID = 8011,
            offsetX = 12,
        },
        {
            x = 3780,
            z = 4414,
            category = 100003,
            custom = true,
            tooltip = "North-western anachronia teleport<br>North-western Anachronia",
            record = {
                title = "North-western anachronia teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "North-western Anachronia",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 51276",
            itemID = 58445,
            offsetX = 12,
        },
        {
            x = 4064,
            z = 4251,
            category = 100003,
            custom = true,
            tooltip = "Eastern anachronia teleport<br>Eastern Anachronia",
            record = {
                title = "Eastern anachronia teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Eastern Anachronia",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 51277",
            itemID = 58446,
            offsetX = 12,
        },
        {
            x = 1980,
            z = 3229,
            category = 100003,
            custom = true,
            tooltip = "Northern lost grove teleport<br>Northern Lost Grove",
            record = {
                title = "Northern lost grove teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Northern Lost Grove",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 51278",
            itemID = 58447,
            offsetX = 12,
        },
        {
            x = 3378,
            z = 2876,
            category = 100003,
            custom = true,
            tooltip = "The Heart teleport<br>The Heart",
            record = {
                title = "The Heart teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "The Heart",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 33163",
            itemID = 36919,
            offsetX = 12,
        },
        {
            x = 3377,
            z = 3402,
            category = 100003,
            custom = true,
            tooltip = "Senntisten teleport<br>Senntisten",
            record = {
                title = "Senntisten teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Senntisten",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14806",
            itemID = 38464,
            offsetX = 12,
        },
        {
            x = 3501,
            z = 3484,
            category = 100003,
            custom = true,
            tooltip = "Kharyrll teleport<br>Kharyrll",
            record = {
                title = "Kharyrll teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Kharyrll",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14809",
            itemID = 38465,
            offsetX = 12,
        },
        {
            x = 3004,
            z = 3470,
            category = 100003,
            custom = true,
            tooltip = "Lassar teleport<br>Lassar",
            record = {
                title = "Lassar teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Lassar",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14812",
            itemID = 38466,
            offsetX = 12,
        },
        {
            x = 2968,
            z = 3696,
            category = 100003,
            custom = true,
            tooltip = "Dareeyak teleport<br>Dareeyak",
            record = {
                title = "Dareeyak teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Dareeyak",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14815",
            itemID = 38467,
            offsetX = 12,
        },
        {
            x = 3222,
            z = 3666,
            category = 100003,
            custom = true,
            tooltip = "Carrallangar teleport<br>Carrallangar",
            record = {
                title = "Carrallangar teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Carrallangar",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14818",
            itemID = 38468,
            offsetX = 12,
        },
        {
            x = 3288,
            z = 3886,
            category = 100003,
            custom = true,
            tooltip = "Annakarl teleport<br>Annakarl",
            record = {
                title = "Annakarl teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Annakarl",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14821",
            itemID = 38469,
            offsetX = 12,
        },
        {
            x = 2976,
            z = 3872,
            category = 100003,
            custom = true,
            tooltip = "Ghorrock teleport<br>Ghorrock",
            record = {
                title = "Ghorrock teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ghorrock",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14824",
            itemID = 38470,
            offsetX = 12,
        },
        {
            x = 2114,
            z = 3915,
            category = 100003,
            custom = true,
            tooltip = "Moonclan teleport<br>Moonclan",
            record = {
                title = "Moonclan teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Moonclan",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14831",
            itemID = 50552,
            offsetX = 12,
        },
        {
            x = 2467,
            z = 3245,
            category = 100003,
            custom = true,
            tooltip = "Ourania teleport<br>Ourania",
            record = {
                title = "Ourania teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ourania",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14833",
            itemID = 50553,
            offsetX = 12,
        },
        {
            x = 3055,
            z = 3310,
            category = 100003,
            custom = true,
            tooltip = "South falador teleport<br>South Falador",
            record = {
                title = "South falador teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "South Falador",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14836",
            itemID = 50554,
            offsetX = 12,
        },
        {
            x = 2546,
            z = 3756,
            category = 100003,
            custom = true,
            tooltip = "Waterbirth teleport<br>Waterbirth",
            record = {
                title = "Waterbirth teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Waterbirth",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14837",
            itemID = 50555,
            offsetX = 12,
        },
        {
            x = 2543,
            z = 3569,
            category = 100003,
            custom = true,
            tooltip = "Barbarian teleport<br>Barbarian",
            record = {
                title = "Barbarian teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Barbarian",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14841",
            itemID = 50556,
            offsetX = 12,
        },
        {
            x = 2665,
            z = 3375,
            category = 100003,
            custom = true,
            tooltip = "North ardougne teleport<br>North Ardougne",
            record = {
                title = "North ardougne teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "North Ardougne",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14843",
            itemID = 50557,
            offsetX = 12,
        },
        {
            x = 2803,
            z = 2917,
            category = 100003,
            custom = true,
            tooltip = "Western kharazi jungle teleport<br>Western Kharazi Jungle",
            record = {
                title = "Western kharazi jungle teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Western Kharazi Jungle",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 51274",
            itemID = 58448,
            offsetX = 12,
        },
        {
            x = 2785,
            z = 3664,
            category = 100003,
            custom = true,
            tooltip = "Mountain camp teleport<br>Mountain Camp",
            record = {
                title = "Mountain camp teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Mountain Camp",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 51275",
            itemID = 58449,
            offsetX = 12,
        },
        {
            x = 2636,
            z = 3167,
            category = 100003,
            custom = true,
            tooltip = "Khazard teleport<br>Khazard",
            record = {
                title = "Khazard teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Khazard",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14847",
            itemID = 50558,
            offsetX = 12,
        },
        {
            x = 2613,
            z = 3383,
            category = 100003,
            custom = true,
            tooltip = "Fishing guild teleport<br>Fishing Guild",
            record = {
                title = "Fishing guild teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Fishing Guild",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14857",
            itemID = 50559,
            offsetX = 12,
        },
        {
            x = 2790,
            z = 3452,
            category = 100003,
            custom = true,
            tooltip = "Catherby teleport<br>Catherby",
            record = {
                title = "Catherby teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Catherby",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14860",
            itemID = 50560,
            offsetX = 12,
        },
        {
            x = 2975,
            z = 3938,
            category = 100003,
            custom = true,
            tooltip = "Ice plateau teleport<br>Ice Plateau",
            record = {
                title = "Ice plateau teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Ice Plateau",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14863",
            itemID = 50561,
            offsetX = 12,
        },
        {
            x = 2817,
            z = 3676,
            category = 100003,
            custom = true,
            tooltip = "Trollheim farm teleport<br>Trollheim Farm",
            record = {
                title = "Trollheim farm teleport",
                kind = "navigation",
                width = 268,
                rows = {
                    {
                        name = "Trollheim Farm",
                        detail = "Tablets teleport destination",
                    },
                },
                note = "Reference destination only; requirements, charges and landing variations may apply.",
            },
            source = "Native tablet enum 8083; matching ability struct 14867",
            itemID = 50562,
            offsetX = 12,
        },
    },
}

-- Merge the documented cape data while preserving the original teleport order.
local capes = require("skillcape_data")
for _, category in ipairs(capes.categories) do
    data.categories[#data.categories + 1] = category
end
for _, point in ipairs(capes.points) do
    data.points[#data.points + 1] = point
end
-- Extra item/outfit/familiar families are kept in their own documented data file.
local extra = require("teleport_extra_data")
for _, category in ipairs(extra.categories) do
    data.categories[#data.categories + 1] = category
end
for _, point in ipairs(extra.points) do
    data.points[#data.points + 1] = point
end
-- Keep Navigation small: all custom teleport filters live under Teleports.
for _, category in ipairs(data.categories) do
    category.group = 6
end
-- world_map_icons.lua delegates shared-location grouping to travel_groups.lua
-- after filtering, so its tooltip lists only the currently enabled methods.
return data
