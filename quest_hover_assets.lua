-- quest_hover_assets.lua
-- Used by: quest_card.lua, quest_requirements.lua.
-- Chooses cached quest badges and skill artwork for reference cards.

--[=[
BEGINNER WALKTHROUGH: quest_hover_assets.lua

The returned table contains two DICTIONARIES:
skillIcons[skill ID]=sprite ID chooses artwork;
extraSteps[quest ID]={note1,note2,...} stores reference journal notes.
Skill IDs, quest IDs and sprite IDs are different namespaces.

Example reuse:
  local assets = require('quest_hover_assets')
  local attackIcon = assets.skillIcons[0]
  for _, note in ipairs(assets.extraSteps[410] or {}) do print(note) end
quest_card.lua and quest_requirements.lua currently consume skillIcons. extraSteps is
retained reference metadata; these notes are not automatically verified live requirements.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: quest_card.lua, quest_requirements.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Bundled quest-hover presentation metadata from the local cache/journal.
skillIcons maps native skill IDs to native sprite IDs; extraSteps maps quest IDs to
reference journal notes. Presence here does not prove a requirement is satisfied.
Consumers select the relevant fields; the table has no runtime API/network side effects.
]]

-- Native skill sprites and reference journal labels from the local cache.
return {
    ["skillIcons"] = {
        [0] = 13193,
        [2] = 13194,
        [4] = 13196,
        [6] = 13205,
        [1] = 13195,
        [3] = 13199,
        [5] = 13197,
        [16] = 13217,
        [15] = 13210,
        [17] = 13201,
        [12] = 13203,
        [20] = 13206,
        [14] = 13198,
        [13] = 13208,
        [10] = 13211,
        [7] = 13212,
        [11] = 13200,
        [8] = 13207,
        [9] = 13204,
        [18] = 13214,
        [19] = 13213,
        [22] = 13209,
        [21] = 13202,
        [23] = 13216,
        [24] = 13215,
        [25] = 13218,
        [26] = 26543,
        [27] = 10784,
        [28] = 30936,
    },
    ["extraSteps"] = {
        [410] = {
            "Access to the fairy ring network",
        },
        [56] = {
            "Claim Kudos from Historian Minas in Varrock Museum for completing Shield of Arrav",
        },
        [75] = {
            "Rescue Mad Eadgar from the Troll Stronghold",
        },
        [117] = {
            "Access Trollheim by defeating Dad",
            "Fully restore Senliten from Missing My Mummy (100%)",
        },
        [170] = {
            "Complete the Knight Waves in Camelot",
            "Complete the Soul Wars tutorial",
        },
        [343] = {
            "Fully restore Senliten from Missing My Mummy (100%)",
            "Bring Leela to Senliten's tomb",
        },
        [391] = {
            "Bring Leela to Senliten's tomb",
            "Fully restore Senliten from Missing My Mummy (100%)",
        },
        [377] = {
            "Access to the Ancient Cavern from Barbarian Training",
        },
        [86] = {
            "Ability to enter the Warriors' Guild",
        },
        [442] = {
            "Complete the 'Meet the Assassin' voyage in Player Owned Ports",
        },
        [444] = {
            "Discover the island of Cyclosis in Player Owned Ports",
        },
        [188] = {
            "Own a player-owned house",
        },
        [435] = {
            "Access to the God Wars dungeon",
        },
        [416] = {
            "You need to find and free Skaldrun from the frozen floors in Daemonheim",
        },
        [417] = {
            "You need to find and free Skaldrun from the frozen floors in Daemonheim",
        },
        [418] = {
            "You need to find and free Skaldrun from the frozen floors in Daemonheim",
        },
        [419] = {
            "You need to find and free Skaldrun from the frozen floors in Daemonheim",
        },
        [420] = {
            "You need to find and free Skaldrun from the frozen floors in Daemonheim",
        },
        [465] = {
            "Complete the base camp tutorial on Anachronia",
        },
        [466] = {
            "You need a level of at least 85 in Crafting, Runecrafting, Smithing or Invention",
        },
        [464] = {
            "Complete the introduction to the player-owned farm with Granny Potterington",
        },
        [473] = {
            "Complete the Archaeology tutorial by speaking to Acting Guildmaster Reiniger at the Varrock dig site.",
        },
        [481] = {
            "Complete the Eyes in Their Stars mystery",
            "Meet Naressa in Senntisten",
        },
        [487] = {
            "Infernal Puzzle Box Tier 5",
        },
        [490] = {
            "Town Hall Tier 1",
            "Command Centre Tier 1",
            "Workshop Tier 1",
            "Chapel Tier 1",
        },
        [500] = {
            "Collect a set of necromancer robes from Sostratus",
        },
        [507] = {
            "Grove Cabin Tier 1",
            "Botanist's Workbench Tier 1",
        },
        [522] = {
            "Complete the Wing Out mystery",
        },
    },
}
