-- skillcape_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: teleport_data.lua.
--[=[
BEGINNER WALKTHROUGH: skillcape_data.lua

This module adds the Navigation > Skillcapes checkbox and cape destination pins.
teleport_data.lua merges both lists into its returned data. world_map_icons.lua
selects points by areaID when main.lua changes maps. No teleport action is executed.

Each point is one destination: x/z are already projected map tiles; areaID names
its map (28 = surface). itemID selects native cape artwork, category connects the
checkbox, and record supplies the hover card. custom=true prevents native-index
lookups. offsetX slightly separates the cape from an existing location icon.

To add a destination, transform its source coordinate with map_math.worldToSurface
or map_areas.Project first, then copy the record shape below. Do not use raw dungeon
coordinates on the surface map. These are area references, not precise landing tiles.
Shared normal/master/trimmed cape destinations are represented once per cape family.
Sources: https://runescape.wiki/w/Slayer_cape
         https://runescape.wiki/w/Dungeoneering_cape
]=]

return {
    points = {
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Turael / Spria",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3548,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Turael / Spria",
            category = 100004,
            x = 2890,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Jacquelyn",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3224,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Jacquelyn",
            category = 100004,
            x = 3221,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Vannaka",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3478,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Vannaka",
            category = 100004,
            x = 3091,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "The Raptor",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3544,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>The Raptor",
            category = 100004,
            x = 3292,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Mazchna / Achtryn",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3509,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Mazchna / Achtryn",
            category = 100004,
            x = 3512,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Chaeldar",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 4431,
            areaID = 1,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Chaeldar",
            category = 100004,
            x = 2445,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Sumona",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 2993,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Sumona",
            category = 100004,
            x = 3358,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Duradel / Lapalok",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 2982,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Duradel / Lapalok",
            category = 100004,
            x = 2869,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Kuradal",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 65,
            areaID = 36,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Kuradal",
            category = 100004,
            x = 138,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Morvran",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3338,
            areaID = 231,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Morvran",
            category = 100004,
            x = 2196,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Laniakea: south-east Anachronia ruins",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Cape destination area near Raksha / Orthen Oubliette, not the base camp. Slayer level and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 4047,
            areaID = 28,
            source = "https://runescape.wiki/w/Laniakea; native Orthen Oubliette entrance reference",
            tooltip = "Slayer cape<br>Laniakea",
            category = 100004,
            x = 4095,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Mandrith",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Slayer cape",
            },
            offsetX = 12,
            z = 3953,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Slayer cape<br>Mandrith",
            category = 100004,
            x = 3051,
            itemID = 9786,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Edgeville chaos druids",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9935,
            areaID = 31,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Edgeville chaos druids",
            category = 100004,
            x = 3132,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Dwarven Mine resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9772,
            areaID = 18,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Dwarven Mine resource dungeon",
            category = 100004,
            x = 3031,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Edgeville hill giants",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9830,
            areaID = 31,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Edgeville hill giants",
            category = 100004,
            x = 3116,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Karamja Volcano resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 149,
            areaID = 13,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Karamja Volcano resource dungeon",
            category = 100004,
            x = 285,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Daemonheim Peninsula Island",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3666,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Daemonheim Peninsula Island",
            category = 100004,
            x = 3514,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Mining Guild resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9742,
            areaID = 18,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Mining Guild resource dungeon",
            category = 100004,
            x = 3022,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Braindeath Island Rum-geon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 5122,
            areaID = 19,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Braindeath Island Rum-geon",
            category = 100004,
            x = 2147,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Taverley hellhound resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9841,
            areaID = 17,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Taverley hellhound resource dungeon",
            category = 100004,
            x = 2853,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Taverley blue dragon resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9810,
            areaID = 17,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Taverley blue dragon resource dungeon",
            category = 100004,
            x = 2912,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Varrock Sewers resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9878,
            areaID = 31,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Varrock Sewers resource dungeon",
            category = 100004,
            x = 3164,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Dragontooth Island resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3534,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Dragontooth Island resource dungeon",
            category = 100004,
            x = 3808,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Chaos Tunnels resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 5545,
            areaID = 23,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Chaos Tunnels resource dungeon",
            category = 100004,
            x = 3144,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Al Kharid resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3307,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Al Kharid resource dungeon",
            category = 100004,
            x = 3297,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Brimhaven Dungeon resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 96,
            areaID = 13,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Brimhaven Dungeon resource dungeon",
            category = 100004,
            x = 85,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Polypore Dungeon resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Surface access reference: the cape lands inside Polypore Dungeon, whose map is not bundled.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3326,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Polypore Dungeon resource dungeon",
            category = 100004,
            x = 3408,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Asgarnian Ice resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 9550,
            areaID = 25,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Asgarnian Ice resource dungeon",
            category = 100004,
            x = 3007,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Kalgerion resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3665,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Kalgerion resource dungeon",
            category = 100004,
            x = 3402,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Morytania Slayer Tower dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Destination-area reference, not an exact landing tile. Cape level, quest and access requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3531,
            areaID = 28,
            source = "RS3 cape destination list; local map transforms and destination-area anchors",
            tooltip = "Dungeoneering cape<br>Morytania Slayer Tower dungeon",
            category = 100004,
            x = 3434,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Gorajo Hoardstalker Dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Dungeon entrance reference in Prifddinas; cape lands outside the entrance. Requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3308,
            areaID = 231,
            source = "RS3 Dungeoneering cape destination list; destination-area reference",
            tooltip = "Dungeoneering cape<br>Gorajo Hoardstalker Dungeon",
            category = 100004,
            x = 2243,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Edimmu resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Dungeon entrance reference in Prifddinas; cape lands outside the entrance. Requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3380,
            areaID = 231,
            source = "RS3 Dungeoneering cape destination list; destination-area reference",
            tooltip = "Dungeoneering cape<br>Edimmu resource dungeon",
            category = 100004,
            x = 2215,
            itemID = 15706,
            custom = true,
        },
        {
            record = {
                kind = "navigation",
                rows = {
                    {
                        name = "Baxtorian Falls resource dungeon",
                        detail = "Skillcape teleport destination",
                    },
                },
                width = 268,
                note = "Surface access reference: cape lands inside Waterfall Dungeon, whose map is not bundled. Requirements apply.",
                title = "Dungeoneering cape",
            },
            offsetX = 12,
            z = 3476,
            areaID = 28,
            source = "RS3 Dungeoneering cape destination list; destination-area reference",
            tooltip = "Dungeoneering cape<br>Baxtorian Falls resource dungeon",
            category = 100004,
            x = 2512,
            itemID = 15706,
            custom = true,
        },
    },
    categories = {
        {
            name = "Skillcapes",
            id = 100004,
            itemID = 9786,
            group = 1,
        },
    },
}
