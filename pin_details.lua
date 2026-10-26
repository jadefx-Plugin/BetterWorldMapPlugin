-- pin_details.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: pin_tooltip.lua, quest_pin_filter.lua.
--[=[
BEGINNER WALKTHROUGH: pin_details.lua

Each [surface pin INDEX] block holds ONE typed resource/quest hover record.
title is the card heading, kind selects layout, and rows holds ordered facts.
Row fields vary: name/detail are text; item/tool are native item-artwork IDs; level is a
reference requirement; questID addresses native quest configuration, NOT this table.

Example reuse:
  for index, record in pairs(require('pin_details')) do
      print(index, record.kind, record.title)
  end
pin_tooltip.lua selects records; quest_requirements/quest_card add exposed live checks;
quest_pin_filter derives marker visibility. None writes live completion into this data.
Missing keys are normal: simple pins may use only world_map_data tooltip text.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: pin_tooltip.lua, quest_pin_filter.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Bundled surface-pin hover records keyed by stable world_map_data array index.
Schema: {title, kind, rows, ...}; row fields vary by kind (quest IDs, resource levels,
tools, item icons and description text). These are cache-derived reference descriptions.
Live quest/skill status is layered on by quest_requirements rather than written into this
shared data. Preserve marker-index alignment with world_map_data when re-exporting.
]]

-- Generated from local cache definitions and exact placed map-label coordinates.
return {
    [34] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Death of Chivalry",
                ["detail"] = "Talk to Sir Owen at the monastery west of Edgeville.",
                ["questID"] = 363,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [35] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Death of Chivalry",
                ["detail"] = "Talk to Sir Owen at the monastery west of Edgeville.",
                ["questID"] = 363,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [36] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cook's Assistant",
                ["detail"] = "Talk to the cook in the kitchen of Lumbridge Castle.",
                ["questID"] = 257,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [37] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cook's Assistant",
                ["detail"] = "Talk to the cook in the kitchen of Lumbridge Castle.",
                ["questID"] = 257,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [38] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Demon Slayer",
                ["detail"] = "Talk to Gideon Bede at the Saradominist church in north-east Varrock.",
                ["questID"] = 51,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [39] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Demon Slayer",
                ["detail"] = "Talk to Gideon Bede at the Saradominist church in north-east Varrock.",
                ["questID"] = 51,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [40] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dragon Slayer",
                ["detail"] = "Talk to the Guildmaster inside the Champions' Guild, south of Varrock.",
                ["questID"] = 66,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [41] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dragon Slayer",
                ["detail"] = "Talk to the Guildmaster inside the Champions' Guild, south of Varrock.",
                ["questID"] = 66,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [42] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ernest the Chicken",
                ["detail"] = "Talk to Veronica outside Draynor Manor.",
                ["questID"] = 15,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [43] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ernest the Chicken",
                ["detail"] = "Talk to Veronica outside Draynor Manor.",
                ["questID"] = 15,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [44] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Goblin Diplomacy",
                ["detail"] = "Talk to General Bentnoze or General Wartface in the Goblin Village, north of Falador.",
                ["questID"] = 137,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [45] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Goblin Diplomacy",
                ["detail"] = "Talk to General Bentnoze or General Wartface in the Goblin Village, north of Falador.",
                ["questID"] = 137,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [46] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Imp Catcher",
                ["detail"] = "Talk to Wizard Mizgog on the first floor of the Wizards' Tower, south of Draynor.",
                ["questID"] = 72,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [47] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Imp Catcher",
                ["detail"] = "Talk to Wizard Mizgog on the first floor of the Wizards' Tower, south of Draynor.",
                ["questID"] = 72,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [48] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Knight's Sword",
                ["detail"] = "Talk to Squire Asrol in the courtyard of the White Knights' Castle in Falador.",
                ["questID"] = 261,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [49] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Knight's Sword",
                ["detail"] = "Talk to Squire Asrol in the courtyard of the White Knights' Castle in Falador.",
                ["questID"] = 261,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [50] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pirate's Treasure",
                ["detail"] = "Talk to Redbeard Frank just south of The Rusty Anchor pub in Port Sarim.",
                ["questID"] = 60,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [51] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pirate's Treasure",
                ["detail"] = "Talk to Redbeard Frank just south of The Rusty Anchor pub in Port Sarim.",
                ["questID"] = 60,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [52] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Restless Ghost",
                ["detail"] = "Talk to Father Aereck in the church east of Lumbridge Castle.",
                ["questID"] = 27,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [53] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Restless Ghost",
                ["detail"] = "Talk to Father Aereck in the church east of Lumbridge Castle.",
                ["questID"] = 27,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [54] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shield of Arrav",
                ["detail"] = "Talk to Reldo in the Varrock palace library.",
                ["questID"] = 63,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [55] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shield of Arrav",
                ["detail"] = "Talk to Reldo in the Varrock palace library.",
                ["questID"] = 63,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [56] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Vampyre Slayer",
                ["detail"] = "Talk to Morgan in Draynor Village.",
                ["questID"] = 258,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [57] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Vampyre Slayer",
                ["detail"] = "Talk to Morgan in Draynor Village.",
                ["questID"] = 258,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [58] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Animal Magnetism",
                ["detail"] = "Talk to Ava in Draynor Manor.",
                ["questID"] = 43,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [59] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Animal Magnetism",
                ["detail"] = "Talk to Ava in Draynor Manor.",
                ["questID"] = 43,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [60] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Big Chompy Bird Hunting",
                ["detail"] = "Talk to Rantz east of the Feldip Hills.",
                ["questID"] = 102,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [61] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Big Chompy Bird Hunting",
                ["detail"] = "Talk to Rantz east of the Feldip Hills.",
                ["questID"] = 102,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [62] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Biohazard",
                ["detail"] = "Talk to Elena in her house in East Ardougne.",
                ["questID"] = 128,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [63] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Biohazard",
                ["detail"] = "Talk to Elena in her house in East Ardougne.",
                ["questID"] = 128,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [64] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cabin Fever",
                ["detail"] = "Talk to Bill Teach in Port Phasmatys.",
                ["questID"] = 296,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [65] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cabin Fever",
                ["detail"] = "Talk to Bill Teach in Port Phasmatys.",
                ["questID"] = 296,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [66] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Clock Tower",
                ["detail"] = "Talk to Brother Kojo in the Clock Tower south of Ardougne.",
                ["questID"] = 44,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [67] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Clock Tower",
                ["detail"] = "Talk to Brother Kojo in the Clock Tower south of Ardougne.",
                ["questID"] = 44,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [68] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Contact!",
                ["detail"] = "Talk to the High Priest of Icthlarin in the south temple of Sophanem.",
                ["questID"] = 316,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [69] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Contact!",
                ["detail"] = "Talk to the High Priest of Icthlarin in the south temple of Sophanem.",
                ["questID"] = 316,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [70] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Zogre Flesh Eaters",
                ["detail"] = "Talk to Grish, located west of Gu'Tanoth and south of Castle Wars.",
                ["questID"] = 104,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [71] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Zogre Flesh Eaters",
                ["detail"] = "Talk to Grish, located west of Gu'Tanoth and south of Castle Wars.",
                ["questID"] = 104,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [72] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Creature of Fenkenstrain",
                ["detail"] = "Read the signpost in Canifis or talk to Dr Fenkenstrain to be hired as his butler.",
                ["questID"] = 92,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [73] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Creature of Fenkenstrain",
                ["detail"] = "Read the signpost in Canifis or talk to Dr Fenkenstrain to be hired as his butler.",
                ["questID"] = 92,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [74] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Troll Stronghold",
                ["detail"] = "Talk to Commander Denulth at the Burthorpe training camp.",
                ["questID"] = 85,
            },
            {
                ["name"] = "Death Plateau",
                ["detail"] = "Talk to Commander Denulth at the Burthorpe training camp.",
                ["questID"] = 140,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [75] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Troll Stronghold",
                ["detail"] = "Talk to Commander Denulth at the Burthorpe training camp.",
                ["questID"] = 85,
            },
            {
                ["name"] = "Death Plateau",
                ["detail"] = "Talk to Commander Denulth at the Burthorpe training camp.",
                ["questID"] = 140,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [76] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desert Treasure",
                ["detail"] = "Talk to the Archaeologist who is exploring the Bedabin Camp south-west of the Shantay Pass.",
                ["questID"] = 135,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [77] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desert Treasure",
                ["detail"] = "Talk to the Archaeologist who is exploring the Bedabin Camp south-west of the Shantay Pass.",
                ["questID"] = 135,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [78] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Devious Minds",
                ["detail"] = "Talk to the monk just outside Paterdomus (the temple on the Salve).",
                ["questID"] = 123,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [79] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Devious Minds",
                ["detail"] = "Talk to the monk just outside Paterdomus (the temple on the Salve).",
                ["questID"] = 123,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [80] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Dig Site",
                ["detail"] = "Talk to an examiner in the Exam Centre.",
                ["questID"] = 273,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [81] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Dig Site",
                ["detail"] = "Talk to an examiner in the Exam Centre.",
                ["questID"] = 273,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [82] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Druidic Ritual",
                ["detail"] = "Talk to Kaqemeex at the stone circle north of Taverley.",
                ["questID"] = 111,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [83] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Druidic Ritual",
                ["detail"] = "Talk to Kaqemeex at the stone circle north of Taverley.",
                ["questID"] = 111,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [84] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dwarf Cannon",
                ["detail"] = "Talk to Captain Lawgof, south of the coal truck mining site to the west of McGrubor's Wood.",
                ["questID"] = 34,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [85] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dwarf Cannon",
                ["detail"] = "Talk to Captain Lawgof, south of the coal truck mining site to the west of McGrubor's Wood.",
                ["questID"] = 34,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [86] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eadgar's Ruse",
                ["detail"] = "Talk to Sanfew in Taverley.",
                ["questID"] = 75,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [87] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eadgar's Ruse",
                ["detail"] = "Talk to Sanfew in Taverley.",
                ["questID"] = 75,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [88] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eagles' Peak",
                ["detail"] = "Talk to Charlie the Zookeeper in Ardougne Zoo.",
                ["questID"] = 149,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [89] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eagles' Peak",
                ["detail"] = "Talk to Charlie the Zookeeper in Ardougne Zoo.",
                ["questID"] = 149,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [90] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop I",
                ["detail"] = "Search the shelves in a house in Seers' Village for an old book.",
                ["questID"] = 275,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [91] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop I",
                ["detail"] = "Search the shelves in a house in Seers' Village for an old book.",
                ["questID"] = 275,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [92] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop II",
                ["detail"] = "Search the shelves in the Varrock Dig Site Exam Centre for an old book.",
                ["questID"] = 313,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [93] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop II",
                ["detail"] = "Search the shelves in the Varrock Dig Site Exam Centre for an old book.",
                ["questID"] = 313,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [94] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enakhra's Lament",
                ["detail"] = "Talk to Lazim in the desert south of the Bandit Camp.",
                ["questID"] = 97,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [95] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enakhra's Lament",
                ["detail"] = "Talk to Lazim in the desert south of the Bandit Camp.",
                ["questID"] = 97,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [96] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enlightened Journey",
                ["detail"] = "Talk to Auguste on Entrana (bring neither weapons nor armour with you).",
                ["questID"] = 315,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [97] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enlightened Journey",
                ["detail"] = "Talk to Auguste on Entrana (bring neither weapons nor armour with you).",
                ["questID"] = 315,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [98] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Fairy Tale I - Growing Pains",
                ["detail"] = "Talk to Martin the Master Gardener in Draynor Village.",
                ["questID"] = 297,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [99] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Fairy Tale I - Growing Pains",
                ["detail"] = "Talk to Martin the Master Gardener in Draynor Village.",
                ["questID"] = 297,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [100] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Fairy Tale II - Cure a Queen",
                ["detail"] = "Talk to Martin the Master Gardener in Draynor Village.",
                ["questID"] = 309,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [101] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Fairy Tale II - Cure a Queen",
                ["detail"] = "Talk to Martin the Master Gardener in Draynor Village.",
                ["questID"] = 309,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [102] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Family Crest",
                ["detail"] = "Talk to Dimintheis in south-east Varrock.",
                ["questID"] = 116,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [103] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Family Crest",
                ["detail"] = "Talk to Dimintheis in south-east Varrock.",
                ["questID"] = 116,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [104] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Feud",
                ["detail"] = "Talk to Ali Morrisane in Al Kharid.",
                ["questID"] = 285,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [105] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Feud",
                ["detail"] = "Talk to Ali Morrisane in Al Kharid.",
                ["questID"] = 285,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [106] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fight Arena",
                ["detail"] = "Talk to Lady Servil, just north-west of the fight arena.",
                ["questID"] = 268,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [107] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fight Arena",
                ["detail"] = "Talk to Lady Servil, just north-west of the fight arena.",
                ["questID"] = 268,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [108] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fishing Contest",
                ["detail"] = "Talk to Vestri or Austri near White Wolf Mountain.",
                ["questID"] = 76,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [109] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fishing Contest",
                ["detail"] = "Talk to Vestri or Austri near White Wolf Mountain.",
                ["questID"] = 76,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [110] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fishing Contest",
                ["detail"] = "Talk to Vestri or Austri near White Wolf Mountain.",
                ["questID"] = 76,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [111] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fishing Contest",
                ["detail"] = "Talk to Vestri or Austri near White Wolf Mountain.",
                ["questID"] = 76,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [112] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Fremennik Trials",
                ["detail"] = "Talk to Brundt the Chieftain in the longhall in Rellekka.",
                ["questID"] = 280,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [113] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Fremennik Trials",
                ["detail"] = "Talk to Brundt the Chieftain in the longhall in Rellekka.",
                ["questID"] = 280,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [114] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Waterfall Quest",
                ["detail"] = "Talk to Almera in her house north-east of the Baxtorian Falls.",
                ["questID"] = 93,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [115] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Waterfall Quest",
                ["detail"] = "Talk to Almera in her house north-east of the Baxtorian Falls.",
                ["questID"] = 93,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [116] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Garden of Tranquillity",
                ["detail"] = "Talk to Queen Ellamaria in the garden of Varrock Palace.",
                ["questID"] = 291,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [117] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Garden of Tranquillity",
                ["detail"] = "Talk to Queen Ellamaria in the garden of Varrock Palace.",
                ["questID"] = 291,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [118] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gertrude's Cat",
                ["detail"] = "Talk to Gertrude in her house west of Varrock.",
                ["questID"] = 138,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [119] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gertrude's Cat",
                ["detail"] = "Talk to Gertrude in her house west of Varrock.",
                ["questID"] = 138,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [120] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ghosts Ahoy",
                ["detail"] = "Talk to Velorina in Port Phasmatys.",
                ["questID"] = 82,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [121] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ghosts Ahoy",
                ["detail"] = "Talk to Velorina in Port Phasmatys.",
                ["questID"] = 82,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [122] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Golem",
                ["detail"] = "Talk to the clay golem in the ruins of Uzer.",
                ["questID"] = 286,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [123] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Golem",
                ["detail"] = "Talk to the clay golem in the ruins of Uzer.",
                ["questID"] = 286,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [124] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Grand Tree",
                ["detail"] = "Talk to King Narnode Shareen at the Grand Tree in the Gnome Stronghold.",
                ["questID"] = 269,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [125] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Grand Tree",
                ["detail"] = "Talk to King Narnode Shareen at the Grand Tree in the Gnome Stronghold.",
                ["questID"] = 269,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [126] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Hand in the Sand",
                ["detail"] = "Talk to Bert in Yanille.",
                ["questID"] = 295,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [127] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Hand in the Sand",
                ["detail"] = "Talk to Bert in Yanille.",
                ["questID"] = 295,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [128] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Haunted Mine",
                ["detail"] = "Talk to the zealot at the entrance of the Abandoned Mine in south Morytania.",
                ["questID"] = 120,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [129] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Haunted Mine",
                ["detail"] = "Talk to the zealot at the entrance of the Abandoned Mine in south Morytania.",
                ["questID"] = 120,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [130] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hazeel Cult",
                ["detail"] = "Talk to Sir Ceril Carnillean in his mansion in south-west Ardougne.",
                ["questID"] = 125,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [131] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hazeel Cult",
                ["detail"] = "Talk to Sir Ceril Carnillean in his mansion in south-west Ardougne.",
                ["questID"] = 125,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [132] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heroes' Quest",
                ["detail"] = "Talk to Achiettes at the entrance to the Heroes' Guild in Burthorpe.",
                ["questID"] = 264,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [133] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heroes' Quest",
                ["detail"] = "Talk to Achiettes at the entrance to the Heroes' Guild in Burthorpe.",
                ["questID"] = 264,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [134] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Holy Grail",
                ["detail"] = "Talk to King Arthur in Camelot Castle.",
                ["questID"] = 112,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [135] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Holy Grail",
                ["detail"] = "Talk to King Arthur in Camelot Castle.",
                ["questID"] = 112,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [136] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Horror from the Deep",
                ["detail"] = "Talk to Larrissa south of the Lighthouse.",
                ["questID"] = 281,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [137] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Horror from the Deep",
                ["detail"] = "Talk to Larrissa south of the Lighthouse.",
                ["questID"] = 281,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [138] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Icthlarin's Little Helper",
                ["detail"] = "Talk to the wanderer, south-east of the southern bridge over the River Elid, in the desert far south of Al Kharid.",
                ["questID"] = 287,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [139] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Icthlarin's Little Helper",
                ["detail"] = "Talk to the wanderer, south-east of the southern bridge over the River Elid, in the desert far south of Al Kharid.",
                ["questID"] = 287,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [140] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Search of the Myreque",
                ["detail"] = "Talk to Vanstrom Klause in the Hair of the Dog tavern in Canifis.",
                ["questID"] = 283,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [141] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Search of the Myreque",
                ["detail"] = "Talk to Vanstrom Klause in the Hair of the Dog tavern in Canifis.",
                ["questID"] = 283,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [142] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Jungle Potion",
                ["detail"] = "Talk to Trufitus in his hut north-east of Tai Bwo Wannai.",
                ["questID"] = 59,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [143] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Jungle Potion",
                ["detail"] = "Talk to Trufitus in his hut north-east of Tai Bwo Wannai.",
                ["questID"] = 59,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [144] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Legends' Quest",
                ["detail"] = "Talk to Radimus Erkle in the Legends' Guild, north-east of Ardougne.",
                ["questID"] = 274,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [145] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Legends' Quest",
                ["detail"] = "Talk to Radimus Erkle in the Legends' Guild, north-east of Ardougne.",
                ["questID"] = 274,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [146] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Lost City",
                ["detail"] = "Talk to the warrior adventurer north-west of Lumbridge Swamp.",
                ["questID"] = 262,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [147] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Lost City",
                ["detail"] = "Talk to the warrior adventurer north-west of Lumbridge Swamp.",
                ["questID"] = 262,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [148] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lost Tribe",
                ["detail"] = "Talk to Sigmund in Lumbridge Castle.",
                ["questID"] = 37,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [149] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lost Tribe",
                ["detail"] = "Talk to Sigmund in Lumbridge Castle.",
                ["questID"] = 37,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [150] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Lunar Diplomacy",
                ["detail"] = "Talk to Lokar Searunner on the west dock of Rellekka.",
                ["questID"] = 24,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [151] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Lunar Diplomacy",
                ["detail"] = "Talk to Lokar Searunner on the west dock of Rellekka.",
                ["questID"] = 24,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [152] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Making History",
                ["detail"] = "Talk to Jorral in the outpost south of the Tree Gnome Stronghold, north-west of West Ardougne.",
                ["questID"] = 124,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [153] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Making History",
                ["detail"] = "Talk to Jorral in the outpost south of the Tree Gnome Stronghold, north-west of West Ardougne.",
                ["questID"] = 124,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [154] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Merlin's Crystal",
                ["detail"] = "Talk to King Arthur in Camelot Castle.",
                ["questID"] = 108,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [155] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Merlin's Crystal",
                ["detail"] = "Talk to King Arthur in Camelot Castle.",
                ["questID"] = 108,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [156] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Monkey Madness",
                ["detail"] = "Talk to King Narnode Shareen within the Grand Tree in the Gnome Stronghold.",
                ["questID"] = 130,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [157] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Monkey Madness",
                ["detail"] = "Talk to King Narnode Shareen within the Grand Tree in the Gnome Stronghold.",
                ["questID"] = 130,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [158] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Monk's Friend",
                ["detail"] = "Talk to Brother Omad at the monastery south of Ardougne.",
                ["questID"] = 266,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [159] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Monk's Friend",
                ["detail"] = "Talk to Brother Omad at the monastery south of Ardougne.",
                ["questID"] = 266,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [160] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Mountain Daughter",
                ["detail"] = "Talk to Hamal the chieftain in the mountain camp east of Rellekka.",
                ["questID"] = 151,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [161] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Mountain Daughter",
                ["detail"] = "Talk to Hamal the chieftain in the mountain camp east of Rellekka.",
                ["questID"] = 151,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [162] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Roving Elves",
                ["detail"] = "Talk to Islwyn, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 110,
            },
            {
                ["name"] = "Mourning's End Part I",
                ["detail"] = "Talk to Eluned, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 289,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [163] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Roving Elves",
                ["detail"] = "Talk to Islwyn, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 110,
            },
            {
                ["name"] = "Mourning's End Part I",
                ["detail"] = "Talk to Eluned, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 289,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [164] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Roving Elves",
                ["detail"] = "Talk to Islwyn, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 110,
            },
            {
                ["name"] = "Mourning's End Part I",
                ["detail"] = "Talk to Eluned, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 289,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [165] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Roving Elves",
                ["detail"] = "Talk to Islwyn, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 110,
            },
            {
                ["name"] = "Mourning's End Part I",
                ["detail"] = "Talk to Eluned, a roving elf somewhere in the elven forest of Isafdar in Tirannwn.",
                ["questID"] = 289,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [166] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Murder Mystery",
                ["detail"] = "Talk to the guard at the Sinclair Mansion north of Seers' Village.",
                ["questID"] = 28,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [167] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Murder Mystery",
                ["detail"] = "Talk to the guard at the Sinclair Mansion north of Seers' Village.",
                ["questID"] = 28,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [168] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Observatory Quest",
                ["detail"] = "Talk to Professor Gronigen in the observatory north of Castle Wars.",
                ["questID"] = 271,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [169] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Observatory Quest",
                ["detail"] = "Talk to Professor Gronigen in the observatory north of Castle Wars.",
                ["questID"] = 271,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [170] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Small Favour",
                ["detail"] = "Talk to Yanni Salika in Shilo Village.",
                ["questID"] = 146,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [171] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Small Favour",
                ["detail"] = "Talk to Yanni Salika in Shilo Village.",
                ["questID"] = 146,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [172] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Plague City",
                ["detail"] = "Talk to Edmond in East Ardougne. (North of the castle, next to the wall surrounding West Ardougne.)",
                ["questID"] = 58,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [173] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Plague City",
                ["detail"] = "Talk to Edmond in East Ardougne. (North of the castle, next to the wall surrounding West Ardougne.)",
                ["questID"] = 58,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [174] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Priest in Peril",
                ["detail"] = "Talk to King Roald in Varrock Palace.",
                ["questID"] = 276,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [175] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Priest in Peril",
                ["detail"] = "Talk to King Roald in Varrock Palace.",
                ["questID"] = 276,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [176] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rag and Bone Man",
                ["detail"] = "Talk to the Odd Old Man at the quarry west of Paterdomus.",
                ["questID"] = 68,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [177] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rag and Bone Man",
                ["detail"] = "Talk to the Odd Old Man at the quarry west of Paterdomus.",
                ["questID"] = 68,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [178] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rat Catchers",
                ["detail"] = "Talk to Gertrude, in her house west of Varrock.",
                ["questID"] = 294,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [179] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rat Catchers",
                ["detail"] = "Talk to Gertrude, in her house west of Varrock.",
                ["questID"] = 294,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [180] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Recipe for Disaster",
                ["detail"] = "Talk to the cook in Lumbridge Castle.",
                ["questID"] = 30,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [181] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Recipe for Disaster",
                ["detail"] = "Talk to the cook in Lumbridge Castle.",
                ["questID"] = 30,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [182] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Royal Trouble",
                ["detail"] = "Talk to Advisor Ghrim in the castle of Miscellania.",
                ["questID"] = 127,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [183] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Royal Trouble",
                ["detail"] = "Talk to Advisor Ghrim in the castle of Miscellania.",
                ["questID"] = 127,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [184] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rum Deal",
                ["detail"] = "Talk to Pirate Pete at the docks north of Port Phasmatys.",
                ["questID"] = 101,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [185] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rum Deal",
                ["detail"] = "Talk to Pirate Pete at the docks north of Port Phasmatys.",
                ["questID"] = 101,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [186] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Scorpion Catcher",
                ["detail"] = "Talk to Thormac on the top floor of his tower south of the Seers' Village.",
                ["questID"] = 265,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [187] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Scorpion Catcher",
                ["detail"] = "Talk to Thormac on the top floor of his tower south of the Seers' Village.",
                ["questID"] = 265,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [188] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sea Slug",
                ["detail"] = "Talk to Caroline in Witchaven, east of Ardougne.",
                ["questID"] = 121,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [189] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sea Slug",
                ["detail"] = "Talk to Caroline in Witchaven, east of Ardougne.",
                ["questID"] = 121,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [190] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Slug Menace",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 312,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [191] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Slug Menace",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 312,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [192] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shades of Mort'ton",
                ["detail"] = "Read a diary found in a house in Mort'ton.",
                ["questID"] = 279,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [193] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shades of Mort'ton",
                ["detail"] = "Read a diary found in a house in Mort'ton.",
                ["questID"] = 279,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [194] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shadow of the Storm",
                ["detail"] = "Talk to Father Reen south of the bank in Al Kharid.",
                ["questID"] = 71,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [195] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shadow of the Storm",
                ["detail"] = "Talk to Father Reen south of the bank in Al Kharid.",
                ["questID"] = 71,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [196] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sheep Herder",
                ["detail"] = "Talk to Councillor Halgrive outside of the East Ardougne church, north of the zoo.",
                ["questID"] = 39,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [197] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sheep Herder",
                ["detail"] = "Talk to Councillor Halgrive outside of the East Ardougne church, north of the zoo.",
                ["questID"] = 39,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [198] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shilo Village",
                ["detail"] = "Talk to Mosol Rei at the edge of Shilo Village.",
                ["questID"] = 70,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [199] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Shilo Village",
                ["detail"] = "Talk to Mosol Rei at the edge of Shilo Village.",
                ["questID"] = 70,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [200] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Soul's Bane",
                ["detail"] = "Talk to Launa by the rift east of Varrock, just south-east of the earth altar.",
                ["questID"] = 36,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [201] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Soul's Bane",
                ["detail"] = "Talk to Launa by the rift east of Varrock, just south-east of the earth altar.",
                ["questID"] = 36,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [202] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spirits of the Elid",
                ["detail"] = "Talk to Awusah the Mayor in Nardah.",
                ["questID"] = 46,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [203] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spirits of the Elid",
                ["detail"] = "Talk to Awusah the Mayor in Nardah.",
                ["questID"] = 46,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [204] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Swan Song",
                ["detail"] = "Talk to Herman Caranos at the Piscatoris Fishing Colony.",
                ["questID"] = 308,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [205] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Swan Song",
                ["detail"] = "Talk to Herman Caranos at the Piscatoris Fishing Colony.",
                ["questID"] = 308,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [206] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Tail of Two Cats",
                ["detail"] = "Talk to Unferth in his house in Burthorpe.",
                ["questID"] = 45,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [207] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Tail of Two Cats",
                ["detail"] = "Talk to Unferth in his house in Burthorpe.",
                ["questID"] = 45,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [208] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Temple of Ikov",
                ["detail"] = "Talk to Lucien in the Flying Horse Inn, Ardougne.",
                ["questID"] = 126,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [209] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Temple of Ikov",
                ["detail"] = "Talk to Lucien in the Flying Horse Inn, Ardougne.",
                ["questID"] = 126,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [210] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Throne of Miscellania",
                ["detail"] = "Talk to King Vargas in the castle on the island of Miscellania, accessed from a longboat on the north coast of Rellekka.",
                ["questID"] = 282,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [211] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Throne of Miscellania",
                ["detail"] = "Talk to King Vargas in the castle on the island of Miscellania, accessed from a longboat on the north coast of Rellekka.",
                ["questID"] = 282,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [212] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Tourist Trap",
                ["detail"] = "Talk to Irena just south of Shantay Pass.",
                ["questID"] = 272,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [213] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Tourist Trap",
                ["detail"] = "Talk to Irena just south of Shantay Pass.",
                ["questID"] = 272,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [214] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Witch's House",
                ["detail"] = "Talk to Harvey, the crying boy west of Falador.",
                ["questID"] = 263,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [215] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Witch's House",
                ["detail"] = "Talk to Harvey, the crying boy west of Falador.",
                ["questID"] = 263,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [216] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Tree Gnome Village",
                ["detail"] = "Talk to King Bolren in the Tree Gnome Village.",
                ["questID"] = 267,
            },
            {
                ["name"] = "The Path of Glouphrie",
                ["detail"] = "Talk to King Bolren in the Tree Gnome Village.",
                ["questID"] = 320,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [217] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Tree Gnome Village",
                ["detail"] = "Talk to King Bolren in the Tree Gnome Village.",
                ["questID"] = 267,
            },
            {
                ["name"] = "The Path of Glouphrie",
                ["detail"] = "Talk to King Bolren in the Tree Gnome Village.",
                ["questID"] = 320,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [218] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tribal Totem",
                ["detail"] = "Talk to Kangai Mau in Brimhaven.",
                ["questID"] = 40,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [219] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tribal Totem",
                ["detail"] = "Talk to Kangai Mau in Brimhaven.",
                ["questID"] = 40,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [220] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Underground Pass",
                ["detail"] = "Talk to King Lathas in Ardougne Castle.",
                ["questID"] = 270,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [221] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Underground Pass",
                ["detail"] = "Talk to King Lathas in Ardougne Castle.",
                ["questID"] = 270,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [222] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Regicide",
                ["detail"] = "Receive a message from King Lathas after completing Underground Pass.",
                ["questID"] = 278,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [223] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Regicide",
                ["detail"] = "Receive a message from King Lathas after completing Underground Pass.",
                ["questID"] = 278,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [224] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wanted!",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 292,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [225] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wanted!",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 292,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [226] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cold War",
                ["detail"] = "Talk to Larry at Ardougne Zoo.",
                ["questID"] = 145,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [227] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Cold War",
                ["detail"] = "Talk to Larry at Ardougne Zoo.",
                ["questID"] = 145,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [228] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Fremennik Isles",
                ["detail"] = "Talk to Mord Gunnars at the docks in Rellekka.",
                ["questID"] = 148,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [229] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Fremennik Isles",
                ["detail"] = "Talk to Mord Gunnars at the docks in Rellekka.",
                ["questID"] = 148,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [230] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tower of Life",
                ["detail"] = "Talk to Effigy outside the Tower of Life south of Ardougne.",
                ["questID"] = 1,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [231] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tower of Life",
                ["detail"] = "Talk to Effigy outside the Tower of Life south of Ardougne.",
                ["questID"] = 1,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [232] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Great Brain Robbery",
                ["detail"] = "Talk to Brother Tranquillity on the docks at Mos Le'Harmless.",
                ["questID"] = 317,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [233] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Great Brain Robbery",
                ["detail"] = "Talk to Brother Tranquillity on the docks at Mos Le'Harmless.",
                ["questID"] = 317,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [234] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "What Lies Below",
                ["detail"] = "Talk to Rat Burgiss, south of Varrock.",
                ["questID"] = 144,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [235] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "What Lies Below",
                ["detail"] = "Talk to Rat Burgiss, south of Varrock.",
                ["questID"] = 144,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [236] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Olaf's Quest",
                ["detail"] = "Talk to Olaf in his 'camp' north-east of Rellekka.",
                ["questID"] = 318,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [237] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Olaf's Quest",
                ["detail"] = "Talk to Olaf in his 'camp' north-east of Rellekka.",
                ["questID"] = 318,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [238] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Grim Tales",
                ["detail"] = "Talk to Sylas, south of Taverley.",
                ["questID"] = 319,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [239] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Grim Tales",
                ["detail"] = "Talk to Sylas, south of Taverley.",
                ["questID"] = 319,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [240] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "King's Ransom",
                ["detail"] = "Talk to the gossip outside Sinclair Mansion.",
                ["questID"] = 61,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [241] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "King's Ransom",
                ["detail"] = "Talk to the gossip outside Sinclair Mansion.",
                ["questID"] = 61,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [242] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Back to my Roots",
                ["detail"] = "Talk to Horacio outside Lord Handelmort's mansion, in East Ardougne.",
                ["questID"] = 321,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [243] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Back to my Roots",
                ["detail"] = "Talk to Horacio outside Lord Handelmort's mansion, in East Ardougne.",
                ["questID"] = 321,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [244] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dealing with Scabaras",
                ["detail"] = "Talk to the High Priest of Icthlarin in the south temple of Sophanem.",
                ["questID"] = 323,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [245] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dealing with Scabaras",
                ["detail"] = "Talk to the High Priest of Icthlarin in the south temple of Sophanem.",
                ["questID"] = 323,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [246] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wolf Whistle",
                ["detail"] = "Talk to Pikkupstix in his house in Taverley.",
                ["questID"] = 324,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [247] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wolf Whistle",
                ["detail"] = "Talk to Pikkupstix in his house in Taverley.",
                ["questID"] = 324,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [248] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "As a First Resort",
                ["detail"] = "Talk to Chief Tess in the centre of Oo'glog.",
                ["questID"] = 325,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [249] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "As a First Resort",
                ["detail"] = "Talk to Chief Tess in the centre of Oo'glog.",
                ["questID"] = 325,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [250] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Catapult Construction",
                ["detail"] = "Talk to the Tyras Guard next to the catapult in the Isafdar Forest.",
                ["questID"] = 23,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [251] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Catapult Construction",
                ["detail"] = "Talk to the Tyras Guard next to the catapult in the Isafdar Forest.",
                ["questID"] = 23,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [252] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Kennith's Concerns",
                ["detail"] = "Talk to Kennith in Witchaven, east of Ardougne.",
                ["questID"] = 326,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [253] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Kennith's Concerns",
                ["detail"] = "Talk to Kennith in Witchaven, east of Ardougne.",
                ["questID"] = 326,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [254] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Legacy of Seergaze",
                ["detail"] = "Talk to the mercenary adventurer east of Paterdomus in Morytania.",
                ["questID"] = 327,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [255] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Legacy of Seergaze",
                ["detail"] = "Talk to the mercenary adventurer east of Paterdomus in Morytania.",
                ["questID"] = 327,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [256] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Perils of Ice Mountain",
                ["detail"] = "Talk to Lakki, on the road south of Ice Mountain.",
                ["questID"] = 328,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [257] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Perils of Ice Mountain",
                ["detail"] = "Talk to Lakki, on the road south of Ice Mountain.",
                ["questID"] = 328,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [258] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Smoking Kills",
                ["detail"] = "Talk to Sumona in her house in Pollnivneach.",
                ["questID"] = 330,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [259] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Smoking Kills",
                ["detail"] = "Talk to Sumona in her house in Pollnivneach.",
                ["questID"] = 330,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [260] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [261] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [262] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [263] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [264] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [265] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [266] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [267] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rocking Out",
                ["detail"] = "Talk to Bill Teach in Mos Le'Harmless or Port Phasmatys.",
                ["questID"] = 4,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [268] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spirit of Summer",
                ["detail"] = "Talk to the little ghost by the Wilderness wall north-east of Varrock.",
                ["questID"] = 331,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [269] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spirit of Summer",
                ["detail"] = "Talk to the little ghost by the Wilderness wall north-east of Varrock.",
                ["questID"] = 331,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [270] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Meeting History",
                ["detail"] = "Talk to Jorral in the outpost south of the Tree Gnome Stronghold, north-west of West Ardougne.",
                ["questID"] = 142,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [271] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Meeting History",
                ["detail"] = "Talk to Jorral in the outpost south of the Tree Gnome Stronghold, north-west of West Ardougne.",
                ["questID"] = 142,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [272] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "All Fired Up",
                ["detail"] = "Talk to King Roald in Varrock palace.",
                ["questID"] = 29,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [273] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "All Fired Up",
                ["detail"] = "Talk to King Roald in Varrock palace.",
                ["questID"] = 29,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [274] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Summer's End",
                ["detail"] = "Talk to Summer by the Wilderness wall north-east of Varrock.",
                ["questID"] = 95,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [275] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Summer's End",
                ["detail"] = "Talk to Summer by the Wilderness wall north-east of Varrock.",
                ["questID"] = 95,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [276] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Defender of Varrock",
                ["detail"] = "Talk to Captain Rovin in the north-west tower of Varrock Palace.",
                ["questID"] = 56,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [277] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Defender of Varrock",
                ["detail"] = "Talk to Captain Rovin in the north-west tower of Varrock Palace.",
                ["questID"] = 56,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [278] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "While Guthix Sleeps",
                ["detail"] = "Talk to Radimus Erkle in the Legends' Guild, which is located in the north-east of Ardougne.",
                ["questID"] = 86,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [279] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "While Guthix Sleeps",
                ["detail"] = "Talk to Radimus Erkle in the Legends' Guild, which is located in the north-east of Ardougne.",
                ["questID"] = 86,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [280] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Pyre Need",
                ["detail"] = "Talk to the priest of Guthix outside a cave south-west of the Piscatoris Fishing Colony.",
                ["questID"] = 87,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [281] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Pyre Need",
                ["detail"] = "Talk to the priest of Guthix outside a cave south-west of the Piscatoris Fishing Colony.",
                ["questID"] = 87,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [282] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Myths of the White Lands",
                ["detail"] = "Talk to Explorer Jack in his house by the Lumbridge General Store.",
                ["questID"] = 74,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [283] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Myths of the White Lands",
                ["detail"] = "Talk to Explorer Jack in his house by the Lumbridge General Store.",
                ["questID"] = 74,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [284] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Glorious Memories",
                ["detail"] = "Talk to Manni the Reveller inside the longhall in Rellekka.",
                ["questID"] = 115,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [285] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Glorious Memories",
                ["detail"] = "Talk to Manni the Reveller inside the longhall in Rellekka.",
                ["questID"] = 115,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [286] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Tale of the Muspah",
                ["detail"] = "Talk to Erjolf at the cave entrance half way up the mountain north-east of Rellekka.",
                ["questID"] = 18,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [287] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Tale of the Muspah",
                ["detail"] = "Talk to Erjolf at the cave entrance half way up the mountain north-east of Rellekka.",
                ["questID"] = 18,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [288] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Missing My Mummy",
                ["detail"] = "Talk to Leela in Draynor Village.",
                ["questID"] = 77,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [289] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Missing My Mummy",
                ["detail"] = "Talk to Leela in Draynor Village.",
                ["questID"] = 77,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [290] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Curse of Arrav",
                ["detail"] = "Talk to Ali the Wise in his house in Nardah.",
                ["questID"] = 117,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [291] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Curse of Arrav",
                ["detail"] = "Talk to Ali the Wise in his house in Nardah.",
                ["questID"] = 117,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [292] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Temple at Senntisten",
                ["detail"] = "Talk to Ali the Wise at his house in Nardah.",
                ["questID"] = 333,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [293] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Temple at Senntisten",
                ["detail"] = "Talk to Ali the Wise at his house in Nardah.",
                ["questID"] = 333,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [294] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hunt for Red Raktuber",
                ["detail"] = "Talk to Larry in the Ardougne Zoo.",
                ["questID"] = 332,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [295] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hunt for Red Raktuber",
                ["detail"] = "Talk to Larry in the Ardougne Zoo.",
                ["questID"] = 332,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [296] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Swept Away",
                ["detail"] = "Talk to Maggie at her caravan north of Draynor Village.",
                ["questID"] = 20,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [297] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Swept Away",
                ["detail"] = "Talk to Maggie at her caravan north of Draynor Village.",
                ["questID"] = 20,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [298] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fur 'n Seek",
                ["detail"] = "Talk to the Odd Old Man at the quarry west of Paterdomus.",
                ["questID"] = 33,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [299] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fur 'n Seek",
                ["detail"] = "Talk to the Odd Old Man at the quarry west of Paterdomus.",
                ["questID"] = 33,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [300] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Within the Light",
                ["detail"] = "Talk to Arianwyn in Lletya.",
                ["questID"] = 167,
            },
            {
                ["name"] = "Plague's End",
                ["detail"] = "Talk to Arianwyn in Lletya.",
                ["questID"] = 222,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [301] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Within the Light",
                ["detail"] = "Talk to Arianwyn in Lletya.",
                ["questID"] = 167,
            },
            {
                ["name"] = "Plague's End",
                ["detail"] = "Talk to Arianwyn in Lletya.",
                ["questID"] = 222,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [302] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Nomad's Requiem",
                ["detail"] = "Talk to Zimberfizz in the Soul Wars camp.",
                ["questID"] = 170,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [303] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Nomad's Requiem",
                ["detail"] = "Talk to Zimberfizz in the Soul Wars camp.",
                ["questID"] = 170,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [304] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Blood Runs Deep",
                ["detail"] = "Talk to Baba Yaga on Lunar Isle.",
                ["questID"] = 334,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [305] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Blood Runs Deep",
                ["detail"] = "Talk to Baba Yaga on Lunar Isle.",
                ["questID"] = 334,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [306] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rune Mechanics",
                ["detail"] = "Talk to Apprentice Clerval in the basement of the Mage Training Arena.",
                ["questID"] = 171,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [307] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rune Mechanics",
                ["detail"] = "Talk to Apprentice Clerval in the basement of the Mage Training Arena.",
                ["questID"] = 171,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [308] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Love Story",
                ["detail"] = "Talk to Mabel at the barn north-east of Draynor Village.",
                ["questID"] = 340,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [309] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Love Story",
                ["detail"] = "Talk to Mabel at the barn north-east of Draynor Village.",
                ["questID"] = 340,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [310] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Blood Pact",
                ["detail"] = "Talk to Xenia in the graveyard of Lumbridge Church.",
                ["questID"] = 335,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [311] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Blood Pact",
                ["detail"] = "Talk to Xenia in the graveyard of Lumbridge Church.",
                ["questID"] = 335,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [312] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Quiet Before the Swarm",
                ["detail"] = "Talk to Sir Tiffy in Falador Park.",
                ["questID"] = 339,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [313] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Quiet Before the Swarm",
                ["detail"] = "Talk to Sir Tiffy in Falador Park.",
                ["questID"] = 339,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [314] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Void Dance",
                ["detail"] = "Talk to Commodore Tyr at the Void Knights' Outpost, accessible from the squire at Port Sarim docks.",
                ["questID"] = 83,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [315] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Void Dance",
                ["detail"] = "Talk to Commodore Tyr at the Void Knights' Outpost, accessible from the squire at Port Sarim docks.",
                ["questID"] = 83,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [316] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Void Stares Back",
                ["detail"] = "Talk to Captain Korasi in Falador Park.",
                ["questID"] = 342,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [317] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Void Stares Back",
                ["detail"] = "Talk to Captain Korasi in Falador Park.",
                ["questID"] = 342,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [318] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gunnar's Ground",
                ["detail"] = "Talk to Dororan outside the barbarian village.",
                ["questID"] = 341,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [319] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gunnar's Ground",
                ["detail"] = "Talk to Dororan outside the barbarian village.",
                ["questID"] = 341,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [320] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ritual of the Mahjarrat",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 194,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [321] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ritual of the Mahjarrat",
                ["detail"] = "Talk to Sir Tiffy Cashien in Falador Park.",
                ["questID"] = 194,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [322] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop III",
                ["detail"] = "Search a bookcase in Seers' Village church.",
                ["questID"] = 338,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [323] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop III",
                ["detail"] = "Search a bookcase in Seers' Village church.",
                ["questID"] = 338,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [324] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Do No Evil",
                ["detail"] = "Talk to Leela and Senliten in Senliten's tomb.",
                ["questID"] = 343,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [325] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Do No Evil",
                ["detail"] = "Talk to Leela and Senliten in Senliten's tomb.",
                ["questID"] = 343,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [326] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop IV",
                ["detail"] = "Search the bookcase on the ground floor of the Sorcerer's Tower.",
                ["questID"] = 344,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [327] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Elemental Workshop IV",
                ["detail"] = "Search the bookcase on the ground floor of the Sorcerer's Tower.",
                ["questID"] = 344,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [328] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [329] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [330] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [331] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [332] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [333] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Clockwork Syringe",
                ["detail"] = "Go to your player-owned house.",
                ["questID"] = 188,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [334] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Deadliest Catch",
                ["detail"] = "Talk to Jones at the Fishing Guild.",
                ["questID"] = 345,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [335] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Deadliest Catch",
                ["detail"] = "Talk to Jones at the Fishing Guild.",
                ["questID"] = 345,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [336] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Salt in the Wound",
                ["detail"] = "Talk to Kennith on the Daemonheim peninsula.",
                ["questID"] = 346,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [337] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Salt in the Wound",
                ["detail"] = "Talk to Kennith on the Daemonheim peninsula.",
                ["questID"] = 346,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [338] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Piercing Note",
                ["detail"] = "Talk to Sister Catherina outside the Citharede Abbey, east of Al Kharid.",
                ["questID"] = 196,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [339] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Piercing Note",
                ["detail"] = "Talk to Sister Catherina outside the Citharede Abbey, east of Al Kharid.",
                ["questID"] = 196,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [340] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Let Them Eat Pie",
                ["detail"] = "Talk to Nails Newton outside the Pick and Lute tavern in Taverley.",
                ["questID"] = 350,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [341] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Let Them Eat Pie",
                ["detail"] = "Talk to Nails Newton outside the Pick and Lute tavern in Taverley.",
                ["questID"] = 350,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [342] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Firemaker's Curse",
                ["detail"] = "Talk to one of the firemakers gathered around a cave entrance south of Eagles' Peak.",
                ["questID"] = 349,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [343] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Firemaker's Curse",
                ["detail"] = "Talk to one of the firemakers gathered around a cave entrance south of Eagles' Peak.",
                ["questID"] = 349,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [344] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Carnillean Rising",
                ["detail"] = "Talk to Xenia outside the Carnillean mansion south-west of East Ardougne.",
                ["questID"] = 353,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [345] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Carnillean Rising",
                ["detail"] = "Talk to Xenia outside the Carnillean mansion south-west of East Ardougne.",
                ["questID"] = 353,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [346] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Song from the Depths",
                ["detail"] = "Talk to Lucille in Rimmington.",
                ["questID"] = 352,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [347] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Song from the Depths",
                ["detail"] = "Talk to Lucille in Rimmington.",
                ["questID"] = 352,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [348] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Some Like It Cold",
                ["detail"] = "Talk to Chuck at the Ardougne Zoo.",
                ["questID"] = 204,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [349] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Some Like It Cold",
                ["detail"] = "Talk to Chuck at the Ardougne Zoo.",
                ["questID"] = 204,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [350] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Stolen Hearts",
                ["detail"] = "Talk to Ozan in Draynor Village.",
                ["questID"] = 355,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [351] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Stolen Hearts",
                ["detail"] = "Talk to Ozan in Draynor Village.",
                ["questID"] = 355,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [352] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Diamond in the Rough",
                ["detail"] = "Talk to Spymaster Osman in Al Kharid's palace.",
                ["questID"] = 356,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [353] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Diamond in the Rough",
                ["detail"] = "Talk to Spymaster Osman in Al Kharid's palace.",
                ["questID"] = 356,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [354] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "What's Mine is Yours",
                ["detail"] = "Talk to Doric who is just outside the gates of Taverley.",
                ["questID"] = 357,
            },
            {
                ["name"] = "Doric's Task I (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 421,
            },
            {
                ["name"] = "Doric's Task II (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 422,
            },
            {
                ["name"] = "Doric's Task III (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 423,
            },
            {
                ["name"] = "Doric's Task IV (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 424,
            },
            {
                ["name"] = "Doric's Task V (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 425,
            },
            {
                ["name"] = "Doric's Task VI (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 426,
            },
            {
                ["name"] = "Doric's Task VII (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 427,
            },
            {
                ["name"] = "Doric's Task VIII (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 428,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [355] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "What's Mine is Yours",
                ["detail"] = "Talk to Doric who is just outside the gates of Taverley.",
                ["questID"] = 357,
            },
            {
                ["name"] = "Doric's Task I (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 421,
            },
            {
                ["name"] = "Doric's Task II (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 422,
            },
            {
                ["name"] = "Doric's Task III (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 423,
            },
            {
                ["name"] = "Doric's Task IV (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 424,
            },
            {
                ["name"] = "Doric's Task V (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 425,
            },
            {
                ["name"] = "Doric's Task VI (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 426,
            },
            {
                ["name"] = "Doric's Task VII (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 427,
            },
            {
                ["name"] = "Doric's Task VIII (miniquest)",
                ["detail"] = "Talk to Doric in his hut just outside the gates of Taverley.",
                ["questID"] = 428,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [356] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rune Mysteries",
                ["detail"] = "Talk to Ariane in the lobby of the Wizards' Tower, south of Draynor Village.",
                ["questID"] = 358,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [357] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rune Mysteries",
                ["detail"] = "Talk to Ariane in the lobby of the Wizards' Tower, south of Draynor Village.",
                ["questID"] = 358,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [358] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The World Wakes",
                ["detail"] = "Talk to Orlando Smith, excavating West of the Legends' Guild.",
                ["questID"] = 361,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [359] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The World Wakes",
                ["detail"] = "Talk to Orlando Smith, excavating West of the Legends' Guild.",
                ["questID"] = 361,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [360] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Bringing Home the Bacon",
                ["detail"] = "Talk to Eli Bacon in the pig farm north of Port Sarim.",
                ["questID"] = 362,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [361] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Bringing Home the Bacon",
                ["detail"] = "Talk to Eli Bacon in the pig farm north of Port Sarim.",
                ["questID"] = 362,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [362] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Missing, Presumed Death",
                ["detail"] = "Talk to Brother Samwell on the road to the Paterdomus Temple, East of Varrock.",
                ["questID"] = 364,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [363] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Missing, Presumed Death",
                ["detail"] = "Talk to Brother Samwell on the road to the Paterdomus Temple, East of Varrock.",
                ["questID"] = 364,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [364] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One of a Kind",
                ["detail"] = "Talk to Mr Mordaut under the stairs in the Varrock museum.",
                ["questID"] = 365,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [365] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One of a Kind",
                ["detail"] = "Talk to Mr Mordaut under the stairs in the Varrock museum.",
                ["questID"] = 365,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [366] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fate of the Gods",
                ["detail"] = "Talk to Azzanadra south of the Eagles' Peak lodestone.",
                ["questID"] = 366,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [367] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fate of the Gods",
                ["detail"] = "Talk to Azzanadra south of the Eagles' Peak lodestone.",
                ["questID"] = 366,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [368] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Shadow over Ashdale",
                ["detail"] = "Talk to Gudrik on the docks of Port Sarim.",
                ["questID"] = 367,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [369] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "A Shadow over Ashdale",
                ["detail"] = "Talk to Gudrik on the docks of Port Sarim.",
                ["questID"] = 367,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [370] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Broken Home",
                ["detail"] = "Talk to Maria outside the mansion north-east of Varrock.",
                ["questID"] = 369,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [371] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Broken Home",
                ["detail"] = "Talk to Maria outside the mansion north-east of Varrock.",
                ["questID"] = 369,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [372] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heart of Stone",
                ["detail"] = "Outside the Wizards' Tower near Draynor.",
                ["questID"] = 224,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [373] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heart of Stone",
                ["detail"] = "Outside the Wizards' Tower near Draynor.",
                ["questID"] = 224,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [374] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dimension of Disaster",
                ["detail"] = "Talk to Aris in her tent south-west of Varrock square.",
                ["questID"] = 371,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [375] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dimension of Disaster",
                ["detail"] = "Talk to Aris in her tent south-west of Varrock square.",
                ["questID"] = 371,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [376] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hero's Welcome",
                ["detail"] = "Talk to Alfrick the Planner and Freya Lune in Rellekka.",
                ["questID"] = 377,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [377] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hero's Welcome",
                ["detail"] = "Talk to Alfrick the Planner and Freya Lune in Rellekka.",
                ["questID"] = 377,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [378] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lord of Vampyrium",
                ["detail"] = "Talk to Vanescula Drakan, by the rowboat entrance to Meiyerditch.",
                ["questID"] = 379,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [379] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lord of Vampyrium",
                ["detail"] = "Talk to Vanescula Drakan, by the rowboat entrance to Meiyerditch.",
                ["questID"] = 379,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [380] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Call of the Ancestors",
                ["detail"] = "Talk to Tunks near the Mazcab portal, North-West of the Menaphos gates.",
                ["questID"] = 380,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [381] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Call of the Ancestors",
                ["detail"] = "Talk to Tunks near the Mazcab portal, North-West of the Menaphos gates.",
                ["questID"] = 380,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [382] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Beneath Cursed Tides",
                ["detail"] = "Talk to Wizard Myrtle at the fountains in front of the Wizards' Tower.",
                ["questID"] = 381,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [383] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Beneath Cursed Tides",
                ["detail"] = "Talk to Wizard Myrtle at the fountains in front of the Wizards' Tower.",
                ["questID"] = 381,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [384] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Nomad's Elegy",
                ["detail"] = "Talk to Zimberfizz in the Soul Wars camp.",
                ["questID"] = 382,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [385] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Nomad's Elegy",
                ["detail"] = "Talk to Zimberfizz in the Soul Wars camp.",
                ["questID"] = 382,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [386] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "River of Blood",
                ["detail"] = "Talk to King Roald in Varrock palace throne room.",
                ["questID"] = 383,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [387] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "River of Blood",
                ["detail"] = "Talk to King Roald in Varrock palace throne room.",
                ["questID"] = 383,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [388] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Kindred Spirits",
                ["detail"] = "Talk to Linza near the smithy in Burthorpe.",
                ["questID"] = 384,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [389] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Kindred Spirits",
                ["detail"] = "Talk to Linza near the smithy in Burthorpe.",
                ["questID"] = 384,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [390] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gower Quest",
                ["detail"] = "Talk to Andrew Gower at the cabbage farm south of Varrock.",
                ["questID"] = 385,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [391] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Gower Quest",
                ["detail"] = "Talk to Andrew Gower at the cabbage farm south of Varrock.",
                ["questID"] = 385,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [392] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Children of Mah",
                ["detail"] = "Talk to Kharshai in the frozen region north of Rellekka or (if you've completed Koschei's Troubles) in his cave beneath Rellekka.",
                ["questID"] = 386,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [393] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Children of Mah",
                ["detail"] = "Talk to Kharshai in the frozen region north of Rellekka or (if you've completed Koschei's Troubles) in his cave beneath Rellekka.",
                ["questID"] = 386,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [394] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Impressing the Locals",
                ["detail"] = "Talk to Trader Stan in Port Sarim about the Skulls pirate named Jed.",
                ["questID"] = 387,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [395] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Impressing the Locals",
                ["detail"] = "Talk to Trader Stan in Port Sarim about the Skulls pirate named Jed.",
                ["questID"] = 387,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [396] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sliske's Endgame",
                ["detail"] = "Talk to Relomia in Draynor Village.",
                ["questID"] = 388,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [397] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sliske's Endgame",
                ["detail"] = "Talk to Relomia in Draynor Village.",
                ["questID"] = 388,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [398] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Back to the Freezer",
                ["detail"] = "Talk to Chuck at the Ardougne Zoo.",
                ["questID"] = 389,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [399] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Back to the Freezer",
                ["detail"] = "Talk to Chuck at the Ardougne Zoo.",
                ["questID"] = 389,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [400] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Jack of Spades",
                ["detail"] = "Talk to Emir Ali in Al Kharid's palace.",
                ["questID"] = 390,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [401] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Jack of Spades",
                ["detail"] = "Talk to Emir Ali in Al Kharid's palace.",
                ["questID"] = 390,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [402] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Crocodile Tears",
                ["detail"] = "Talk to Leela and Senliten in Senliten's tomb.",
                ["questID"] = 391,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [403] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Crocodile Tears",
                ["detail"] = "Talk to Leela and Senliten in Senliten's tomb.",
                ["questID"] = 391,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [404] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Our Man in the North",
                ["detail"] = "Talk to Hassan in Menaphos.",
                ["questID"] = 392,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [405] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Our Man in the North",
                ["detail"] = "Talk to Hassan in Menaphos.",
                ["questID"] = 392,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [406] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "'Phite Club",
                ["detail"] = "Talk to Hassan in Menaphos.",
                ["questID"] = 393,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [407] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "'Phite Club",
                ["detail"] = "Talk to Hassan in Menaphos.",
                ["questID"] = 393,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [408] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Evil Dave's Big Day Out",
                ["detail"] = "Talk to Evil Dave in his mother's basement in Edgeville.",
                ["questID"] = 395,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [409] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Evil Dave's Big Day Out",
                ["detail"] = "Talk to Evil Dave in his mother's basement in Edgeville.",
                ["questID"] = 395,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [410] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pieces of Hate",
                ["detail"] = "Talk to Postie Pete at any player-owned house portal.",
                ["questID"] = 397,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [411] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pieces of Hate",
                ["detail"] = "Talk to Postie Pete at any player-owned house portal.",
                ["questID"] = 397,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [412] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "You Are It",
                ["detail"] = "Chop the tree in south-west McGrubor's Wood near the quest start marker.",
                ["questID"] = 398,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [413] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "You Are It",
                ["detail"] = "Chop the tree in south-west McGrubor's Wood near the quest start marker.",
                ["questID"] = 398,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [414] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Needle Skips",
                ["detail"] = "Find the Needle on the hill west of Piscatoris.",
                ["questID"] = 399,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [415] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Needle Skips",
                ["detail"] = "Find the Needle on the hill west of Piscatoris.",
                ["questID"] = 399,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [416] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Violet is Blue",
                ["detail"] = "Enter the portal to the Land of Snow on White Wolf Mountain (accessed from the Taverley side).",
                ["questID"] = 400,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [417] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Violet is Blue",
                ["detail"] = "Enter the portal to the Land of Snow on White Wolf Mountain (accessed from the Taverley side).",
                ["questID"] = 400,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [418] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Chef's Assistant",
                ["detail"] = "Talk to the Head Chef in the Cooking Guild.",
                ["questID"] = 401,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [419] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Chef's Assistant",
                ["detail"] = "Talk to the Head Chef in the Cooking Guild.",
                ["questID"] = 401,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [420] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Curse of the Black Stone",
                ["detail"] = "Talk to Bryll Thoksdottir at Daemonheim.",
                ["questID"] = 402,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [421] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Curse of the Black Stone",
                ["detail"] = "Talk to Bryll Thoksdottir at Daemonheim.",
                ["questID"] = 402,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [422] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Once Upon a Slime",
                ["detail"] = "Talk to Peter in Rimmington.",
                ["questID"] = 455,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [423] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Once Upon a Slime",
                ["detail"] = "Talk to Peter in Rimmington.",
                ["questID"] = 455,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [424] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desperate Measures",
                ["detail"] = "Talk to Seren, up the stairs in Burthorpe castle.",
                ["questID"] = 465,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [425] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desperate Measures",
                ["detail"] = "Talk to Seren, up the stairs in Burthorpe castle.",
                ["questID"] = 465,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [426] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sins of the Father",
                ["detail"] = "Talk to Mr. Mordaut at the base camp on Anachronia to find out more.",
                ["questID"] = 466,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [427] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sins of the Father",
                ["detail"] = "Talk to Mr. Mordaut at the base camp on Anachronia to find out more.",
                ["questID"] = 466,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [428] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desperate Creatures",
                ["detail"] = "Speak to the Curator north of the Burthorpe lodestone.",
                ["questID"] = 488,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [429] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Desperate Creatures",
                ["detail"] = "Speak to the Curator north of the Burthorpe lodestone.",
                ["questID"] = 488,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [430] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Raksha, the Shadow Colossus",
                ["detail"] = "Talk to Laniakea on Anachronia to find out more.",
                ["questID"] = 467,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [431] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Raksha, the Shadow Colossus",
                ["detail"] = "Talk to Laniakea on Anachronia to find out more.",
                ["questID"] = 467,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [432] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Violet is Blue Too",
                ["detail"] = "Talk to Postie Pete by the portal to the Land of Snow. (The base of White wolf mountain)",
                ["questID"] = 453,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [433] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Violet is Blue Too",
                ["detail"] = "Talk to Postie Pete by the portal to the Land of Snow. (The base of White wolf mountain)",
                ["questID"] = 453,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [434] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Vault of Shadows",
                ["detail"] = "Talk to Dr Nabanik outside the Kharid-et Dig Site.",
                ["questID"] = 470,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [435] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Vault of Shadows",
                ["detail"] = "Talk to Dr Nabanik outside the Kharid-et Dig Site.",
                ["questID"] = 470,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [436] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heartstealer",
                ["detail"] = "Talk to Caelyn on the first floor of the house north of Edgeville bank.",
                ["questID"] = 468,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [437] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heartstealer",
                ["detail"] = "Talk to Caelyn on the first floor of the house north of Edgeville bank.",
                ["questID"] = 468,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [438] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Battle of the Monolith",
                ["detail"] = "Speak to Ali the Wise or Wizard Trindy at the Archaeology campus.",
                ["questID"] = 473,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [439] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Battle of the Monolith",
                ["detail"] = "Speak to Ali the Wise or Wizard Trindy at the Archaeology campus.",
                ["questID"] = 473,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [440] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "City of Senntisten",
                ["detail"] = "Talk to Ariane outside The Heart in the Kharidian Desert.",
                ["questID"] = 474,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [441] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "City of Senntisten",
                ["detail"] = "Talk to Ariane outside The Heart in the Kharidian Desert.",
                ["questID"] = 474,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [442] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Once Upon a Time in Gielinor",
                ["detail"] = "Talk to the Relomia in the Blue Moon Inn in Varrock.",
                ["questID"] = 477,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [443] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Once Upon a Time in Gielinor",
                ["detail"] = "Talk to the Relomia in the Blue Moon Inn in Varrock.",
                ["questID"] = 477,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [444] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye of Het I",
                ["detail"] = "Talk to Icthlarin at the entrance to Het's Oasis.",
                ["questID"] = 478,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [445] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye of Het I",
                ["detail"] = "Talk to Icthlarin at the entrance to Het's Oasis.",
                ["questID"] = 478,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [446] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye of Het II",
                ["detail"] = "Talk to Icthlarin at the entrance to Het's Oasis.",
                ["questID"] = 479,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [447] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye of Het II",
                ["detail"] = "Talk to Icthlarin at the entrance to Het's Oasis.",
                ["questID"] = 479,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [448] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Extinction",
                ["detail"] = "Speak to Moia at the surface entrance of Senntisten.",
                ["questID"] = 480,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [449] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Extinction",
                ["detail"] = "Speak to Moia at the surface entrance of Senntisten.",
                ["questID"] = 480,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [450] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Twilight of the Gods",
                ["detail"] = "Talk to a wounded knight outside the surface entrance to Senntisten.",
                ["questID"] = 481,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [451] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Twilight of the Gods",
                ["detail"] = "Talk to a wounded knight outside the surface entrance to Senntisten.",
                ["questID"] = 481,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [452] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Aftermath",
                ["detail"] = "Talk to Adrasteia in her library on the first floor of the White Knights' Castle in Falador, near the interrogation room.",
                ["questID"] = 482,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [453] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Aftermath",
                ["detail"] = "Talk to Adrasteia in her library on the first floor of the White Knights' Castle in Falador, near the interrogation room.",
                ["questID"] = 482,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [454] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Daughter of Chaos",
                ["detail"] = "Speak to Adrasteia in the Falador castle throne room.",
                ["questID"] = 483,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [455] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Daughter of Chaos",
                ["detail"] = "Speak to Adrasteia in the Falador castle throne room.",
                ["questID"] = 483,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [456] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Succession",
                ["detail"] = "Speak to Adrasteia in the Falador castle throne room.",
                ["questID"] = 487,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [457] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Succession",
                ["detail"] = "Speak to Adrasteia in the Falador castle throne room.",
                ["questID"] = 487,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [458] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "New Foundations",
                ["detail"] = "Outside the Varrock palace throne room.",
                ["questID"] = 489,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [459] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "New Foundations",
                ["detail"] = "Outside the Varrock palace throne room.",
                ["questID"] = 489,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [460] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Murder on the Border",
                ["detail"] = "Speak to Aster in the Fort Forinthry townhall.",
                ["questID"] = 490,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [461] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Murder on the Border",
                ["detail"] = "Speak to Aster in the Fort Forinthry townhall.",
                ["questID"] = 490,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [462] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Unwelcome Guests",
                ["detail"] = "Talk to overseer Siv in Fort Forinthry.",
                ["questID"] = 491,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [463] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Unwelcome Guests",
                ["detail"] = "Talk to overseer Siv in Fort Forinthry.",
                ["questID"] = 491,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [464] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dead and Buried",
                ["detail"] = "Talk to the Raptor north of the guardhouse in Fort Forinthry.",
                ["questID"] = 492,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [465] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Dead and Buried",
                ["detail"] = "Talk to the Raptor north of the guardhouse in Fort Forinthry.",
                ["questID"] = 492,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [466] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Necromancy!",
                ["detail"] = "Investigate the white light portal north of Draynor's lodestone.",
                ["questID"] = 493,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [467] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Necromancy!",
                ["detail"] = "Investigate the white light portal north of Draynor's lodestone.",
                ["questID"] = 493,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [468] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ancient Awakening",
                ["detail"] = "Talk to overseer Siv in Fort Forinthry.",
                ["questID"] = 502,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [469] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ancient Awakening",
                ["detail"] = "Talk to overseer Siv in Fort Forinthry.",
                ["questID"] = 502,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [470] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Battle of Forinthry",
                ["detail"] = "Talk to the Raptor in Fort Forinthry.",
                ["questID"] = 507,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [471] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Battle of Forinthry",
                ["detail"] = "Talk to the Raptor in Fort Forinthry.",
                ["questID"] = 507,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [472] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Requiem for a Dragon",
                ["detail"] = "Speak to Aster in the Fort Forinthry townhall.",
                ["questID"] = 511,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [473] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Requiem for a Dragon",
                ["detail"] = "Speak to Aster in the Fort Forinthry townhall.",
                ["questID"] = 511,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [474] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Osseous Rex",
                ["detail"] = "Talk to the 'calm' Archaeologist in Anachronia base camp.",
                ["questID"] = 512,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [475] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Osseous Rex",
                ["detail"] = "Talk to the 'calm' Archaeologist in Anachronia base camp.",
                ["questID"] = 512,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [476] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ode of the Devourer",
                ["detail"] = "Check on Bill at the Fort Forinthry workshop.",
                ["questID"] = 514,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [477] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ode of the Devourer",
                ["detail"] = "Check on Bill at the Fort Forinthry workshop.",
                ["questID"] = 514,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [478] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Beneath Scabaras' Sands",
                ["detail"] = "Enter the Menaphos throne room.",
                ["questID"] = 517,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [479] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Beneath Scabaras' Sands",
                ["detail"] = "Enter the Menaphos throne room.",
                ["questID"] = 517,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [480] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pharaoh's Folly",
                ["detail"] = "Speak to Leela outside the gates of Menaphos.",
                ["questID"] = 519,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [481] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Pharaoh's Folly",
                ["detail"] = "Speak to Leela outside the gates of Menaphos.",
                ["questID"] = 519,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [482] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Duck Quest",
                ["detail"] = "Investigate a strange fishing spot on the riverbank south of Draynor Village.",
                ["questID"] = 520,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [483] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Duck Quest",
                ["detail"] = "Investigate a strange fishing spot on the riverbank south of Draynor Village.",
                ["questID"] = 520,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [484] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eclipse of the Heart",
                ["detail"] = "Enter the Menaphos throne room.",
                ["questID"] = 521,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [485] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eclipse of the Heart",
                ["detail"] = "Enter the Menaphos throne room.",
                ["questID"] = 521,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [486] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Stellar Born",
                ["detail"] = "Investigate a mysterious crashed star in Piscatoris.",
                ["questID"] = 522,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [487] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Stellar Born",
                ["detail"] = "Investigate a mysterious crashed star in Piscatoris.",
                ["questID"] = 522,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [488] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Princess and the Pauper",
                ["detail"] = "Talk to Rodney in the Fort Forinthry kitchen.",
                ["questID"] = 525,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [489] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Princess and the Pauper",
                ["detail"] = "Talk to Rodney in the Fort Forinthry kitchen.",
                ["questID"] = 525,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [490] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Visions of Havenhythe",
                ["detail"] = "Speak to the bartender at the Rusty Anchor Tavern in Port Sarim.",
                ["questID"] = 526,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [491] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Visions of Havenhythe",
                ["detail"] = "Speak to the bartender at the Rusty Anchor Tavern in Port Sarim.",
                ["questID"] = 526,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [492] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hearts of Sanguine",
                ["detail"] = "Speak to Adam at his house in Wendlewick.",
                ["questID"] = 527,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [493] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hearts of Sanguine",
                ["detail"] = "Speak to Adam at his house in Wendlewick.",
                ["questID"] = 527,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [494] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hermit Permits",
                ["detail"] = "Read the village noticeboard in Wendlewick.",
                ["questID"] = 528,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [495] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Hermit Permits",
                ["detail"] = "Read the village noticeboard in Wendlewick.",
                ["questID"] = 528,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [496] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wiz Kid",
                ["detail"] = "Speak to Ben on Marigold Farm in Wendlewick.",
                ["questID"] = 529,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [497] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Wiz Kid",
                ["detail"] = "Speak to Ben on Marigold Farm in Wendlewick.",
                ["questID"] = 529,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [498] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Secrets of Amberfell",
                ["detail"] = "Speak to the ranger guarding the ruined bridge to Amberfell.",
                ["questID"] = 531,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [499] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Secrets of Amberfell",
                ["detail"] = "Speak to the ranger guarding the ruined bridge to Amberfell.",
                ["questID"] = 531,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [500] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "There's No Place Like Home...",
                ["detail"] = "Talk to Alfred Stonemason in Rimmington.",
                ["questID"] = 532,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [501] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "There's No Place Like Home...",
                ["detail"] = "Talk to Alfred Stonemason in Rimmington.",
                ["questID"] = 532,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [502] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heralds of Crimson",
                ["detail"] = "Speak to Sorrel in Amberfell.",
                ["questID"] = 533,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [503] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Heralds of Crimson",
                ["detail"] = "Speak to Sorrel in Amberfell.",
                ["questID"] = 533,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [504] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Three's Company (saga)",
                ["detail"] = "Find a bearskin while raiding the 1-11 frozen floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 416,
            },
            {
                ["name"] = "Vengeance (saga)",
                ["detail"] = "Find a collection of swords while raiding the 12-17 abandoned floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 417,
            },
            {
                ["name"] = "Nadir (saga)",
                ["detail"] = "Find the damaged device while raiding the 18-22 furnished floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 419,
            },
            {
                ["name"] = "Thok Your Block Off (saga)",
                ["detail"] = "Find the rock and twine bundle while raiding the 36-40 occult floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 420,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [505] = {
        ["title"] = "Quest starts",
        ["rows"] = {
            {
                ["name"] = "Three's Company (saga)",
                ["detail"] = "Find a bearskin while raiding the 1-11 frozen floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 416,
            },
            {
                ["name"] = "Vengeance (saga)",
                ["detail"] = "Find a collection of swords while raiding the 12-17 abandoned floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 417,
            },
            {
                ["name"] = "Nadir (saga)",
                ["detail"] = "Find the damaged device while raiding the 18-22 furnished floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 419,
            },
            {
                ["name"] = "Thok Your Block Off (saga)",
                ["detail"] = "Find the rock and twine bundle while raiding the 36-40 occult floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 420,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [506] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Vengeance (saga)",
                ["detail"] = "Find a collection of swords while raiding the 12-17 abandoned floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 417,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [507] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Thok It To 'Em (saga)",
                ["detail"] = "Find scribbled notes while raiding the 30-35 abandoned floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 418,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [508] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Nadir (saga)",
                ["detail"] = "Find the damaged device while raiding the 18-22 furnished floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 419,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [509] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Thok Your Block Off (saga)",
                ["detail"] = "Find the rock and twine bundle while raiding the 36-40 occult floors of Daemonheim, then ask Skaldrun south-west of the Daemonheim entrance to share their story.",
                ["questID"] = 420,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [510] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Flag Fall (miniquest)",
                ["detail"] = "Talk to Boni the rewards vendor at Waiko market. (Quartermaster Gully, south-east of the Port Sarim pub, can sail you to Waiko in the Arc region of the Wushanko Isles.)",
                ["questID"] = 440,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [511] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Flag Fall (miniquest)",
                ["detail"] = "Talk to Boni the rewards vendor at Waiko market. (Quartermaster Gully, south-east of the Port Sarim pub, can sail you to Waiko in the Arc region of the Wushanko Isles.)",
                ["questID"] = 440,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [512] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Head of the Family (miniquest)",
                ["detail"] = "Talk to the Waiko moai on the hill north-east of Waiko market.",
                ["questID"] = 441,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [513] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Head of the Family (miniquest)",
                ["detail"] = "Talk to the Waiko moai on the hill north-east of Waiko market.",
                ["questID"] = 441,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [514] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spiritual Enlightenment (miniquest)",
                ["detail"] = "Talk to Ling on the south beach of Aminishi.",
                ["questID"] = 442,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [515] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Spiritual Enlightenment (miniquest)",
                ["detail"] = "Talk to Ling on the south beach of Aminishi.",
                ["questID"] = 442,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [516] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Jed Hunter (miniquest)",
                ["detail"] = "Talk to Lookout Ekahi on the nothern dock of Waiko, near your ship, the Sarim's Revenge.",
                ["questID"] = 443,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [517] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Jed Hunter (miniquest)",
                ["detail"] = "Talk to Lookout Ekahi on the nothern dock of Waiko, near your ship, the Sarim's Revenge.",
                ["questID"] = 443,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [518] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye for an Eye (miniquest)",
                ["detail"] = "Talk to Ichi on the eastern side of Cyclosis. (Quartermaster Gully, south-east of the Port Sarim pub, can sail you to Cyclosis in the Arc region of the Wushanko Isles.)",
                ["questID"] = 444,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [519] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Eye for an Eye (miniquest)",
                ["detail"] = "Talk to Ichi on the eastern side of Cyclosis. (Quartermaster Gully, south-east of the Port Sarim pub, can sail you to Cyclosis in the Arc region of the Wushanko Isles.)",
                ["questID"] = 444,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [520] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Harbinger (miniquest)",
                ["detail"] = "Talk to Navigator Jemi on the docks of Cyclosis.",
                ["questID"] = 445,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [521] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Harbinger (miniquest)",
                ["detail"] = "Talk to Navigator Jemi on the docks of Cyclosis.",
                ["questID"] = 445,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [522] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tuai Leit's Own (miniquest)",
                ["detail"] = "Talk to Seasinger Jemi on Tuai Leit.",
                ["questID"] = 446,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [523] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tuai Leit's Own (miniquest)",
                ["detail"] = "Talk to Seasinger Jemi on Tuai Leit.",
                ["questID"] = 446,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [524] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ghosts from the Past (miniquest)",
                ["detail"] = "Talk to Quartermaster Gully on the docks near the Sarim's Revenge.",
                ["questID"] = 447,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [525] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Ghosts from the Past (miniquest)",
                ["detail"] = "Talk to Quartermaster Gully on the docks near the Sarim's Revenge.",
                ["questID"] = 447,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [526] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Damage Control (miniquest)",
                ["detail"] = "Talk to Bosun Higgs on the docks near the Sarim's Revenge.",
                ["questID"] = 448,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [527] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Damage Control (miniquest)",
                ["detail"] = "Talk to Bosun Higgs on the docks near the Sarim's Revenge.",
                ["questID"] = 448,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [528] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Final Destination (miniquest)",
                ["detail"] = "Talk to Lookout Ekahi on the docks near the Sarim's Revenge.",
                ["questID"] = 449,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [529] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Final Destination (miniquest)",
                ["detail"] = "Talk to Lookout Ekahi on the docks near the Sarim's Revenge.",
                ["questID"] = 449,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [530] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sheep Shearer (miniquest)",
                ["detail"] = "Talk to Fred the farmer in his farm, north of the Lumbridge market.",
                ["questID"] = 173,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [531] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Sheep Shearer (miniquest)",
                ["detail"] = "Talk to Fred the farmer in his farm, north of the Lumbridge market.",
                ["questID"] = 173,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [532] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Witch's Potion (miniquest)",
                ["detail"] = "Talk to Hetty in Rimmington.",
                ["questID"] = 178,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [533] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Witch's Potion (miniquest)",
                ["detail"] = "Talk to Hetty in Rimmington.",
                ["questID"] = 178,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [534] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Purple Cat (miniquest)",
                ["detail"] = "Talk to Wendy, west of the Draynor Village lodestone.",
                ["questID"] = 412,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [535] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Purple Cat (miniquest)",
                ["detail"] = "Talk to Wendy, west of the Draynor Village lodestone.",
                ["questID"] = 412,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [536] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Benedict's World Tour (miniquest)",
                ["detail"] = "Talk to Benedict Encumberyak in the building just north-west of the Varrock lodestone, near Charlie the Tramp.",
                ["questID"] = 436,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [537] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Benedict's World Tour (miniquest)",
                ["detail"] = "Talk to Benedict Encumberyak in the building just north-west of the Varrock lodestone, near Charlie the Tramp.",
                ["questID"] = 436,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [538] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enter the Abyss (miniquest)",
                ["detail"] = "Talk to the Mage of Zamorak at the end of the River Lum in the Wilderness (roams levels 4-7).",
                ["questID"] = 404,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [539] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Enter the Abyss (miniquest)",
                ["detail"] = "Talk to the Mage of Zamorak at the end of the River Lum in the Wilderness (roams levels 4-7).",
                ["questID"] = 404,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [540] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Bar Crawl (miniquest)",
                ["detail"] = "Talk to one of the barbarian guards at the outer entrance of the Barbarian Outpost Agility Course.",
                ["questID"] = 403,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [541] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Bar Crawl (miniquest)",
                ["detail"] = "Talk to one of the barbarian guards at the outer entrance of the Barbarian Outpost Agility Course.",
                ["questID"] = 403,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [542] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Curse of the Empty Lord (miniquest)",
                ["detail"] = "Talk to the mysterious ghost (Valdez) near Glarial's tombstone (north-west of the Fishing Guild), while wearing a ring of visibility and a way to speak with ghosts.",
                ["questID"] = 405,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [543] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Curse of the Empty Lord (miniquest)",
                ["detail"] = "Talk to the mysterious ghost (Valdez) near Glarial's tombstone (north-west of the Fishing Guild), while wearing a ring of visibility and a way to speak with ghosts.",
                ["questID"] = 405,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [544] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The General's Shadow (miniquest)",
                ["detail"] = "Talk to the ghost of General Khazard wandering near the road south-east of Rellekka, while wearing a ring of visibility, ghostly robes and a way to speak with ghosts.",
                ["questID"] = 407,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [545] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The General's Shadow (miniquest)",
                ["detail"] = "Talk to the ghost of General Khazard wandering near the road south-east of Rellekka, while wearing a ring of visibility, ghostly robes and a way to speak with ghosts.",
                ["questID"] = 407,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [546] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Hunt for Surok (miniquest)",
                ["detail"] = "Talk to Surok by the statue of Saradomin, east of Varrock.",
                ["questID"] = 408,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [547] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Hunt for Surok (miniquest)",
                ["detail"] = "Talk to Surok by the statue of Saradomin, east of Varrock.",
                ["questID"] = 408,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [548] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Memory of the Myreque (miniquest)",
                ["detail"] = "Talk to Veliaf Hurtz, north-west of the Canifis lodestone.",
                ["questID"] = 437,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [549] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "In Memory of the Myreque (miniquest)",
                ["detail"] = "Talk to Veliaf Hurtz, north-west of the Canifis lodestone.",
                ["questID"] = 437,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [550] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lost Toys (miniquest)",
                ["detail"] = "Talk to Lex in the Hair of the Dog tavern in Canifis.",
                ["questID"] = 438,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [551] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "The Lost Toys (miniquest)",
                ["detail"] = "Talk to Lex in the Hair of the Dog tavern in Canifis.",
                ["questID"] = 438,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [552] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Koschei's Troubles (miniquest)",
                ["detail"] = "Talk to Thorvald the Warrior in Rellekka's helmet shop.",
                ["questID"] = 433,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [553] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Koschei's Troubles (miniquest)",
                ["detail"] = "Talk to Thorvald the Warrior in Rellekka's helmet shop.",
                ["questID"] = 433,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [554] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Mahjarrat Memories (miniquest)",
                ["detail"] = "Talk to Kharshai (via the trapdoor in Thorvald the Warrior's helmet shop) in Rellekka.",
                ["questID"] = 434,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [555] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Mahjarrat Memories (miniquest)",
                ["detail"] = "Talk to Kharshai (via the trapdoor in Thorvald the Warrior's helmet shop) in Rellekka.",
                ["questID"] = 434,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [556] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rebuilding Edgeville (miniquest)",
                ["detail"] = "Talk to Vannaka in Edgeville.",
                ["questID"] = 450,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [557] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Rebuilding Edgeville (miniquest)",
                ["detail"] = "Talk to Vannaka in Edgeville.",
                ["questID"] = 450,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [558] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Foot in the Grave (miniquest)",
                ["detail"] = "Talk to Zavistic Rarve at the Wizards' Guild, with Clarence's hand in your backpack.",
                ["questID"] = 409,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [559] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "One Foot in the Grave (miniquest)",
                ["detail"] = "Talk to Zavistic Rarve at the Wizards' Guild, with Clarence's hand in your backpack.",
                ["questID"] = 409,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [560] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tales of Nomad (miniquest)",
                ["detail"] = "Sift through Nomad's memory on the western side of the lower level of the Underworld. (Return to the Underworld by passing through Death's door in Death's Office.)",
                ["questID"] = 439,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [561] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tales of Nomad (miniquest)",
                ["detail"] = "Sift through Nomad's memory on the western side of the lower level of the Underworld. (Return to the Underworld by passing through Death's door in Death's Office.)",
                ["questID"] = 439,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [562] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tales of the God Wars (miniquest)",
                ["detail"] = "Talk to the Curator at the Heart of Gielinor, north of the Agility Pyramid in the Kharidian desert.",
                ["questID"] = 435,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [563] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tales of the God Wars (miniquest)",
                ["detail"] = "Talk to the Curator at the Heart of Gielinor, north of the Agility Pyramid in the Kharidian desert.",
                ["questID"] = 435,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [564] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Foreshadowing",
                ["detail"] = "Talk to the Relomia in the Blue Moon Inn in Varrock.",
                ["questID"] = 471,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [565] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Foreshadowing",
                ["detail"] = "Talk to the Relomia in the Blue Moon Inn in Varrock.",
                ["questID"] = 471,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [566] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tortle Combat (miniquest)",
                ["detail"] = "Talk to Postie Pete-za by the entrance to Varrock Sewers.",
                ["questID"] = 464,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [567] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Tortle Combat (miniquest)",
                ["detail"] = "Talk to Postie Pete-za by the entrance to Varrock Sewers.",
                ["questID"] = 464,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [568] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Flashback",
                ["detail"] = "Talk to Closure in his office to find out more. It can be accessed through Death's Realm.",
                ["questID"] = 472,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [569] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Flashback",
                ["detail"] = "Talk to Closure in his office to find out more. It can be accessed through Death's Realm.",
                ["questID"] = 472,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [570] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fortunes",
                ["detail"] = "Talk to Closure in his office, which can be accessed through Death's realm, to find out more.",
                ["questID"] = 475,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [571] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Fortunes",
                ["detail"] = "Talk to Closure in his office, which can be accessed through Death's realm, to find out more.",
                ["questID"] = 475,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [572] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Finale",
                ["detail"] = "Talk to Closure in his office to find out more. It can be accessed via Death's realm.",
                ["questID"] = 476,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [573] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Finale",
                ["detail"] = "Talk to Closure in his office to find out more. It can be accessed via Death's realm.",
                ["questID"] = 476,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [574] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War I (miniquest)",
                ["detail"] = "Speak to Adrasteia in the Falador Castle throne room.",
                ["questID"] = 484,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [575] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War I (miniquest)",
                ["detail"] = "Speak to Adrasteia in the Falador Castle throne room.",
                ["questID"] = 484,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [576] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War II (miniquest)",
                ["detail"] = "Speak to Anne Dimitri in the Wilderness.",
                ["questID"] = 485,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [577] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War II (miniquest)",
                ["detail"] = "Speak to Anne Dimitri in the Wilderness.",
                ["questID"] = 485,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [578] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War III (miniquest)",
                ["detail"] = "Speak to Anne Dimitri in the Wilderness.",
                ["questID"] = 486,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [579] = {
        ["title"] = "Quest start",
        ["rows"] = {
            {
                ["name"] = "Civil War III (miniquest)",
                ["detail"] = "Speak to Anne Dimitri in the Wilderness.",
                ["questID"] = 486,
            },
        },
        ["kind"] = "quest",
        ["note"] = "Quest availability and progress are not checked.",
    },
    [583] = {
        ["title"] = "Rod Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw minnow",
                ["item"] = 30076,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Rod Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [585] = {
        ["title"] = "Ashdale Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
        },
        ["kind"] = "resource",
    },
    [762] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [763] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [764] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [765] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [766] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [767] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [768] = {
        ["title"] = "Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 15,
                ["skill"] = "Farming",
                ["detail"] = "Oak logs",
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 30,
                ["skill"] = "Farming",
                ["detail"] = "Willow logs",
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 45,
                ["skill"] = "Farming",
                ["detail"] = "Maple logs",
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 60,
                ["skill"] = "Farming",
                ["detail"] = "Yew logs",
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 75,
                ["skill"] = "Farming",
                ["detail"] = "Magic logs",
            },
        },
        ["kind"] = "resource",
    },
    [769] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [770] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [771] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [772] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [773] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [774] = {
        ["title"] = "Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [775] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [776] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [777] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [778] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [779] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [780] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [781] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [782] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [783] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [784] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [785] = {
        ["title"] = "Allotment Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [786] = {
        ["title"] = "Hops Patch",
        ["rows"] = {
            {
                ["name"] = "Barley",
                ["item"] = 6006,
                ["level"] = 3,
                ["skill"] = "Farming",
                ["detail"] = "Barley",
            },
            {
                ["name"] = "Hammerstone hop",
                ["item"] = 5994,
                ["level"] = 4,
                ["skill"] = "Farming",
                ["detail"] = "Hammerstone hops",
            },
            {
                ["name"] = "Asgarnian hop",
                ["item"] = 5996,
                ["level"] = 8,
                ["skill"] = "Farming",
                ["detail"] = "Asgarnian hops",
            },
            {
                ["name"] = "Wendlewick hop",
                ["item"] = 60664,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Wendlewick hops",
            },
            {
                ["name"] = "Jute plant",
                ["item"] = 5931,
                ["level"] = 13,
                ["skill"] = "Farming",
                ["detail"] = "Jute fibre",
            },
            {
                ["name"] = "Yanillian hop",
                ["item"] = 5998,
                ["level"] = 16,
                ["skill"] = "Farming",
                ["detail"] = "Yanillian hops",
            },
            {
                ["name"] = "Krandorian hop",
                ["item"] = 6000,
                ["level"] = 21,
                ["skill"] = "Farming",
                ["detail"] = "Krandorian hops",
            },
            {
                ["name"] = "Wildblood hop",
                ["item"] = 6002,
                ["level"] = 28,
                ["skill"] = "Farming",
                ["detail"] = "Wildblood hops",
            },
            {
                ["name"] = "Reeds",
                ["item"] = 28319,
                ["level"] = 78,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Grapevines",
                ["item"] = 1987,
                ["level"] = 49,
                ["skill"] = "Farming",
                ["detail"] = "Grapes",
            },
            {
                ["name"] = "Godly grapevines",
                ["item"] = 28310,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Grapes of Saradomin",
            },
        },
        ["kind"] = "resource",
    },
    [787] = {
        ["title"] = "Hops Patch",
        ["rows"] = {
            {
                ["name"] = "Barley",
                ["item"] = 6006,
                ["level"] = 3,
                ["skill"] = "Farming",
                ["detail"] = "Barley",
            },
            {
                ["name"] = "Hammerstone hop",
                ["item"] = 5994,
                ["level"] = 4,
                ["skill"] = "Farming",
                ["detail"] = "Hammerstone hops",
            },
            {
                ["name"] = "Asgarnian hop",
                ["item"] = 5996,
                ["level"] = 8,
                ["skill"] = "Farming",
                ["detail"] = "Asgarnian hops",
            },
            {
                ["name"] = "Wendlewick hop",
                ["item"] = 60664,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Wendlewick hops",
            },
            {
                ["name"] = "Jute plant",
                ["item"] = 5931,
                ["level"] = 13,
                ["skill"] = "Farming",
                ["detail"] = "Jute fibre",
            },
            {
                ["name"] = "Yanillian hop",
                ["item"] = 5998,
                ["level"] = 16,
                ["skill"] = "Farming",
                ["detail"] = "Yanillian hops",
            },
            {
                ["name"] = "Krandorian hop",
                ["item"] = 6000,
                ["level"] = 21,
                ["skill"] = "Farming",
                ["detail"] = "Krandorian hops",
            },
            {
                ["name"] = "Wildblood hop",
                ["item"] = 6002,
                ["level"] = 28,
                ["skill"] = "Farming",
                ["detail"] = "Wildblood hops",
            },
            {
                ["name"] = "Reeds",
                ["item"] = 28319,
                ["level"] = 78,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Grapevines",
                ["item"] = 1987,
                ["level"] = 49,
                ["skill"] = "Farming",
                ["detail"] = "Grapes",
            },
            {
                ["name"] = "Godly grapevines",
                ["item"] = 28310,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Grapes of Saradomin",
            },
        },
        ["kind"] = "resource",
    },
    [788] = {
        ["title"] = "Hops Patch",
        ["rows"] = {
            {
                ["name"] = "Barley",
                ["item"] = 6006,
                ["level"] = 3,
                ["skill"] = "Farming",
                ["detail"] = "Barley",
            },
            {
                ["name"] = "Hammerstone hop",
                ["item"] = 5994,
                ["level"] = 4,
                ["skill"] = "Farming",
                ["detail"] = "Hammerstone hops",
            },
            {
                ["name"] = "Asgarnian hop",
                ["item"] = 5996,
                ["level"] = 8,
                ["skill"] = "Farming",
                ["detail"] = "Asgarnian hops",
            },
            {
                ["name"] = "Wendlewick hop",
                ["item"] = 60664,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Wendlewick hops",
            },
            {
                ["name"] = "Jute plant",
                ["item"] = 5931,
                ["level"] = 13,
                ["skill"] = "Farming",
                ["detail"] = "Jute fibre",
            },
            {
                ["name"] = "Yanillian hop",
                ["item"] = 5998,
                ["level"] = 16,
                ["skill"] = "Farming",
                ["detail"] = "Yanillian hops",
            },
            {
                ["name"] = "Krandorian hop",
                ["item"] = 6000,
                ["level"] = 21,
                ["skill"] = "Farming",
                ["detail"] = "Krandorian hops",
            },
            {
                ["name"] = "Wildblood hop",
                ["item"] = 6002,
                ["level"] = 28,
                ["skill"] = "Farming",
                ["detail"] = "Wildblood hops",
            },
            {
                ["name"] = "Reeds",
                ["item"] = 28319,
                ["level"] = 78,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Grapevines",
                ["item"] = 1987,
                ["level"] = 49,
                ["skill"] = "Farming",
                ["detail"] = "Grapes",
            },
            {
                ["name"] = "Godly grapevines",
                ["item"] = 28310,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Grapes of Saradomin",
            },
        },
        ["kind"] = "resource",
    },
    [789] = {
        ["title"] = "Hops Patch",
        ["rows"] = {
            {
                ["name"] = "Barley",
                ["item"] = 6006,
                ["level"] = 3,
                ["skill"] = "Farming",
                ["detail"] = "Barley",
            },
            {
                ["name"] = "Hammerstone hop",
                ["item"] = 5994,
                ["level"] = 4,
                ["skill"] = "Farming",
                ["detail"] = "Hammerstone hops",
            },
            {
                ["name"] = "Asgarnian hop",
                ["item"] = 5996,
                ["level"] = 8,
                ["skill"] = "Farming",
                ["detail"] = "Asgarnian hops",
            },
            {
                ["name"] = "Wendlewick hop",
                ["item"] = 60664,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Wendlewick hops",
            },
            {
                ["name"] = "Jute plant",
                ["item"] = 5931,
                ["level"] = 13,
                ["skill"] = "Farming",
                ["detail"] = "Jute fibre",
            },
            {
                ["name"] = "Yanillian hop",
                ["item"] = 5998,
                ["level"] = 16,
                ["skill"] = "Farming",
                ["detail"] = "Yanillian hops",
            },
            {
                ["name"] = "Krandorian hop",
                ["item"] = 6000,
                ["level"] = 21,
                ["skill"] = "Farming",
                ["detail"] = "Krandorian hops",
            },
            {
                ["name"] = "Wildblood hop",
                ["item"] = 6002,
                ["level"] = 28,
                ["skill"] = "Farming",
                ["detail"] = "Wildblood hops",
            },
            {
                ["name"] = "Reeds",
                ["item"] = 28319,
                ["level"] = 78,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Grapevines",
                ["item"] = 1987,
                ["level"] = 49,
                ["skill"] = "Farming",
                ["detail"] = "Grapes",
            },
            {
                ["name"] = "Godly grapevines",
                ["item"] = 28310,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Grapes of Saradomin",
            },
        },
        ["kind"] = "resource",
    },
    [790] = {
        ["title"] = "Bush Patch",
        ["rows"] = {
            {
                ["name"] = "Redberry bush",
                ["item"] = 1951,
                ["level"] = 10,
                ["skill"] = "Farming",
                ["detail"] = "Redberries",
            },
            {
                ["name"] = "Cadavaberry bush",
                ["item"] = 753,
                ["level"] = 22,
                ["skill"] = "Farming",
                ["detail"] = "Cadava berries",
            },
            {
                ["name"] = "Dwellberry bush",
                ["item"] = 2126,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Dwellberries",
            },
            {
                ["name"] = "Jangerberry bush",
                ["item"] = 247,
                ["level"] = 48,
                ["skill"] = "Farming",
                ["detail"] = "Jangerberries",
            },
            {
                ["name"] = "White berry bush",
                ["item"] = 239,
                ["level"] = 59,
                ["skill"] = "Farming",
                ["detail"] = "White berries",
            },
            {
                ["name"] = "Poison ivy bush",
                ["item"] = 6018,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Poison ivy berries",
            },
            {
                ["name"] = "Barberry bush",
                ["item"] = 28314,
                ["level"] = 77,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Avocado bush",
                ["item"] = 48578,
                ["level"] = 99,
                ["skill"] = "Farming",
                ["detail"] = "Avocado",
            },
            {
                ["name"] = "Mango bush",
                ["item"] = 48580,
                ["level"] = 105,
                ["skill"] = "Farming",
                ["detail"] = "Mango",
            },
            {
                ["name"] = "Lychee bush",
                ["item"] = 48582,
                ["level"] = 111,
                ["skill"] = "Farming",
                ["detail"] = "Lychee",
            },
        },
        ["kind"] = "resource",
    },
    [791] = {
        ["title"] = "Bush Patch",
        ["rows"] = {
            {
                ["name"] = "Redberry bush",
                ["item"] = 1951,
                ["level"] = 10,
                ["skill"] = "Farming",
                ["detail"] = "Redberries",
            },
            {
                ["name"] = "Cadavaberry bush",
                ["item"] = 753,
                ["level"] = 22,
                ["skill"] = "Farming",
                ["detail"] = "Cadava berries",
            },
            {
                ["name"] = "Dwellberry bush",
                ["item"] = 2126,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Dwellberries",
            },
            {
                ["name"] = "Jangerberry bush",
                ["item"] = 247,
                ["level"] = 48,
                ["skill"] = "Farming",
                ["detail"] = "Jangerberries",
            },
            {
                ["name"] = "White berry bush",
                ["item"] = 239,
                ["level"] = 59,
                ["skill"] = "Farming",
                ["detail"] = "White berries",
            },
            {
                ["name"] = "Poison ivy bush",
                ["item"] = 6018,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Poison ivy berries",
            },
            {
                ["name"] = "Barberry bush",
                ["item"] = 28314,
                ["level"] = 77,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Avocado bush",
                ["item"] = 48578,
                ["level"] = 99,
                ["skill"] = "Farming",
                ["detail"] = "Avocado",
            },
            {
                ["name"] = "Mango bush",
                ["item"] = 48580,
                ["level"] = 105,
                ["skill"] = "Farming",
                ["detail"] = "Mango",
            },
            {
                ["name"] = "Lychee bush",
                ["item"] = 48582,
                ["level"] = 111,
                ["skill"] = "Farming",
                ["detail"] = "Lychee",
            },
        },
        ["kind"] = "resource",
    },
    [792] = {
        ["title"] = "Bush Patch",
        ["rows"] = {
            {
                ["name"] = "Redberry bush",
                ["item"] = 1951,
                ["level"] = 10,
                ["skill"] = "Farming",
                ["detail"] = "Redberries",
            },
            {
                ["name"] = "Cadavaberry bush",
                ["item"] = 753,
                ["level"] = 22,
                ["skill"] = "Farming",
                ["detail"] = "Cadava berries",
            },
            {
                ["name"] = "Dwellberry bush",
                ["item"] = 2126,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Dwellberries",
            },
            {
                ["name"] = "Jangerberry bush",
                ["item"] = 247,
                ["level"] = 48,
                ["skill"] = "Farming",
                ["detail"] = "Jangerberries",
            },
            {
                ["name"] = "White berry bush",
                ["item"] = 239,
                ["level"] = 59,
                ["skill"] = "Farming",
                ["detail"] = "White berries",
            },
            {
                ["name"] = "Poison ivy bush",
                ["item"] = 6018,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Poison ivy berries",
            },
            {
                ["name"] = "Barberry bush",
                ["item"] = 28314,
                ["level"] = 77,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Avocado bush",
                ["item"] = 48578,
                ["level"] = 99,
                ["skill"] = "Farming",
                ["detail"] = "Avocado",
            },
            {
                ["name"] = "Mango bush",
                ["item"] = 48580,
                ["level"] = 105,
                ["skill"] = "Farming",
                ["detail"] = "Mango",
            },
            {
                ["name"] = "Lychee bush",
                ["item"] = 48582,
                ["level"] = 111,
                ["skill"] = "Farming",
                ["detail"] = "Lychee",
            },
        },
        ["kind"] = "resource",
    },
    [793] = {
        ["title"] = "Bush Patch",
        ["rows"] = {
            {
                ["name"] = "Redberry bush",
                ["item"] = 1951,
                ["level"] = 10,
                ["skill"] = "Farming",
                ["detail"] = "Redberries",
            },
            {
                ["name"] = "Cadavaberry bush",
                ["item"] = 753,
                ["level"] = 22,
                ["skill"] = "Farming",
                ["detail"] = "Cadava berries",
            },
            {
                ["name"] = "Dwellberry bush",
                ["item"] = 2126,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Dwellberries",
            },
            {
                ["name"] = "Jangerberry bush",
                ["item"] = 247,
                ["level"] = 48,
                ["skill"] = "Farming",
                ["detail"] = "Jangerberries",
            },
            {
                ["name"] = "White berry bush",
                ["item"] = 239,
                ["level"] = 59,
                ["skill"] = "Farming",
                ["detail"] = "White berries",
            },
            {
                ["name"] = "Poison ivy bush",
                ["item"] = 6018,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Poison ivy berries",
            },
            {
                ["name"] = "Barberry bush",
                ["item"] = 28314,
                ["level"] = 77,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Avocado bush",
                ["item"] = 48578,
                ["level"] = 99,
                ["skill"] = "Farming",
                ["detail"] = "Avocado",
            },
            {
                ["name"] = "Mango bush",
                ["item"] = 48580,
                ["level"] = 105,
                ["skill"] = "Farming",
                ["detail"] = "Mango",
            },
            {
                ["name"] = "Lychee bush",
                ["item"] = 48582,
                ["level"] = 111,
                ["skill"] = "Farming",
                ["detail"] = "Lychee",
            },
        },
        ["kind"] = "resource",
    },
    [794] = {
        ["title"] = "Spirit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Spirit tree",
                ["item"] = 6063,
                ["level"] = 83,
                ["skill"] = "Farming",
                ["detail"] = "Spirit tree",
            },
        },
        ["kind"] = "resource",
    },
    [795] = {
        ["title"] = "Spirit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Spirit tree",
                ["item"] = 6063,
                ["level"] = 83,
                ["skill"] = "Farming",
                ["detail"] = "Spirit tree",
            },
        },
        ["kind"] = "resource",
    },
    [796] = {
        ["title"] = "Spirit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Spirit tree",
                ["item"] = 6063,
                ["level"] = 83,
                ["skill"] = "Farming",
                ["detail"] = "Spirit tree",
            },
        },
        ["kind"] = "resource",
    },
    [797] = {
        ["title"] = "Spirit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Spirit tree",
                ["item"] = 6063,
                ["level"] = 83,
                ["skill"] = "Farming",
                ["detail"] = "Spirit tree",
            },
        },
        ["kind"] = "resource",
    },
    [798] = {
        ["title"] = "Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Marigold",
                ["item"] = 6010,
                ["level"] = 2,
                ["skill"] = "Farming",
                ["detail"] = "Marigolds",
            },
            {
                ["name"] = "Rosemary",
                ["item"] = 6014,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Rosemary",
            },
            {
                ["name"] = "Scarecrows",
                ["item"] = 6059,
                ["level"] = 23,
                ["skill"] = "Farming",
                ["detail"] = "Scarecrow",
            },
            {
                ["name"] = "Nasturtium",
                ["item"] = 6012,
                ["level"] = 24,
                ["skill"] = "Farming",
                ["detail"] = "Nasturtiums",
            },
            {
                ["name"] = "Woad",
                ["item"] = 5738,
                ["level"] = 25,
                ["skill"] = "Farming",
                ["detail"] = "Woad leaf",
            },
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
            {
                ["name"] = "White lily",
                ["item"] = 14583,
                ["level"] = 52,
                ["skill"] = "Farming",
                ["detail"] = "White lily",
            },
            {
                ["name"] = "Butterfly flower",
                ["item"] = 9970,
                ["level"] = 88,
                ["skill"] = "Farming",
                ["detail"] = "Butterfly",
            },
            {
                ["name"] = "Starbloom flower",
                ["item"] = 58971,
                ["level"] = 100,
                ["skill"] = "Farming",
                ["detail"] = "Starbloom flower",
            },
        },
        ["kind"] = "resource",
    },
    [799] = {
        ["title"] = "Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Marigold",
                ["item"] = 6010,
                ["level"] = 2,
                ["skill"] = "Farming",
                ["detail"] = "Marigolds",
            },
            {
                ["name"] = "Rosemary",
                ["item"] = 6014,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Rosemary",
            },
            {
                ["name"] = "Scarecrows",
                ["item"] = 6059,
                ["level"] = 23,
                ["skill"] = "Farming",
                ["detail"] = "Scarecrow",
            },
            {
                ["name"] = "Nasturtium",
                ["item"] = 6012,
                ["level"] = 24,
                ["skill"] = "Farming",
                ["detail"] = "Nasturtiums",
            },
            {
                ["name"] = "Woad",
                ["item"] = 5738,
                ["level"] = 25,
                ["skill"] = "Farming",
                ["detail"] = "Woad leaf",
            },
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
            {
                ["name"] = "White lily",
                ["item"] = 14583,
                ["level"] = 52,
                ["skill"] = "Farming",
                ["detail"] = "White lily",
            },
            {
                ["name"] = "Butterfly flower",
                ["item"] = 9970,
                ["level"] = 88,
                ["skill"] = "Farming",
                ["detail"] = "Butterfly",
            },
            {
                ["name"] = "Starbloom flower",
                ["item"] = 58971,
                ["level"] = 100,
                ["skill"] = "Farming",
                ["detail"] = "Starbloom flower",
            },
        },
        ["kind"] = "resource",
    },
    [800] = {
        ["title"] = "Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Marigold",
                ["item"] = 6010,
                ["level"] = 2,
                ["skill"] = "Farming",
                ["detail"] = "Marigolds",
            },
            {
                ["name"] = "Rosemary",
                ["item"] = 6014,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Rosemary",
            },
            {
                ["name"] = "Scarecrows",
                ["item"] = 6059,
                ["level"] = 23,
                ["skill"] = "Farming",
                ["detail"] = "Scarecrow",
            },
            {
                ["name"] = "Nasturtium",
                ["item"] = 6012,
                ["level"] = 24,
                ["skill"] = "Farming",
                ["detail"] = "Nasturtiums",
            },
            {
                ["name"] = "Woad",
                ["item"] = 5738,
                ["level"] = 25,
                ["skill"] = "Farming",
                ["detail"] = "Woad leaf",
            },
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
            {
                ["name"] = "White lily",
                ["item"] = 14583,
                ["level"] = 52,
                ["skill"] = "Farming",
                ["detail"] = "White lily",
            },
            {
                ["name"] = "Butterfly flower",
                ["item"] = 9970,
                ["level"] = 88,
                ["skill"] = "Farming",
                ["detail"] = "Butterfly",
            },
            {
                ["name"] = "Starbloom flower",
                ["item"] = 58971,
                ["level"] = 100,
                ["skill"] = "Farming",
                ["detail"] = "Starbloom flower",
            },
        },
        ["kind"] = "resource",
    },
    [801] = {
        ["title"] = "Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Marigold",
                ["item"] = 6010,
                ["level"] = 2,
                ["skill"] = "Farming",
                ["detail"] = "Marigolds",
            },
            {
                ["name"] = "Rosemary",
                ["item"] = 6014,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Rosemary",
            },
            {
                ["name"] = "Scarecrows",
                ["item"] = 6059,
                ["level"] = 23,
                ["skill"] = "Farming",
                ["detail"] = "Scarecrow",
            },
            {
                ["name"] = "Nasturtium",
                ["item"] = 6012,
                ["level"] = 24,
                ["skill"] = "Farming",
                ["detail"] = "Nasturtiums",
            },
            {
                ["name"] = "Woad",
                ["item"] = 5738,
                ["level"] = 25,
                ["skill"] = "Farming",
                ["detail"] = "Woad leaf",
            },
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
            {
                ["name"] = "White lily",
                ["item"] = 14583,
                ["level"] = 52,
                ["skill"] = "Farming",
                ["detail"] = "White lily",
            },
            {
                ["name"] = "Butterfly flower",
                ["item"] = 9970,
                ["level"] = 88,
                ["skill"] = "Farming",
                ["detail"] = "Butterfly",
            },
            {
                ["name"] = "Starbloom flower",
                ["item"] = 58971,
                ["level"] = 100,
                ["skill"] = "Farming",
                ["detail"] = "Starbloom flower",
            },
        },
        ["kind"] = "resource",
    },
    [802] = {
        ["title"] = "Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Marigold",
                ["item"] = 6010,
                ["level"] = 2,
                ["skill"] = "Farming",
                ["detail"] = "Marigolds",
            },
            {
                ["name"] = "Rosemary",
                ["item"] = 6014,
                ["level"] = 11,
                ["skill"] = "Farming",
                ["detail"] = "Rosemary",
            },
            {
                ["name"] = "Scarecrows",
                ["item"] = 6059,
                ["level"] = 23,
                ["skill"] = "Farming",
                ["detail"] = "Scarecrow",
            },
            {
                ["name"] = "Nasturtium",
                ["item"] = 6012,
                ["level"] = 24,
                ["skill"] = "Farming",
                ["detail"] = "Nasturtiums",
            },
            {
                ["name"] = "Woad",
                ["item"] = 5738,
                ["level"] = 25,
                ["skill"] = "Farming",
                ["detail"] = "Woad leaf",
            },
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
            {
                ["name"] = "White lily",
                ["item"] = 14583,
                ["level"] = 52,
                ["skill"] = "Farming",
                ["detail"] = "White lily",
            },
            {
                ["name"] = "Butterfly flower",
                ["item"] = 9970,
                ["level"] = 88,
                ["skill"] = "Farming",
                ["detail"] = "Butterfly",
            },
            {
                ["name"] = "Starbloom flower",
                ["item"] = 58971,
                ["level"] = 100,
                ["skill"] = "Farming",
                ["detail"] = "Starbloom flower",
            },
        },
        ["kind"] = "resource",
    },
    [803] = {
        ["title"] = "Calquat Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Calquat tree",
                ["item"] = 5980,
                ["level"] = 72,
                ["skill"] = "Farming",
                ["detail"] = "Calquat fruit",
            },
        },
        ["kind"] = "resource",
    },
    [804] = {
        ["title"] = "Cactus Patch",
        ["rows"] = {
            {
                ["name"] = "Cactus",
                ["item"] = 6016,
                ["level"] = 55,
                ["skill"] = "Farming",
                ["detail"] = "Cactus spine",
            },
            {
                ["name"] = "Prickly pear",
                ["item"] = 28316,
                ["level"] = 76,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Potato cactus",
                ["item"] = 3138,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Potato cactus",
            },
            {
                ["name"] = "Dragonfruit",
                ["item"] = 48771,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Dragonfruit",
            },
            {
                ["name"] = "Golden dragonfruit",
                ["item"] = 48773,
                ["level"] = 116,
                ["skill"] = "Farming",
                ["detail"] = "Golden dragonfruit",
            },
        },
        ["kind"] = "resource",
    },
    [805] = {
        ["title"] = "Cactus Patch",
        ["rows"] = {
            {
                ["name"] = "Cactus",
                ["item"] = 6016,
                ["level"] = 55,
                ["skill"] = "Farming",
                ["detail"] = "Cactus spine",
            },
            {
                ["name"] = "Prickly pear",
                ["item"] = 28316,
                ["level"] = 76,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Potato cactus",
                ["item"] = 3138,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Potato cactus",
            },
            {
                ["name"] = "Dragonfruit",
                ["item"] = 48771,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Dragonfruit",
            },
            {
                ["name"] = "Golden dragonfruit",
                ["item"] = 48773,
                ["level"] = 116,
                ["skill"] = "Farming",
                ["detail"] = "Golden dragonfruit",
            },
        },
        ["kind"] = "resource",
    },
    [806] = {
        ["title"] = "Cactus Patch",
        ["rows"] = {
            {
                ["name"] = "Cactus",
                ["item"] = 6016,
                ["level"] = 55,
                ["skill"] = "Farming",
                ["detail"] = "Cactus spine",
            },
            {
                ["name"] = "Prickly pear",
                ["item"] = 28316,
                ["level"] = 76,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Potato cactus",
                ["item"] = 3138,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Potato cactus",
            },
            {
                ["name"] = "Dragonfruit",
                ["item"] = 48771,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Dragonfruit",
            },
            {
                ["name"] = "Golden dragonfruit",
                ["item"] = 48773,
                ["level"] = 116,
                ["skill"] = "Farming",
                ["detail"] = "Golden dragonfruit",
            },
        },
        ["kind"] = "resource",
    },
    [807] = {
        ["title"] = "Cactus Patch",
        ["rows"] = {
            {
                ["name"] = "Cactus",
                ["item"] = 6016,
                ["level"] = 55,
                ["skill"] = "Farming",
                ["detail"] = "Cactus spine",
            },
            {
                ["name"] = "Prickly pear",
                ["item"] = 28316,
                ["level"] = 76,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Potato cactus",
                ["item"] = 3138,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Potato cactus",
            },
            {
                ["name"] = "Dragonfruit",
                ["item"] = 48771,
                ["level"] = 95,
                ["skill"] = "Farming",
                ["detail"] = "Dragonfruit",
            },
            {
                ["name"] = "Golden dragonfruit",
                ["item"] = 48773,
                ["level"] = 116,
                ["skill"] = "Farming",
                ["detail"] = "Golden dragonfruit",
            },
        },
        ["kind"] = "resource",
    },
    [808] = {
        ["title"] = "Mushroom Patch",
        ["rows"] = {
            {
                ["name"] = "Bittercap mushroom",
                ["item"] = 6004,
                ["level"] = 53,
                ["skill"] = "Farming",
                ["detail"] = "Bittercap mushroom",
            },
            {
                ["name"] = "Bogwart",
                ["item"] = 64296,
                ["level"] = 69,
                ["skill"] = "Farming",
                ["detail"] = "Bogwart",
            },
            {
                ["name"] = "Morchella mushroom",
                ["item"] = 21622,
                ["level"] = 74,
                ["skill"] = "Farming",
                ["detail"] = "Morchella mushroom",
            },
            {
                ["name"] = "Stinkshroom",
                ["item"] = 48712,
                ["level"] = 103,
                ["skill"] = "Farming",
                ["detail"] = "Stinkfly",
            },
            {
                ["name"] = "Tombshroom",
                ["item"] = 48711,
                ["level"] = 109,
                ["skill"] = "Farming",
                ["detail"] = "Tombshroom",
            },
        },
        ["kind"] = "resource",
    },
    [809] = {
        ["title"] = "Nightshade Patch",
        ["rows"] = {
            {
                ["name"] = "Cave Nightshade",
                ["item"] = 2398,
                ["level"] = 63,
                ["skill"] = "Farming",
                ["detail"] = "Cave nightshade",
            },
            {
                ["name"] = "Mourning Lily",
                ["item"] = 64298,
                ["level"] = 96,
                ["skill"] = "Farming",
                ["detail"] = "Mourning lily",
            },
        },
        ["kind"] = "resource",
    },
    [810] = {
        ["title"] = "Nightshade Patch",
        ["rows"] = {
            {
                ["name"] = "Cave Nightshade",
                ["item"] = 2398,
                ["level"] = 63,
                ["skill"] = "Farming",
                ["detail"] = "Cave nightshade",
            },
            {
                ["name"] = "Mourning Lily",
                ["item"] = 64298,
                ["level"] = 96,
                ["skill"] = "Farming",
                ["detail"] = "Mourning lily",
            },
        },
        ["kind"] = "resource",
    },
    [811] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [812] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [813] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [814] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [815] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [816] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [817] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Bloodweed",
                ["item"] = 37953,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Clean bloodweed",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [818] = {
        ["title"] = "Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Guam",
                ["item"] = 249,
                ["level"] = 9,
                ["skill"] = "Farming",
                ["detail"] = "Clean guam",
            },
            {
                ["name"] = "Marrentill",
                ["item"] = 251,
                ["level"] = 14,
                ["skill"] = "Farming",
                ["detail"] = "Clean marrentill",
            },
            {
                ["name"] = "Tarromin",
                ["item"] = 253,
                ["level"] = 19,
                ["skill"] = "Farming",
                ["detail"] = "Clean tarromin",
            },
            {
                ["name"] = "Harralander",
                ["item"] = 255,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Clean harralander",
            },
            {
                ["name"] = "Goutweed",
                ["item"] = 3261,
                ["level"] = 29,
                ["skill"] = "Farming",
                ["detail"] = "Goutweed",
            },
            {
                ["name"] = "Ranarr",
                ["item"] = 257,
                ["level"] = 32,
                ["skill"] = "Farming",
                ["detail"] = "Clean ranarr",
            },
            {
                ["name"] = "Spirit weed",
                ["item"] = 12172,
                ["level"] = 36,
                ["skill"] = "Farming",
                ["detail"] = "Clean spirit weed",
            },
            {
                ["name"] = "Toadflax",
                ["item"] = 2998,
                ["level"] = 38,
                ["skill"] = "Farming",
                ["detail"] = "Clean toadflax",
            },
            {
                ["name"] = "Irit",
                ["item"] = 259,
                ["level"] = 44,
                ["skill"] = "Farming",
                ["detail"] = "Clean irit",
            },
            {
                ["name"] = "Wergali",
                ["item"] = 14854,
                ["level"] = 46,
                ["skill"] = "Farming",
                ["detail"] = "Clean wergali",
            },
            {
                ["name"] = "Avantoe",
                ["item"] = 261,
                ["level"] = 50,
                ["skill"] = "Farming",
                ["detail"] = "Clean avantoe",
            },
            {
                ["name"] = "Kwuarm",
                ["item"] = 263,
                ["level"] = 56,
                ["skill"] = "Farming",
                ["detail"] = "Clean kwuarm",
            },
            {
                ["name"] = "Snapdragon",
                ["item"] = 3000,
                ["level"] = 62,
                ["skill"] = "Farming",
                ["detail"] = "Clean snapdragon",
            },
            {
                ["name"] = "Cadantine",
                ["item"] = 265,
                ["level"] = 67,
                ["skill"] = "Farming",
                ["detail"] = "Clean cadantine",
            },
            {
                ["name"] = "Lantadyme",
                ["item"] = 2481,
                ["level"] = 73,
                ["skill"] = "Farming",
                ["detail"] = "Clean lantadyme",
            },
            {
                ["name"] = "Arbuck",
                ["item"] = 48211,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Clean arbuck",
            },
            {
                ["name"] = "Dwarf weed",
                ["item"] = 267,
                ["level"] = 79,
                ["skill"] = "Farming",
                ["detail"] = "Clean dwarf weed",
            },
            {
                ["name"] = "Torstol",
                ["item"] = 269,
                ["level"] = 85,
                ["skill"] = "Farming",
                ["detail"] = "Clean torstol",
            },
            {
                ["name"] = "Fellstalk",
                ["item"] = 21624,
                ["level"] = 91,
                ["skill"] = "Farming",
                ["detail"] = "Clean fellstalk",
            },
        },
        ["kind"] = "resource",
    },
    [819] = {
        ["title"] = "Money Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Money tree",
                ["item"] = 48775,
                ["level"] = 119,
                ["skill"] = "Farming",
                ["detail"] = "Money tree cash bag",
            },
        },
        ["kind"] = "resource",
    },
    [820] = {
        ["title"] = "Berry Patch",
        ["rows"] = {
            {
                ["name"] = "Wushanko berries",
                ["item"] = 38627,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Rumberry",
            },
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
            {
                ["name"] = "Uncharted Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 94,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [821] = {
        ["title"] = "Berry Patch",
        ["rows"] = {
            {
                ["name"] = "Wushanko berries",
                ["item"] = 38627,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Rumberry",
            },
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
            {
                ["name"] = "Uncharted Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 94,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [822] = {
        ["title"] = "Mushroom Patch",
        ["rows"] = {
            {
                ["name"] = "Bittercap mushroom",
                ["item"] = 6004,
                ["level"] = 53,
                ["skill"] = "Farming",
                ["detail"] = "Bittercap mushroom",
            },
            {
                ["name"] = "Bogwart",
                ["item"] = 64296,
                ["level"] = 69,
                ["skill"] = "Farming",
                ["detail"] = "Bogwart",
            },
            {
                ["name"] = "Morchella mushroom",
                ["item"] = 21622,
                ["level"] = 74,
                ["skill"] = "Farming",
                ["detail"] = "Morchella mushroom",
            },
            {
                ["name"] = "Stinkshroom",
                ["item"] = 48712,
                ["level"] = 103,
                ["skill"] = "Farming",
                ["detail"] = "Stinkfly",
            },
            {
                ["name"] = "Tombshroom",
                ["item"] = 48711,
                ["level"] = 109,
                ["skill"] = "Farming",
                ["detail"] = "Tombshroom",
            },
        },
        ["kind"] = "resource",
    },
    [823] = {
        ["title"] = "Mushroom Patch",
        ["rows"] = {
            {
                ["name"] = "Bittercap mushroom",
                ["item"] = 6004,
                ["level"] = 53,
                ["skill"] = "Farming",
                ["detail"] = "Bittercap mushroom",
            },
            {
                ["name"] = "Bogwart",
                ["item"] = 64296,
                ["level"] = 69,
                ["skill"] = "Farming",
                ["detail"] = "Bogwart",
            },
            {
                ["name"] = "Morchella mushroom",
                ["item"] = 21622,
                ["level"] = 74,
                ["skill"] = "Farming",
                ["detail"] = "Morchella mushroom",
            },
            {
                ["name"] = "Stinkshroom",
                ["item"] = 48712,
                ["level"] = 103,
                ["skill"] = "Farming",
                ["detail"] = "Stinkfly",
            },
            {
                ["name"] = "Tombshroom",
                ["item"] = 48711,
                ["level"] = 109,
                ["skill"] = "Farming",
                ["detail"] = "Tombshroom",
            },
        },
        ["kind"] = "resource",
    },
    [824] = {
        ["title"] = "Evil Turnip Patch",
        ["rows"] = {
            {
                ["name"] = "Evil turnip",
                ["item"] = 12134,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Evil turnip",
            },
        },
        ["kind"] = "resource",
    },
    [825] = {
        ["title"] = "Vegetable Patch",
        ["rows"] = {
            {
                ["name"] = "Potato",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Raw potato",
            },
            {
                ["name"] = "Onion",
                ["item"] = 1957,
                ["level"] = 5,
                ["skill"] = "Farming",
                ["detail"] = "Onion",
            },
            {
                ["name"] = "Cabbage",
                ["item"] = 1965,
                ["level"] = 7,
                ["skill"] = "Farming",
                ["detail"] = "Cabbage",
            },
            {
                ["name"] = "Tomato",
                ["item"] = 1982,
                ["level"] = 12,
                ["skill"] = "Farming",
                ["detail"] = "Tomato",
            },
            {
                ["name"] = "Sweetcorn",
                ["item"] = 5986,
                ["level"] = 20,
                ["skill"] = "Farming",
                ["detail"] = "Sweetcorn",
            },
            {
                ["name"] = "Strawberry",
                ["item"] = 5504,
                ["level"] = 31,
                ["skill"] = "Farming",
                ["detail"] = "Strawberry",
            },
            {
                ["name"] = "Watermelon",
                ["item"] = 5982,
                ["level"] = 47,
                ["skill"] = "Farming",
                ["detail"] = "Watermelon",
            },
            {
                ["name"] = "Snape grass",
                ["item"] = 231,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Snape grass",
            },
            {
                ["name"] = "Sunchoke",
                ["item"] = 28318,
                ["level"] = 87,
                ["skill"] = "Farming",
            },
            {
                ["name"] = "Fly trap",
                ["item"] = 28317,
                ["level"] = 93,
                ["skill"] = "Farming",
            },
        },
        ["kind"] = "resource",
    },
    [826] = {
        ["title"] = "Herblore Habitat:<br>Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Erzille",
                ["item"] = 19989,
                ["level"] = 58,
                ["skill"] = "Farming",
                ["detail"] = "Clean erzille",
            },
            {
                ["name"] = "Argway",
                ["item"] = 19990,
                ["level"] = 65,
                ["skill"] = "Farming",
                ["detail"] = "Clean argway",
            },
            {
                ["name"] = "Ugune",
                ["item"] = 19991,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Clean ugune",
            },
            {
                ["name"] = "Shengo",
                ["item"] = 19992,
                ["level"] = 76,
                ["skill"] = "Farming",
                ["detail"] = "Clean shengo",
            },
            {
                ["name"] = "Samaden",
                ["item"] = 19993,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Clean samaden",
            },
        },
        ["kind"] = "resource",
    },
    [827] = {
        ["title"] = "Herblore Habitat:<br>Herb Patch",
        ["rows"] = {
            {
                ["name"] = "Erzille",
                ["item"] = 19989,
                ["level"] = 58,
                ["skill"] = "Farming",
                ["detail"] = "Clean erzille",
            },
            {
                ["name"] = "Argway",
                ["item"] = 19990,
                ["level"] = 65,
                ["skill"] = "Farming",
                ["detail"] = "Clean argway",
            },
            {
                ["name"] = "Ugune",
                ["item"] = 19991,
                ["level"] = 70,
                ["skill"] = "Farming",
                ["detail"] = "Clean ugune",
            },
            {
                ["name"] = "Shengo",
                ["item"] = 19992,
                ["level"] = 76,
                ["skill"] = "Farming",
                ["detail"] = "Clean shengo",
            },
            {
                ["name"] = "Samaden",
                ["item"] = 19993,
                ["level"] = 80,
                ["skill"] = "Farming",
                ["detail"] = "Clean samaden",
            },
        },
        ["kind"] = "resource",
    },
    [828] = {
        ["title"] = "Herblore Habitat:<br>Fruit Tree Patch",
        ["rows"] = {
            {
                ["name"] = "Apple tree",
                ["item"] = 1955,
                ["level"] = 27,
                ["skill"] = "Farming",
                ["detail"] = "Cooking apple",
            },
            {
                ["name"] = "Banana tree",
                ["item"] = 1963,
                ["level"] = 33,
                ["skill"] = "Farming",
                ["detail"] = "Banana",
            },
            {
                ["name"] = "Orange tree",
                ["item"] = 2108,
                ["level"] = 39,
                ["skill"] = "Farming",
                ["detail"] = "Orange",
            },
            {
                ["name"] = "Curry tree",
                ["item"] = 5970,
                ["level"] = 42,
                ["skill"] = "Farming",
                ["detail"] = "Curry leaf",
            },
            {
                ["name"] = "Pineapple plant",
                ["item"] = 2114,
                ["level"] = 51,
                ["skill"] = "Farming",
                ["detail"] = "Pineapple",
            },
            {
                ["name"] = "Papaya tree",
                ["item"] = 5972,
                ["level"] = 57,
                ["skill"] = "Farming",
                ["detail"] = "Papaya fruit",
            },
            {
                ["name"] = "Palm tree",
                ["item"] = 5974,
                ["level"] = 68,
                ["skill"] = "Farming",
                ["detail"] = "Coconut",
            },
            {
                ["name"] = "Ciku tree",
                ["item"] = 48584,
                ["level"] = 101,
                ["skill"] = "Farming",
                ["detail"] = "Ciku",
            },
            {
                ["name"] = "Guarana tree",
                ["item"] = 48588,
                ["level"] = 107,
                ["skill"] = "Farming",
                ["detail"] = "Guarana",
            },
            {
                ["name"] = "Carambola tree",
                ["item"] = 48586,
                ["level"] = 113,
                ["skill"] = "Farming",
                ["detail"] = "Carambola",
            },
        },
        ["kind"] = "resource",
    },
    [829] = {
        ["title"] = "Herblore Habitat:<br>Bush Patch",
        ["rows"] = {
            {
                ["name"] = "Lergberry bush",
                ["item"] = 19969,
                ["level"] = 61,
                ["skill"] = "Farming",
                ["detail"] = "Lergberries",
            },
            {
                ["name"] = "Kalferberry bush",
                ["item"] = 19970,
                ["level"] = 77,
                ["skill"] = "Farming",
                ["detail"] = "Kalferberries",
            },
        },
        ["kind"] = "resource",
    },
    [830] = {
        ["title"] = "Herblore Habitat:<br>Flower Patch",
        ["rows"] = {
            {
                ["name"] = "Vine blossoms",
                ["item"] = 19962,
                ["level"] = 54,
                ["skill"] = "Farming",
                ["detail"] = "Red vine blossom",
            },
        },
        ["kind"] = "resource",
    },
    [831] = {
        ["title"] = "Jade Vine Patch",
        ["rows"] = {
            {
                ["name"] = "Jade Vine",
                ["item"] = 11779,
                ["level"] = 53,
                ["skill"] = "Farming",
                ["detail"] = "Jade vine",
            },
        },
        ["kind"] = "resource",
    },
    [832] = {
        ["title"] = "Limpwurt Patch",
        ["rows"] = {
            {
                ["name"] = "Limpwurt",
                ["item"] = 225,
                ["level"] = 26,
                ["skill"] = "Farming",
                ["detail"] = "Limpwurt root",
            },
        },
        ["kind"] = "resource",
    },
    [833] = {
        ["title"] = "Forage: Berry",
        ["rows"] = {
            {
                ["name"] = "Wushanko berries",
                ["item"] = 38627,
                ["level"] = 86,
                ["skill"] = "Farming",
                ["detail"] = "Rumberry",
            },
        },
        ["kind"] = "resource",
    },
    [890] = {
        ["title"] = "Burthorpe Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 21345,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut lapis lazuli",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1625,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut opal",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1627,
                ["level"] = 13,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut jade",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1629,
                ["level"] = 16,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut red topaz",
            },
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
        },
        ["kind"] = "resource",
    },
    [891] = {
        ["title"] = "Asgarnian Ice Dungeon Mine",
        ["rows"] = {
            {
                ["name"] = "Blurite rock",
                ["item"] = 668,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Blurite ore",
            },
        },
        ["kind"] = "resource",
    },
    [892] = {
        ["title"] = "Crafting Guild Mine",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
        },
        ["kind"] = "resource",
    },
    [893] = {
        ["title"] = "Dwarven Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Luminite rock",
                ["item"] = 44820,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Luminite",
            },
            {
                ["name"] = "Concentrated coal",
                ["item"] = 453,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Concentrated gold",
                ["item"] = 444,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
        },
        ["kind"] = "resource",
    },
    [894] = {
        ["title"] = "Dwarven Mine Resource Dungeon",
        ["rows"] = {
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
            {
                ["name"] = "Phasmatite rock",
                ["item"] = 44828,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Phasmatite",
            },
        },
        ["kind"] = "resource",
    },
    [895] = {
        ["title"] = "Mining Guild",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
            {
                ["name"] = "Orichalcite rock",
                ["item"] = 44822,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Orichalcite ore",
            },
        },
        ["kind"] = "resource",
    },
    [896] = {
        ["title"] = "Al Kharid Resource Dungeon",
        ["rows"] = {
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1621,
                ["level"] = 25,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1619,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1617,
                ["level"] = 43,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut diamond",
            },
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
            {
                ["name"] = "Necrite rock",
                ["item"] = 44826,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Necrite ore",
            },
        },
        ["kind"] = "resource",
    },
    [897] = {
        ["title"] = "Karamja Volcano Mine",
        ["rows"] = {
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [898] = {
        ["title"] = "Heroes' Guild Mine",
        ["rows"] = {
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
        },
        ["kind"] = "resource",
    },
    [899] = {
        ["title"] = "Empty Throne Room Mine",
        ["rows"] = {
            {
                ["name"] = "Dark animica rock",
                ["item"] = 44832,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Dark animica",
            },
        },
        ["kind"] = "resource",
    },
    [900] = {
        ["title"] = "Desert Mining Camp Cave",
        ["rows"] = {
            {
                ["name"] = "Punishment rock",
                ["item"] = 1855,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Punishment rock",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
            {
                ["name"] = "Necrite rock",
                ["item"] = 44826,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Necrite ore",
            },
        },
        ["kind"] = "resource",
    },
    [901] = {
        ["title"] = "Grand Tree Mine",
        ["rows"] = {
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [902] = {
        ["title"] = "Ancient Cavern Mine",
        ["rows"] = {
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
        },
        ["kind"] = "resource",
    },
    [903] = {
        ["title"] = "Witchaven Dungeon",
        ["rows"] = {
            {
                ["name"] = "'Perfect' gold rock",
                ["item"] = 446,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "'Perfect' gold ore",
            },
            {
                ["name"] = "Rubium seam",
                ["item"] = 12630,
                ["level"] = 46,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Rubium",
            },
        },
        ["kind"] = "resource",
    },
    [904] = {
        ["title"] = "Miscellania Dungeon Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [905] = {
        ["title"] = "Jatizso Dungeon Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [906] = {
        ["title"] = "Lunar Isle Mine",
        ["rows"] = {
            {
                ["name"] = "Rune essence rock",
                ["item"] = 1436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Rune essence",
            },
            {
                ["name"] = "Rune essence rock",
                ["item"] = 7936,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Pure essence",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1621,
                ["level"] = 23,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1619,
                ["level"] = 29,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1617,
                ["level"] = 38,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut diamond",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1631,
                ["level"] = 55,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut dragonstone",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
        },
        ["kind"] = "resource",
    },
    [907] = {
        ["title"] = "Shilo Village Underground Mine",
        ["rows"] = {
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1621,
                ["level"] = 25,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1619,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1617,
                ["level"] = 43,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut diamond",
            },
        },
        ["kind"] = "resource",
    },
    [908] = {
        ["title"] = "Tarshak's Sanctum (Abomination Mine)",
        ["rows"] = {
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [909] = {
        ["title"] = "Kal'gerion Resource Dungeon",
        ["rows"] = {
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1621,
                ["level"] = 23,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1619,
                ["level"] = 29,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1617,
                ["level"] = 38,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut diamond",
            },
            {
                ["name"] = "Rare gem rock",
                ["item"] = 1631,
                ["level"] = 55,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut dragonstone",
            },
        },
        ["kind"] = "resource",
    },
    [910] = {
        ["title"] = "Meiyerditch Daeyalt Mine",
        ["rows"] = {
            {
                ["name"] = "Daeyalt rock",
                ["item"] = 9632,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Daeyalt ore",
            },
        },
        ["kind"] = "resource",
    },
    [911] = {
        ["title"] = "Haunted Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Luminite rock",
                ["item"] = 44820,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Luminite",
            },
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
            {
                ["name"] = "Phasmatite rock",
                ["item"] = 44828,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Phasmatite",
            },
        },
        ["kind"] = "resource",
    },
    [912] = {
        ["title"] = "Everlight Porcelain Clay Mine",
        ["rows"] = {
            {
                ["name"] = "Porcelain clay rock",
                ["item"] = 59205,
                ["level"] = 102,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Porcelain clay",
            },
        },
        ["kind"] = "resource",
    },
    [913] = {
        ["title"] = "Glacor Cavern Mine",
        ["rows"] = {
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [914] = {
        ["title"] = "Dorgesh-Kaan Mine",
        ["rows"] = {
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
        },
        ["kind"] = "resource",
    },
    [915] = {
        ["title"] = "Keldagrim Mines",
        ["rows"] = {
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
            {
                ["name"] = "Luminite rock",
                ["item"] = 44820,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Luminite",
            },
        },
        ["kind"] = "resource",
    },
    [916] = {
        ["title"] = "TzHaar City Mines",
        ["rows"] = {
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
            {
                ["name"] = "Stone slab seam",
                ["item"] = 13245,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Stone slab",
            },
        },
        ["kind"] = "resource",
    },
    [917] = {
        ["title"] = "Highweald Ruins Mine",
        ["rows"] = {
            {
                ["name"] = "Necrite rock",
                ["item"] = 44826,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Necrite ore",
            },
            {
                ["name"] = "Phasmatite rock",
                ["item"] = 44828,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Phasmatite",
            },
            {
                ["name"] = "Platinum rock",
                ["item"] = 59207,
                ["level"] = 104,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Platinum ore",
            },
            {
                ["name"] = "Havensilver rock",
                ["item"] = 60295,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Havensilver ore",
            },
        },
        ["kind"] = "resource",
    },
    [920] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Positive energy",
                ["item"] = 38612,
                ["level"] = 90,
                ["skill"] = "Divination",
                ["detail"] = "Positive energy",
            },
        },
        ["kind"] = "resource",
    },
    [923] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [924] = {
        ["title"] = "Cyclosis Beach",
        ["rows"] = {
            {
                ["name"] = "Salty crabletine",
                ["item"] = 37772,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sea salt",
            },
        },
        ["kind"] = "resource",
    },
    [927] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [931] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Bamboo",
                ["item"] = 37770,
                ["level"] = 90,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bamboo",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [932] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [933] = {
        ["title"] = "Positive and Negative Energy",
        ["rows"] = {
            {
                ["name"] = "Positive energy",
                ["item"] = 38612,
                ["level"] = 90,
                ["skill"] = "Divination",
                ["detail"] = "Positive energy",
            },
            {
                ["name"] = "Negative energy",
                ["item"] = 38617,
                ["level"] = 90,
                ["skill"] = "Divination",
                ["detail"] = "Negative energy",
            },
        },
        ["kind"] = "resource",
    },
    [935] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [936] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [937] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [939] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [940] = {
        ["title"] = "Arc Bait Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw seerfish",
                ["item"] = 37764,
                ["level"] = 91,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Bait Fishing",
            },
            {
                ["name"] = "Raw tarpon",
                ["item"] = 37762,
                ["level"] = 90,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Bait Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [941] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [942] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [943] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [944] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [945] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [946] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [947] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Bamboo",
                ["item"] = 37770,
                ["level"] = 90,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bamboo",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [948] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [949] = {
        ["title"] = "Waiko excavation site (Quest requirement: Impressing the Locals)",
        ["rows"] = {
            {
                ["name"] = "Waiko excavation site (Quest requirement: Impressing the Locals)",
                ["item"] = 49458,
                ["level"] = 60,
                ["skill"] = "Archaeology",
                ["detail"] = "Soapstone",
            },
        },
        ["kind"] = "resource",
    },
    [950] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [951] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Negative energy",
                ["item"] = 38617,
                ["level"] = 90,
                ["skill"] = "Divination",
                ["detail"] = "Negative energy",
            },
        },
        ["kind"] = "resource",
    },
    [952] = {
        ["title"] = "Forage: Mushroom",
        ["rows"] = {
            {
                ["name"] = "Wushanko mushrooms",
                ["item"] = 38723,
                ["level"] = 90,
                ["skill"] = "Farming",
                ["detail"] = "Wushroom",
            },
        },
        ["kind"] = "resource",
    },
    [957] = {
        ["title"] = "Arc Net Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw sillago",
                ["item"] = 37766,
                ["level"] = 92,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Net Fishing",
            },
            {
                ["name"] = "Raw seerfish",
                ["item"] = 37764,
                ["level"] = 91,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Net Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [958] = {
        ["title"] = "Arc Net Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw sillago",
                ["item"] = 37766,
                ["level"] = 92,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Net Fishing",
            },
            {
                ["name"] = "Raw seerfish",
                ["item"] = 37764,
                ["level"] = 91,
                ["skill"] = "Fishing",
                ["detail"] = "Arc Net Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [960] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [961] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [962] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Bamboo",
                ["item"] = 37770,
                ["level"] = 90,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bamboo",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [963] = {
        ["title"] = "Inferior bamboo",
        ["rows"] = {
            {
                ["name"] = "Bamboo",
                ["item"] = 37770,
                ["level"] = 90,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bamboo",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [966] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [967] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [968] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [969] = {
        ["title"] = "Jackalope",
        ["rows"] = {
            {
                ["name"] = "Jackalope",
                ["item"] = 43734,
                ["level"] = 32,
                ["skill"] = "Hunter",
                ["detail"] = "Jackalope",
            },
        },
        ["kind"] = "resource",
    },
    [973] = {
        ["title"] = "Giant Crayfish Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw giant crayfish",
                ["item"] = 60684,
                ["level"] = 82,
                ["skill"] = "Fishing",
                ["detail"] = "Giant Crayfish Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [974] = {
        ["title"] = "Wendlewick Deserted Mine",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1623,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut sapphire",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1621,
                ["level"] = 27,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1619,
                ["level"] = 34,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
        },
        ["kind"] = "resource",
    },
    [977] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [978] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [979] = {
        ["title"] = "Eternal magic trees",
        ["rows"] = {
            {
                ["name"] = "Eternal magic tree",
                ["item"] = 58250,
                ["level"] = 100,
                ["skill"] = "Woodcutting",
                ["detail"] = "Eternal magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [982] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [983] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [985] = {
        ["title"] = "Magic trees",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [990] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Creeping ivy",
                ["item"] = 60811,
                ["level"] = 35,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [991] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [992] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [994] = {
        ["title"] = "Wendlewick Fish Farm",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 45,
                ["skill"] = "Fishing",
                ["detail"] = "Wendlewick Fish Farm",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 55,
                ["skill"] = "Fishing",
                ["detail"] = "Wendlewick Fish Farm",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Wendlewick Fish Farm",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 79,
                ["skill"] = "Fishing",
                ["detail"] = "Wendlewick Fish Farm",
            },
            {
                ["name"] = "Raw giant crayfish",
                ["item"] = 60684,
                ["level"] = 84,
                ["skill"] = "Fishing",
                ["detail"] = "Wendlewick Fish Farm",
            },
        },
        ["kind"] = "resource",
    },
    [998] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [999] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1000] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1006] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1012] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1013] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1014] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1015] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1018] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1019] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1020] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1022] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1028] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1029] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1031] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1032] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Creeping ivy",
                ["item"] = 60811,
                ["level"] = 35,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1033] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Creeping ivy",
                ["item"] = 60811,
                ["level"] = 35,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1036] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1039] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1040] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1041] = {
        ["title"] = "Wendlewick Limestone Mine",
        ["rows"] = {
            {
                ["name"] = "Limestone rock",
                ["item"] = 3211,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Limestone",
            },
        },
        ["kind"] = "resource",
    },
    [1042] = {
        ["title"] = "Spirit moths",
        ["rows"] = {
            {
                ["name"] = "Gold spirit moth",
                ["item"] = 60464,
                ["level"] = 18,
                ["skill"] = "Hunter",
                ["detail"] = "Gold spirit moth",
            },
            {
                ["name"] = "Green spirit moth",
                ["item"] = 60465,
                ["level"] = 32,
                ["skill"] = "Hunter",
                ["detail"] = "Green spirit moth",
            },
            {
                ["name"] = "Crimson spirit moth",
                ["item"] = 60466,
                ["level"] = 49,
                ["skill"] = "Hunter",
                ["detail"] = "Crimson spirit moth",
            },
            {
                ["name"] = "Blue spirit moth",
                ["item"] = 60467,
                ["level"] = 64,
                ["skill"] = "Hunter",
                ["detail"] = "Blue spirit moth",
            },
        },
        ["kind"] = "resource",
    },
    [1044] = {
        ["title"] = "Giant Crayfish Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw giant crayfish",
                ["item"] = 60684,
                ["level"] = 82,
                ["skill"] = "Fishing",
                ["detail"] = "Giant Crayfish Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1045] = {
        ["title"] = "Spirit moths",
        ["rows"] = {
            {
                ["name"] = "Gold spirit moth",
                ["item"] = 60464,
                ["level"] = 18,
                ["skill"] = "Hunter",
                ["detail"] = "Gold spirit moth",
            },
            {
                ["name"] = "Green spirit moth",
                ["item"] = 60465,
                ["level"] = 32,
                ["skill"] = "Hunter",
                ["detail"] = "Green spirit moth",
            },
            {
                ["name"] = "Crimson spirit moth",
                ["item"] = 60466,
                ["level"] = 49,
                ["skill"] = "Hunter",
                ["detail"] = "Crimson spirit moth",
            },
            {
                ["name"] = "Blue spirit moth",
                ["item"] = 60467,
                ["level"] = 64,
                ["skill"] = "Hunter",
                ["detail"] = "Blue spirit moth",
            },
        },
        ["kind"] = "resource",
    },
    [1046] = {
        ["title"] = "Spirit moths",
        ["rows"] = {
            {
                ["name"] = "Gold spirit moth",
                ["item"] = 60464,
                ["level"] = 18,
                ["skill"] = "Hunter",
                ["detail"] = "Gold spirit moth",
            },
            {
                ["name"] = "Green spirit moth",
                ["item"] = 60465,
                ["level"] = 32,
                ["skill"] = "Hunter",
                ["detail"] = "Green spirit moth",
            },
            {
                ["name"] = "Crimson spirit moth",
                ["item"] = 60466,
                ["level"] = 49,
                ["skill"] = "Hunter",
                ["detail"] = "Crimson spirit moth",
            },
            {
                ["name"] = "Blue spirit moth",
                ["item"] = 60467,
                ["level"] = 64,
                ["skill"] = "Hunter",
                ["detail"] = "Blue spirit moth",
            },
        },
        ["kind"] = "resource",
    },
    [1047] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Creeping ivy",
                ["item"] = 60811,
                ["level"] = 35,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1048] = {
        ["title"] = "Wendlewick giant camp excavation site",
        ["rows"] = {
            {
                ["name"] = "Wendlewick giant camp excavation site",
                ["item"] = 61701,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Ivory",
            },
            {
                ["name"] = "Wendlewick giant camp excavation site",
                ["item"] = 49448,
                ["level"] = 81,
                ["skill"] = "Archaeology",
                ["detail"] = "Fossilised bone",
            },
        },
        ["kind"] = "resource",
    },
    [1049] = {
        ["title"] = "Box trap: Black chinchompa",
        ["rows"] = {
            {
                ["name"] = "Box trap: Black chinchompa",
                ["item"] = 60463,
                ["level"] = 73,
                ["skill"] = "Hunter",
                ["detail"] = "Black chinchompa",
            },
        },
        ["kind"] = "resource",
    },
    [1051] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1052] = {
        ["title"] = "Amberfell forest",
        ["rows"] = {
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 10,
                ["skill"] = "Woodcutting",
                ["detail"] = "Oak logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1053] = {
        ["title"] = "Moonrise - Temple periphery excavation site",
        ["rows"] = {
            {
                ["name"] = "Lunar wheel debris",
                ["item"] = 61707,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Banded limestone",
            },
            {
                ["name"] = "Lunar wheel debris",
                ["item"] = 61701,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Ivory",
            },
            {
                ["name"] = "Lunar wheel debris",
                ["item"] = 61705,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Triskelion",
            },
            {
                ["name"] = "Arbour rubble",
                ["item"] = 49464,
                ["level"] = 59,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
            {
                ["name"] = "Arbour rubble",
                ["item"] = 61705,
                ["level"] = 59,
                ["skill"] = "Archaeology",
                ["detail"] = "Triskelion",
            },
            {
                ["name"] = "Arbour rubble",
                ["item"] = 61701,
                ["level"] = 59,
                ["skill"] = "Archaeology",
                ["detail"] = "Ivory",
            },
            {
                ["name"] = "Weaver's hut debris",
                ["item"] = 61703,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "Cashmere",
            },
            {
                ["name"] = "Weaver's hut debris",
                ["item"] = 61699,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "Burnt umber",
            },
            {
                ["name"] = "Weaver's hut debris",
                ["item"] = 49464,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
            {
                ["name"] = "Weaver's hut debris",
                ["item"] = 61701,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "Ivory",
            },
            {
                ["name"] = "Weaver's hut debris",
                ["item"] = 49452,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "Leather scraps",
            },
            {
                ["name"] = "Shrine debris",
                ["item"] = 61707,
                ["level"] = 75,
                ["skill"] = "Archaeology",
                ["detail"] = "Banded limestone",
            },
            {
                ["name"] = "Shrine debris",
                ["item"] = 61703,
                ["level"] = 75,
                ["skill"] = "Archaeology",
                ["detail"] = "Cashmere",
            },
            {
                ["name"] = "Shrine debris",
                ["item"] = 61705,
                ["level"] = 75,
                ["skill"] = "Archaeology",
                ["detail"] = "Triskelion",
            },
            {
                ["name"] = "Shrine debris",
                ["item"] = 61699,
                ["level"] = 75,
                ["skill"] = "Archaeology",
                ["detail"] = "Burnt umber",
            },
            {
                ["name"] = "Shrine debris",
                ["item"] = 49464,
                ["level"] = 75,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
            {
                ["name"] = "Moonrise - Temple periphery excavation site",
                ["item"] = 61707,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Banded limestone",
            },
        },
        ["kind"] = "resource",
    },
    [1054] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1055] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Creeping ivy",
                ["item"] = 60811,
                ["level"] = 35,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1056] = {
        ["title"] = "Spirit moths",
        ["rows"] = {
            {
                ["name"] = "Gold spirit moth",
                ["item"] = 60464,
                ["level"] = 18,
                ["skill"] = "Hunter",
                ["detail"] = "Gold spirit moth",
            },
            {
                ["name"] = "Green spirit moth",
                ["item"] = 60465,
                ["level"] = 32,
                ["skill"] = "Hunter",
                ["detail"] = "Green spirit moth",
            },
            {
                ["name"] = "Crimson spirit moth",
                ["item"] = 60466,
                ["level"] = 49,
                ["skill"] = "Hunter",
                ["detail"] = "Crimson spirit moth",
            },
            {
                ["name"] = "Blue spirit moth",
                ["item"] = 60467,
                ["level"] = 64,
                ["skill"] = "Hunter",
                ["detail"] = "Blue spirit moth",
            },
        },
        ["kind"] = "resource",
    },
    [1057] = {
        ["title"] = "Highweald Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
        },
        ["kind"] = "resource",
    },
    [1058] = {
        ["title"] = "Wendlewick watchtower excavation site",
        ["rows"] = {
            {
                ["name"] = "Wendlewick watchtower excavation site",
                ["item"] = 61703,
                ["level"] = 66,
                ["skill"] = "Archaeology",
                ["detail"] = "Cashmere",
            },
            {
                ["name"] = "Wendlewick watchtower excavation site",
                ["item"] = 61705,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "Triskelion",
            },
        },
        ["kind"] = "resource",
    },
    [1059] = {
        ["title"] = "Moonrise",
        ["rows"] = {
            {
                ["name"] = "Moonrise",
                ["item"] = 61709,
                ["level"] = 52,
                ["skill"] = "Archaeology",
                ["detail"] = "An ancient temple towering over the autumnal forest of Amberfell.",
            },
        },
        ["kind"] = "resource",
    },
    [1064] = {
        ["title"] = "Anachronia Swamp Mine",
        ["rows"] = {
            {
                ["name"] = "Dark animica rock",
                ["item"] = 44832,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Dark animica",
            },
        },
        ["kind"] = "resource",
    },
    [1070] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1071] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1073] = {
        ["title"] = "Anachronia west excavation site",
        ["rows"] = {
            {
                ["name"] = "Anachronia west excavation site",
                ["item"] = 50692,
                ["level"] = 78,
                ["skill"] = "Archaeology",
                ["detail"] = "Felt",
            },
            {
                ["name"] = "Anachronia west excavation site",
                ["item"] = 50694,
                ["level"] = 73,
                ["skill"] = "Archaeology",
                ["detail"] = "Orgone",
            },
        },
        ["kind"] = "resource",
    },
    [1075] = {
        ["title"] = "Anachronia South-West Mine",
        ["rows"] = {
            {
                ["name"] = "Light animica rock",
                ["item"] = 44830,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Light animica",
            },
        },
        ["kind"] = "resource",
    },
    [1081] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1082] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1083] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1084] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1085] = {
        ["title"] = "Anachronia Western Ruins Mine",
        ["rows"] = {
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
            {
                ["name"] = "Luminite rock",
                ["item"] = 44820,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Luminite",
            },
        },
        ["kind"] = "resource",
    },
    [1088] = {
        ["title"] = "Overgrown idol",
        ["rows"] = {
            {
                ["name"] = "Overgrown idols",
                ["item"] = 42747,
                ["level"] = 81,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1089] = {
        ["title"] = "Overgrown idol",
        ["rows"] = {
            {
                ["name"] = "Overgrown idols",
                ["item"] = 42747,
                ["level"] = 81,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1094] = {
        ["title"] = "Anachronia Canyon Mine",
        ["rows"] = {
            {
                ["name"] = "Orichalcite rock",
                ["item"] = 44822,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Orichalcite ore",
            },
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
        },
        ["kind"] = "resource",
    },
    [1095] = {
        ["title"] = "Time Altar",
        ["rows"] = {
            {
                ["name"] = "Time runes",
                ["item"] = 58450,
                ["level"] = 100,
                ["skill"] = "Runecrafting",
                ["detail"] = "Time rune",
            },
        },
        ["kind"] = "resource",
    },
    [1096] = {
        ["title"] = "Anachronia north excavation site",
        ["rows"] = {
            {
                ["name"] = "Anachronia north excavation site",
                ["item"] = 49454,
                ["level"] = 20,
                ["skill"] = "Archaeology",
                ["detail"] = "Orthenglass",
            },
        },
        ["kind"] = "resource",
    },
    [1111] = {
        ["title"] = "Mos Le'Treeless islet",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1112] = {
        ["title"] = "Mos Le'Treeless islet",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1114] = {
        ["title"] = "Everlight - Oikoi excavation site",
        ["rows"] = {
            {
                ["name"] = "Oikos studio debris",
                ["item"] = 49490,
                ["level"] = 72,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
            {
                ["name"] = "Oikos studio debris",
                ["item"] = 49494,
                ["level"] = 72,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Oikos studio debris",
                ["item"] = 49486,
                ["level"] = 72,
                ["skill"] = "Archaeology",
                ["detail"] = "Cobalt blue",
            },
            {
                ["name"] = "Oikos studio debris",
                ["item"] = 49488,
                ["level"] = 72,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Oikos fishing hut remnants",
                ["item"] = 49460,
                ["level"] = 84,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
            {
                ["name"] = "Oikos fishing hut remnants",
                ["item"] = 49450,
                ["level"] = 84,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Oikos fishing hut remnants",
                ["item"] = 49488,
                ["level"] = 84,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Oikos fishing hut remnants",
                ["item"] = 49492,
                ["level"] = 84,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Everlight - Oikoi excavation site",
                ["item"] = 49490,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
        },
        ["kind"] = "resource",
    },
    [1115] = {
        ["title"] = "Everlight - Acropolis excavation site",
        ["rows"] = {
            {
                ["name"] = "Acropolis debris",
                ["item"] = 49450,
                ["level"] = 92,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Acropolis debris",
                ["item"] = 49490,
                ["level"] = 92,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
            {
                ["name"] = "Acropolis debris",
                ["item"] = 49494,
                ["level"] = 92,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Acropolis debris",
                ["item"] = 49488,
                ["level"] = 92,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Bibliotheke debris",
                ["item"] = 49450,
                ["level"] = 109,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Bibliotheke debris",
                ["item"] = 49462,
                ["level"] = 109,
                ["skill"] = "Archaeology",
                ["detail"] = "Vellum",
            },
            {
                ["name"] = "Bibliotheke debris",
                ["item"] = 49494,
                ["level"] = 109,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Bibliotheke debris",
                ["item"] = 49492,
                ["level"] = 109,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Everlight - Acropolis excavation site",
                ["item"] = 49494,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Everlight - Acropolis excavation site",
                ["item"] = 49492,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
        },
        ["kind"] = "resource",
    },
    [1116] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1117] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1118] = {
        ["title"] = "Everlight - Dominion Games stadium excavation site",
        ["rows"] = {
            {
                ["name"] = "Stadio debris",
                ["item"] = 49456,
                ["level"] = 61,
                ["skill"] = "Archaeology",
                ["detail"] = "Samite silk",
            },
            {
                ["name"] = "Stadio debris",
                ["item"] = 49460,
                ["level"] = 61,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
            {
                ["name"] = "Stadio debris",
                ["item"] = 49492,
                ["level"] = 61,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Stadio debris",
                ["item"] = 49490,
                ["level"] = 61,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
            {
                ["name"] = "Dominion Games podium",
                ["item"] = 49450,
                ["level"] = 69,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Dominion Games podium",
                ["item"] = 49454,
                ["level"] = 69,
                ["skill"] = "Archaeology",
                ["detail"] = "Orthenglass",
            },
            {
                ["name"] = "Dominion Games podium",
                ["item"] = 49488,
                ["level"] = 69,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Dominion Games podium",
                ["item"] = 49492,
                ["level"] = 69,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Icyene weapon rack",
                ["item"] = 49452,
                ["level"] = 100,
                ["skill"] = "Archaeology",
                ["detail"] = "Leather scraps",
            },
            {
                ["name"] = "Icyene weapon rack",
                ["item"] = 49488,
                ["level"] = 100,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Everlight - Dominion Games stadium excavation site",
                ["item"] = 49494,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Everlight - Dominion Games stadium excavation site",
                ["item"] = 49488,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
        },
        ["kind"] = "resource",
    },
    [1119] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1120] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1125] = {
        ["title"] = "Everlight",
        ["rows"] = {
            {
                ["name"] = "Everlight",
                ["item"] = 49519,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "A long-lost lighthouse off Morytania's south-east coast.",
            },
        },
        ["kind"] = "resource",
    },
    [1127] = {
        ["title"] = "Everlight - Mass grave excavation site",
        ["rows"] = {
            {
                ["name"] = "Prodromoi remains",
                ["item"] = 49460,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
            {
                ["name"] = "Prodromoi remains",
                ["item"] = 49490,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
            {
                ["name"] = "Prodromoi remains",
                ["item"] = 49494,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Monoceros remains",
                ["item"] = 49452,
                ["level"] = 48,
                ["skill"] = "Archaeology",
                ["detail"] = "Leather scraps",
            },
            {
                ["name"] = "Monoceros remains",
                ["item"] = 49486,
                ["level"] = 48,
                ["skill"] = "Archaeology",
                ["detail"] = "Cobalt blue",
            },
            {
                ["name"] = "Monoceros remains",
                ["item"] = 49490,
                ["level"] = 48,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
            {
                ["name"] = "Everlight - Mass grave excavation site",
                ["item"] = 49490,
                ["level"] = 42,
                ["skill"] = "Archaeology",
                ["detail"] = "Keramos",
            },
        },
        ["kind"] = "resource",
    },
    [1128] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1130] = {
        ["title"] = "Everlight - Amphitheatre excavation site",
        ["rows"] = {
            {
                ["name"] = "Amphitheatre debris",
                ["item"] = 49450,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Amphitheatre debris",
                ["item"] = 49464,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
            {
                ["name"] = "Amphitheatre debris",
                ["item"] = 49488,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
            {
                ["name"] = "Amphitheatre debris",
                ["item"] = 49492,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Ceramics studio debris",
                ["item"] = 49450,
                ["level"] = 56,
                ["skill"] = "Archaeology",
                ["detail"] = "Goldrune",
            },
            {
                ["name"] = "Ceramics studio debris",
                ["item"] = 49494,
                ["level"] = 56,
                ["skill"] = "Archaeology",
                ["detail"] = "White marble",
            },
            {
                ["name"] = "Everlight - Amphitheatre excavation site",
                ["item"] = 49486,
                ["level"] = 48,
                ["skill"] = "Archaeology",
                ["detail"] = "Cobalt blue",
            },
        },
        ["kind"] = "resource",
    },
    [1133] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1144] = {
        ["title"] = "Port Phasmatys South Mine",
        ["rows"] = {
            {
                ["name"] = "Phasmatite rock",
                ["item"] = 44828,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Phasmatite",
            },
        },
        ["kind"] = "resource",
    },
    [1145] = {
        ["title"] = "Hollow trees",
        ["rows"] = {
            {
                ["name"] = "Hollow tree",
                ["item"] = 3239,
                ["level"] = 45,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bark",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1153] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1157] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Radiant wisps",
                ["item"] = 29393,
                ["level"] = 85,
                ["skill"] = "Divination",
                ["detail"] = "Radiant memory",
            },
        },
        ["kind"] = "resource",
    },
    [1161] = {
        ["title"] = "Menaphos Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw catfish",
                ["item"] = 40289,
                ["level"] = 60,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
            {
                ["name"] = "Raw beltfish",
                ["item"] = 40291,
                ["level"] = 72,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1177] = {
        ["title"] = "Menaphos Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw catfish",
                ["item"] = 40289,
                ["level"] = 60,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
            {
                ["name"] = "Raw beltfish",
                ["item"] = 40291,
                ["level"] = 72,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1179] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Luminous wisps",
                ["item"] = 29394,
                ["level"] = 90,
                ["skill"] = "Divination",
                ["detail"] = "Luminous memory",
            },
        },
        ["kind"] = "resource",
    },
    [1183] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1184] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1195] = {
        ["title"] = "Menaphos VIP Area",
        ["rows"] = {
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6971,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (1kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6973,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (2kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6975,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (5kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6977,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (10kg)",
            },
        },
        ["kind"] = "resource",
    },
    [1196] = {
        ["title"] = "Menaphos Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw catfish",
                ["item"] = 40289,
                ["level"] = 60,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
            {
                ["name"] = "Raw beltfish",
                ["item"] = 40291,
                ["level"] = 72,
                ["skill"] = "Fishing",
                ["detail"] = "Menaphos Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1197] = {
        ["title"] = "Acadia trees",
        ["rows"] = {
            {
                ["name"] = "Acadia tree",
                ["item"] = 40285,
                ["level"] = 50,
                ["skill"] = "Woodcutting",
                ["detail"] = "Acadia logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1198] = {
        ["title"] = "Acadia trees",
        ["rows"] = {
            {
                ["name"] = "Acadia tree",
                ["item"] = 40285,
                ["level"] = 50,
                ["skill"] = "Woodcutting",
                ["detail"] = "Acadia logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1212] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1213] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1225] = {
        ["title"] = "Menaphos Worker District",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6971,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (1kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6973,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (2kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6975,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (5kg)",
            },
            {
                ["name"] = "Menaphos sandstone",
                ["item"] = 6977,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (10kg)",
            },
        },
        ["kind"] = "resource",
    },
    [1233] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1234] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1249] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1250] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1251] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1258] = {
        ["title"] = "Sophanem Red Sandstone",
        ["rows"] = {
            {
                ["name"] = "Red sandstone",
                ["item"] = 23194,
                ["level"] = 81,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Red sandstone",
            },
        },
        ["kind"] = "resource",
    },
    [1264] = {
        ["title"] = "Agility Pyramid North-West Mine",
        ["rows"] = {
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1268] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1269] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1270] = {
        ["title"] = "Mahogany trees",
        ["rows"] = {
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1271] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1274] = {
        ["title"] = "Desert Quarry",
        ["rows"] = {
            {
                ["name"] = "Sandstone rock",
                ["item"] = 6971,
                ["level"] = 35,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (1kg)",
            },
            {
                ["name"] = "Sandstone rock",
                ["item"] = 6973,
                ["level"] = 35,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (2kg)",
            },
            {
                ["name"] = "Sandstone rock",
                ["item"] = 6975,
                ["level"] = 35,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (5kg)",
            },
            {
                ["name"] = "Sandstone rock",
                ["item"] = 6977,
                ["level"] = 35,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Sandstone (10kg)",
            },
            {
                ["name"] = "Granite rock",
                ["item"] = 6979,
                ["level"] = 45,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Granite (500g)",
            },
            {
                ["name"] = "Granite rock",
                ["item"] = 6981,
                ["level"] = 45,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Granite (2kg)",
            },
            {
                ["name"] = "Granite rock",
                ["item"] = 6983,
                ["level"] = 45,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Granite (5kg)",
            },
        },
        ["kind"] = "resource",
    },
    [1285] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1291] = {
        ["title"] = "Mahogany trees",
        ["rows"] = {
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1301] = {
        ["title"] = "Shilo Village Mine",
        ["rows"] = {
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1621,
                ["level"] = 25,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1619,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Precious gem rock",
                ["item"] = 1617,
                ["level"] = 43,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut diamond",
            },
        },
        ["kind"] = "resource",
    },
    [1302] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1306] = {
        ["title"] = "Overgrown idol",
        ["rows"] = {
            {
                ["name"] = "Overgrown idols",
                ["item"] = 42747,
                ["level"] = 81,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1311] = {
        ["title"] = "Tumeken's Remnant",
        ["rows"] = {
            {
                ["name"] = "Light animica rock",
                ["item"] = 44830,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Light animica",
            },
        },
        ["kind"] = "resource",
    },
    [1316] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1317] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1325] = {
        ["title"] = "Karambwanji Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Karambwanji Fishing",
            },
            {
                ["name"] = "Raw karambwanji",
                ["item"] = 3150,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Karambwanji Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1327] = {
        ["title"] = "Nature Altar",
        ["rows"] = {
            {
                ["name"] = "Nature runes",
                ["item"] = 561,
                ["level"] = 44,
                ["skill"] = "Runecrafting",
                ["detail"] = "Nature rune",
            },
        },
        ["kind"] = "resource",
    },
    [1328] = {
        ["title"] = "Tai Bwo Wannai Mine",
        ["rows"] = {
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
        },
        ["kind"] = "resource",
    },
    [1330] = {
        ["title"] = "Overgrown idol",
        ["rows"] = {
            {
                ["name"] = "Overgrown idols",
                ["item"] = 42747,
                ["level"] = 81,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1331] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Gleaming wisps",
                ["item"] = 29389,
                ["level"] = 50,
                ["skill"] = "Divination",
                ["detail"] = "Gleaming memory",
            },
        },
        ["kind"] = "resource",
    },
    [1333] = {
        ["title"] = "Desert Mining Camp",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [1340] = {
        ["title"] = "Hardwood grove",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1341] = {
        ["title"] = "Karambwan Fishing",
        ["rows"] = {
            {
                ["name"] = "Karambwan vessel",
                ["item"] = 3157,
                ["level"] = 65,
                ["skill"] = "Fishing",
                ["detail"] = "Karambwan Fishing",
            },
            {
                ["name"] = "Raw karambwan",
                ["item"] = 3142,
                ["level"] = 65,
                ["skill"] = "Fishing",
                ["detail"] = "Karambwan Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1349] = {
        ["title"] = "Uzer Hunter Mine",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
        },
        ["kind"] = "resource",
    },
    [1352] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1355] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1363] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1364] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1370] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1371] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1372] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1373] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1380] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1381] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1382] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1384] = {
        ["title"] = "Water Altar",
        ["rows"] = {
            {
                ["name"] = "Water runes",
                ["item"] = 555,
                ["level"] = 5,
                ["skill"] = "Runecrafting",
                ["detail"] = "Water rune",
            },
        },
        ["kind"] = "resource",
    },
    [1385] = {
        ["title"] = "Lumbridge South-West Mine",
        ["rows"] = {
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [1390] = {
        ["title"] = "Lumbridge South-East Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
        },
        ["kind"] = "resource",
    },
    [1391] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1402] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1415] = {
        ["title"] = "Kharid-et",
        ["rows"] = {
            {
                ["name"] = "Kharid-et",
                ["item"] = 49517,
                ["level"] = 5,
                ["skill"] = "Archaeology",
                ["detail"] = "A forsaken fortress buried in sand, south of Het's Oasis.",
            },
        },
        ["kind"] = "resource",
    },
    [1416] = {
        ["title"] = "Kharid-et - Exterior excavation site",
        ["rows"] = {
            {
                ["name"] = "Venator remains",
                ["item"] = 49460,
                ["level"] = 5,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
            {
                ["name"] = "Venator remains",
                ["item"] = 49514,
                ["level"] = 5,
                ["skill"] = "Archaeology",
                ["detail"] = "Zarosian insignia",
            },
            {
                ["name"] = "Kharid-et - Exterior excavation site",
                ["item"] = 49456,
                ["level"] = 12,
                ["skill"] = "Archaeology",
                ["detail"] = "Samite silk",
            },
        },
        ["kind"] = "resource",
    },
    [1417] = {
        ["title"] = "Al Kharid east excavation site",
        ["rows"] = {
            {
                ["name"] = "Al Kharid east excavation site",
                ["item"] = 49456,
                ["level"] = 12,
                ["skill"] = "Archaeology",
                ["detail"] = "Samite silk",
            },
        },
        ["kind"] = "resource",
    },
    [1420] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1421] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1423] = {
        ["title"] = "Uzer Mine",
        ["rows"] = {
            {
                ["name"] = "Necrite rock",
                ["item"] = 44826,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Necrite ore",
            },
            {
                ["name"] = "Platinum rock",
                ["item"] = 59207,
                ["level"] = 104,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Platinum ore",
            },
        },
        ["kind"] = "resource",
    },
    [1424] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1425] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1427] = {
        ["title"] = "Crandor Mine",
        ["rows"] = {
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1431] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1437] = {
        ["title"] = "Rimmington Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1444] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1452] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1453] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1461] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Pale wisps",
                ["item"] = 29384,
                ["level"] = 1,
                ["skill"] = "Divination",
                ["detail"] = "Pale memory",
            },
        },
        ["kind"] = "resource",
    },
    [1462] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1463] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1465] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1466] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1467] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1468] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1469] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1476] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1477] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1478] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1479] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1480] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1487] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1488] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1489] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1490] = {
        ["title"] = "Yew tree",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1499] = {
        ["title"] = "Fire Altar",
        ["rows"] = {
            {
                ["name"] = "Fire runes",
                ["item"] = 554,
                ["level"] = 14,
                ["skill"] = "Runecrafting",
                ["detail"] = "Fire rune",
            },
        },
        ["kind"] = "resource",
    },
    [1500] = {
        ["title"] = "Acadia trees",
        ["rows"] = {
            {
                ["name"] = "Acadia tree",
                ["item"] = 40285,
                ["level"] = 50,
                ["skill"] = "Woodcutting",
                ["detail"] = "Acadia logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1514] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1517] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1520] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1521] = {
        ["title"] = "Crandor Mine",
        ["rows"] = {
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1526] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1534] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1536] = {
        ["title"] = "Sandpit",
        ["rows"] = {
            {
                ["name"] = "Sand",
                ["item"] = 1783,
                ["detail"] = "Collect buckets of sand.",
            },
        },
        ["kind"] = "resource",
    },
    [1538] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1541] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1543] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1549] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1550] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1556] = {
        ["title"] = "Draynor Mine",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
        },
        ["kind"] = "resource",
    },
    [1557] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1558] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1559] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1560] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1563] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1565] = {
        ["title"] = "Al Kharid Mine",
        ["rows"] = {
            {
                ["name"] = "Common gem rock",
                ["item"] = 21345,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut lapis lazuli",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1625,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut opal",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1627,
                ["level"] = 13,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut jade",
            },
            {
                ["name"] = "Common gem rock",
                ["item"] = 1629,
                ["level"] = 16,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut red topaz",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1623,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut sapphire",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1621,
                ["level"] = 27,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut emerald",
            },
            {
                ["name"] = "Uncommon gem rock",
                ["item"] = 1619,
                ["level"] = 34,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Uncut ruby",
            },
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
        },
        ["kind"] = "resource",
    },
    [1568] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1569] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1571] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Brilliant wisps",
                ["item"] = 29392,
                ["level"] = 80,
                ["skill"] = "Divination",
                ["detail"] = "Brilliant memory",
            },
        },
        ["kind"] = "resource",
    },
    [1572] = {
        ["title"] = "Slimy Eel Swamp Fishing",
        ["rows"] = {
            {
                ["name"] = "Slimy eel",
                ["item"] = 3379,
                ["level"] = 28,
                ["skill"] = "Fishing",
                ["detail"] = "Slimy Eel Swamp Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1575] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1578] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1580] = {
        ["title"] = "Barrows mounds excavation site",
        ["rows"] = {
            {
                ["name"] = "Barrows mounds excavation site",
                ["item"] = 49492,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Star of Saradomin",
            },
            {
                ["name"] = "Barrows mounds excavation site",
                ["item"] = 49488,
                ["level"] = 51,
                ["skill"] = "Archaeology",
                ["detail"] = "Everlight silvthril",
            },
        },
        ["kind"] = "resource",
    },
    [1581] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1583] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1589] = {
        ["title"] = "Sandpit",
        ["rows"] = {
            {
                ["name"] = "Sand",
                ["item"] = 1783,
                ["detail"] = "Collect buckets of sand.",
            },
        },
        ["kind"] = "resource",
    },
    [1591] = {
        ["title"] = "Law Altar",
        ["rows"] = {
            {
                ["name"] = "Law runes",
                ["item"] = 563,
                ["level"] = 54,
                ["skill"] = "Runecrafting",
                ["detail"] = "Law rune",
            },
        },
        ["kind"] = "resource",
    },
    [1592] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1593] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1594] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1596] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1598] = {
        ["title"] = "Falador West Mine",
        ["rows"] = {
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [1599] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1607] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1616] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1627] = {
        ["title"] = "Varrock South-West Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
        },
        ["kind"] = "resource",
    },
    [1631] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1637] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1641] = {
        ["title"] = "Varrock South-East Mine",
        ["rows"] = {
            {
                ["name"] = "Copper rock",
                ["item"] = 436,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Copper ore",
            },
            {
                ["name"] = "Tin rock",
                ["item"] = 438,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Tin ore",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
            {
                ["name"] = "Adamantite rock",
                ["item"] = 449,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Adamantite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1643] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1653] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1654] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1658] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1663] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1669] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1670] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1671] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1673] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1683] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1694] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Flickering wisps",
                ["item"] = 29385,
                ["level"] = 10,
                ["skill"] = "Divination",
                ["detail"] = "Flickering memory",
            },
        },
        ["kind"] = "resource",
    },
    [1697] = {
        ["title"] = "Body Altar",
        ["rows"] = {
            {
                ["name"] = "Body runes",
                ["item"] = 559,
                ["level"] = 20,
                ["skill"] = "Runecrafting",
                ["detail"] = "Body rune",
            },
        },
        ["kind"] = "resource",
    },
    [1702] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1704] = {
        ["title"] = "Air Altar",
        ["rows"] = {
            {
                ["name"] = "Air runes",
                ["item"] = 556,
                ["level"] = 1,
                ["skill"] = "Runecrafting",
                ["detail"] = "Air rune",
            },
        },
        ["kind"] = "resource",
    },
    [1705] = {
        ["title"] = "Gunnarsgrunn Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [1706] = {
        ["title"] = "Gunnarsgrunn South Mine",
        ["rows"] = {
            {
                ["name"] = "Clay rock",
                ["item"] = 434,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Clay",
            },
        },
        ["kind"] = "resource",
    },
    [1708] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1715] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1732] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1733] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1743] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1745] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Bright wisps",
                ["item"] = 29386,
                ["level"] = 20,
                ["skill"] = "Divination",
                ["detail"] = "Bright memory",
            },
        },
        ["kind"] = "resource",
    },
    [1749] = {
        ["title"] = "Archaeology Guild excavation site",
        ["rows"] = {
            {
                ["name"] = "Archaeology Guild excavation site",
                ["item"] = 49460,
                ["level"] = 5,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
        },
        ["kind"] = "resource",
    },
    [1751] = {
        ["title"] = "Slimy Eel Swamp Fishing",
        ["rows"] = {
            {
                ["name"] = "Slimy eel",
                ["item"] = 3379,
                ["level"] = 28,
                ["skill"] = "Fishing",
                ["detail"] = "Slimy Eel Swamp Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1752] = {
        ["title"] = "Slimy Eel Swamp Fishing",
        ["rows"] = {
            {
                ["name"] = "Slimy eel",
                ["item"] = 3379,
                ["level"] = 28,
                ["skill"] = "Fishing",
                ["detail"] = "Slimy Eel Swamp Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1755] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1756] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1757] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1768] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1770] = {
        ["title"] = "Taverley Potato Patch",
        ["rows"] = {
            {
                ["name"] = "Potatoes",
                ["item"] = 1942,
                ["level"] = 1,
                ["skill"] = "Farming",
                ["detail"] = "Head Farmer Jones looks after this patch.",
            },
        },
        ["kind"] = "resource",
    },
    [1776] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1779] = {
        ["title"] = "Mind Altar",
        ["rows"] = {
            {
                ["name"] = "Mind runes",
                ["item"] = 558,
                ["level"] = 1,
                ["skill"] = "Runecrafting",
                ["detail"] = "Mind rune",
            },
        },
        ["kind"] = "resource",
    },
    [1784] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1785] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Bloodwood tree",
                ["item"] = 24121,
                ["level"] = 85,
                ["skill"] = "Woodcutting",
                ["detail"] = "Bloodwood logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1789] = {
        ["title"] = "Ice mountain excavation site",
        ["rows"] = {
            {
                ["name"] = "Ice mountain excavation site",
                ["item"] = 49464,
                ["level"] = 17,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
        },
        ["kind"] = "resource",
    },
    [1796] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1797] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1806] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1825] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1826] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1827] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1833] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1834] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1835] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1836] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1840] = {
        ["title"] = "Earth Altar",
        ["rows"] = {
            {
                ["name"] = "Earth runes",
                ["item"] = 557,
                ["level"] = 9,
                ["skill"] = "Runecrafting",
                ["detail"] = "Earth rune",
            },
        },
        ["kind"] = "resource",
    },
    [1842] = {
        ["title"] = "Infernal Source",
        ["rows"] = {
            {
                ["name"] = "Infernal Source",
                ["item"] = 49521,
                ["level"] = 20,
                ["skill"] = "Archaeology",
                ["detail"] = "A secret society's descent beneath the Wilderness.",
            },
        },
        ["kind"] = "resource",
    },
    [1843] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1847] = {
        ["title"] = "Silvarea Quarry",
        ["rows"] = {
            {
                ["name"] = "Limestone rock",
                ["item"] = 3211,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Limestone",
            },
        },
        ["kind"] = "resource",
    },
    [1848] = {
        ["title"] = "Odd Old Man - excavation site",
        ["rows"] = {
            {
                ["name"] = "Odd Old Man - excavation site",
                ["item"] = 49448,
                ["level"] = 81,
                ["skill"] = "Archaeology",
                ["detail"] = "Fossilised bone",
            },
        },
        ["kind"] = "resource",
    },
    [1871] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [1884] = {
        ["title"] = "Wilderness (level 6) South Mine",
        ["rows"] = {
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1887] = {
        ["title"] = "Woodcutters' Grove",
        ["rows"] = {
            {
                ["name"] = "Normal tree",
                ["item"] = 1511,
                ["level"] = 1,
                ["skill"] = "Woodcutting",
                ["detail"] = "Logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Oak tree",
                ["item"] = 1521,
                ["level"] = 10,
                ["skill"] = "Woodcutting",
                ["detail"] = "Oak logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Elder tree",
                ["item"] = 29556,
                ["level"] = 90,
                ["skill"] = "Woodcutting",
                ["detail"] = "Elder logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1888] = {
        ["title"] = "Morytania north excavation site",
        ["rows"] = {
            {
                ["name"] = "Morytania north excavation site",
                ["item"] = 49452,
                ["level"] = 29,
                ["skill"] = "Archaeology",
                ["detail"] = "Leather scraps",
            },
        },
        ["kind"] = "resource",
    },
    [1889] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Lustrous wisps",
                ["item"] = 29391,
                ["level"] = 70,
                ["skill"] = "Divination",
                ["detail"] = "Lustrous memory",
            },
        },
        ["kind"] = "resource",
    },
    [1892] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Sparkling wisps",
                ["item"] = 29388,
                ["level"] = 40,
                ["skill"] = "Divination",
                ["detail"] = "Sparkling memory",
            },
        },
        ["kind"] = "resource",
    },
    [1900] = {
        ["title"] = "Chaos Altar",
        ["rows"] = {
            {
                ["name"] = "Chaos runes",
                ["item"] = 562,
                ["level"] = 35,
                ["skill"] = "Runecrafting",
                ["detail"] = "Chaos rune",
            },
        },
        ["kind"] = "resource",
    },
    [1901] = {
        ["title"] = "Wilderness (level 9) South-West Mine",
        ["rows"] = {
            {
                ["name"] = "Orichalcite rock",
                ["item"] = 44822,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Orichalcite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1904] = {
        ["title"] = "Wilderness (level 14) Volcano Mine",
        ["rows"] = {
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
        },
        ["kind"] = "resource",
    },
    [1906] = {
        ["title"] = "Kratonium & Novite Mine",
        ["rows"] = {
            {
                ["name"] = "Kratonium rock",
                ["item"] = 57181,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Kratonium ore",
            },
            {
                ["name"] = "Novite rock",
                ["item"] = 57175,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Novite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1908] = {
        ["title"] = "Daemonheim Peninsula Island",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1909] = {
        ["title"] = "Promethium Mine",
        ["rows"] = {
            {
                ["name"] = "Promethium rock",
                ["item"] = 57193,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Promethium ore",
            },
        },
        ["kind"] = "resource",
    },
    [1924] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 82,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1927] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1930] = {
        ["title"] = "Daemonheim south-west excavation site",
        ["rows"] = {
            {
                ["name"] = "Daemonheim south-west excavation site",
                ["item"] = 49498,
                ["level"] = 29,
                ["skill"] = "Archaeology",
                ["detail"] = "Chaotic brimstone",
            },
            {
                ["name"] = "Daemonheim south-west excavation site",
                ["item"] = 49502,
                ["level"] = 36,
                ["skill"] = "Archaeology",
                ["detail"] = "Eye of Dagon",
            },
        },
        ["kind"] = "resource",
    },
    [1931] = {
        ["title"] = "Argonite & Katagon Mine",
        ["rows"] = {
            {
                ["name"] = "Argonite rock",
                ["item"] = 57187,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Argonite ore",
            },
            {
                ["name"] = "Katagon rock",
                ["item"] = 57189,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Katagon ore",
            },
        },
        ["kind"] = "resource",
    },
    [1934] = {
        ["title"] = "Fractite & Bathus Mine",
        ["rows"] = {
            {
                ["name"] = "Fractite rock",
                ["item"] = 57183,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Fractite ore",
            },
            {
                ["name"] = "Bathus rock",
                ["item"] = 57177,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Bathus ore",
            },
        },
        ["kind"] = "resource",
    },
    [1942] = {
        ["title"] = "Zephyrium Mine",
        ["rows"] = {
            {
                ["name"] = "Zephyrium rock",
                ["item"] = 57185,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Zephyrium ore",
            },
        },
        ["kind"] = "resource",
    },
    [1943] = {
        ["title"] = "Promethium & Fractite Mine",
        ["rows"] = {
            {
                ["name"] = "Promethium rock",
                ["item"] = 57193,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Promethium ore",
            },
            {
                ["name"] = "Fractite rock",
                ["item"] = 57183,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Fractite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1944] = {
        ["title"] = "Bathus Mine",
        ["rows"] = {
            {
                ["name"] = "Bathus rock",
                ["item"] = 57177,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Bathus ore",
            },
        },
        ["kind"] = "resource",
    },
    [1945] = {
        ["title"] = "Marmaros & Gorgonite Mine",
        ["rows"] = {
            {
                ["name"] = "Marmaros rock",
                ["item"] = 57179,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Marmaros ore",
            },
            {
                ["name"] = "Gorgonite rock",
                ["item"] = 57191,
                ["level"] = 100,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gorgonite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1948] = {
        ["title"] = "Wilderness (level 35) Hobgoblin Mine",
        ["rows"] = {
            {
                ["name"] = "Necrite rock",
                ["item"] = 44826,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Necrite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1950] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1956] = {
        ["title"] = "Wilderness (level 47) Lava Maze Mine",
        ["rows"] = {
            {
                ["name"] = "Phasmatite rock",
                ["item"] = 44828,
                ["level"] = 70,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Phasmatite",
            },
        },
        ["kind"] = "resource",
    },
    [1957] = {
        ["title"] = "Lava Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lava eel",
                ["item"] = 2148,
                ["level"] = 53,
                ["skill"] = "Fishing",
                ["detail"] = "Lava Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1966] = {
        ["title"] = "Wilderness (level 54) Pirates' Hideout Mine",
        ["rows"] = {
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [1986] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [1987] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1988] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Mahogany tree",
                ["item"] = 6332,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Mahogany logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1991] = {
        ["title"] = "Oo'glog Red Sandstone",
        ["rows"] = {
            {
                ["name"] = "Red sandstone",
                ["item"] = 23194,
                ["level"] = 81,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Red sandstone",
            },
        },
        ["kind"] = "resource",
    },
    [1992] = {
        ["title"] = "Feldip Swamp Mine",
        ["rows"] = {
            {
                ["name"] = "Feldip swamp rock",
                ["item"] = 1480,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Rock",
            },
        },
        ["kind"] = "resource",
    },
    [1993] = {
        ["title"] = "Feldip Swamp Mine",
        ["rows"] = {
            {
                ["name"] = "Feldip swamp rock",
                ["item"] = 1480,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Rock",
            },
        },
        ["kind"] = "resource",
    },
    [1995] = {
        ["title"] = "Feldip Swamp Mine",
        ["rows"] = {
            {
                ["name"] = "Feldip swamp rock",
                ["item"] = 1480,
                ["level"] = 1,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Rock",
            },
        },
        ["kind"] = "resource",
    },
    [1996] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [1997] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2000] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2001] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2002] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2015] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2018] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2019] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2020] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2021] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2033] = {
        ["title"] = "Fight Arena South-East Mine",
        ["rows"] = {
            {
                ["name"] = "Runite rock",
                ["item"] = 451,
                ["level"] = 50,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Runite ore",
            },
        },
        ["kind"] = "resource",
    },
    [2034] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2035] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2040] = {
        ["title"] = "Ardougne South-East Mine",
        ["rows"] = {
            {
                ["name"] = "Silver rock",
                ["item"] = 442,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Silver ore",
            },
        },
        ["kind"] = "resource",
    },
    [2042] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2044] = {
        ["title"] = "Karamja North-West Mine",
        ["rows"] = {
            {
                ["name"] = "Gold rock",
                ["item"] = 444,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Gold ore",
            },
        },
        ["kind"] = "resource",
    },
    [2049] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2056] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2057] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2066] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2067] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2068] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2069] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2070] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2084] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2086] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2087] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2089] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2094] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2099] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2102] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2103] = {
        ["title"] = "Legends' Guild South-West Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
        },
        ["kind"] = "resource",
    },
    [2104] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2105] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2108] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2109] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2115] = {
        ["title"] = "Stormguard Citadel",
        ["rows"] = {
            {
                ["name"] = "Stormguard Citadel",
                ["item"] = 49523,
                ["level"] = 70,
                ["skill"] = "Archaeology",
                ["detail"] = "A wondrous workshop floating high among the clouds.",
            },
        },
        ["kind"] = "resource",
    },
    [2116] = {
        ["title"] = "Stormguard Citadel - Temple of Ikov excavation site",
        ["rows"] = {
            {
                ["name"] = "Ikovian memorial",
                ["item"] = 49460,
                ["level"] = 70,
                ["skill"] = "Archaeology",
                ["detail"] = "Third Age iron",
            },
            {
                ["name"] = "Ikovian memorial",
                ["item"] = 49464,
                ["level"] = 70,
                ["skill"] = "Archaeology",
                ["detail"] = "White oak",
            },
            {
                ["name"] = "Ikovian memorial",
                ["item"] = 49472,
                ["level"] = 70,
                ["skill"] = "Archaeology",
                ["detail"] = "Stormguard steel",
            },
            {
                ["name"] = "Ikovian memorial",
                ["item"] = 49474,
                ["level"] = 70,
                ["skill"] = "Archaeology",
                ["detail"] = "Wings of War",
            },
        },
        ["kind"] = "resource",
    },
    [2117] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2122] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Glowing wisps",
                ["item"] = 29387,
                ["level"] = 30,
                ["skill"] = "Divination",
                ["detail"] = "Glowing memory",
            },
        },
        ["kind"] = "resource",
    },
    [2123] = {
        ["title"] = "Magic trees",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2126] = {
        ["title"] = "Coal Truck Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 453,
                ["level"] = 20,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Coal",
            },
        },
        ["kind"] = "resource",
    },
    [2127] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2134] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2139] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2143] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2144] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2145] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2146] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2147] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2149] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2150] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2153] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2154] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2155] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2156] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2157] = {
        ["title"] = "Maple trees",
        ["rows"] = {
            {
                ["name"] = "Maple tree",
                ["item"] = 1517,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Maple logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2161] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2163] = {
        ["title"] = "Small Cage Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw crayfish",
                ["item"] = 13435,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Cage Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2179] = {
        ["title"] = "Sandpit",
        ["rows"] = {
            {
                ["name"] = "Sand",
                ["item"] = 1783,
                ["detail"] = "Collect buckets of sand.",
            },
        },
        ["kind"] = "resource",
    },
    [2182] = {
        ["title"] = "Rellekka Mine",
        ["rows"] = {
            {
                ["name"] = "Mithril rock",
                ["item"] = 447,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Mithril ore",
            },
        },
        ["kind"] = "resource",
    },
    [2183] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2184] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2185] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2189] = {
        ["title"] = "Keldagrim Entrance Mine",
        ["rows"] = {
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
        },
        ["kind"] = "resource",
    },
    [2198] = {
        ["title"] = "Miscellania Fishing",
        ["rows"] = {
            {
                ["name"] = "Tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Fish to improve kingdom approval.",
            },
            {
                ["name"] = "Lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Fish to improve kingdom approval.",
            },
        },
        ["kind"] = "resource",
    },
    [2199] = {
        ["title"] = "Etceterian forest",
        ["rows"] = {
            {
                ["name"] = "Teak tree (Etceteria)",
                ["item"] = 52870,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Approval rating",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Mahogany tree (Etceteria)",
                ["item"] = 52870,
                ["level"] = 60,
                ["skill"] = "Woodcutting",
                ["detail"] = "Approval rating",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2201] = {
        ["title"] = "Arctic (Azure) Habitat Mine",
        ["rows"] = {
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [2202] = {
        ["title"] = "Arctic (Azure) Habitat Mine",
        ["rows"] = {
            {
                ["name"] = "Banite rock",
                ["item"] = 21778,
                ["level"] = 80,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Banite ore",
            },
        },
        ["kind"] = "resource",
    },
    [2203] = {
        ["title"] = "Oo'glog jungle",
        ["rows"] = {
            {
                ["name"] = "Achey tree",
                ["item"] = 2862,
                ["level"] = 1,
                ["skill"] = "Woodcutting",
                ["detail"] = "Achey tree logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Eucalyptus tree",
                ["item"] = 12581,
                ["level"] = 58,
                ["skill"] = "Woodcutting",
                ["detail"] = "Eucalyptus logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2209] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2210] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2211] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2214] = {
        ["title"] = "Feldip excavation site",
        ["rows"] = {
            {
                ["name"] = "Feldip excavation site",
                ["item"] = 49446,
                ["level"] = 76,
                ["skill"] = "Archaeology",
                ["detail"] = "Animal furs",
            },
        },
        ["kind"] = "resource",
    },
    [2234] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2235] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2239] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2241] = {
        ["title"] = "Sandpit",
        ["rows"] = {
            {
                ["name"] = "Sand",
                ["item"] = 1783,
                ["detail"] = "Collect buckets of sand.",
            },
        },
        ["kind"] = "resource",
    },
    [2245] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2248] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2249] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2255] = {
        ["title"] = "Ourania Altar",
        ["rows"] = {
            {
                ["name"] = "Random elemental and catalytic runes",
                ["item"] = 1436,
                ["level"] = 1,
                ["skill"] = "Runecrafting",
                ["detail"] = "Converts pure essence into a random assortment of runes.",
            },
        },
        ["kind"] = "resource",
    },
    [2258] = {
        ["title"] = "Ourania Battlefield Mine",
        ["rows"] = {
            {
                ["name"] = "Luminite rock",
                ["item"] = 44820,
                ["level"] = 40,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Luminite",
            },
        },
        ["kind"] = "resource",
    },
    [2265] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2269] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2277] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2278] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2279] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2280] = {
        ["title"] = "Gnome Agility Arboretum",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2282] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2287] = {
        ["title"] = "Heavy Rod Fishing",
        ["rows"] = {
            {
                ["name"] = "Leaping salmon",
                ["item"] = 11330,
                ["level"] = 58,
                ["skill"] = "Fishing",
                ["detail"] = "Heavy Rod Fishing",
            },
            {
                ["name"] = "Leaping sturgeon",
                ["item"] = 11332,
                ["level"] = 70,
                ["skill"] = "Fishing",
                ["detail"] = "Heavy Rod Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2288] = {
        ["title"] = "Yew tree",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2290] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2295] = {
        ["title"] = "Small Net/Bait Saltwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw shrimps",
                ["item"] = 317,
                ["level"] = 1,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw anchovies",
                ["item"] = 321,
                ["level"] = 15,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw sardine",
                ["item"] = 327,
                ["level"] = 5,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
            {
                ["name"] = "Raw herring",
                ["item"] = 345,
                ["level"] = 10,
                ["skill"] = "Fishing",
                ["detail"] = "Small Net/Bait Saltwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2296] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2301] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2310] = {
        ["title"] = "(Managing) Miscellania Mine",
        ["rows"] = {
            {
                ["name"] = "Coal rock",
                ["item"] = 44777,
                ["level"] = 30,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Approval rating",
            },
        },
        ["kind"] = "resource",
    },
    [2311] = {
        ["title"] = "Miscellaneous maples",
        ["rows"] = {
            {
                ["name"] = "Maple tree (Miscellania)",
                ["item"] = 52870,
                ["level"] = 40,
                ["skill"] = "Woodcutting",
                ["detail"] = "Approval rating",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2316] = {
        ["title"] = "Warforge",
        ["rows"] = {
            {
                ["name"] = "Warforge",
                ["item"] = 49525,
                ["level"] = 76,
                ["skill"] = "Archaeology",
                ["detail"] = "An abandoned army buried south-west of the Feldip Hills.",
            },
        },
        ["kind"] = "resource",
    },
    [2317] = {
        ["title"] = "Feldip shores excavation site",
        ["rows"] = {
            {
                ["name"] = "Feldip shores excavation site",
                ["item"] = 49484,
                ["level"] = 83,
                ["skill"] = "Archaeology",
                ["detail"] = "Yu'biusk clay",
            },
            {
                ["name"] = "Feldip shores excavation site",
                ["item"] = 49480,
                ["level"] = 76,
                ["skill"] = "Archaeology",
                ["detail"] = "Vulcanised rubber",
            },
        },
        ["kind"] = "resource",
    },
    [2318] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Vibrant wisps",
                ["item"] = 29390,
                ["level"] = 60,
                ["skill"] = "Divination",
                ["detail"] = "Vibrant memory",
            },
        },
        ["kind"] = "resource",
    },
    [2319] = {
        ["title"] = "Trees - Uncommon",
        ["rows"] = {
            {
                ["name"] = "Choking ivy",
                ["item"] = 60810,
                ["level"] = 68,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2320] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2321] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2322] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2323] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2327] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2328] = {
        ["title"] = "Willow trees",
        ["rows"] = {
            {
                ["name"] = "Willow tree",
                ["item"] = 1519,
                ["level"] = 20,
                ["skill"] = "Woodcutting",
                ["detail"] = "Willow logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2329] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2332] = {
        ["title"] = "Trees - Rare",
        ["rows"] = {
            {
                ["name"] = "Crystal tree",
                ["item"] = 29555,
                ["level"] = 94,
                ["skill"] = "Woodcutting",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2341] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2342] = {
        ["title"] = "Big Cage/Harpoon Rare Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw lobster",
                ["item"] = 377,
                ["level"] = 40,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Big Cage/Harpoon Rare Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2343] = {
        ["title"] = "Fremennik Isles Mine",
        ["rows"] = {
            {
                ["name"] = "Drakolith rock",
                ["item"] = 44824,
                ["level"] = 60,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Drakolith",
            },
        },
        ["kind"] = "resource",
    },
    [2346] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2351] = {
        ["title"] = "Piscatoris South Mine",
        ["rows"] = {
            {
                ["name"] = "Iron rock",
                ["item"] = 440,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Iron ore",
            },
            {
                ["name"] = "Platinum rock",
                ["item"] = 59207,
                ["level"] = 104,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Platinum ore",
            },
        },
        ["kind"] = "resource",
    },
    [2352] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2353] = {
        ["title"] = "Eternal magic trees",
        ["rows"] = {
            {
                ["name"] = "Eternal magic tree",
                ["item"] = 58250,
                ["level"] = 100,
                ["skill"] = "Woodcutting",
                ["detail"] = "Eternal magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2357] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2358] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2359] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2361] = {
        ["title"] = "Piscatoris Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw monkfish",
                ["item"] = 7944,
                ["level"] = 62,
                ["skill"] = "Fishing",
                ["detail"] = "Piscatoris Fishing",
            },
            {
                ["name"] = "Raw tuna",
                ["item"] = 359,
                ["level"] = 35,
                ["skill"] = "Fishing",
                ["detail"] = "Piscatoris Fishing",
            },
            {
                ["name"] = "Raw swordfish",
                ["item"] = 371,
                ["level"] = 50,
                ["skill"] = "Fishing",
                ["detail"] = "Piscatoris Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2368] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2379] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2383] = {
        ["title"] = "Arctic pines",
        ["rows"] = {
            {
                ["name"] = "Arctic pine tree",
                ["item"] = 10810,
                ["level"] = 54,
                ["skill"] = "Woodcutting",
                ["detail"] = "Arctic pine logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2385] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2386] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2387] = {
        ["title"] = "Water Source",
        ["rows"] = {
            {
                ["name"] = "Water",
                ["item"] = 1929,
                ["detail"] = "Fill a suitable container at this water source.",
            },
        },
        ["kind"] = "resource",
    },
    [2395] = {
        ["title"] = "Arandar Pass Mine",
        ["rows"] = {
            {
                ["name"] = "Limestone rock",
                ["item"] = 3211,
                ["level"] = 10,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Limestone",
            },
        },
        ["kind"] = "resource",
    },
    [2399] = {
        ["title"] = "Wisp Colony",
        ["rows"] = {
            {
                ["name"] = "Incandescent wisps",
                ["item"] = 29395,
                ["level"] = 95,
                ["skill"] = "Divination",
                ["detail"] = "Incandescent memory",
            },
        },
        ["kind"] = "resource",
    },
    [2400] = {
        ["title"] = "Teak trees",
        ["rows"] = {
            {
                ["name"] = "Teak tree",
                ["item"] = 6333,
                ["level"] = 30,
                ["skill"] = "Woodcutting",
                ["detail"] = "Teak logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2408] = {
        ["title"] = "Yew trees",
        ["rows"] = {
            {
                ["name"] = "Yew tree",
                ["item"] = 1515,
                ["level"] = 70,
                ["skill"] = "Woodcutting",
                ["detail"] = "Yew logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2415] = {
        ["title"] = "Lletya Mine",
        ["rows"] = {
            {
                ["name"] = "Light animica rock",
                ["item"] = 44830,
                ["level"] = 90,
                ["skill"] = "Mining",
                ["tool"] = 1265,
                ["detail"] = "Light animica",
            },
        },
        ["kind"] = "resource",
    },
    [2416] = {
        ["title"] = "Magic trees",
        ["rows"] = {
            {
                ["name"] = "Magic tree",
                ["item"] = 1513,
                ["level"] = 80,
                ["skill"] = "Woodcutting",
                ["detail"] = "Magic logs",
                ["tool"] = 1351,
            },
        },
        ["kind"] = "resource",
    },
    [2426] = {
        ["title"] = "Big Net/Harpoon Member Fishing",
        ["rows"] = {
            {
                ["name"] = "Oyster",
                ["item"] = 407,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Seaweed",
                ["item"] = 401,
                ["level"] = 16,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw great white shark",
                ["item"] = 34727,
                ["level"] = 80,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
            {
                ["name"] = "Raw shark",
                ["item"] = 383,
                ["level"] = 76,
                ["skill"] = "Fishing",
                ["detail"] = "Big Net/Harpoon Member Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2427] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
    [2432] = {
        ["title"] = "Lure/Bait Freshwater Fishing",
        ["rows"] = {
            {
                ["name"] = "Raw trout",
                ["item"] = 335,
                ["level"] = 20,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw salmon",
                ["item"] = 331,
                ["level"] = 30,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw rainbow fish",
                ["item"] = 10138,
                ["level"] = 38,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
            {
                ["name"] = "Raw pike",
                ["item"] = 349,
                ["level"] = 25,
                ["skill"] = "Fishing",
                ["detail"] = "Lure/Bait Freshwater Fishing",
            },
        },
        ["kind"] = "resource",
    },
}
