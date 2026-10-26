-- dungeon_routes_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: dungeon_routes.lua.
-- Dungeon navigation additions, consumed by dungeon_routes.Apply in map_areas_data.lua.
-- Each [native area ID] list uses DISPLAY tile coordinates, never screen pixels.
-- sprite=1610 is the native ladder mapscene artwork. Most ladders have artwork/actions
-- only: the cache does not specify where they go. routeTarget is present ONLY for
-- a cached cross-map destination or an explicitly checked Yanille staircase pair.
-- routeTarget={areaID,x,z} opens/pans the plugin map; it never moves the character.
-- connector=true draws a gold line to a same-map target, beneath the marker artwork.
-- Requirements are descriptive, not live skill/quest access checks.
-- Sources: local native map labels/locations; Yanille requirements:
-- https://runescape.wiki/w/Yanille_Agility_dungeon
-- https://runescape.wiki/w/Agility
return {
    [0] = {
        {
            x = 2555,
            z = 9658,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2569,
            z = 9667,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2569,
            z = 9631,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2561,
            z = 9622,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2566,
            z = 9627,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2566,
            z = 9631,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2566,
            z = 9642,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2569,
            z = 9627,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2572,
            z = 9627,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2572,
            z = 9631,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2576,
            z = 9655,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2621,
            z = 9661,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2562,
            z = 9756,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2632,
            z = 9694,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2696,
            z = 9682,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Exit",
            record = {
                title = "Exit",
                kind = "navigation",
                rows = {
                    {
                        name = "Exit",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2717,
            z = 9773,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2570,
            z = 9683,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2581,
            z = 9852,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [1] = {
        {
            x = 2403,
            z = 4458,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [2] = {
        {
            x = 36,
            z = 13,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 36,
            z = 58,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 122,
            z = 3,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 122,
            z = 60,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 132,
            z = 13,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 132,
            z = 58,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 218,
            z = 3,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 218,
            z = 60,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone Staircase",
            record = {
                title = "Stone Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone Staircase",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 207,
            z = 29,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Troll ladder",
            record = {
                title = "Troll ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Troll ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [3] = {
        {
            x = 140,
            z = 90,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Yanille staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Yanille staircase",
                        detail = "Stairs to the upper chamber.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 124,
                z = 89,
            },
            connector = false,
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 124,
            z = 89,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Yanille staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Yanille staircase",
                        detail = "Stairs to the lower chamber. Reaching this route requires 57 Agility via the monkey bars, or 82 Thieving and a lockpick via the southern entrance.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 140,
                z = 90,
            },
            connector = true,
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 98,
            z = 77,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder to RuneScape Surface",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder to RuneScape Surface",
                        detail = "Wizards' Guild ground floor.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 28,
                x = 2594,
                z = 3085,
            },
            connector = false,
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 73,
            z = 114,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 107,
            z = 70,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 42,
            z = 81,
            category = 100020,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Yanille staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Yanille staircase",
                        detail = "One-way staircase from the poison spider chamber. No skill requirement for climbing out.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 82,
                z = 113,
            },
            connector = true,
            iconWidth = 12,
            iconHeight = 16,
            markerStyle = "dot",
        },
        {
            x = 77,
            z = 98,
            category = 100020,
            iconSize = 20,
            tooltip = "Obstacle pipe",
            record = {
                title = "Obstacle pipe",
                kind = "navigation",
                rows = {
                    {
                        name = "Obstacle pipe",
                        detail = "Agility obstacle. Failure can cause damage and temporarily trap you.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 81,
                z = 98,
            },
            connector = true,
            markerStyle = "dot",
        },
        {
            x = 81,
            z = 98,
            category = 100020,
            iconSize = 20,
            tooltip = "Obstacle pipe",
            record = {
                title = "Obstacle pipe",
                kind = "navigation",
                rows = {
                    {
                        name = "Obstacle pipe",
                        detail = "Agility obstacle. Failure can cause damage and temporarily trap you.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 77,
                z = 98,
            },
            connector = false,
            markerStyle = "dot",
        },
        {
            x = 102,
            z = 81,
            category = 100020,
            iconSize = 20,
            tooltip = "Monkey bars",
            record = {
                title = "Monkey bars",
                kind = "navigation",
                rows = {
                    {
                        name = "Monkey bars",
                        detail = "Requires 57 Agility. Failure drops you into the poison spider chamber.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 102,
                z = 86,
            },
            connector = true,
            markerStyle = "dot",
        },
        {
            x = 102,
            z = 86,
            category = 100020,
            iconSize = 20,
            tooltip = "Monkey bars",
            record = {
                title = "Monkey bars",
                kind = "navigation",
                rows = {
                    {
                        name = "Monkey bars",
                        detail = "Requires 57 Agility. Failure drops you into the poison spider chamber.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 102,
                z = 81,
            },
            connector = false,
            markerStyle = "dot",
        },
        {
            x = 136,
            z = 100,
            category = 100020,
            iconSize = 20,
            tooltip = "Rubble climb",
            record = {
                title = "Rubble climb",
                kind = "navigation",
                rows = {
                    {
                        name = "Rubble climb",
                        detail = "Requires 67 Agility.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 119,
                z = 96,
            },
            connector = true,
            markerStyle = "dot",
        },
        {
            x = 119,
            z = 96,
            category = 100020,
            iconSize = 20,
            tooltip = "Rubble climb",
            record = {
                title = "Rubble climb",
                kind = "navigation",
                rows = {
                    {
                        name = "Rubble climb",
                        detail = "Requires 67 Agility.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 3,
                x = 136,
                z = 100,
            },
            connector = false,
            markerStyle = "dot",
        },
        {
            x = 82,
            z = 113,
            category = 100020,
            iconSize = 20,
            tooltip = "Poison spider staircase arrival",
            record = {
                title = "Poison spider staircase arrival",
                kind = "navigation",
                rows = {
                    {
                        name = "Poison spider staircase arrival",
                        detail = "One-way arrival from the lower chamber.",
                    },
                },
            },
            markerStyle = "dot",
        },
    },
    [4] = {
        {
            x = 3297,
            z = 9823,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [6] = {
        {
            x = 3005,
            z = 10363,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3069,
            z = 10256,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3043,
            z = 10328,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Steps",
            record = {
                title = "Steps",
                kind = "navigation",
                rows = {
                    {
                        name = "Steps",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3242,
            z = 9974,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Asgarnian Ice Dungeon",
            record = {
                title = "Asgarnian Ice Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Asgarnian Ice Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 25,
                x = 3033,
                z = 9800,
            },
            connector = false,
        },
    },
    [8] = {
        {
            x = 7,
            z = 74,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 71,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 29,
            z = 69,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 4,
            z = 27,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 60,
            z = 24,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 7,
            z = 57,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 8,
            z = 51,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 11,
            z = 54,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 29,
            z = 60,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 32,
            z = 57,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 32,
            z = 63,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 41,
            z = 61,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 43,
            z = 63,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 59,
            z = 7,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Keldagrim",
            record = {
                title = "Keldagrim",
                kind = "navigation",
                rows = {
                    {
                        name = "Keldagrim",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 21,
                x = 96,
                z = 124,
            },
            connector = false,
        },
    },
    [9] = {
        {
            x = 13,
            z = 101,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 85,
            z = 109,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 13,
            z = 106,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 85,
            z = 114,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 101,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 93,
            z = 109,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 106,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 93,
            z = 114,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 107,
            z = 136,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 203,
            z = 128,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 191,
            z = 136,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 101,
            z = 204,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 11,
            z = 102,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 11,
            z = 105,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 102,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 105,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 107,
            z = 137,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 102,
            z = 204,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [13] = {
        {
            x = 125,
            z = 73,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Brimhaven Adamant Dungeon",
            record = {
                title = "Brimhaven Adamant Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Brimhaven Adamant Dungeon",
                        detail = "The southern room is unrestricted; side rooms require 70, 80 or 90 Slayer.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 680,
                x = 4512,
                z = 6047,
            },
            connector = false,
        },
    },
    [14] = {
        {
            x = 2509,
            z = 10246,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2138,
            z = 10353,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2421,
            z = 10279,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stone ladder",
            record = {
                title = "Stone ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Stone ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [16] = {
        {
            x = 8,
            z = 482,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Steps",
            record = {
                title = "Steps",
                kind = "navigation",
                rows = {
                    {
                        name = "Steps",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 114,
            z = 479,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Iron ladder",
            record = {
                title = "Iron ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Iron ladder",
                        detail = "Climb / Climb-up / Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 118,
            z = 406,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 128,
            z = 405,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 129,
            z = 309,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 404,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 143,
            z = 308,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 154,
            z = 389,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 154,
            z = 292,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 131,
            z = 298,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 202,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 119,
            z = 196,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 119,
            z = 291,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 117,
            z = 286,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 118,
            z = 190,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 122,
            z = 177,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 121,
            z = 273,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 146,
            z = 266,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 147,
            z = 170,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 285,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 380,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 158,
            z = 376,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 158,
            z = 279,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 170,
            z = 290,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 170,
            z = 193,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 183,
            z = 179,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 183,
            z = 276,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 184,
            z = 292,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 184,
            z = 197,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 210,
            z = 215,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 210,
            z = 120,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 231,
            z = 79,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down / Public encounter / Private encounter / Join private encounter / Rejoin last private encounter",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 295,
            z = 408,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 277,
            z = 83,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 277,
            z = 180,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 252,
            z = 283,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 252,
            z = 186,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 281,
            z = 392,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 281,
            z = 295,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [17] = {
        {
            x = 2842,
            z = 9824,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [18] = {
        {
            x = 2996,
            z = 9846,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3018,
            z = 9739,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3019,
            z = 9738,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3019,
            z = 9740,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3020,
            z = 9739,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3059,
            z = 9776,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3019,
            z = 9850,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3013,
            z = 9831,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Living Rock Caverns",
            record = {
                title = "Living Rock Caverns",
                kind = "navigation",
                rows = {
                    {
                        name = "Living Rock Caverns",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 35,
                x = 3651,
                z = 5122,
            },
            connector = false,
        },
    },
    [19] = {
        {
            x = 2162,
            z = 5116,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2129,
            z = 5094,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Wooden Stair",
            record = {
                title = "Wooden Stair",
                kind = "navigation",
                rows = {
                    {
                        name = "Wooden Stair",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2137,
            z = 5088,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Wooden Stair",
            record = {
                title = "Wooden Stair",
                kind = "navigation",
                rows = {
                    {
                        name = "Wooden Stair",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2149,
            z = 5088,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Wooden Stair",
            record = {
                title = "Wooden Stair",
                kind = "navigation",
                rows = {
                    {
                        name = "Wooden Stair",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2151,
            z = 5109,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Wooden Stair",
            record = {
                title = "Wooden Stair",
                kind = "navigation",
                rows = {
                    {
                        name = "Wooden Stair",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2163,
            z = 5088,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Wooden Stair",
            record = {
                title = "Wooden Stair",
                kind = "navigation",
                rows = {
                    {
                        name = "Wooden Stair",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 2139,
            z = 5105,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [21] = {
        {
            x = 12,
            z = 167,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 12,
            z = 177,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 18,
            z = 176,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 19,
            z = 148,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 47,
            z = 140,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 47,
            z = 161,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 49,
            z = 174,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 95,
            z = 115,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 115,
            z = 117,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 89,
            z = 160,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 99,
            z = 148,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 78,
            z = 140,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 78,
            z = 161,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 114,
            z = 132,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 114,
            z = 148,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 55,
            z = 126,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 124,
            z = 150,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Lava Flow Mine",
            record = {
                title = "Lava Flow Mine",
                kind = "navigation",
                rows = {
                    {
                        name = "Lava Flow Mine",
                        detail = "Requires King of the Dwarves.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 39,
                x = 2177,
                z = 5664,
            },
            connector = false,
        },
    },
    [22] = {
        {
            x = 12,
            z = 25,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 31,
            z = 9,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 50,
            z = 24,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 14,
            z = 83,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 47,
            z = 83,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 106,
            z = 52,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 150,
            z = 52,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 112,
            z = 80,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 149,
            z = 77,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 10,
            z = 24,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 49,
            z = 23,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 12,
            z = 82,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 46,
            z = 82,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 106,
            z = 51,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 147,
            z = 51,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 112,
            z = 79,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 146,
            z = 76,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 120,
            z = 5,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Fremennik Dungeon",
            record = {
                title = "Fremennik Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Fremennik Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 5,
                x = 2712,
                z = 10012,
            },
            connector = false,
        },
        {
            x = 126,
            z = 5,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Fremennik Dungeon",
            record = {
                title = "Fremennik Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Fremennik Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 5,
                x = 2741,
                z = 10007,
            },
            connector = false,
        },
        {
            x = 127,
            z = 119,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Fremennik Dungeon",
            record = {
                title = "Fremennik Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Fremennik Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 5,
                x = 2704,
                z = 9995,
            },
            connector = false,
        },
        {
            x = 157,
            z = 103,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Fremennik Dungeon",
            record = {
                title = "Fremennik Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Fremennik Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 5,
                x = 2797,
                z = 9996,
            },
            connector = false,
        },
    },
    [23] = {
        {
            x = 3183,
            z = 5470,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [24] = {
        {
            x = 25,
            z = 152,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Spiky chain",
            record = {
                title = "Spiky chain",
                kind = "navigation",
                rows = {
                    {
                        name = "Spiky chain",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3,
            z = 164,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 57,
            z = 146,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 46,
            z = 142,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 46,
            z = 46,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Goo covered vine",
            record = {
                title = "Goo covered vine",
                kind = "navigation",
                rows = {
                    {
                        name = "Goo covered vine",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 19,
            z = 19,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Dripping vine",
            record = {
                title = "Dripping vine",
                kind = "navigation",
                rows = {
                    {
                        name = "Dripping vine",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 44,
            z = 52,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Dripping vine",
            record = {
                title = "Dripping vine",
                kind = "navigation",
                rows = {
                    {
                        name = "Dripping vine",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 115,
            z = 96,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 121,
            z = 114,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 135,
            z = 93,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 112,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rope",
            record = {
                title = "Rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Rope",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 146,
            z = 150,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 122,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 101,
            z = 56,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Bone Chain",
            record = {
                title = "Bone Chain",
                kind = "navigation",
                rows = {
                    {
                        name = "Bone Chain",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 142,
            z = 31,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Bone Chain",
            record = {
                title = "Bone Chain",
                kind = "navigation",
                rows = {
                    {
                        name = "Bone Chain",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 150,
            z = 32,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Boney ladder",
            record = {
                title = "Boney ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Boney ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [25] = {
        {
            x = 3008,
            z = 9550,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3049,
            z = 9593,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Asgarnian Ice Dungeon",
            record = {
                title = "Asgarnian Ice Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Asgarnian Ice Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 760,
                x = 3919,
                z = 5070,
            },
            connector = false,
        },
        {
            x = 3034,
            z = 9796,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Wilderness Dungeons",
            record = {
                title = "Wilderness Dungeons",
                kind = "navigation",
                rows = {
                    {
                        name = "Wilderness Dungeons",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 6,
                x = 3244,
                z = 9975,
            },
            connector = false,
        },
    },
    [26] = {
        {
            x = 45,
            z = 28,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 104,
            z = 108,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 104,
            z = 120,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 147,
            z = 74,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 148,
            z = 112,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 151,
            z = 103,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 141,
            z = 92,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 200,
            z = 172,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 200,
            z = 184,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 243,
            z = 138,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 244,
            z = 176,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 247,
            z = 167,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 21,
            z = 27,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 117,
            z = 91,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 14,
            z = 57,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 22,
            z = 45,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 25,
            z = 30,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 25,
            z = 34,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 34,
            z = 21,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 34,
            z = 25,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 34,
            z = 44,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 41,
            z = 53,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 43,
            z = 58,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 50,
            z = 30,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 110,
            z = 121,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 118,
            z = 109,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 121,
            z = 95,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 121,
            z = 98,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 86,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 89,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 131,
            z = 108,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 137,
            z = 117,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 140,
            z = 122,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 146,
            z = 95,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 34,
            z = 9,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 74,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 130,
            z = 68,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 226,
            z = 129,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 226,
            z = 133,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 17,
            z = 116,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 46,
            z = 103,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 182,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 148,
            z = 176,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 240,
            z = 246,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 244,
            z = 240,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 113,
            z = 180,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 142,
            z = 167,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 7,
            z = 80,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 51,
            z = 77,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 110,
            z = 179,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 153,
            z = 170,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 206,
            z = 243,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 249,
            z = 234,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 103,
            z = 144,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 147,
            z = 141,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 14,
            z = 79,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 40,
            z = 98,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 110,
            z = 143,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 137,
            z = 162,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 32,
            z = 111,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 128,
            z = 176,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 63,
            z = 127,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Misthalin Underground",
            record = {
                title = "Misthalin Underground",
                kind = "navigation",
                rows = {
                    {
                        name = "Misthalin Underground",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 31,
                x = 3318,
                z = 9602,
            },
            connector = false,
        },
    },
    [27] = {
        {
            x = 3814,
            z = 9462,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3829,
            z = 9462,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [29] = {
        {
            x = 3271,
            z = 4862,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [30] = {
        {
            x = 104,
            z = 12,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 118,
            z = 20,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 131,
            z = 33,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 20,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 153,
            z = 62,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 197,
            z = 18,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 214,
            z = 31,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [31] = {
        {
            x = 3080,
            z = 9772,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3117,
            z = 9754,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3116,
            z = 9852,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3076,
            z = 9893,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Cellar stairs",
            record = {
                title = "Cellar stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Cellar stairs",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3097,
            z = 9868,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3118,
            z = 9643,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3084,
            z = 9672,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3088,
            z = 9971,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3187,
            z = 9833,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3169,
            z = 9572,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Climbing rope",
            record = {
                title = "Climbing rope",
                kind = "navigation",
                rows = {
                    {
                        name = "Climbing rope",
                        detail = "Climb",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3149,
            z = 9653,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3244,
            z = 9783,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3231,
            z = 9801,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3230,
            z = 9904,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3237,
            z = 9866,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3209,
            z = 9616,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3240,
            z = 9695,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3183,
            z = 9766,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3318,
            z = 9602,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Dorgesh-Kaan",
            record = {
                title = "Dorgesh-Kaan",
                kind = "navigation",
                rows = {
                    {
                        name = "Dorgesh-Kaan",
                        detail = "Requires Death to the Dorgeshuun.",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 26,
                x = 60,
                z = 127,
            },
            connector = false,
        },
    },
    [35] = {
        {
            x = 3651,
            z = 5122,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Dwarven Mines",
            record = {
                title = "Dwarven Mines",
                kind = "navigation",
                rows = {
                    {
                        name = "Dwarven Mines",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 18,
                x = 3013,
                z = 9831,
            },
            connector = false,
        },
    },
    [36] = {
        {
            x = 42,
            z = 181,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 16,
            z = 139,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rough hewn steps",
            record = {
                title = "Rough hewn steps",
                kind = "navigation",
                rows = {
                    {
                        name = "Rough hewn steps",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 169,
            z = 117,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rough hewn steps",
            record = {
                title = "Rough hewn steps",
                kind = "navigation",
                rows = {
                    {
                        name = "Rough hewn steps",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 50,
            z = 160,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 178,
            z = 96,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 144,
            z = 74,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Rough hewn steps",
            record = {
                title = "Rough hewn steps",
                kind = "navigation",
                rows = {
                    {
                        name = "Rough hewn steps",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [39] = {
        {
            x = 2177,
            z = 5664,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Keldagrim",
            record = {
                title = "Keldagrim",
                kind = "navigation",
                rows = {
                    {
                        name = "Keldagrim",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 21,
                x = 122,
                z = 149,
            },
            connector = false,
        },
    },
    [40] = {
        {
            x = 3024,
            z = 9223,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [41] = {
        {
            x = 3637,
            z = 9696,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Staircase",
            record = {
                title = "Staircase",
                kind = "navigation",
                rows = {
                    {
                        name = "Staircase",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3477,
            z = 9846,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3483,
            z = 9841,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3549,
            z = 9864,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3668,
            z = 9919,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3682,
            z = 9890,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [164] = {
        {
            x = 3858,
            z = 5533,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3858,
            z = 5543,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3870,
            z = 5524,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3865,
            z = 5524,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [672] = {
        {
            x = 2592,
            z = 5959,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [673] = {
        {
            x = 2673,
            z = 5961,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [718] = {
        {
            x = 3257,
            z = 9225,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3318,
            z = 9274,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3267,
            z = 9221,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3271,
            z = 9235,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3271,
            z = 9274,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3280,
            z = 9255,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3286,
            z = 9274,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3317,
            z = 9224,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3317,
            z = 9250,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3323,
            z = 9241,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3268,
            z = 9229,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3301,
            z = 9166,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3301,
            z = 9159,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder / stairs",
            record = {
                title = "Ladder / stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder / stairs",
                        detail = "",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3319,
            z = 9287,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 3320,
            z = 9287,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [719] = {
        {
            x = 204,
            z = 179,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Ladder",
            record = {
                title = "Ladder",
                kind = "navigation",
                rows = {
                    {
                        name = "Ladder",
                        detail = "Climb-up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [735] = {
        {
            x = 1716,
            z = 1340,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 1667,
            z = 1310,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten Colosseum",
            record = {
                title = "Senntisten Colosseum",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten Colosseum",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 736,
                x = 366,
                z = 159,
            },
            connector = false,
        },
        {
            x = 1760,
            z = 1314,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten sewers",
            record = {
                title = "Senntisten sewers",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten sewers",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 737,
                x = 982,
                z = 333,
            },
            connector = false,
        },
        {
            x = 1796,
            z = 1343,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten Asylum",
            record = {
                title = "Senntisten Asylum",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten Asylum",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 738,
                x = 1940,
                z = 1478,
            },
            connector = false,
        },
    },
    [736] = {
        {
            x = 366,
            z = 159,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten",
            record = {
                title = "Senntisten",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 735,
                x = 1667,
                z = 1310,
            },
            connector = false,
        },
    },
    [737] = {
        {
            x = 982,
            z = 333,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten",
            record = {
                title = "Senntisten",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 735,
                x = 1759,
                z = 1303,
            },
            connector = false,
        },
    },
    [738] = {
        {
            x = 1940,
            z = 1478,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Senntisten",
            record = {
                title = "Senntisten",
                kind = "navigation",
                rows = {
                    {
                        name = "Senntisten",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 735,
                x = 1796,
                z = 1343,
            },
            connector = false,
        },
    },
    [742] = {
        {
            x = 1134,
            z = 1776,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 1131,
            z = 1775,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 1112,
            z = 1799,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb up",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
        {
            x = 1109,
            z = 1800,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [748] = {
        {
            x = 5777,
            z = 6395,
            category = 100020,
            sprite = 1610,
            iconSize = 20,
            tooltip = "Stairs",
            record = {
                title = "Stairs",
                kind = "navigation",
                rows = {
                    {
                        name = "Stairs",
                        detail = "Climb down",
                    },
                },
            },
            iconWidth = 12,
            iconHeight = 16,
        },
    },
    [760] = {
        {
            x = 3919,
            z = 5070,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Asgarnian Ice Dungeon",
            record = {
                title = "Asgarnian Ice Dungeon",
                kind = "navigation",
                rows = {
                    {
                        name = "Asgarnian Ice Dungeon",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 25,
                x = 3049,
                z = 9593,
            },
            connector = false,
        },
    },
    [762] = {
        {
            x = 4877,
            z = 5500,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Zolarea Core",
            record = {
                title = "Zolarea Core",
                kind = "navigation",
                rows = {
                    {
                        name = "Zolarea Core",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 763,
                x = 5009,
                z = 5467,
            },
            connector = false,
        },
    },
    [763] = {
        {
            x = 5009,
            z = 5467,
            category = 100020,
            sprite = 20902,
            iconSize = 20,
            tooltip = "Zolarea",
            record = {
                title = "Zolarea",
                kind = "navigation",
                rows = {
                    {
                        name = "Zolarea",
                        detail = "",
                    },
                },
                note = "Click to view the destination on the map.",
            },
            routeTarget = {
                areaID = 762,
                x = 4877,
                z = 5500,
            },
            connector = false,
        },
    },
}
