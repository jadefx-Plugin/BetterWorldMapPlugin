-- navigation_details.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: pin_tooltip.lua.
--[=[
BEGINNER WALKTHROUGH: navigation_details.lua

Each [surface pin INDEX] block describes transport/fairy-ring reference information.
title/kind/width control the card; rows stores ordered text facts. Some records have
accessQuestID, a QUEST config ID used by navigation_requirements.lua for a read-only check.

Example reuse:
  for index, record in pairs(require('navigation_details')) do
      print(index, record.title, #record.rows)
  end
Use pairs because this is a sparse dictionary. pin_tooltip.lua shows these descriptions;
they do not contain actions to teleport or interact with transport.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: pin_tooltip.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Bundled navigation hover records keyed by stable world_map_data marker index.
Records describe public/cached destinations and requirements; accessQuestID may request a
read-only quest-completion check in navigation_requirements. Rows are informational text.
No teleport, transport or navigation gameplay action is issued when these records display.
]]

-- Generated from local map labels and marker codes.
return {
    [580] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 54 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [581] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 92 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [697] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AIR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [698] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AIQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [699] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: ALS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [700] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: ALQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [701] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AKS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [702] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AKQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [703] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AJS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [704] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: AJR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [705] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DIP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [706] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DIS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [707] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DIQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [708] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DLP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [709] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DLR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [710] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DLQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [711] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DKP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [712] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DKS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [713] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DKR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [714] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DJP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [715] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: DJR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [716] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CIP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [717] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CIQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [718] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CLP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [719] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CLS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [720] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CLR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [721] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CKS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [722] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CKR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [723] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CKQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [724] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CJS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [725] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: CJR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [726] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BIP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [727] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BIS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [728] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BIQ",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [729] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BLR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [730] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BKP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [731] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BKS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [732] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BKR",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [733] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BJP",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [734] = {
        ["kind"] = "navigation",
        ["title"] = "Fairy ring",
        ["accessQuestID"] = 309,
        ["width"] = 332,
        ["rows"] = {
            {
                ["name"] = "Code: BJS",
            },
            {
                ["name"] = "Fairy ring network access",
                ["detail"] = "Fairy Tale II - Cure a Queen",
            },
        },
    },
    [934] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 63 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [970] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [971] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1043] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1067] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1068] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1087] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1090] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1093] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1106] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1254] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1256] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1266] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 40 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Requires a rope on first passage",
            },
        },
    },
    [1298] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 32 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1300] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 74 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1303] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1329] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1339] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 53 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 42 Ranged Level 21 Strength Requires a grapple",
            },
        },
    },
    [1367] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 53 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 42 Ranged Level 21 Strength Requires a grapple",
            },
        },
    },
    [1386] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 8 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 37 Ranged Level 19 Strength Requires a grapple",
            },
        },
    },
    [1387] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 8 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 37 Ranged Level 19 Strength Requires a grapple",
            },
        },
    },
    [1411] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1509] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 25 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Requires some progress in the In Aid of the Myreque quest",
            },
        },
    },
    [1540] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 26 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1546] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1547] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1564] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 38 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1595] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 5 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1622] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 28 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1628] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 13 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1659] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 32 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 35 Ranged Level 35 Strength Requires a grapple",
            },
        },
    },
    [1681] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 52 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1686] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 11 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 37 Strength Level 19 Ranged Requires a grapple",
            },
        },
    },
    [1814] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 21 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [1854] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 65 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Requires the Priest in Peril quest",
            },
        },
    },
    [1874] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1882] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1893] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1894] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1895] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1896] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1897] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1898] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1911] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1912] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1913] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1914] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1915] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1916] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1917] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1918] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1919] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1923] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1936] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1938] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1973] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1985] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [1989] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 29 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2003] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 16 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2090] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2124] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 20 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2162] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 48 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2236] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 39 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Level 38 Strength Level 21 Ranged Requires a grapple",
            },
        },
    },
    [2254] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2281] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2283] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 37 Agility",
                ["spriteID"] = 13217,
                ["detail"] = "Requires the Grand Tree quest",
            },
        },
    },
    [2285] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 19 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2298] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2299] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2326] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2331] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2371] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2392] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Level 25 Agility",
                ["spriteID"] = 13217,
            },
        },
    },
    [2428] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
    [2429] = {
        ["kind"] = "navigation",
        ["title"] = "Shortcut",
        ["width"] = 268,
        ["rows"] = {
            {
                ["name"] = "Agility shortcut",
                ["spriteID"] = 13217,
                ["detail"] = "Level requirement not recorded locally.",
            },
        },
    },
}
