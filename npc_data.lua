-- npc_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: main.lua.
--[=[
BEGINNER WALKTHROUGH: npc_data.lua

Each outer { ... } block is ONE non-monster NPC type, using the same name/ids/locations
schema as bestiary_data.lua. name is display/search text; ids is a numeric config-ID SET;
locations is an ordered list of {x,z} reference map positions, not live entity instances.

Example reuse:
  local records = require('npc_data')
  local search = require('bestiary')
  local matches = search.search('banker', records) -- explicitly use NPCs instead of monsters
  if matches[1] then
      local point = search.nearest(matches[1], 3222, 3218)
      if point then print(matches[1].name, point.x, point.z) end
  end
main.lua passes this table into its NPC catalogue; reference_pins.lua draws the selected locations on the map.
See bestiary_data.lua for an annotated record and an explanation of sets versus lists.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: main.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Bundled non-monster NPC catalogue derived from RuneScape Wiki locations.
Schema: ordered array of {name, ids = {[NPC config ID] = true}, locations = {{x, z}, ...}}.
Coordinates use the same surface transform as bestiary_data. These are reference positions,
not a claim that an NPC is loaded or currently accessible. Preserve config-ID keys.
Source/license/retrieval details: WIKI-NPCS.md (CC BY-NC-SA 3.0). No runtime network fetch.
]]

-- RuneScape Wiki contributors, CC BY-NC-SA 3.0; see WIKI-NPCS.md.
return {
    {
        name = "'Admiral' Wadud (Ports)",
        ids = {
            [24489] = true,
        },
        locations = {
            {
                x = 3179,
                z = 2649,
            },
        },
    },
    {
        name = "'Beedy-eye' Jones",
        ids = {
            [4544] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "'Beefy' Burns",
        ids = {
            [4541] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "'Betty' B.Boppin",
        ids = {
            [4553] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "'Bird's-Eye' Jack",
        ids = {
            [4544] = true,
            [5898] = true,
        },
        locations = {
            {
                x = 2100,
                z = 3922,
            },
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "'Black-eye'",
        ids = {
            [5589] = true,
        },
        locations = {
            {
                x = 2645,
                z = 3229,
            },
        },
    },
    {
        name = "'Currency' The Alchemist",
        ids = {
            [5587] = true,
        },
        locations = {
            {
                x = 2639,
                z = 3218,
            },
        },
    },
    {
        name = "'Deathly Hallows'",
        ids = {
            [21588] = true,
        },
        locations = {
            {
                x = 3637,
                z = 3366,
            },
        },
    },
    {
        name = "'Eagle-eye' Shultz",
        ids = {
            [4542] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "'Gummy'",
        ids = {
            [5591] = true,
        },
        locations = {
            {
                x = 2645,
                z = 3230,
            },
        },
    },
    {
        name = "'I Vanstrom'",
        ids = {
            [21677] = true,
        },
        locations = {
            {
                x = 3640,
                z = 3363,
            },
        },
    },
    {
        name = "'Kill Fosho'",
        ids = {
            [21660] = true,
        },
        locations = {
            {
                x = 3640,
                z = 3366,
            },
        },
    },
    {
        name = "'Mekky Graah'",
        ids = {
            [21652] = true,
        },
        locations = {
            {
                x = 3639,
                z = 3367,
            },
        },
    },
    {
        name = "'No fingers'",
        ids = {
            [5590] = true,
        },
        locations = {
            {
                x = 2645,
                z = 3224,
            },
        },
    },
    {
        name = "'Pygmalion Mardigras'",
        ids = {
            [21695] = true,
        },
        locations = {
            {
                x = 3639,
                z = 3362,
            },
        },
    },
    {
        name = "'Shady' Sullivan",
        ids = {
            [32667] = true,
        },
        locations = {
            {
                x = 3052,
                z = 3255,
            },
        },
    },
    {
        name = "'The Guns'",
        ids = {
            [5592] = true,
            [11248] = true,
        },
        locations = {
            {
                x = 2591,
                z = 3421,
            },
            {
                x = 2639,
                z = 3218,
            },
        },
    },
    {
        name = "'Transmute' The Alchemist",
        ids = {
            [5601] = true,
        },
        locations = {
            {
                x = 2638,
                z = 3220,
            },
        },
    },
    {
        name = "'Venial Hurts'",
        ids = {
            [21668] = true,
        },
        locations = {
            {
                x = 3637,
                z = 3363,
            },
        },
    },
    {
        name = "'Vertigo von Cephalitis'",
        ids = {
            [21643] = true,
        },
        locations = {
            {
                x = 3638,
                z = 3367,
            },
        },
    },
    {
        name = "A humble acolyte",
        ids = {
            [23307] = true,
        },
        locations = {
            {
                x = 2963,
                z = 3332,
            },
        },
    },
    {
        name = "A Meiyerditch child",
        ids = {
            [4746] = true,
            [4747] = true,
            [4748] = true,
            [4749] = true,
            [4750] = true,
            [4751] = true,
            [4752] = true,
            [4753] = true,
            [4754] = true,
            [4755] = true,
        },
        locations = {
            {
                x = 3597,
                z = 3189,
            },
            {
                x = 3598,
                z = 3200,
            },
            {
                x = 3613,
                z = 3211,
            },
            {
                x = 3614,
                z = 3196,
            },
            {
                x = 3614,
                z = 3224,
            },
            {
                x = 3615,
                z = 3217,
            },
            {
                x = 3618,
                z = 3217,
            },
            {
                x = 3620,
                z = 3203,
            },
            {
                x = 3622,
                z = 3228,
            },
            {
                x = 3623,
                z = 3184,
            },
            {
                x = 3623,
                z = 3200,
            },
            {
                x = 3623,
                z = 3213,
            },
            {
                x = 3626,
                z = 3222,
            },
            {
                x = 3627,
                z = 3217,
            },
            {
                x = 3631,
                z = 3208,
            },
            {
                x = 3631,
                z = 3272,
            },
            {
                x = 3631,
                z = 3299,
            },
            {
                x = 3632,
                z = 3313,
            },
            {
                x = 3639,
                z = 3267,
            },
            {
                x = 3639,
                z = 3287,
            },
            {
                x = 3641,
                z = 3279,
            },
            {
                x = 3642,
                z = 3287,
            },
        },
    },
    {
        name = "A memory",
        ids = {
            [23336] = true,
            [23337] = true,
            [23341] = true,
            [23344] = true,
            [23345] = true,
            [23346] = true,
        },
        locations = {
            {
                x = 2257,
                z = 3066,
            },
            {
                x = 2965,
                z = 3332,
            },
            {
                x = 3015,
                z = 3522,
            },
            {
                x = 3093,
                z = 3478,
            },
            {
                x = 3244,
                z = 3400,
            },
            {
                x = 3284,
                z = 3422,
            },
        },
    },
    {
        name = "Abbess Benita",
        ids = {
            [14631] = true,
        },
        locations = {
            {
                x = 3424,
                z = 3178,
            },
        },
    },
    {
        name = "Abbot Langley",
        ids = {
            [801] = true,
        },
        locations = {
            {
                x = 3058,
                z = 3484,
            },
        },
    },
    {
        name = "Aberab",
        ids = {
            [1432] = true,
        },
        locations = {
            {
                x = 2768,
                z = 2803,
            },
        },
    },
    {
        name = "Abyssal Knight",
        ids = {
            [24364] = true,
        },
        locations = {
            {
                x = 3165,
                z = 3154,
            },
            {
                x = 3167,
                z = 3148,
            },
            {
                x = 3167,
                z = 3163,
            },
            {
                x = 3169,
                z = 3148,
            },
            {
                x = 3169,
                z = 3163,
            },
            {
                x = 3170,
                z = 3154,
            },
        },
    },
    {
        name = "Abyssal Knight Quartermaster",
        ids = {
            [24361] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 2678,
                z = 2682,
            },
            {
                x = 2679,
                z = 2679,
            },
        },
    },
    {
        name = "Acca Gielinor",
        ids = {
            [21877] = true,
        },
        locations = {
            {
                x = 3105,
                z = 2855,
            },
        },
    },
    {
        name = "Ace",
        ids = {
            [31047] = true,
        },
        locations = {
            {
                x = 2895,
                z = 3567,
            },
        },
    },
    {
        name = "Achietties",
        ids = {
            [796] = true,
        },
        locations = {
            {
                x = 2918,
                z = 3513,
            },
        },
    },
    {
        name = "Achtryn",
        ids = {
            [8465] = true,
        },
        locations = {
            {
                x = 3511,
                z = 3509,
            },
        },
    },
    {
        name = "Acting Guildmaster Reiniger",
        ids = {
            [26930] = true,
            [26931] = true,
        },
        locations = {
            {
                x = 3325,
                z = 3375,
            },
            {
                x = 3381,
                z = 3393,
            },
        },
    },
    {
        name = "Adam Antite",
        ids = {
            [8944] = true,
        },
        locations = {
            {
                x = 2656,
                z = 3358,
            },
        },
    },
    {
        name = "Adoratrice Haruko",
        ids = {
            [24714] = true,
        },
        locations = {
            {
                x = 3169,
                z = 2614,
            },
        },
    },
    {
        name = "Adyna",
        ids = {
            [19523] = true,
        },
        locations = {
            {
                x = 2341,
                z = 3171,
            },
        },
    },
    {
        name = "Aemad",
        ids = {
            [590] = true,
        },
        locations = {
            {
                x = 2613,
                z = 3294,
            },
        },
    },
    {
        name = "Aeonisig Raispher",
        ids = {
            [22532] = true,
        },
        locations = {
            {
                x = 3222,
                z = 3474,
            },
        },
    },
    {
        name = "Afrah",
        ids = {
            [968] = true,
        },
        locations = {
            {
                x = 3361,
                z = 3219,
            },
        },
    },
    {
        name = "Aggie",
        ids = {
            [922] = true,
        },
        locations = {
            {
                x = 3085,
                z = 3260,
            },
        },
    },
    {
        name = "Agnar",
        ids = {
            [1305] = true,
        },
        locations = {
            {
                x = 2642,
                z = 3677,
            },
        },
    },
    {
        name = "Ahab",
        ids = {
            [2692] = true,
        },
        locations = {
            {
                x = 3050,
                z = 3256,
            },
        },
    },
    {
        name = "Ajjat",
        ids = {
            [4288] = true,
        },
        locations = {
            {
                x = 2851,
                z = 3549,
            },
        },
    },
    {
        name = "Ak-Haranu",
        ids = {
            [1687] = true,
        },
        locations = {
            {
                x = 3689,
                z = 3495,
            },
        },
    },
    {
        name = "Aksel",
        ids = {
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3038,
                z = 3343,
            },
        },
    },
    {
        name = "Al Shabim",
        ids = {
            [832] = true,
        },
        locations = {
            {
                x = 3171,
                z = 3025,
            },
        },
    },
    {
        name = "Al the Camel",
        ids = {
            [2809] = true,
        },
        locations = {
            {
                x = 3274,
                z = 3168,
            },
        },
    },
    {
        name = "Al'Kharidian Guard 1",
        ids = {
            [110267] = true,
        },
        locations = {
            {
                x = 3305,
                z = 3131,
            },
        },
    },
    {
        name = "Alain",
        ids = {
            [2339] = true,
        },
        locations = {
            {
                x = 2885,
                z = 3461,
            },
        },
    },
    {
        name = "Aleck",
        ids = {
            [5110] = true,
        },
        locations = {
            {
                x = 2568,
                z = 3082,
            },
        },
    },
    {
        name = "Alex",
        ids = {
            [31043] = true,
        },
        locations = {
            {
                x = 3207,
                z = 3414,
            },
        },
    },
    {
        name = "Alfonse the waiter",
        ids = {
            [793] = true,
        },
        locations = {
            {
                x = 2793,
                z = 3188,
            },
        },
    },
    {
        name = "Alfred Stonemason",
        ids = {
            [14862] = true,
        },
        locations = {
            {
                x = 2953,
                z = 3229,
            },
        },
    },
    {
        name = "Alfrick the Planner",
        ids = {
            [21168] = true,
        },
        locations = {
            {
                x = 2029,
                z = 3815,
            },
            {
                x = 2629,
                z = 3683,
            },
        },
    },
    {
        name = "Ali Cat",
        ids = {
            [7784] = true,
        },
        locations = {
            {
                x = 3358,
                z = 2973,
            },
        },
    },
    {
        name = "Ali Morrisane",
        ids = {
            [1862] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3211,
            },
        },
    },
    {
        name = "Ali the Tailor",
        ids = {
            [26824] = true,
        },
        locations = {
            {
                x = 3300,
                z = 3198,
            },
        },
    },
    {
        name = "Ali Tist",
        ids = {
            [11641] = true,
        },
        locations = {
            {
                x = 3011,
                z = 3348,
            },
        },
    },
    {
        name = "Alice",
        ids = {
            [2307] = true,
        },
        locations = {
            {
                x = 3627,
                z = 3526,
            },
        },
    },
    {
        name = "Alice the Camel",
        ids = {
            [2813] = true,
        },
        locations = {
            {
                x = 3284,
                z = 3201,
            },
        },
    },
    {
        name = "Alice's husband",
        ids = {
            [5206] = true,
        },
        locations = {
            {
                x = 3617,
                z = 3528,
            },
        },
    },
    {
        name = "Aligra Nite",
        ids = {
            [16711] = true,
        },
        locations = {
            {
                x = 3169,
                z = 2912,
            },
        },
    },
    {
        name = "Allie",
        ids = {
            [31063] = true,
        },
        locations = {
            {
                x = 3137,
                z = 3515,
            },
        },
    },
    {
        name = "Almera",
        ids = {
            [304] = true,
        },
        locations = {
            {
                x = 2522,
                z = 3498,
            },
        },
    },
    {
        name = "Almost Master Crafter",
        ids = {
            [2732] = true,
            [2733] = true,
        },
        locations = {
            {
                x = 2935,
                z = 3280,
            },
            {
                x = 2937,
                z = 3290,
            },
        },
    },
    {
        name = "Alrena",
        ids = {
            [710] = true,
        },
        locations = {
            {
                x = 2573,
                z = 3333,
            },
        },
    },
    {
        name = "Amaethwr",
        ids = {
            [2860] = true,
        },
        locations = {
            {
                x = 2347,
                z = 3164,
            },
        },
    },
    {
        name = "Ambush Commander",
        ids = {
            [15104] = true,
        },
        locations = {
            {
                x = 2853,
                z = 3614,
            },
        },
    },
    {
        name = "Amelia",
        ids = {
            [3608] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3236,
            },
        },
    },
    {
        name = "Aminishi gem trader",
        ids = {
            [24434] = true,
        },
        locations = {
            {
                x = 3171,
                z = 2614,
            },
        },
    },
    {
        name = "Amunemen",
        ids = {
            [24698] = true,
        },
        locations = {
            {
                x = 3113,
                z = 2746,
            },
        },
    },
    {
        name = "Ana",
        ids = {
            [6077] = true,
        },
        locations = {
            {
                x = 3305,
                z = 3112,
            },
        },
    },
    {
        name = "Anahita",
        ids = {
            [28672] = true,
        },
        locations = {
            {
                x = 3385,
                z = 3255,
            },
        },
    },
    {
        name = "Ancient Necronium armour",
        ids = {
            [29471] = true,
            [29472] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3517,
            },
            {
                x = 2889,
                z = 3516,
            },
        },
    },
    {
        name = "Andrew Gower",
        ids = {
            [22790] = true,
        },
        locations = {
            {
                x = 3255,
                z = 3355,
            },
        },
    },
    {
        name = "Angof",
        ids = {},
        locations = {
            {
                x = 2377,
                z = 3373,
            },
        },
    },
    {
        name = "Angor",
        ids = {
            [259] = true,
        },
        locations = {
            {
                x = 2566,
                z = 3140,
            },
        },
    },
    {
        name = "Anhur",
        ids = {
            [24703] = true,
        },
        locations = {
            {
                x = 3109,
                z = 2725,
            },
        },
    },
    {
        name = "Anita",
        ids = {
            [672] = true,
        },
        locations = {
            {
                x = 2390,
                z = 3514,
            },
        },
    },
    {
        name = "Anna",
        ids = {
            [6192] = true,
        },
        locations = {
            {
                x = 2734,
                z = 3575,
            },
        },
    },
    {
        name = "Anna Jones",
        ids = {
            [5837] = true,
        },
        locations = {
            {
                x = 3285,
                z = 3468,
            },
        },
    },
    {
        name = "Anne Dimitri",
        ids = {
            [29616] = true,
        },
        locations = {
            {
                x = 3136,
                z = 3535,
            },
        },
    },
    {
        name = "Anne Isaakson",
        ids = {
            [5512] = true,
        },
        locations = {
            {
                x = 2320,
                z = 3798,
            },
        },
    },
    {
        name = "Anukat",
        ids = {
            [24407] = true,
        },
        locations = {
            {
                x = 3180,
                z = 2744,
            },
        },
    },
    {
        name = "Aoife",
        ids = {},
        locations = {
            {
                x = 3160,
                z = 3237,
            },
        },
    },
    {
        name = "Aoife Fairweather",
        ids = {
            [18203] = true,
        },
        locations = {
            {
                x = 2917,
                z = 3538,
            },
        },
    },
    {
        name = "Apothecary",
        ids = {
            [638] = true,
        },
        locations = {
            {
                x = 3195,
                z = 3404,
            },
        },
    },
    {
        name = "Apprentice",
        ids = {
            [5532] = true,
        },
        locations = {
            {
                x = 3321,
                z = 3139,
            },
        },
    },
    {
        name = "Apprentice Clara",
        ids = {
            [14906] = true,
        },
        locations = {
            {
                x = 2915,
                z = 3540,
            },
        },
    },
    {
        name = "Arboretum guard",
        ids = {
            [14117] = true,
            [14118] = true,
        },
        locations = {
            {
                x = 3617,
                z = 3363,
            },
            {
                x = 3617,
                z = 3366,
            },
        },
    },
    {
        name = "Archaeologist",
        ids = {
            [26328] = true,
            [26330] = true,
            [26332] = true,
        },
        locations = {
            {
                x = 3362,
                z = 3406,
            },
            {
                x = 3363,
                z = 3405,
            },
            {
                x = 3364,
                z = 3406,
            },
        },
    },
    {
        name = "Archer",
        ids = {
            [15090] = true,
            [32433] = true,
        },
        locations = {
            {
                x = 2852,
                z = 3608,
            },
            {
                x = 3149,
                z = 3204,
            },
        },
    },
    {
        name = "Argumentative man",
        ids = {},
        locations = {
            {
                x = 3082,
                z = 3502,
            },
        },
    },
    {
        name = "Arhein",
        ids = {
            [563] = true,
        },
        locations = {
            {
                x = 2803,
                z = 3426,
            },
        },
    },
    {
        name = "Arianwyn",
        ids = {
            [8951] = true,
        },
        locations = {
            {
                x = 2352,
                z = 3172,
            },
        },
    },
    {
        name = "Aris",
        ids = {
            [9362] = true,
        },
        locations = {
            {
                x = 3202,
                z = 3424,
            },
        },
    },
    {
        name = "Aristarchus",
        ids = {
            [3127] = true,
        },
        locations = {
            {
                x = 3338,
                z = 2961,
            },
        },
    },
    {
        name = "Armed monkey guard",
        ids = {
            [13194] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Armour salesman",
        ids = {
            [682] = true,
        },
        locations = {
            {
                x = 2667,
                z = 3436,
            },
        },
    },
    {
        name = "Arnold Lydspor",
        ids = {
            [3824] = true,
        },
        locations = {
            {
                x = 2330,
                z = 3691,
            },
        },
    },
    {
        name = "Arnor",
        ids = {
            [1361] = true,
        },
        locations = {
            {
                x = 2616,
                z = 3899,
            },
        },
    },
    {
        name = "Arresting officer",
        ids = {
            [11468] = true,
        },
        locations = {
            {
                x = 2739,
                z = 3467,
            },
        },
    },
    {
        name = "Artifax",
        ids = {},
        locations = {
            {
                x = 2893,
                z = 3417,
            },
        },
    },
    {
        name = "Artimeus",
        ids = {
            [5109] = true,
        },
        locations = {
            {
                x = 3443,
                z = 2902,
            },
        },
    },
    {
        name = "Arvel",
        ids = {
            [2365] = true,
        },
        locations = {
            {
                x = 2335,
                z = 3177,
            },
        },
    },
    {
        name = "Asgarnia Smith",
        ids = {
            [1918] = true,
        },
        locations = {
            {
                x = 3178,
                z = 3043,
            },
        },
    },
    {
        name = "Ash",
        ids = {
            [1100] = true,
        },
        locations = {
            {
                x = 2858,
                z = 3588,
            },
        },
    },
    {
        name = "Ashild",
        ids = {
            [1366] = true,
        },
        locations = {
            {
                x = 2603,
                z = 3858,
            },
        },
    },
    {
        name = "Askeladden",
        ids = {
            [1295] = true,
            [2439] = true,
        },
        locations = {
            {
                x = 2539,
                z = 3739,
            },
            {
                x = 2658,
                z = 3660,
            },
        },
    },
    {
        name = "Assassin",
        ids = {
            [9043] = true,
        },
        locations = {
            {
                x = 3378,
                z = 3442,
            },
        },
    },
    {
        name = "Assistant",
        ids = {
            [7726] = true,
            [13236] = true,
        },
        locations = {
            {
                x = 2996,
                z = 3451,
            },
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Assistant Brock",
        ids = {
            [5054] = true,
        },
        locations = {
            {
                x = 2922,
                z = 3301,
            },
        },
    },
    {
        name = "Assistant Le Smith",
        ids = {
            [5056] = true,
        },
        locations = {
            {
                x = 2479,
                z = 3459,
            },
        },
    },
    {
        name = "Assistant Librarian Subotai",
        ids = {
            [24405] = true,
        },
        locations = {
            {
                x = 3203,
                z = 2780,
            },
        },
    },
    {
        name = "Assistant Marrow",
        ids = {
            [5055] = true,
        },
        locations = {
            {
                x = 2461,
                z = 3108,
            },
        },
    },
    {
        name = "Assistant Professor",
        ids = {
            [26892] = true,
        },
        locations = {
            {
                x = 3351,
                z = 3360,
            },
        },
    },
    {
        name = "Assistant Serf",
        ids = {
            [5053] = true,
        },
        locations = {
            {
                x = 3296,
                z = 3481,
            },
        },
    },
    {
        name = "Assistant Stan",
        ids = {
            [5057] = true,
        },
        locations = {
            {
                x = 2928,
                z = 3409,
            },
        },
    },
    {
        name = "Associate Professor",
        ids = {
            [26894] = true,
        },
        locations = {
            {
                x = 3342,
                z = 3362,
            },
        },
    },
    {
        name = "Aster",
        ids = {
            [29809] = true,
            [29824] = true,
        },
        locations = {
            {
                x = 3216,
                z = 3405,
            },
            {
                x = 3302,
                z = 3571,
            },
        },
    },
    {
        name = "Astlayrix",
        ids = {
            [13104] = true,
        },
        locations = {
            {
                x = 2959,
                z = 2908,
            },
        },
    },
    {
        name = "Athletix",
        ids = {
            [27755] = true,
        },
        locations = {
            {
                x = 3322,
                z = 3350,
            },
        },
    },
    {
        name = "Aubury",
        ids = {
            [5913] = true,
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3253,
                z = 3402,
            },
        },
    },
    {
        name = "Auguste",
        ids = {
            [5049] = true,
        },
        locations = {
            {
                x = 2808,
                z = 3355,
            },
        },
    },
    {
        name = "Aurel",
        ids = {
            [3541] = true,
        },
        locations = {
            {
                x = 3517,
                z = 3241,
            },
        },
    },
    {
        name = "Austri",
        ids = {
            [232] = true,
        },
        locations = {
            {
                x = 2880,
                z = 3458,
            },
        },
    },
    {
        name = "Ava",
        ids = {
            [5199] = true,
        },
        locations = {
            {
                x = 3093,
                z = 3357,
            },
            {
                x = 3093,
                z = 3358,
            },
        },
    },
    {
        name = "Avalani",
        ids = {
            [13827] = true,
        },
        locations = {
            {
                x = 3178,
                z = 3478,
            },
        },
    },
    {
        name = "Avan",
        ids = {
            [663] = true,
        },
        locations = {
            {
                x = 3292,
                z = 3283,
            },
        },
    },
    {
        name = "Awusah the Mayor",
        ids = {
            [3040] = true,
        },
        locations = {
            {
                x = 3442,
                z = 2912,
            },
        },
    },
    {
        name = "Aya",
        ids = {},
        locations = {
            {
                x = 3335,
                z = 3208,
            },
        },
    },
    {
        name = "Ayesha",
        ids = {
            [15748] = true,
        },
        locations = {
            {
                x = 3317,
                z = 3205,
            },
        },
    },
    {
        name = "Ayleth Beaststalker",
        ids = {
            [14864] = true,
        },
        locations = {
            {
                x = 2929,
                z = 3507,
            },
        },
    },
    {
        name = "Azibo",
        ids = {
            [24762] = true,
        },
        locations = {
            {
                x = 3232,
                z = 2776,
            },
        },
    },
    {
        name = "Baba Yaga",
        ids = {
            [4513] = true,
        },
        locations = {
            {
                x = 2083,
                z = 3931,
            },
        },
    },
    {
        name = "Babe",
        ids = {
            [8204] = true,
        },
        locations = {
            {
                x = 3087,
                z = 3302,
            },
        },
    },
    {
        name = "Baby gecko (blue)",
        ids = {
            [7288] = true,
        },
        locations = {
            {
                x = 2817,
                z = 3050,
            },
            {
                x = 2821,
                z = 3046,
            },
            {
                x = 2824,
                z = 3048,
            },
            {
                x = 2825,
                z = 3042,
            },
            {
                x = 2831,
                z = 3046,
            },
        },
    },
    {
        name = "Baby gecko (green)",
        ids = {
            [7286] = true,
        },
        locations = {
            {
                x = 2925,
                z = 3104,
            },
            {
                x = 2927,
                z = 3098,
            },
            {
                x = 2930,
                z = 3092,
            },
            {
                x = 2933,
                z = 3101,
            },
            {
                x = 2935,
                z = 3096,
            },
        },
    },
    {
        name = "Baby gecko (orange)",
        ids = {
            [6917] = true,
        },
        locations = {
            {
                x = 2913,
                z = 3090,
            },
            {
                x = 2915,
                z = 3085,
            },
            {
                x = 2919,
                z = 3088,
            },
        },
    },
    {
        name = "Baby gecko (red)",
        ids = {
            [7287] = true,
        },
        locations = {
            {
                x = 2841,
                z = 2903,
            },
            {
                x = 2842,
                z = 2917,
            },
            {
                x = 2848,
                z = 2905,
            },
            {
                x = 2850,
                z = 2914,
            },
            {
                x = 2854,
                z = 2902,
            },
        },
    },
    {
        name = "Baby gecko (speckled)",
        ids = {
            [7285] = true,
        },
        locations = {
            {
                x = 2833,
                z = 3106,
            },
            {
                x = 2833,
                z = 3111,
            },
            {
                x = 2837,
                z = 3103,
            },
            {
                x = 2839,
                z = 3109,
            },
            {
                x = 2842,
                z = 3105,
            },
            {
                x = 2882,
                z = 3021,
            },
            {
                x = 2886,
                z = 3016,
            },
            {
                x = 2888,
                z = 3020,
            },
        },
    },
    {
        name = "Baby icefiend",
        ids = {},
        locations = {
            {
                x = 2997,
                z = 3469,
            },
            {
                x = 3004,
                z = 3471,
            },
            {
                x = 3006,
                z = 3479,
            },
            {
                x = 3007,
                z = 3486,
            },
        },
    },
    {
        name = "Baby monkey",
        ids = {
            [6944] = true,
            [7228] = true,
            [7229] = true,
            [7230] = true,
            [7231] = true,
            [7232] = true,
            [7233] = true,
            [7234] = true,
            [7235] = true,
            [7236] = true,
        },
        locations = {
            {
                x = 2797,
                z = 3003,
            },
            {
                x = 2800,
                z = 3108,
            },
            {
                x = 2803,
                z = 2996,
            },
            {
                x = 2804,
                z = 2990,
            },
            {
                x = 2804,
                z = 3004,
            },
            {
                x = 2804,
                z = 3100,
            },
            {
                x = 2806,
                z = 3110,
            },
            {
                x = 2808,
                z = 2999,
            },
            {
                x = 2809,
                z = 3101,
            },
            {
                x = 2812,
                z = 3105,
            },
            {
                x = 2821,
                z = 3052,
            },
            {
                x = 2822,
                z = 3063,
            },
            {
                x = 2823,
                z = 3058,
            },
            {
                x = 2824,
                z = 3051,
            },
            {
                x = 2829,
                z = 3058,
            },
            {
                x = 2832,
                z = 3088,
            },
            {
                x = 2834,
                z = 3089,
            },
            {
                x = 2836,
                z = 3013,
            },
            {
                x = 2838,
                z = 3077,
            },
            {
                x = 2838,
                z = 3081,
            },
            {
                x = 2840,
                z = 3036,
            },
            {
                x = 2841,
                z = 3021,
            },
            {
                x = 2842,
                z = 3029,
            },
            {
                x = 2842,
                z = 3091,
            },
            {
                x = 2852,
                z = 3027,
            },
            {
                x = 2866,
                z = 3100,
            },
            {
                x = 2873,
                z = 3094,
            },
            {
                x = 2882,
                z = 3104,
            },
            {
                x = 2883,
                z = 3095,
            },
            {
                x = 2886,
                z = 3103,
            },
            {
                x = 2890,
                z = 3051,
            },
            {
                x = 2893,
                z = 3055,
            },
            {
                x = 2898,
                z = 3056,
            },
            {
                x = 2899,
                z = 3037,
            },
            {
                x = 2901,
                z = 3100,
            },
            {
                x = 2903,
                z = 3109,
            },
            {
                x = 2905,
                z = 3047,
            },
            {
                x = 2907,
                z = 3105,
            },
            {
                x = 2908,
                z = 3110,
            },
            {
                x = 2910,
                z = 3106,
            },
            {
                x = 2923,
                z = 3075,
            },
            {
                x = 2923,
                z = 3082,
            },
            {
                x = 2926,
                z = 3080,
            },
            {
                x = 2927,
                z = 3072,
            },
            {
                x = 2930,
                z = 2960,
            },
            {
                x = 2930,
                z = 3077,
            },
            {
                x = 2933,
                z = 2963,
            },
            {
                x = 2934,
                z = 2968,
            },
            {
                x = 2939,
                z = 2975,
            },
            {
                x = 2941,
                z = 2962,
            },
        },
    },
    {
        name = "Baby monkey (beige)",
        ids = {
            [7230] = true,
        },
        locations = {
            {
                x = 2890,
                z = 3051,
            },
            {
                x = 2893,
                z = 3055,
            },
            {
                x = 2898,
                z = 3056,
            },
            {
                x = 2899,
                z = 3037,
            },
            {
                x = 2905,
                z = 3047,
            },
        },
    },
    {
        name = "Baby monkey (black and brown)",
        ids = {
            [7229] = true,
        },
        locations = {
            {
                x = 2832,
                z = 3088,
            },
            {
                x = 2834,
                z = 3089,
            },
            {
                x = 2838,
                z = 3077,
            },
            {
                x = 2838,
                z = 3081,
            },
            {
                x = 2842,
                z = 3091,
            },
        },
    },
    {
        name = "Baby monkey (black and white)",
        ids = {
            [7234] = true,
        },
        locations = {
            {
                x = 2901,
                z = 3100,
            },
            {
                x = 2903,
                z = 3109,
            },
            {
                x = 2907,
                z = 3105,
            },
            {
                x = 2908,
                z = 3110,
            },
            {
                x = 2910,
                z = 3106,
            },
        },
    },
    {
        name = "Baby monkey (blue and grey)",
        ids = {
            [7233] = true,
        },
        locations = {
            {
                x = 2923,
                z = 3075,
            },
            {
                x = 2923,
                z = 3082,
            },
            {
                x = 2926,
                z = 3080,
            },
            {
                x = 2927,
                z = 3072,
            },
            {
                x = 2930,
                z = 3077,
            },
        },
    },
    {
        name = "Baby monkey (blue and white)",
        ids = {
            [7236] = true,
        },
        locations = {
            {
                x = 2797,
                z = 3003,
            },
            {
                x = 2803,
                z = 2996,
            },
            {
                x = 2804,
                z = 2990,
            },
            {
                x = 2804,
                z = 3004,
            },
            {
                x = 2808,
                z = 2999,
            },
        },
    },
    {
        name = "Baby monkey (brown and beige)",
        ids = {
            [7228] = true,
        },
        locations = {
            {
                x = 2866,
                z = 3100,
            },
            {
                x = 2873,
                z = 3094,
            },
            {
                x = 2882,
                z = 3104,
            },
            {
                x = 2883,
                z = 3095,
            },
            {
                x = 2886,
                z = 3103,
            },
        },
    },
    {
        name = "Baby monkey (grey and beige)",
        ids = {
            [6944] = true,
        },
        locations = {
            {
                x = 2836,
                z = 3013,
            },
            {
                x = 2840,
                z = 3036,
            },
            {
                x = 2841,
                z = 3021,
            },
            {
                x = 2842,
                z = 3029,
            },
            {
                x = 2852,
                z = 3027,
            },
        },
    },
    {
        name = "Baby monkey (grey and white)",
        ids = {
            [7232] = true,
        },
        locations = {
            {
                x = 2800,
                z = 3108,
            },
            {
                x = 2804,
                z = 3100,
            },
            {
                x = 2806,
                z = 3110,
            },
            {
                x = 2809,
                z = 3101,
            },
            {
                x = 2812,
                z = 3105,
            },
        },
    },
    {
        name = "Baby monkey (orange)",
        ids = {
            [7235] = true,
        },
        locations = {
            {
                x = 2821,
                z = 3052,
            },
            {
                x = 2822,
                z = 3063,
            },
            {
                x = 2823,
                z = 3058,
            },
            {
                x = 2824,
                z = 3051,
            },
            {
                x = 2829,
                z = 3058,
            },
        },
    },
    {
        name = "Baby monkey (tan and beige)",
        ids = {
            [7231] = true,
        },
        locations = {
            {
                x = 2930,
                z = 2960,
            },
            {
                x = 2933,
                z = 2963,
            },
            {
                x = 2934,
                z = 2968,
            },
            {
                x = 2939,
                z = 2975,
            },
            {
                x = 2941,
                z = 2962,
            },
        },
    },
    {
        name = "Baby platypus",
        ids = {
            [7024] = true,
            [7025] = true,
            [7026] = true,
        },
        locations = {
            {
                x = 2523,
                z = 2823,
            },
            {
                x = 2537,
                z = 2820,
            },
            {
                x = 2543,
                z = 2822,
            },
        },
    },
    {
        name = "Baby raccoon",
        ids = {
            [6997] = true,
            [7275] = true,
            [7276] = true,
        },
        locations = {
            {
                x = 2719,
                z = 3443,
            },
            {
                x = 2721,
                z = 3449,
            },
            {
                x = 2724,
                z = 3440,
            },
            {
                x = 2909,
                z = 3380,
            },
            {
                x = 2911,
                z = 3372,
            },
            {
                x = 2914,
                z = 3380,
            },
            {
                x = 2928,
                z = 3381,
            },
            {
                x = 2931,
                z = 3379,
            },
            {
                x = 2994,
                z = 3255,
            },
            {
                x = 2995,
                z = 3252,
            },
            {
                x = 2997,
                z = 3255,
            },
            {
                x = 3002,
                z = 3250,
            },
            {
                x = 3003,
                z = 3255,
            },
            {
                x = 3048,
                z = 3429,
            },
            {
                x = 3054,
                z = 3426,
            },
            {
                x = 3055,
                z = 3432,
            },
            {
                x = 3059,
                z = 3421,
            },
            {
                x = 3061,
                z = 3429,
            },
            {
                x = 3306,
                z = 3412,
            },
            {
                x = 3307,
                z = 3417,
            },
            {
                x = 3308,
                z = 3408,
            },
            {
                x = 3310,
                z = 3412,
            },
            {
                x = 3312,
                z = 3413,
            },
            {
                x = 3313,
                z = 3418,
            },
        },
    },
    {
        name = "Baby Shakes",
        ids = {
            [8947] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3353,
            },
        },
    },
    {
        name = "Baby squirrel",
        ids = {
            [6921] = true,
            [7309] = true,
            [7310] = true,
            [7311] = true,
            [7312] = true,
        },
        locations = {
            {
                x = 2720,
                z = 3420,
            },
            {
                x = 2725,
                z = 3426,
            },
            {
                x = 2728,
                z = 3415,
            },
            {
                x = 2728,
                z = 3424,
            },
            {
                x = 2731,
                z = 3419,
            },
            {
                x = 2945,
                z = 3275,
            },
            {
                x = 2947,
                z = 3265,
            },
            {
                x = 2948,
                z = 3282,
            },
            {
                x = 2954,
                z = 3268,
            },
            {
                x = 2955,
                z = 3276,
            },
            {
                x = 2963,
                z = 3450,
            },
            {
                x = 2969,
                z = 3452,
            },
            {
                x = 2972,
                z = 3445,
            },
            {
                x = 2973,
                z = 3444,
            },
            {
                x = 2976,
                z = 3452,
            },
            {
                x = 3305,
                z = 3439,
            },
            {
                x = 3306,
                z = 3444,
            },
            {
                x = 3310,
                z = 3439,
            },
            {
                x = 3313,
                z = 3446,
            },
            {
                x = 3314,
                z = 3440,
            },
        },
    },
    {
        name = "Bacon addict",
        ids = {
            [17359] = true,
            [17361] = true,
            [17363] = true,
            [17365] = true,
        },
        locations = {
            {
                x = 3020,
                z = 3297,
            },
            {
                x = 3020,
                z = 3300,
            },
            {
                x = 3020,
                z = 3303,
            },
            {
                x = 3020,
                z = 3307,
            },
            {
                x = 3023,
                z = 3300,
            },
            {
                x = 3023,
                z = 3305,
            },
        },
    },
    {
        name = "Badir the Snake Charmer",
        ids = {
            [1872] = true,
        },
        locations = {
            {
                x = 3354,
                z = 2953,
            },
        },
    },
    {
        name = "Bailey",
        ids = {
            [695] = true,
        },
        locations = {
            {
                x = 2765,
                z = 3276,
            },
        },
    },
    {
        name = "Baker",
        ids = {
            [571] = true,
        },
        locations = {
            {
                x = 2669,
                z = 3310,
            },
        },
    },
    {
        name = "Balnea",
        ids = {
            [7047] = true,
        },
        locations = {
            {
                x = 2557,
                z = 2836,
            },
        },
    },
    {
        name = "Banafrit",
        ids = {
            [24711] = true,
        },
        locations = {
            {
                x = 3090,
                z = 2723,
            },
        },
    },
    {
        name = "Banana merchant",
        ids = {
            [13186] = true,
            [13187] = true,
            [13188] = true,
        },
        locations = {
            {
                x = 3221,
                z = 2987,
            },
            {
                x = 3222,
                z = 2990,
            },
            {
                x = 3228,
                z = 2993,
            },
        },
    },
    {
        name = "Bandit Leader",
        ids = {
            [1877] = true,
        },
        locations = {
            {
                x = 3353,
                z = 3002,
            },
        },
    },
    {
        name = "Bandit shopkeeper",
        ids = {
            [1917] = true,
        },
        locations = {
            {
                x = 3175,
                z = 2988,
            },
        },
    },
    {
        name = "Bank guard",
        ids = {
            [2574] = true,
        },
        locations = {
            {
                x = 3087,
                z = 3247,
            },
        },
    },
    {
        name = "Banker",
        ids = {
            [44] = true,
            [45] = true,
            [494] = true,
            [495] = true,
            [496] = true,
            [499] = true,
            [553] = true,
            [1036] = true,
            [1360] = true,
            [2354] = true,
            [2355] = true,
            [2718] = true,
            [2759] = true,
            [3198] = true,
            [3199] = true,
            [3418] = true,
            [4456] = true,
            [4457] = true,
            [4458] = true,
            [4459] = true,
            [6200] = true,
            [14923] = true,
            [14924] = true,
            [14925] = true,
            [23223] = true,
            [23224] = true,
            [24362] = true,
            [24543] = true,
            [24544] = true,
            [24545] = true,
            [24546] = true,
            [24855] = true,
            [24856] = true,
        },
        locations = {
            {
                x = 2351,
                z = 3161,
            },
            {
                x = 2353,
                z = 3161,
            },
            {
                x = 2583,
                z = 3422,
            },
            {
                x = 2583,
                z = 3423,
            },
            {
                x = 2614,
                z = 3330,
            },
            {
                x = 2615,
                z = 3091,
            },
            {
                x = 2615,
                z = 3092,
            },
            {
                x = 2615,
                z = 3094,
            },
            {
                x = 2616,
                z = 3330,
            },
            {
                x = 2619,
                z = 3330,
            },
            {
                x = 2621,
                z = 3895,
            },
            {
                x = 2657,
                z = 3280,
            },
            {
                x = 2657,
                z = 3283,
            },
            {
                x = 2657,
                z = 3286,
            },
            {
                x = 2676,
                z = 2679,
            },
            {
                x = 2678,
                z = 2682,
            },
            {
                x = 2721,
                z = 3495,
            },
            {
                x = 2722,
                z = 3495,
            },
            {
                x = 2724,
                z = 3495,
            },
            {
                x = 2727,
                z = 3495,
            },
            {
                x = 2728,
                z = 3495,
            },
            {
                x = 2729,
                z = 3495,
            },
            {
                x = 2731,
                z = 3377,
            },
            {
                x = 2732,
                z = 3379,
            },
            {
                x = 2732,
                z = 3381,
            },
            {
                x = 2733,
                z = 3377,
            },
            {
                x = 2793,
                z = 3438,
            },
            {
                x = 2793,
                z = 3440,
            },
            {
                x = 2793,
                z = 3441,
            },
            {
                x = 2851,
                z = 2954,
            },
            {
                x = 2853,
                z = 2955,
            },
            {
                x = 2873,
                z = 3416,
            },
            {
                x = 2873,
                z = 3417,
            },
            {
                x = 2873,
                z = 3418,
            },
            {
                x = 2945,
                z = 3366,
            },
            {
                x = 2946,
                z = 3366,
            },
            {
                x = 2947,
                z = 3366,
            },
            {
                x = 2948,
                z = 3366,
            },
            {
                x = 2949,
                z = 3366,
            },
            {
                x = 3010,
                z = 3353,
            },
            {
                x = 3011,
                z = 3353,
            },
            {
                x = 3012,
                z = 3353,
            },
            {
                x = 3013,
                z = 3353,
            },
            {
                x = 3014,
                z = 3353,
            },
            {
                x = 3015,
                z = 3353,
            },
            {
                x = 3090,
                z = 3241,
            },
            {
                x = 3090,
                z = 3242,
            },
            {
                x = 3090,
                z = 3244,
            },
            {
                x = 3090,
                z = 3245,
            },
            {
                x = 3096,
                z = 3489,
            },
            {
                x = 3096,
                z = 3491,
            },
            {
                x = 3096,
                z = 3493,
            },
            {
                x = 3097,
                z = 3494,
            },
            {
                x = 3147,
                z = 3448,
            },
            {
                x = 3148,
                z = 3448,
            },
            {
                x = 3159,
                z = 3490,
            },
            {
                x = 3163,
                z = 3486,
            },
            {
                x = 3166,
                z = 3497,
            },
            {
                x = 3170,
                z = 3493,
            },
            {
                x = 3180,
                z = 3433,
            },
            {
                x = 3180,
                z = 3436,
            },
            {
                x = 3180,
                z = 3438,
            },
            {
                x = 3180,
                z = 3440,
            },
            {
                x = 3180,
                z = 3442,
            },
            {
                x = 3180,
                z = 3444,
            },
            {
                x = 3191,
                z = 3435,
            },
            {
                x = 3191,
                z = 3437,
            },
            {
                x = 3191,
                z = 3439,
            },
            {
                x = 3191,
                z = 3441,
            },
            {
                x = 3191,
                z = 3443,
            },
            {
                x = 3191,
                z = 3445,
            },
            {
                x = 3208,
                z = 3222,
            },
            {
                x = 3233,
                z = 2757,
            },
            {
                x = 3235,
                z = 2756,
            },
            {
                x = 3235,
                z = 2765,
            },
            {
                x = 3237,
                z = 2765,
            },
            {
                x = 3251,
                z = 3418,
            },
            {
                x = 3252,
                z = 3418,
            },
            {
                x = 3253,
                z = 3418,
            },
            {
                x = 3254,
                z = 3418,
            },
            {
                x = 3255,
                z = 3418,
            },
            {
                x = 3256,
                z = 3418,
            },
            {
                x = 3268,
                z = 3170,
            },
            {
                x = 3269,
                z = 3170,
            },
            {
                x = 3270,
                z = 3170,
            },
            {
                x = 3271,
                z = 3170,
            },
            {
                x = 3272,
                z = 3170,
            },
            {
                x = 3514,
                z = 3479,
            },
            {
                x = 3514,
                z = 3481,
            },
            {
                x = 3682,
                z = 2981,
            },
            {
                x = 3682,
                z = 2982,
            },
            {
                x = 3682,
                z = 2983,
            },
        },
    },
    {
        name = "Banker (Etceteria)",
        ids = {},
        locations = {
            {
                x = 2620,
                z = 3895,
            },
        },
    },
    {
        name = "Baraek",
        ids = {
            [547] = true,
        },
        locations = {
            {
                x = 3217,
                z = 3435,
            },
        },
    },
    {
        name = "Barb-tailed kebbit",
        ids = {
            [5088] = true,
        },
        locations = {
            {
                x = 2565,
                z = 2903,
            },
            {
                x = 2567,
                z = 2903,
            },
            {
                x = 2572,
                z = 2929,
            },
            {
                x = 2572,
                z = 2931,
            },
            {
                x = 2573,
                z = 2896,
            },
            {
                x = 2573,
                z = 2898,
            },
            {
                x = 2574,
                z = 2909,
            },
            {
                x = 2574,
                z = 2911,
            },
            {
                x = 2575,
                z = 2916,
            },
            {
                x = 2575,
                z = 2926,
            },
            {
                x = 2577,
                z = 2926,
            },
            {
                x = 2581,
                z = 2884,
            },
            {
                x = 2581,
                z = 2886,
            },
            {
                x = 2584,
                z = 2912,
            },
            {
                x = 2584,
                z = 2914,
            },
        },
    },
    {
        name = "Barbarian guard",
        ids = {
            [384] = true,
        },
        locations = {
            {
                x = 2544,
                z = 3567,
            },
            {
                x = 2544,
                z = 3571,
            },
        },
    },
    {
        name = "Bard Roberts",
        ids = {
            [3509] = true,
        },
        locations = {
            {
                x = 3048,
                z = 3259,
            },
            {
                x = 3667,
                z = 2984,
            },
        },
    },
    {
        name = "Barfy Bill",
        ids = {
            [3331] = true,
        },
        locations = {
            {
                x = 3231,
                z = 3252,
            },
        },
    },
    {
        name = "Barker",
        ids = {
            [1039] = true,
        },
        locations = {
            {
                x = 3499,
                z = 3506,
            },
        },
    },
    {
        name = "Barnabus Hurma",
        ids = {
            [5932] = true,
        },
        locations = {
            {
                x = 3255,
                z = 3442,
            },
        },
    },
    {
        name = "Barr Rows",
        ids = {
            [16098] = true,
        },
        locations = {
            {
                x = 3212,
                z = 3260,
            },
        },
    },
    {
        name = "Bartender",
        ids = {
            [731] = true,
            [732] = true,
            [733] = true,
            [735] = true,
            [737] = true,
            [738] = true,
            [739] = true,
            [1921] = true,
            [24553] = true,
        },
        locations = {
            {
                x = 2556,
                z = 3078,
            },
            {
                x = 2574,
                z = 3319,
            },
            {
                x = 2690,
                z = 3493,
            },
            {
                x = 2797,
                z = 3155,
            },
            {
                x = 3045,
                z = 3257,
            },
            {
                x = 3049,
                z = 3257,
            },
            {
                x = 3159,
                z = 2981,
            },
            {
                x = 3178,
                z = 2647,
            },
            {
                x = 3226,
                z = 3399,
            },
            {
                x = 3268,
                z = 3393,
            },
            {
                x = 3277,
                z = 3488,
            },
        },
    },
    {
        name = "Batal (Worker)",
        ids = {
            [24488] = true,
        },
        locations = {
            {
                x = 3151,
                z = 2790,
            },
        },
    },
    {
        name = "Bayek",
        ids = {},
        locations = {
            {
                x = 3333,
                z = 3210,
            },
        },
    },
    {
        name = "Bedabin nomad",
        ids = {
            [833] = true,
        },
        locations = {
            {
                x = 3159,
                z = 3042,
            },
            {
                x = 3160,
                z = 3039,
            },
            {
                x = 3163,
                z = 3035,
            },
            {
                x = 3169,
                z = 3030,
            },
            {
                x = 3172,
                z = 3031,
            },
            {
                x = 3173,
                z = 3035,
            },
            {
                x = 3176,
                z = 3038,
            },
            {
                x = 3176,
                z = 3043,
            },
        },
    },
    {
        name = "Bedabin nomad guard",
        ids = {
            [834] = true,
        },
        locations = {
            {
                x = 3170,
                z = 3045,
            },
        },
    },
    {
        name = "Bedread the bold",
        ids = {
            [4547] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "Beefy Bill",
        ids = {
            [246] = true,
        },
        locations = {
            {
                x = 3180,
                z = 3320,
            },
        },
    },
    {
        name = "Beekeeper",
        ids = {
            [16840] = true,
        },
        locations = {
            {
                x = 2759,
                z = 3443,
            },
        },
    },
    {
        name = "Bees",
        ids = {
            [16841] = true,
        },
        locations = {
            {
                x = 2681,
                z = 3338,
            },
            {
                x = 2681,
                z = 3342,
            },
            {
                x = 2754,
                z = 3439,
            },
            {
                x = 2755,
                z = 3448,
            },
            {
                x = 2763,
                z = 3443,
            },
        },
    },
    {
        name = "Beggar",
        ids = {
            [252] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3247,
            },
        },
    },
    {
        name = "Bellemorde",
        ids = {
            [2942] = true,
        },
        locations = {
            {
                x = 3019,
                z = 3233,
            },
        },
    },
    {
        name = "Belligerent man",
        ids = {},
        locations = {
            {
                x = 3084,
                z = 3502,
            },
        },
    },
    {
        name = "Benedict",
        ids = {
            [22549] = true,
        },
        locations = {
            {
                x = 3206,
                z = 3387,
            },
        },
    },
    {
        name = "Benny",
        ids = {
            [5925] = true,
        },
        locations = {
            {
                x = 3219,
                z = 3432,
            },
        },
    },
    {
        name = "Bentamir",
        ids = {
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
        },
    },
    {
        name = "Bernald",
        ids = {
            [2580] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3436,
            },
        },
    },
    {
        name = "Bert",
        ids = {
            [3108] = true,
        },
        locations = {
            {
                x = 2550,
                z = 3100,
            },
        },
    },
    {
        name = "Bettamax",
        ids = {
            [13106] = true,
        },
        locations = {
            {
                x = 2884,
                z = 3425,
            },
        },
    },
    {
        name = "Betty",
        ids = {
            [583] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 3012,
                z = 3259,
            },
        },
    },
    {
        name = "Big Dave",
        ids = {
            [228] = true,
        },
        locations = {
            {
                x = 2634,
                z = 3425,
            },
        },
    },
    {
        name = "Bill",
        ids = {
            [42] = true,
            [29806] = true,
        },
        locations = {
            {
                x = 3216,
                z = 3259,
            },
            {
                x = 3288,
                z = 3556,
            },
        },
    },
    {
        name = "Bill Blakey",
        ids = {
            [8722] = true,
        },
        locations = {
            {
                x = 3424,
                z = 3320,
            },
        },
    },
    {
        name = "Billy",
        ids = {
            [1093] = true,
        },
        locations = {
            {
                x = 2816,
                z = 3559,
            },
        },
    },
    {
        name = "Billy Rehnison",
        ids = {
            [723] = true,
        },
        locations = {
            {
                x = 2530,
                z = 3331,
            },
        },
    },
    {
        name = "Bjorn",
        ids = {
            [1284] = true,
        },
        locations = {
            {
                x = 2655,
                z = 3673,
            },
        },
    },
    {
        name = "Black lamb",
        ids = {
            [32643] = true,
        },
        locations = {
            {
                x = 3190,
                z = 3290,
            },
        },
    },
    {
        name = "Black salamander",
        ids = {
            [5116] = true,
        },
        locations = {
            {
                x = 3294,
                z = 3676,
            },
            {
                x = 3296,
                z = 3678,
            },
            {
                x = 3298,
                z = 3665,
            },
            {
                x = 3298,
                z = 3669,
            },
            {
                x = 3299,
                z = 3684,
            },
            {
                x = 3300,
                z = 3666,
            },
            {
                x = 3300,
                z = 3682,
            },
            {
                x = 3305,
                z = 3661,
            },
            {
                x = 3307,
                z = 3662,
            },
            {
                x = 3319,
                z = 3662,
            },
            {
                x = 3321,
                z = 3661,
            },
        },
    },
    {
        name = "Black warlock",
        ids = {
            [5082] = true,
        },
        locations = {
            {
                x = 2524,
                z = 2906,
            },
            {
                x = 2528,
                z = 2911,
            },
            {
                x = 2532,
                z = 2905,
            },
            {
                x = 2535,
                z = 2900,
            },
            {
                x = 2540,
                z = 2898,
            },
            {
                x = 2540,
                z = 2914,
            },
            {
                x = 2544,
                z = 2906,
            },
            {
                x = 2550,
                z = 2893,
            },
            {
                x = 2551,
                z = 2901,
            },
            {
                x = 2551,
                z = 2915,
            },
            {
                x = 2556,
                z = 2910,
            },
            {
                x = 2558,
                z = 2914,
            },
            {
                x = 2563,
                z = 2920,
            },
            {
                x = 2566,
                z = 2886,
            },
        },
    },
    {
        name = "Blackjack seller",
        ids = {
            [1876] = true,
        },
        locations = {
            {
                x = 3352,
                z = 2970,
            },
        },
    },
    {
        name = "Blacklock",
        ids = {
            [26340] = true,
        },
        locations = {
            {
                x = 3030,
                z = 3549,
            },
        },
    },
    {
        name = "Blair",
        ids = {
            [29341] = true,
        },
        locations = {
            {
                x = 3119,
                z = 3519,
            },
        },
    },
    {
        name = "Blanin",
        ids = {
            [2940] = true,
        },
        locations = {
            {
                x = 2675,
                z = 3671,
            },
        },
    },
    {
        name = "Blaze Sharpeye",
        ids = {
            [8065] = true,
        },
        locations = {
            {
                x = 3394,
                z = 3469,
            },
        },
    },
    {
        name = "Blood tither",
        ids = {
            [14155] = true,
        },
        locations = {
            {
                x = 3606,
                z = 3365,
            },
        },
    },
    {
        name = "Blue wisp",
        ids = {
            [25454] = true,
        },
        locations = {
            {
                x = 2228,
                z = 2839,
            },
            {
                x = 2240,
                z = 2876,
            },
            {
                x = 2314,
                z = 2868,
            },
        },
    },
    {
        name = "Bob",
        ids = {
            [519] = true,
            [6193] = true,
        },
        locations = {
            {
                x = 2748,
                z = 3559,
            },
            {
                x = 3228,
                z = 3203,
            },
        },
    },
    {
        name = "Bob Barter (herbs)",
        ids = {
            [6524] = true,
        },
        locations = {
            {
                x = 3148,
                z = 3498,
            },
        },
    },
    {
        name = "Bogrog",
        ids = {
            [4472] = true,
        },
        locations = {
            {
                x = 2523,
                z = 3057,
            },
        },
    },
    {
        name = "Bolongo",
        ids = {
            [2343] = true,
        },
        locations = {
            {
                x = 2474,
                z = 3446,
            },
        },
    },
    {
        name = "Bonafido",
        ids = {
            [5580] = true,
        },
        locations = {
            {
                x = 2650,
                z = 3227,
            },
        },
    },
    {
        name = "Bones",
        ids = {
            [2945] = true,
        },
        locations = {
            {
                x = 2562,
                z = 3319,
            },
        },
    },
    {
        name = "Bonzo",
        ids = {
            [225] = true,
        },
        locations = {
            {
                x = 2641,
                z = 3437,
            },
        },
    },
    {
        name = "Booth imp",
        ids = {
            [8881] = true,
        },
        locations = {
            {
                x = 2928,
                z = 3325,
            },
        },
    },
    {
        name = "Boric",
        ids = {
            [4231] = true,
        },
        locations = {
            {
                x = 2960,
                z = 3440,
            },
        },
    },
    {
        name = "Boris Barrington",
        ids = {
            [3611] = true,
        },
        locations = {
            {
                x = 3637,
                z = 3390,
            },
        },
    },
    {
        name = "Bosun Higgs",
        ids = {
            [22948] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3256,
            },
        },
    },
    {
        name = "Bouquet Mac Hyacinth",
        ids = {
            [4526] = true,
        },
        locations = {
            {
                x = 2109,
                z = 3920,
            },
        },
    },
    {
        name = "Bow and Arrow salesman",
        ids = {
            [683] = true,
        },
        locations = {
            {
                x = 2673,
                z = 3434,
            },
        },
    },
    {
        name = "Bowloftrix",
        ids = {
            [15056] = true,
        },
        locations = {
            {
                x = 2922,
                z = 3445,
            },
        },
    },
    {
        name = "Brambickle",
        ids = {
            [4576] = true,
        },
        locations = {
            {
                x = 2786,
                z = 3862,
            },
        },
    },
    {
        name = "Breadstix",
        ids = {
            [31814] = true,
        },
        locations = {
            {
                x = 3161,
                z = 3356,
            },
        },
    },
    {
        name = "Brendt",
        ids = {
            [19653] = true,
        },
        locations = {
            {
                x = 2408,
                z = 3815,
            },
        },
    },
    {
        name = "Breoca",
        ids = {
            [1084] = true,
        },
        locations = {
            {
                x = 2921,
                z = 3546,
            },
        },
    },
    {
        name = "Brian",
        ids = {
            [559] = true,
            [1860] = true,
        },
        locations = {
            {
                x = 2958,
                z = 3192,
            },
            {
                x = 3025,
                z = 3249,
            },
        },
    },
    {
        name = "Brian Twitcher",
        ids = {
            [8579] = true,
        },
        locations = {
            {
                x = 2292,
                z = 3626,
            },
        },
    },
    {
        name = "Bright wisp",
        ids = {},
        locations = {
            {
                x = 3289,
                z = 3390,
            },
            {
                x = 3291,
                z = 3392,
            },
            {
                x = 3296,
                z = 3392,
            },
            {
                x = 3296,
                z = 3393,
            },
            {
                x = 3297,
                z = 3390,
            },
            {
                x = 3304,
                z = 3392,
            },
            {
                x = 3304,
                z = 3393,
            },
            {
                x = 3307,
                z = 3390,
            },
            {
                x = 3307,
                z = 3393,
            },
            {
                x = 3307,
                z = 3394,
            },
            {
                x = 3308,
                z = 3397,
            },
            {
                x = 3308,
                z = 3398,
            },
            {
                x = 3309,
                z = 3393,
            },
        },
    },
    {
        name = "Brilliant wisp",
        ids = {},
        locations = {
            {
                x = 3393,
                z = 3304,
            },
            {
                x = 3394,
                z = 3305,
            },
            {
                x = 3394,
                z = 3311,
            },
            {
                x = 3395,
                z = 3301,
            },
            {
                x = 3395,
                z = 3302,
            },
            {
                x = 3396,
                z = 3303,
            },
            {
                x = 3396,
                z = 3304,
            },
            {
                x = 3396,
                z = 3307,
            },
            {
                x = 3397,
                z = 3295,
            },
            {
                x = 3397,
                z = 3305,
            },
            {
                x = 3397,
                z = 3308,
            },
            {
                x = 3399,
                z = 3303,
            },
        },
    },
    {
        name = "Brother Althric",
        ids = {
            [2588] = true,
        },
        locations = {
            {
                x = 3049,
                z = 3504,
            },
        },
    },
    {
        name = "Brother Bordiss",
        ids = {
            [7718] = true,
            [7724] = true,
        },
        locations = {
            {
                x = 2996,
                z = 3450,
            },
            {
                x = 3049,
                z = 3505,
            },
        },
    },
    {
        name = "Brother Cedric",
        ids = {
            [280] = true,
        },
        locations = {
            {
                x = 2618,
                z = 3244,
            },
        },
    },
    {
        name = "Brother Celerity",
        ids = {
            [16725] = true,
        },
        locations = {
            {
                x = 3058,
                z = 3497,
            },
        },
    },
    {
        name = "Brother Fintan",
        ids = {
            [8071] = true,
        },
        locations = {
            {
                x = 3036,
                z = 3517,
            },
        },
    },
    {
        name = "Brother Kojo",
        ids = {
            [223] = true,
        },
        locations = {
            {
                x = 2569,
                z = 3249,
            },
        },
    },
    {
        name = "Brother Maledict",
        ids = {
            [4855] = true,
        },
        locations = {
            {
                x = 2722,
                z = 3283,
            },
        },
    },
    {
        name = "Brother Omad",
        ids = {
            [279] = true,
        },
        locations = {
            {
                x = 2604,
                z = 3209,
            },
        },
    },
    {
        name = "Brother Samwell",
        ids = {
            [18457] = true,
        },
        locations = {
            {
                x = 3380,
                z = 3486,
            },
        },
    },
    {
        name = "Brother Tranquillity",
        ids = {
            [5667] = true,
            [5668] = true,
        },
        locations = {
            {
                x = 3681,
                z = 2963,
            },
            {
                x = 3787,
                z = 2824,
            },
        },
    },
    {
        name = "Bruce",
        ids = {
            [25568] = true,
        },
        locations = {
            {
                x = 3087,
                z = 3505,
            },
        },
    },
    {
        name = "Brugsen Bursen",
        ids = {
            [6522] = true,
        },
        locations = {
            {
                x = 3165,
                z = 3469,
            },
        },
    },
    {
        name = "Bruin Odetsson",
        ids = {
            [18199] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3232,
            },
        },
    },
    {
        name = "Brundt",
        ids = {
            [5502] = true,
        },
        locations = {
            {
                x = 2406,
                z = 3816,
            },
        },
    },
    {
        name = "Brundt the Chieftain",
        ids = {
            [1294] = true,
        },
        locations = {
            {
                x = 2658,
                z = 3667,
            },
        },
    },
    {
        name = "Bryll Thoksdottir",
        ids = {
            [14889] = true,
            [25616] = true,
            [25632] = true,
            [25685] = true,
        },
        locations = {
            {
                x = 2858,
                z = 3406,
            },
            {
                x = 3367,
                z = 3888,
            },
            {
                x = 3441,
                z = 3696,
            },
            {
                x = 4771,
                z = 3403,
            },
        },
    },
    {
        name = "Bunkdo",
        ids = {
            [1415] = true,
        },
        locations = {
            {
                x = 2775,
                z = 2798,
            },
        },
    },
    {
        name = "Bunny boy",
        ids = {
            [30840] = true,
        },
        locations = {
            {
                x = 2886,
                z = 3518,
            },
        },
    },
    {
        name = "Butler",
        ids = {
            [11306] = true,
        },
        locations = {
            {
                x = 2671,
                z = 3330,
            },
        },
    },
    {
        name = "Butler Crichton",
        ids = {
            [15607] = true,
        },
        locations = {
            {
                x = 2568,
                z = 3273,
            },
        },
    },
    {
        name = "Butler Jones",
        ids = {
            [890] = true,
        },
        locations = {
            {
                x = 2569,
                z = 3272,
            },
        },
    },
    {
        name = "Butterfly",
        ids = {
            [153] = true,
            [154] = true,
            [155] = true,
            [156] = true,
            [157] = true,
            [23913] = true,
        },
        locations = {
            {
                x = 2176,
                z = 3202,
            },
            {
                x = 2177,
                z = 3234,
            },
            {
                x = 2178,
                z = 3203,
            },
            {
                x = 2178,
                z = 3206,
            },
            {
                x = 2180,
                z = 3173,
            },
            {
                x = 2180,
                z = 3203,
            },
            {
                x = 2180,
                z = 3207,
            },
            {
                x = 2182,
                z = 3201,
            },
            {
                x = 2190,
                z = 3180,
            },
            {
                x = 2193,
                z = 3187,
            },
            {
                x = 2194,
                z = 3158,
            },
            {
                x = 2196,
                z = 3184,
            },
            {
                x = 2196,
                z = 3191,
            },
            {
                x = 2197,
                z = 3189,
            },
            {
                x = 2198,
                z = 3181,
            },
            {
                x = 2198,
                z = 3187,
            },
            {
                x = 2199,
                z = 3183,
            },
            {
                x = 2199,
                z = 3185,
            },
            {
                x = 2199,
                z = 3187,
            },
            {
                x = 2200,
                z = 3181,
            },
            {
                x = 2200,
                z = 3188,
            },
            {
                x = 2201,
                z = 3183,
            },
            {
                x = 2203,
                z = 3189,
            },
            {
                x = 2204,
                z = 3180,
            },
            {
                x = 2207,
                z = 3215,
            },
            {
                x = 2207,
                z = 3224,
            },
            {
                x = 2209,
                z = 3222,
            },
            {
                x = 2211,
                z = 3218,
            },
            {
                x = 2212,
                z = 3222,
            },
            {
                x = 2213,
                z = 3216,
            },
            {
                x = 2216,
                z = 3188,
            },
            {
                x = 2216,
                z = 3240,
            },
            {
                x = 2216,
                z = 3242,
            },
            {
                x = 2217,
                z = 3190,
            },
            {
                x = 2217,
                z = 3244,
            },
            {
                x = 2218,
                z = 3236,
            },
            {
                x = 2218,
                z = 3238,
            },
            {
                x = 2218,
                z = 3241,
            },
            {
                x = 2220,
                z = 3158,
            },
            {
                x = 2220,
                z = 3240,
            },
            {
                x = 2220,
                z = 3242,
            },
            {
                x = 2222,
                z = 3141,
            },
            {
                x = 2222,
                z = 3237,
            },
            {
                x = 2229,
                z = 3138,
            },
            {
                x = 2230,
                z = 3220,
            },
            {
                x = 2231,
                z = 3181,
            },
            {
                x = 2231,
                z = 3234,
            },
            {
                x = 2232,
                z = 3256,
            },
            {
                x = 2233,
                z = 3221,
            },
            {
                x = 2233,
                z = 3223,
            },
            {
                x = 2236,
                z = 3155,
            },
            {
                x = 2236,
                z = 3222,
            },
            {
                x = 2237,
                z = 3225,
            },
            {
                x = 2238,
                z = 3205,
            },
            {
                x = 2240,
                z = 3148,
            },
            {
                x = 2241,
                z = 3139,
            },
            {
                x = 2241,
                z = 3144,
            },
            {
                x = 2242,
                z = 3143,
            },
            {
                x = 2242,
                z = 3150,
            },
            {
                x = 2242,
                z = 3151,
            },
            {
                x = 2243,
                z = 3140,
            },
            {
                x = 2244,
                z = 3137,
            },
            {
                x = 2244,
                z = 3138,
            },
            {
                x = 2244,
                z = 3144,
            },
            {
                x = 2244,
                z = 3146,
            },
            {
                x = 2244,
                z = 3179,
            },
            {
                x = 2245,
                z = 3137,
            },
            {
                x = 2245,
                z = 3139,
            },
            {
                x = 2245,
                z = 3141,
            },
            {
                x = 2245,
                z = 3146,
            },
            {
                x = 2246,
                z = 3139,
            },
            {
                x = 2246,
                z = 3142,
            },
            {
                x = 2246,
                z = 3181,
            },
            {
                x = 2247,
                z = 3138,
            },
            {
                x = 2247,
                z = 3141,
            },
            {
                x = 2247,
                z = 3143,
            },
            {
                x = 2247,
                z = 3144,
            },
            {
                x = 2247,
                z = 3147,
            },
            {
                x = 2247,
                z = 3177,
            },
            {
                x = 2249,
                z = 3142,
            },
            {
                x = 2249,
                z = 3143,
            },
            {
                x = 2249,
                z = 3260,
            },
            {
                x = 2250,
                z = 3137,
            },
            {
                x = 2250,
                z = 3177,
            },
            {
                x = 2250,
                z = 3180,
            },
            {
                x = 2250,
                z = 3257,
            },
            {
                x = 2250,
                z = 3259,
            },
            {
                x = 2251,
                z = 3138,
            },
            {
                x = 2251,
                z = 3141,
            },
            {
                x = 2252,
                z = 3139,
            },
            {
                x = 2252,
                z = 3140,
            },
            {
                x = 2252,
                z = 3261,
            },
            {
                x = 2253,
                z = 3141,
            },
            {
                x = 2253,
                z = 3256,
            },
            {
                x = 2254,
                z = 3137,
            },
            {
                x = 2254,
                z = 3139,
            },
            {
                x = 2254,
                z = 3140,
            },
            {
                x = 2255,
                z = 3175,
            },
            {
                x = 2255,
                z = 3216,
            },
            {
                x = 2256,
                z = 3173,
            },
            {
                x = 2257,
                z = 3177,
            },
            {
                x = 2260,
                z = 3543,
            },
            {
                x = 2262,
                z = 3210,
            },
            {
                x = 2262,
                z = 3226,
            },
            {
                x = 2264,
                z = 3225,
            },
            {
                x = 2266,
                z = 3229,
            },
            {
                x = 2267,
                z = 3541,
            },
            {
                x = 2268,
                z = 3227,
            },
            {
                x = 2268,
                z = 3228,
            },
            {
                x = 2269,
                z = 3222,
            },
            {
                x = 2269,
                z = 3224,
            },
            {
                x = 2270,
                z = 3223,
            },
            {
                x = 2270,
                z = 3226,
            },
            {
                x = 2271,
                z = 3204,
            },
            {
                x = 2275,
                z = 3161,
            },
            {
                x = 2277,
                z = 3184,
            },
            {
                x = 2278,
                z = 3141,
            },
            {
                x = 2279,
                z = 3137,
            },
            {
                x = 2281,
                z = 3139,
            },
            {
                x = 2282,
                z = 3147,
            },
            {
                x = 2282,
                z = 3536,
            },
            {
                x = 2284,
                z = 3140,
            },
            {
                x = 2284,
                z = 3151,
            },
            {
                x = 2286,
                z = 3146,
            },
            {
                x = 2286,
                z = 3541,
            },
            {
                x = 2287,
                z = 3150,
            },
            {
                x = 2287,
                z = 3153,
            },
            {
                x = 2288,
                z = 3562,
            },
            {
                x = 2290,
                z = 3154,
            },
            {
                x = 2291,
                z = 3179,
            },
            {
                x = 2296,
                z = 3164,
            },
            {
                x = 2296,
                z = 3563,
            },
            {
                x = 2297,
                z = 3554,
            },
            {
                x = 2298,
                z = 3547,
            },
            {
                x = 2322,
                z = 3168,
            },
            {
                x = 2323,
                z = 3172,
            },
            {
                x = 2323,
                z = 3175,
            },
            {
                x = 2327,
                z = 3171,
            },
            {
                x = 2339,
                z = 3169,
            },
            {
                x = 2340,
                z = 3161,
            },
            {
                x = 2342,
                z = 3181,
            },
            {
                x = 2345,
                z = 3165,
            },
            {
                x = 2345,
                z = 3168,
            },
            {
                x = 2350,
                z = 3157,
            },
            {
                x = 2371,
                z = 3460,
            },
            {
                x = 2372,
                z = 3456,
            },
            {
                x = 2374,
                z = 3469,
            },
            {
                x = 2376,
                z = 3466,
            },
            {
                x = 2378,
                z = 3418,
            },
            {
                x = 2380,
                z = 3422,
            },
            {
                x = 2392,
                z = 3442,
            },
            {
                x = 2397,
                z = 3440,
            },
            {
                x = 2416,
                z = 3404,
            },
            {
                x = 2422,
                z = 3467,
            },
            {
                x = 2422,
                z = 3489,
            },
            {
                x = 2423,
                z = 3399,
            },
            {
                x = 2424,
                z = 3410,
            },
            {
                x = 2425,
                z = 3406,
            },
            {
                x = 2427,
                z = 3402,
            },
            {
                x = 2430,
                z = 3405,
            },
            {
                x = 2434,
                z = 3516,
            },
            {
                x = 2437,
                z = 3425,
            },
            {
                x = 2438,
                z = 3422,
            },
            {
                x = 2444,
                z = 3491,
            },
            {
                x = 2446,
                z = 3396,
            },
            {
                x = 2447,
                z = 3467,
            },
            {
                x = 2448,
                z = 3469,
            },
            {
                x = 2450,
                z = 3419,
            },
            {
                x = 2470,
                z = 3398,
            },
            {
                x = 2478,
                z = 3373,
            },
            {
                x = 2479,
                z = 3381,
            },
            {
                x = 2479,
                z = 3394,
            },
            {
                x = 2479,
                z = 3501,
            },
            {
                x = 2481,
                z = 3384,
            },
            {
                x = 2490,
                z = 3371,
            },
            {
                x = 2540,
                z = 3167,
            },
            {
                x = 2549,
                z = 3139,
            },
            {
                x = 2556,
                z = 3444,
            },
            {
                x = 2954,
                z = 3210,
            },
            {
                x = 2954,
                z = 3227,
            },
            {
                x = 2958,
                z = 3202,
            },
            {
                x = 2958,
                z = 3213,
            },
            {
                x = 2960,
                z = 3221,
            },
            {
                x = 3233,
                z = 3216,
            },
            {
                x = 3255,
                z = 3226,
            },
        },
    },
    {
        name = "Cabbage",
        ids = {
            [22806] = true,
        },
        locations = {
            {
                x = 3239,
                z = 3342,
            },
            {
                x = 3241,
                z = 3342,
            },
            {
                x = 3243,
                z = 3342,
            },
        },
    },
    {
        name = "Cabbage dummy",
        ids = {
            [16520] = true,
            [23160] = true,
        },
        locations = {
            {
                x = 3288,
                z = 3556,
            },
            {
                x = 3315,
                z = 3569,
            },
        },
    },
    {
        name = "Cabin boy",
        ids = {
            [4539] = true,
        },
        locations = {
            {
                x = 2082,
                z = 3926,
            },
        },
    },
    {
        name = "Cabin boy Jenkins",
        ids = {
            [748] = true,
        },
        locations = {
            {
                x = 3048,
                z = 3208,
            },
        },
    },
    {
        name = "Caden Azro",
        ids = {
            [5934] = true,
        },
        locations = {
            {
                x = 3259,
                z = 3443,
            },
        },
    },
    {
        name = "Caleb",
        ids = {
            [666] = true,
        },
        locations = {
            {
                x = 3156,
                z = 3409,
            },
        },
    },
    {
        name = "Calin",
        ids = {
            [21522] = true,
        },
        locations = {
            {
                x = 3498,
                z = 3242,
            },
        },
    },
    {
        name = "Callia",
        ids = {
            [8942] = true,
        },
        locations = {
            {
                x = 2672,
                z = 3374,
            },
        },
    },
    {
        name = "Cam the Camel",
        ids = {
            [2812] = true,
        },
        locations = {
            {
                x = 3287,
                z = 3236,
            },
        },
    },
    {
        name = "Camel",
        ids = {
            [80] = true,
        },
        locations = {
            {
                x = 2615,
                z = 3266,
            },
            {
                x = 2619,
                z = 3265,
            },
            {
                x = 2621,
                z = 3266,
            },
            {
                x = 3173,
                z = 3039,
            },
            {
                x = 3310,
                z = 3269,
            },
        },
    },
    {
        name = "Camel Cart",
        ids = {},
        locations = {
            {
                x = 3286,
                z = 3022,
            },
        },
    },
    {
        name = "Candle-maker",
        ids = {
            [562] = true,
        },
        locations = {
            {
                x = 2795,
                z = 3428,
            },
        },
    },
    {
        name = "Canifis settler",
        ids = {
            [14166] = true,
            [14167] = true,
        },
        locations = {
            {
                x = 3647,
                z = 3336,
            },
            {
                x = 3658,
                z = 3357,
            },
        },
    },
    {
        name = "Cap'n Arnav",
        ids = {
            [16842] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3196,
            },
        },
    },
    {
        name = "Cap'n Hand",
        ids = {
            [23027] = true,
        },
        locations = {
            {
                x = 3015,
                z = 3192,
            },
        },
    },
    {
        name = "Cap'n Izzy No-Beard",
        ids = {
            [437] = true,
        },
        locations = {
            {
                x = 2807,
                z = 3190,
            },
        },
    },
    {
        name = "Captain Barnaby",
        ids = {
            [4961] = true,
        },
        locations = {
            {
                x = 2683,
                z = 3275,
            },
        },
    },
    {
        name = "Captain Belmondo",
        ids = {
            [6562] = true,
        },
        locations = {
            {
                x = 2495,
                z = 3191,
            },
        },
    },
    {
        name = "Captain Bentley",
        ids = {
            [407] = true,
        },
        locations = {
            {
                x = 2141,
                z = 3898,
            },
        },
    },
    {
        name = "Captain Cain",
        ids = {
            [5030] = true,
        },
        locations = {
            {
                x = 2534,
                z = 3568,
            },
        },
    },
    {
        name = "Captain Daerkin",
        ids = {
            [4595] = true,
        },
        locations = {
            {
                x = 3313,
                z = 3160,
            },
            {
                x = 3315,
                z = 3157,
            },
        },
    },
    {
        name = "Captain Dalbur",
        ids = {
            [3809] = true,
        },
        locations = {
            {
                x = 3283,
                z = 3212,
            },
        },
    },
    {
        name = "Captain Deathbeard",
        ids = {
            [23976] = true,
        },
        locations = {
            {
                x = 3210,
                z = 3141,
            },
        },
    },
    {
        name = "Captain Errdo",
        ids = {
            [3811] = true,
            [5249] = true,
        },
        locations = {
            {
                x = 2918,
                z = 3057,
            },
            {
                x = 3318,
                z = 3440,
            },
        },
    },
    {
        name = "Captain Ethar",
        ids = {
            [12195] = true,
        },
        locations = {
            {
                x = 2637,
                z = 2676,
            },
        },
    },
    {
        name = "Captain Harkhebi",
        ids = {
            [24689] = true,
        },
        locations = {
            {
                x = 3189,
                z = 2625,
            },
        },
    },
    {
        name = "Captain Harlan",
        ids = {
            [705] = true,
        },
        locations = {
            {
                x = 3197,
                z = 3262,
            },
        },
    },
    {
        name = "Captain Jute",
        ids = {
            [13697] = true,
        },
        locations = {
            {
                x = 2874,
                z = 3565,
            },
        },
    },
    {
        name = "Captain Klemfoodle",
        ids = {
            [3812] = true,
        },
        locations = {
            {
                x = 2970,
                z = 2973,
            },
        },
    },
    {
        name = "Captain Lawgof",
        ids = {
            [208] = true,
        },
        locations = {
            {
                x = 2567,
                z = 3460,
            },
        },
    },
    {
        name = "Captain Lorris",
        ids = {
            [32664] = true,
        },
        locations = {
            {
                x = 3028,
                z = 3221,
            },
        },
    },
    {
        name = "Captain of the Guard",
        ids = {
            [13633] = true,
        },
        locations = {
            {
                x = 3182,
                z = 3471,
            },
        },
    },
    {
        name = "Captain Rovin",
        ids = {
            [22534] = true,
        },
        locations = {
            {
                x = 3413,
                z = 3474,
            },
        },
    },
    {
        name = "Captain Tobias",
        ids = {
            [376] = true,
        },
        locations = {
            {
                x = 3028,
                z = 3216,
            },
        },
    },
    {
        name = "Captain Tyr",
        ids = {
            [11509] = true,
        },
        locations = {
            {
                x = 2673,
                z = 2661,
            },
        },
    },
    {
        name = "Carado",
        ids = {
            [1417] = true,
        },
        locations = {
            {
                x = 2775,
                z = 2801,
            },
        },
    },
    {
        name = "Carla",
        ids = {
            [712] = true,
        },
        locations = {
            {
                x = 2495,
                z = 3312,
            },
        },
    },
    {
        name = "Caroline",
        ids = {
            [7163] = true,
        },
        locations = {
            {
                x = 2716,
                z = 3302,
            },
        },
    },
    {
        name = "Carpenter",
        ids = {
            [5289] = true,
        },
        locations = {
            {
                x = 3313,
                z = 2771,
            },
        },
    },
    {
        name = "Carpenter Kjallak",
        ids = {
            [3916] = true,
        },
        locations = {
            {
                x = 2594,
                z = 3891,
            },
        },
    },
    {
        name = "Carwen Essencebinder",
        ids = {
            [14872] = true,
        },
        locations = {
            {
                x = 2914,
                z = 3540,
            },
        },
    },
    {
        name = "Cassie",
        ids = {
            [577] = true,
        },
        locations = {
            {
                x = 2979,
                z = 3383,
            },
        },
    },
    {
        name = "Cat",
        ids = {
            [4768] = true,
            [4769] = true,
        },
        locations = {
            {
                x = 3593,
                z = 3207,
            },
            {
                x = 3621,
                z = 3207,
            },
            {
                x = 3629,
                z = 3309,
            },
            {
                x = 3631,
                z = 3315,
            },
            {
                x = 3633,
                z = 3240,
            },
            {
                x = 3634,
                z = 3294,
            },
            {
                x = 3635,
                z = 3296,
            },
            {
                x = 3636,
                z = 3195,
            },
        },
    },
    {
        name = "Catalina",
        ids = {
            [3551] = true,
        },
        locations = {
            {
                x = 3489,
                z = 3221,
            },
        },
    },
    {
        name = "Catapult engineer",
        ids = {
            [7119] = true,
        },
        locations = {
            {
                x = 2185,
                z = 3199,
            },
        },
    },
    {
        name = "Catsanova",
        ids = {
            [24416] = true,
        },
        locations = {
            {
                x = 3246,
                z = 2800,
            },
        },
    },
    {
        name = "Cave monk",
        ids = {
            [656] = true,
        },
        locations = {
            {
                x = 2822,
                z = 3374,
            },
        },
    },
    {
        name = "Cavey Davey",
        ids = {
            [4358] = true,
        },
        locations = {
            {
                x = 3749,
                z = 2972,
            },
        },
    },
    {
        name = "Cecilia",
        ids = {
            [14663] = true,
        },
        locations = {
            {
                x = 3400,
                z = 3147,
            },
        },
    },
    {
        name = "Celia Diggory",
        ids = {
            [23572] = true,
        },
        locations = {
            {
                x = 3377,
                z = 3404,
            },
        },
    },
    {
        name = "Ceolburg",
        ids = {
            [1089] = true,
        },
        locations = {
            {
                x = 2920,
                z = 3526,
            },
        },
    },
    {
        name = "Ceril Carnillean",
        ids = {
            [885] = true,
        },
        locations = {
            {
                x = 2565,
                z = 3268,
            },
        },
    },
    {
        name = "Cerulean twitch",
        ids = {
            [5074] = true,
        },
        locations = {
            {
                x = 2714,
                z = 3765,
            },
            {
                x = 2716,
                z = 3775,
            },
            {
                x = 2719,
                z = 3769,
            },
            {
                x = 2727,
                z = 3772,
            },
            {
                x = 2731,
                z = 3767,
            },
            {
                x = 2733,
                z = 3775,
            },
            {
                x = 2736,
                z = 3765,
            },
            {
                x = 2740,
                z = 3770,
            },
        },
    },
    {
        name = "Chadwell",
        ids = {
            [971] = true,
        },
        locations = {
            {
                x = 2464,
                z = 3287,
            },
        },
    },
    {
        name = "Challenge Mistress Fara",
        ids = {
            [15780] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3530,
            },
        },
    },
    {
        name = "Challenge Mistress Rashida",
        ids = {
            [24763] = true,
        },
        locations = {
            {
                x = 3224,
                z = 2729,
            },
        },
    },
    {
        name = "Chancy",
        ids = {
            [338] = true,
            [339] = true,
        },
        locations = {
            {
                x = 2929,
                z = 3220,
            },
            {
                x = 3271,
                z = 3390,
            },
        },
    },
    {
        name = "Chaplain Sarah",
        ids = {
            [14887] = true,
        },
        locations = {
            {
                x = 2931,
                z = 3565,
            },
        },
    },
    {
        name = "Chargurr",
        ids = {
            [7055] = true,
        },
        locations = {
            {
                x = 2559,
                z = 2851,
            },
        },
    },
    {
        name = "Charity",
        ids = {
            [2258] = true,
        },
        locations = {
            {
                x = 2880,
                z = 3442,
            },
        },
    },
    {
        name = "Charley",
        ids = {
            [3161] = true,
        },
        locations = {
            {
                x = 3673,
                z = 2970,
            },
        },
    },
    {
        name = "Charlie",
        ids = {
            [5138] = true,
        },
        locations = {
            {
                x = 2607,
                z = 3264,
            },
        },
    },
    {
        name = "Charlie the cook",
        ids = {
            [794] = true,
        },
        locations = {
            {
                x = 2790,
                z = 3191,
            },
        },
    },
    {
        name = "Charlie the Tramp",
        ids = {
            [641] = true,
        },
        locations = {
            {
                x = 3208,
                z = 3391,
            },
        },
    },
    {
        name = "Charm sprite",
        ids = {
            [12338] = true,
        },
        locations = {
            {
                x = 2392,
                z = 3377,
            },
            {
                x = 2393,
                z = 3363,
            },
            {
                x = 2393,
                z = 3366,
            },
            {
                x = 2393,
                z = 3370,
            },
            {
                x = 2393,
                z = 3381,
            },
            {
                x = 2395,
                z = 3374,
            },
            {
                x = 2397,
                z = 3369,
            },
            {
                x = 2398,
                z = 3378,
            },
            {
                x = 2398,
                z = 3382,
            },
            {
                x = 2399,
                z = 3372,
            },
            {
                x = 2400,
                z = 3364,
            },
            {
                x = 2400,
                z = 3375,
            },
            {
                x = 2402,
                z = 3368,
            },
            {
                x = 2402,
                z = 3383,
            },
            {
                x = 2404,
                z = 3372,
            },
            {
                x = 2404,
                z = 3379,
            },
            {
                x = 2405,
                z = 3364,
            },
            {
                x = 2407,
                z = 3366,
            },
            {
                x = 2407,
                z = 3375,
            },
            {
                x = 2407,
                z = 3381,
            },
            {
                x = 2409,
                z = 3371,
            },
            {
                x = 2410,
                z = 3362,
            },
            {
                x = 2410,
                z = 3375,
            },
            {
                x = 2410,
                z = 3380,
            },
            {
                x = 2411,
                z = 3368,
            },
            {
                x = 2412,
                z = 3365,
            },
            {
                x = 2413,
                z = 3363,
            },
            {
                x = 2413,
                z = 3373,
            },
            {
                x = 2416,
                z = 3365,
            },
            {
                x = 2416,
                z = 3370,
            },
        },
    },
    {
        name = "Charmed Warrior",
        ids = {
            [3104] = true,
            [3107] = true,
        },
        locations = {
            {
                x = 3359,
                z = 3304,
            },
            {
                x = 3364,
                z = 3311,
            },
        },
    },
    {
        name = "Charnak",
        ids = {
            [24688] = true,
        },
        locations = {
            {
                x = 3158,
                z = 2625,
            },
        },
    },
    {
        name = "Charos",
        ids = {
            [26321] = true,
        },
        locations = {
            {
                x = 3240,
                z = 3450,
            },
        },
    },
    {
        name = "Cheerleader",
        ids = {
            [636] = true,
        },
        locations = {
            {
                x = 2395,
                z = 3495,
            },
            {
                x = 2397,
                z = 3495,
            },
        },
    },
    {
        name = "Chemist",
        ids = {
            [367] = true,
        },
        locations = {
            {
                x = 2934,
                z = 3210,
            },
        },
    },
    {
        name = "Chester",
        ids = {
            [24848] = true,
        },
        locations = {
            {
                x = 2250,
                z = 2811,
            },
        },
    },
    {
        name = "Chief servant",
        ids = {
            [4245] = true,
        },
        locations = {
            {
                x = 2664,
                z = 3330,
            },
        },
    },
    {
        name = "Chief Tess",
        ids = {
            [7051] = true,
        },
        locations = {
            {
                x = 2547,
                z = 2852,
            },
        },
    },
    {
        name = "Chief Thief Robin",
        ids = {
            [11268] = true,
        },
        locations = {
            {
                x = 3212,
                z = 3208,
            },
        },
    },
    {
        name = "Chief Zookeeper",
        ids = {
            [7580] = true,
        },
        locations = {
            {
                x = 2597,
                z = 3265,
            },
        },
    },
    {
        name = "Chieftain Gunthor",
        ids = {
            [2876] = true,
        },
        locations = {
            {
                x = 3078,
                z = 3444,
            },
        },
    },
    {
        name = "Child",
        ids = {
            [355] = true,
            [356] = true,
            [6334] = true,
            [6335] = true,
            [6336] = true,
            [6337] = true,
            [6338] = true,
            [6339] = true,
            [6340] = true,
            [6341] = true,
            [6342] = true,
            [6343] = true,
            [6345] = true,
        },
        locations = {
            {
                x = 2462,
                z = 3306,
            },
            {
                x = 2464,
                z = 3302,
            },
            {
                x = 2464,
                z = 3306,
            },
            {
                x = 2465,
                z = 3301,
            },
            {
                x = 2466,
                z = 3307,
            },
            {
                x = 2467,
                z = 3306,
            },
            {
                x = 2468,
                z = 3315,
            },
            {
                x = 2469,
                z = 3295,
            },
            {
                x = 2470,
                z = 3319,
            },
            {
                x = 2471,
                z = 3323,
            },
            {
                x = 2473,
                z = 3295,
            },
            {
                x = 2473,
                z = 3305,
            },
            {
                x = 2476,
                z = 3307,
            },
            {
                x = 2476,
                z = 3319,
            },
            {
                x = 2478,
                z = 3323,
            },
            {
                x = 2480,
                z = 3296,
            },
            {
                x = 2481,
                z = 3313,
            },
            {
                x = 2482,
                z = 3312,
            },
            {
                x = 2485,
                z = 3312,
            },
            {
                x = 2504,
                z = 3318,
            },
            {
                x = 2518,
                z = 3275,
            },
            {
                x = 2523,
                z = 3307,
            },
            {
                x = 2547,
                z = 3277,
            },
        },
    },
    {
        name = "Chimp ice chimp",
        ids = {
            [13199] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Chito",
        ids = {},
        locations = {
            {
                x = 3336,
                z = 3256,
            },
            {
                x = 3337,
                z = 3256,
            },
        },
    },
    {
        name = "Chomp",
        ids = {
            [15242] = true,
        },
        locations = {
            {
                x = 2556,
                z = 2858,
            },
        },
    },
    {
        name = "Chuck",
        ids = {
            [8677] = true,
            [8679] = true,
        },
        locations = {
            {
                x = 2615,
                z = 3259,
            },
            {
                x = 2865,
                z = 2582,
            },
        },
    },
    {
        name = "Churchill",
        ids = {},
        locations = {
            {
                x = 3378,
                z = 3205,
            },
        },
    },
    {
        name = "Citharede Sister",
        ids = {
            [14646] = true,
            [14647] = true,
            [14648] = true,
            [14649] = true,
            [14650] = true,
            [14651] = true,
        },
        locations = {
            {
                x = 3416,
                z = 3171,
            },
            {
                x = 3422,
                z = 3159,
            },
            {
                x = 3427,
                z = 3166,
            },
            {
                x = 3430,
                z = 3151,
            },
            {
                x = 3436,
                z = 3153,
            },
            {
                x = 3445,
                z = 3178,
            },
        },
    },
    {
        name = "Citizen",
        ids = {
            [7554] = true,
        },
        locations = {
            {
                x = 2565,
                z = 3149,
            },
        },
    },
    {
        name = "Civilian",
        ids = {
            [785] = true,
            [786] = true,
            [787] = true,
        },
        locations = {
            {
                x = 2468,
                z = 3304,
            },
            {
                x = 2469,
                z = 3309,
            },
            {
                x = 2473,
                z = 3300,
            },
            {
                x = 2476,
                z = 3313,
            },
            {
                x = 2476,
                z = 3317,
            },
            {
                x = 2478,
                z = 3291,
            },
            {
                x = 2481,
                z = 3289,
            },
            {
                x = 2487,
                z = 3308,
            },
            {
                x = 2488,
                z = 3289,
            },
            {
                x = 2490,
                z = 3313,
            },
            {
                x = 2491,
                z = 3300,
            },
            {
                x = 2492,
                z = 3312,
            },
        },
    },
    {
        name = "Clan representative",
        ids = {},
        locations = {
            {
                x = 3153,
                z = 3414,
            },
        },
    },
    {
        name = "Clay golem",
        ids = {},
        locations = {
            {
                x = 3488,
                z = 3090,
            },
        },
    },
    {
        name = "Cleaner",
        ids = {
            [5916] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3429,
            },
        },
    },
    {
        name = "Clerk",
        ids = {
            [713] = true,
            [11461] = true,
        },
        locations = {
            {
                x = 2526,
                z = 3319,
            },
            {
                x = 2732,
                z = 3469,
            },
        },
    },
    {
        name = "Clive",
        ids = {
            [8174] = true,
        },
        locations = {
            {
                x = 3203,
                z = 3479,
            },
        },
    },
    {
        name = "Clothears",
        ids = {
            [6130] = true,
        },
        locations = {
            {
                x = 2469,
                z = 3158,
            },
        },
    },
    {
        name = "Coenus",
        ids = {
            [24661] = true,
        },
        locations = {
            {
                x = 3242,
                z = 2729,
            },
        },
    },
    {
        name = "Col. O'Niall",
        ids = {
            [4853] = true,
        },
        locations = {
            {
                x = 2740,
                z = 3310,
            },
        },
    },
    {
        name = "Commander Akhomet (Imperial)",
        ids = {
            [24490] = true,
        },
        locations = {
            {
                x = 3171,
                z = 2729,
            },
        },
    },
    {
        name = "Commander Colby",
        ids = {
            [12311] = true,
        },
        locations = {
            {
                x = 3023,
                z = 3545,
            },
        },
    },
    {
        name = "Commander Connad",
        ids = {
            [5029] = true,
        },
        locations = {
            {
                x = 2536,
                z = 3577,
            },
        },
    },
    {
        name = "Commander Denulth",
        ids = {
            [1060] = true,
        },
        locations = {
            {
                x = 2918,
                z = 3561,
            },
        },
    },
    {
        name = "Commander Montai",
        ids = {
            [470] = true,
        },
        locations = {
            {
                x = 2523,
                z = 3211,
            },
        },
    },
    {
        name = "Commodore Matthias",
        ids = {
            [11497] = true,
        },
        locations = {
            {
                x = 2675,
                z = 2668,
            },
        },
    },
    {
        name = "Commodore Tyr",
        ids = {
            [11681] = true,
        },
        locations = {
            {
                x = 2676,
                z = 2667,
            },
        },
    },
    {
        name = "Competition Judge",
        ids = {
            [693] = true,
        },
        locations = {
            {
                x = 2669,
                z = 3418,
            },
        },
    },
    {
        name = "Cook",
        ids = {
            [278] = true,
            [5910] = true,
            [5911] = true,
            [11305] = true,
        },
        locations = {
            {
                x = 2669,
                z = 3331,
            },
            {
                x = 3209,
                z = 3215,
            },
            {
                x = 3230,
                z = 3401,
            },
            {
                x = 3285,
                z = 3489,
            },
        },
    },
    {
        name = "Cook's brother",
        ids = {
            [1430] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3215,
            },
        },
    },
    {
        name = "Copernicus Glyph",
        ids = {
            [16678] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3067,
            },
            {
                x = 2928,
                z = 3457,
            },
            {
                x = 3030,
                z = 3415,
            },
            {
                x = 3526,
                z = 3510,
            },
        },
    },
    {
        name = "Copperpot",
        ids = {
            [29815] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3546,
            },
        },
    },
    {
        name = "Cormorant",
        ids = {
            [1180] = true,
            [9718] = true,
        },
        locations = {
            {
                x = 2931,
                z = 3108,
            },
            {
                x = 3393,
                z = 3774,
            },
            {
                x = 3453,
                z = 3791,
            },
            {
                x = 3456,
                z = 3638,
            },
            {
                x = 3462,
                z = 3587,
            },
            {
                x = 3492,
                z = 3648,
            },
            {
                x = 3505,
                z = 3774,
            },
            {
                x = 3510,
                z = 3705,
            },
            {
                x = 3515,
                z = 3747,
            },
        },
    },
    {
        name = "Cornelius",
        ids = {
            [3566] = true,
            [3567] = true,
        },
        locations = {
            {
                x = 3493,
                z = 3211,
            },
        },
    },
    {
        name = "Corporal Keymans",
        ids = {
            [14994] = true,
        },
        locations = {
            {
                x = 2925,
                z = 3560,
            },
        },
    },
    {
        name = "Cosmic Billy",
        ids = {
            [26856] = true,
        },
        locations = {
            {
                x = 2890,
                z = 3526,
            },
        },
    },
    {
        name = "Cough",
        ids = {},
        locations = {
            {
                x = 3167,
                z = 3510,
            },
        },
    },
    {
        name = "Council workman",
        ids = {
            [1287] = true,
        },
        locations = {
            {
                x = 2655,
                z = 3592,
            },
        },
    },
    {
        name = "Councillor Halgrive",
        ids = {
            [289] = true,
        },
        locations = {
            {
                x = 2617,
                z = 3299,
            },
        },
    },
    {
        name = "Count Rivance",
        ids = {
            [12365] = true,
        },
        locations = {
            {
                x = 3017,
                z = 3221,
            },
        },
    },
    {
        name = "Cowardly Bandit",
        ids = {
            [1886] = true,
        },
        locations = {
            {
                x = 3359,
                z = 3000,
            },
        },
    },
    {
        name = "Crab",
        ids = {
            [2706] = true,
            [4346] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3141,
            },
            {
                x = 3019,
                z = 3154,
            },
            {
                x = 3020,
                z = 3146,
            },
            {
                x = 3022,
                z = 3157,
            },
            {
                x = 3025,
                z = 3156,
            },
            {
                x = 3028,
                z = 3158,
            },
            {
                x = 3658,
                z = 3054,
            },
            {
                x = 3670,
                z = 3051,
            },
            {
                x = 3672,
                z = 3060,
            },
            {
                x = 3685,
                z = 3055,
            },
            {
                x = 3689,
                z = 3046,
            },
            {
                x = 3694,
                z = 3056,
            },
            {
                x = 3697,
                z = 3062,
            },
            {
                x = 3710,
                z = 3057,
            },
            {
                x = 3718,
                z = 3054,
            },
            {
                x = 3726,
                z = 3063,
            },
            {
                x = 3728,
                z = 3059,
            },
            {
                x = 3735,
                z = 3058,
            },
            {
                x = 3737,
                z = 3052,
            },
            {
                x = 3737,
                z = 3062,
            },
            {
                x = 3741,
                z = 3056,
            },
            {
                x = 3742,
                z = 3066,
            },
            {
                x = 3754,
                z = 2976,
            },
            {
                x = 3755,
                z = 3047,
            },
            {
                x = 3756,
                z = 3056,
            },
            {
                x = 3758,
                z = 2981,
            },
            {
                x = 3758,
                z = 3062,
            },
            {
                x = 3759,
                z = 2959,
            },
            {
                x = 3764,
                z = 2952,
            },
            {
                x = 3764,
                z = 3042,
            },
            {
                x = 3764,
                z = 3053,
            },
            {
                x = 3764,
                z = 3059,
            },
            {
                x = 3769,
                z = 3047,
            },
            {
                x = 3771,
                z = 2986,
            },
            {
                x = 3772,
                z = 2956,
            },
            {
                x = 3772,
                z = 3061,
            },
            {
                x = 3777,
                z = 3056,
            },
            {
                x = 3785,
                z = 3053,
            },
            {
                x = 3791,
                z = 3042,
            },
            {
                x = 3791,
                z = 3048,
            },
            {
                x = 3798,
                z = 3051,
            },
            {
                x = 3803,
                z = 3049,
            },
            {
                x = 3808,
                z = 3045,
            },
            {
                x = 3809,
                z = 3038,
            },
            {
                x = 3812,
                z = 3057,
            },
            {
                x = 3816,
                z = 3062,
            },
            {
                x = 3817,
                z = 3043,
            },
            {
                x = 3827,
                z = 3038,
            },
            {
                x = 3828,
                z = 3051,
            },
            {
                x = 3830,
                z = 3066,
            },
            {
                x = 3831,
                z = 3023,
            },
            {
                x = 3831,
                z = 3030,
            },
            {
                x = 3834,
                z = 3057,
            },
            {
                x = 3838,
                z = 3029,
            },
        },
    },
    {
        name = "Crablet (Menaphos)",
        ids = {
            [24463] = true,
        },
        locations = {
            {
                x = 3244,
                z = 2664,
            },
        },
    },
    {
        name = "Crate",
        ids = {
            [8074] = true,
        },
        locations = {
            {
                x = 2945,
                z = 3621,
            },
        },
    },
    {
        name = "Creakyknees",
        ids = {
            [6129] = true,
        },
        locations = {
            {
                x = 2470,
                z = 3185,
            },
        },
    },
    {
        name = "Croc",
        ids = {
            [24069] = true,
        },
        locations = {
            {
                x = 3314,
                z = 2939,
            },
        },
    },
    {
        name = "Crow",
        ids = {
            [1754] = true,
            [1755] = true,
            [1756] = true,
            [2252] = true,
            [4570] = true,
            [4571] = true,
        },
        locations = {
            {
                x = 3082,
                z = 3271,
            },
            {
                x = 3085,
                z = 3248,
            },
            {
                x = 3092,
                z = 3261,
            },
            {
                x = 3095,
                z = 3274,
            },
            {
                x = 3096,
                z = 3264,
            },
            {
                x = 3096,
                z = 3283,
            },
            {
                x = 3100,
                z = 3239,
            },
            {
                x = 3104,
                z = 3255,
            },
            {
                x = 3107,
                z = 3286,
            },
            {
                x = 3108,
                z = 3265,
            },
            {
                x = 3113,
                z = 3242,
            },
            {
                x = 3115,
                z = 3270,
            },
            {
                x = 3116,
                z = 3279,
            },
            {
                x = 3116,
                z = 3286,
            },
            {
                x = 3124,
                z = 3271,
            },
            {
                x = 3125,
                z = 3288,
            },
            {
                x = 3126,
                z = 3276,
            },
            {
                x = 3131,
                z = 3251,
            },
            {
                x = 3208,
                z = 3301,
            },
            {
                x = 3209,
                z = 3300,
            },
            {
                x = 3258,
                z = 3315,
            },
            {
                x = 3258,
                z = 3317,
            },
            {
                x = 3260,
                z = 3317,
            },
        },
    },
    {
        name = "Crows",
        ids = {
            [32348] = true,
        },
        locations = {
            {
                x = 2885,
                z = 3518,
            },
        },
    },
    {
        name = "Crux Eqal Knight",
        ids = {
            [29639] = true,
            [29640] = true,
        },
        locations = {
            {
                x = 3316,
                z = 3295,
            },
            {
                x = 3325,
                z = 3292,
            },
        },
    },
    {
        name = "Curator Haig Halen",
        ids = {
            [646] = true,
        },
        locations = {
            {
                x = 3257,
                z = 3447,
            },
        },
    },
    {
        name = "Curpile Fyod",
        ids = {
            [1568] = true,
        },
        locations = {
            {
                x = 3508,
                z = 3440,
            },
        },
    },
    {
        name = "Cursed wisp",
        ids = {
            [23159] = true,
        },
        locations = {
            {
                x = 3138,
                z = 3729,
            },
            {
                x = 3140,
                z = 3729,
            },
            {
                x = 3141,
                z = 3712,
            },
            {
                x = 3143,
                z = 3713,
            },
            {
                x = 3143,
                z = 3721,
            },
            {
                x = 3145,
                z = 3718,
            },
            {
                x = 3145,
                z = 3720,
            },
            {
                x = 3147,
                z = 3695,
            },
            {
                x = 3148,
                z = 3696,
            },
            {
                x = 3149,
                z = 3710,
            },
            {
                x = 3149,
                z = 3714,
            },
            {
                x = 3150,
                z = 3714,
            },
            {
                x = 3154,
                z = 3711,
            },
        },
    },
    {
        name = "Customer",
        ids = {
            [11644] = true,
            [11646] = true,
        },
        locations = {
            {
                x = 3008,
                z = 3354,
            },
            {
                x = 3008,
                z = 3355,
            },
        },
    },
    {
        name = "Customs officer",
        ids = {
            [380] = true,
        },
        locations = {
            {
                x = 2772,
                z = 3225,
            },
            {
                x = 2953,
                z = 3147,
            },
        },
    },
    {
        name = "Customs Sergeant",
        ids = {
            [7830] = true,
        },
        locations = {
            {
                x = 2966,
                z = 3194,
            },
        },
    },
    {
        name = "Cyreg Paddlehorn",
        ids = {
            [1567] = true,
        },
        locations = {
            {
                x = 3522,
                z = 3284,
            },
        },
    },
    {
        name = "Cyrisus",
        ids = {
            [5897] = true,
            [8279] = true,
        },
        locations = {
            {
                x = 2074,
                z = 3911,
            },
            {
                x = 2149,
                z = 3867,
            },
            {
                x = 2997,
                z = 3340,
            },
        },
    },
    {
        name = "Da Vinci",
        ids = {
            [336] = true,
            [337] = true,
        },
        locations = {
            {
                x = 2929,
                z = 3220,
            },
            {
                x = 3271,
                z = 3390,
            },
        },
    },
    {
        name = "Dafi",
        ids = {
            [26897] = true,
        },
        locations = {
            {
                x = 3351,
                z = 3191,
            },
        },
    },
    {
        name = "Daga",
        ids = {
            [1434] = true,
        },
        locations = {
            {
                x = 2759,
                z = 2775,
            },
        },
    },
    {
        name = "Dal",
        ids = {},
        locations = {
            {
                x = 2518,
                z = 3037,
            },
        },
    },
    {
        name = "Dalal",
        ids = {
            [967] = true,
        },
        locations = {
            {
                x = 3329,
                z = 3253,
            },
        },
    },
    {
        name = "Dalldav",
        ids = {
            [2356] = true,
        },
        locations = {
            {
                x = 2324,
                z = 3164,
            },
        },
    },
    {
        name = "Dancer",
        ids = {
            [14654] = true,
            [14655] = true,
        },
        locations = {
            {
                x = 3399,
                z = 3148,
            },
            {
                x = 3400,
                z = 3151,
            },
        },
    },
    {
        name = "Danlozep",
        ids = {
            [24705] = true,
        },
        locations = {
            {
                x = 3168,
                z = 2651,
            },
        },
    },
    {
        name = "Dantaera",
        ids = {
            [2324] = true,
        },
        locations = {
            {
                x = 2784,
                z = 3463,
            },
        },
    },
    {
        name = "Danwad",
        ids = {
            [24709] = true,
        },
        locations = {
            {
                x = 3147,
                z = 2773,
            },
        },
    },
    {
        name = "Dark kebbit",
        ids = {
            [5099] = true,
        },
        locations = {
            {
                x = 2365,
                z = 3579,
            },
            {
                x = 2375,
                z = 3591,
            },
            {
                x = 2379,
                z = 3588,
            },
            {
                x = 2380,
                z = 3600,
            },
            {
                x = 2383,
                z = 3595,
            },
            {
                x = 2388,
                z = 3590,
            },
            {
                x = 2389,
                z = 3598,
            },
        },
    },
    {
        name = "Dark mage",
        ids = {
            [1001] = true,
        },
        locations = {
            {
                x = 2457,
                z = 3309,
            },
        },
    },
    {
        name = "Darkmeyer blood trader",
        ids = {
            [14165] = true,
        },
        locations = {
            {
                x = 3603,
                z = 3345,
            },
        },
    },
    {
        name = "Darkmeyer trader",
        ids = {
            [14164] = true,
        },
        locations = {
            {
                x = 3647,
                z = 3387,
            },
        },
    },
    {
        name = "Darren",
        ids = {
            [1781] = true,
        },
        locations = {
            {
                x = 3007,
                z = 3860,
            },
        },
    },
    {
        name = "Dashing kebbit",
        ids = {
            [5100] = true,
        },
        locations = {
            {
                x = 2367,
                z = 3576,
            },
            {
                x = 2370,
                z = 3583,
            },
            {
                x = 2375,
                z = 3578,
            },
            {
                x = 2375,
                z = 3589,
            },
            {
                x = 2380,
                z = 3580,
            },
            {
                x = 2385,
                z = 3596,
            },
            {
                x = 2387,
                z = 3589,
            },
        },
    },
    {
        name = "David",
        ids = {
            [6195] = true,
        },
        locations = {
            {
                x = 2739,
                z = 3581,
            },
        },
    },
    {
        name = "Davon",
        ids = {
            [588] = true,
        },
        locations = {
            {
                x = 2803,
                z = 3152,
            },
        },
    },
    {
        name = "Dawg",
        ids = {
            [7104] = true,
        },
        locations = {
            {
                x = 2549,
                z = 2852,
            },
        },
    },
    {
        name = "Dead Monk",
        ids = {
            [3076] = true,
        },
        locations = {
            {
                x = 3401,
                z = 3492,
            },
        },
    },
    {
        name = "Dead monkey",
        ids = {
            [13210] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Dealga",
        ids = {
            [11475] = true,
        },
        locations = {
            {
                x = 3206,
                z = 3400,
            },
        },
    },
    {
        name = "Dean Vellio",
        ids = {
            [14055] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3240,
            },
        },
    },
    {
        name = "Death's dogwalker",
        ids = {
            [27329] = true,
        },
        locations = {
            {
                x = 3133,
                z = 3355,
            },
        },
    },
    {
        name = "Dell Monti",
        ids = {
            [3227] = true,
        },
        locations = {
            {
                x = 2763,
                z = 3186,
            },
        },
    },
    {
        name = "Delphie",
        ids = {
            [8948] = true,
        },
        locations = {
            {
                x = 3040,
                z = 3366,
            },
        },
    },
    {
        name = "Demon butler",
        ids = {
            [11307] = true,
        },
        locations = {
            {
                x = 2664,
                z = 3329,
            },
        },
    },
    {
        name = "Demon hunter",
        ids = {
            [29562] = true,
        },
        locations = {
            {
                x = 3145,
                z = 3621,
            },
        },
    },
    {
        name = "Derrik",
        ids = {
            [1376] = true,
        },
        locations = {
            {
                x = 2551,
                z = 3897,
            },
        },
    },
    {
        name = "Desert devil",
        ids = {},
        locations = {
            {
                x = 3406,
                z = 3111,
            },
        },
    },
    {
        name = "Desert Phoenix",
        ids = {
            [1911] = true,
        },
        locations = {
            {
                x = 3347,
                z = 3114,
            },
        },
    },
    {
        name = "Devin Mendelberg",
        ids = {
            [3825] = true,
        },
        locations = {
            {
                x = 2313,
                z = 3686,
            },
        },
    },
    {
        name = "Diana",
        ids = {
            [28688] = true,
        },
        locations = {
            {
                x = 3361,
                z = 3221,
            },
        },
    },
    {
        name = "Diango",
        ids = {
            [970] = true,
        },
        locations = {
            {
                x = 3081,
                z = 3247,
            },
        },
    },
    {
        name = "Didymus the Lorehound",
        ids = {
            [25869] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3370,
            },
        },
    },
    {
        name = "Dig Site winch operator",
        ids = {
            [4564] = true,
            [4565] = true,
        },
        locations = {
            {
                x = 3355,
                z = 3434,
            },
            {
                x = 3378,
                z = 3445,
            },
        },
    },
    {
        name = "Dig Site workman",
        ids = {
            [613] = true,
        },
        locations = {
            {
                x = 3337,
                z = 3414,
            },
            {
                x = 3358,
                z = 3423,
            },
            {
                x = 3376,
                z = 3442,
            },
        },
    },
    {
        name = "Dimintheis",
        ids = {
            [664] = true,
        },
        locations = {
            {
                x = 3279,
                z = 3404,
            },
        },
    },
    {
        name = "Dioscuri Sentinel",
        ids = {
            [26854] = true,
        },
        locations = {
            {
                x = 2891,
                z = 3525,
            },
        },
    },
    {
        name = "Diseased kebbit",
        ids = {
            [7039] = true,
        },
        locations = {
            {
                x = 2503,
                z = 2824,
            },
            {
                x = 2518,
                z = 2824,
            },
            {
                x = 2534,
                z = 2821,
            },
            {
                x = 2548,
                z = 2823,
            },
            {
                x = 2560,
                z = 2822,
            },
            {
                x = 2570,
                z = 2823,
            },
            {
                x = 2582,
                z = 2824,
            },
            {
                x = 2588,
                z = 2828,
            },
        },
    },
    {
        name = "Doctor Orbon",
        ids = {
            [290] = true,
        },
        locations = {
            {
                x = 2614,
                z = 3306,
            },
        },
    },
    {
        name = "Dog",
        ids = {
            [98] = true,
        },
        locations = {
            {
                x = 3022,
                z = 3288,
            },
        },
    },
    {
        name = "Dommik",
        ids = {
            [545] = true,
        },
        locations = {
            {
                x = 3321,
                z = 3194,
            },
        },
    },
    {
        name = "Donie",
        ids = {
            [2238] = true,
        },
        locations = {
            {
                x = 3219,
                z = 3247,
            },
        },
    },
    {
        name = "Doomsayer",
        ids = {
            [3777] = true,
        },
        locations = {
            {
                x = 3230,
                z = 3228,
            },
        },
    },
    {
        name = "Doorman",
        ids = {
            [6769] = true,
            [24685] = true,
            [24732] = true,
        },
        locations = {
            {
                x = 3294,
                z = 2812,
            },
            {
                x = 3300,
                z = 2812,
            },
            {
                x = 3322,
                z = 2760,
            },
            {
                x = 3322,
                z = 2762,
            },
            {
                x = 3331,
                z = 2759,
            },
            {
                x = 3331,
                z = 2763,
            },
        },
    },
    {
        name = "Doran the tool artisan",
        ids = {
            [27229] = true,
        },
        locations = {
            {
                x = 3015,
                z = 3450,
            },
        },
    },
    {
        name = "Dorian (student)",
        ids = {},
        locations = {
            {
                x = 3377,
                z = 3402,
            },
        },
    },
    {
        name = "Doric",
        ids = {
            [284] = true,
        },
        locations = {
            {
                x = 2959,
                z = 3439,
            },
        },
    },
    {
        name = "Doris",
        ids = {
            [3381] = true,
        },
        locations = {
            {
                x = 3079,
                z = 3492,
            },
        },
    },
    {
        name = "Doronbol",
        ids = {
            [8073] = true,
        },
        locations = {
            {
                x = 2942,
                z = 3559,
            },
        },
    },
    {
        name = "Dororan",
        ids = {
            [1175] = true,
            [2647] = true,
            [2651] = true,
        },
        locations = {
            {
                x = 3083,
                z = 3417,
            },
            {
                x = 3098,
                z = 3422,
            },
            {
                x = 3159,
                z = 3434,
            },
        },
    },
    {
        name = "Dotmatrix",
        ids = {
            [13823] = true,
        },
        locations = {
            {
                x = 2948,
                z = 2956,
            },
        },
    },
    {
        name = "Dr Fenkenstrain",
        ids = {
            [1668] = true,
        },
        locations = {
            {
                x = 3551,
                z = 3550,
            },
        },
    },
    {
        name = "Dr Harlow",
        ids = {
            [756] = true,
        },
        locations = {
            {
                x = 3222,
                z = 3397,
            },
        },
    },
    {
        name = "Dr Nabanik",
        ids = {
            [9046] = true,
        },
        locations = {
            {
                x = 3354,
                z = 3353,
            },
        },
    },
    {
        name = "Drain pipe",
        ids = {
            [5991] = true,
        },
        locations = {
            {
                x = 2966,
                z = 3466,
            },
        },
    },
    {
        name = "Dreven",
        ids = {
            [2335] = true,
        },
        locations = {
            {
                x = 3181,
                z = 3359,
            },
        },
    },
    {
        name = "Drew",
        ids = {
            [26933] = true,
        },
        locations = {
            {
                x = 3325,
                z = 3375,
            },
            {
                x = 3385,
                z = 3388,
            },
        },
    },
    {
        name = "Drill Sergeant Hartman",
        ids = {
            [14852] = true,
        },
        locations = {
            {
                x = 2925,
                z = 3574,
            },
        },
    },
    {
        name = "Droalak",
        ids = {
            [2936] = true,
        },
        locations = {
            {
                x = 3657,
                z = 3469,
            },
        },
    },
    {
        name = "Dron",
        ids = {
            [2939] = true,
        },
        locations = {
            {
                x = 2658,
                z = 3700,
            },
        },
    },
    {
        name = "Drorkar",
        ids = {
            [7723] = true,
        },
        locations = {
            {
                x = 2996,
                z = 3450,
            },
        },
    },
    {
        name = "Druid",
        ids = {
            [20937] = true,
            [29638] = true,
        },
        locations = {
            {
                x = 3313,
                z = 3305,
            },
            {
                x = 3320,
                z = 3300,
            },
            {
                x = 3328,
                z = 3302,
            },
        },
    },
    {
        name = "Druidess",
        ids = {
            [15118] = true,
            [15119] = true,
            [15120] = true,
        },
        locations = {
            {
                x = 2882,
                z = 3427,
            },
            {
                x = 2892,
                z = 3425,
            },
            {
                x = 2908,
                z = 3417,
            },
            {
                x = 2917,
                z = 3485,
            },
            {
                x = 2920,
                z = 3487,
            },
            {
                x = 2923,
                z = 3435,
            },
        },
    },
    {
        name = "Drummer",
        ids = {
            [8719] = true,
            [8720] = true,
        },
        locations = {
            {
                x = 2771,
                z = 3131,
            },
            {
                x = 2811,
                z = 2946,
            },
        },
    },
    {
        name = "Drunken Dwarf",
        ids = {
            [11466] = true,
        },
        locations = {
            {
                x = 2734,
                z = 3466,
            },
            {
                x = 3235,
                z = 3334,
            },
        },
    },
    {
        name = "Drunken dwarf's leg",
        ids = {
            [4970] = true,
        },
        locations = {
            {
                x = 2825,
                z = 3681,
            },
        },
    },
    {
        name = "Drunken musician",
        ids = {
            [8715] = true,
        },
        locations = {
            {
                x = 3003,
                z = 3739,
            },
        },
    },
    {
        name = "Drunken sailor",
        ids = {
            [1205] = true,
            [1207] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3254,
            },
            {
                x = 3055,
                z = 3254,
            },
        },
    },
    {
        name = "Dugopul",
        ids = {
            [1429] = true,
        },
        locations = {
            {
                x = 2802,
                z = 2746,
            },
        },
    },
    {
        name = "Dundee",
        ids = {
            [24068] = true,
            [28658] = true,
        },
        locations = {
            {
                x = 3317,
                z = 2939,
            },
            {
                x = 3335,
                z = 3254,
            },
        },
    },
    {
        name = "Dung",
        ids = {
            [1099] = true,
        },
        locations = {
            {
                x = 2856,
                z = 3588,
            },
        },
    },
    {
        name = "Dungeoneering tutor",
        ids = {
            [9712] = true,
        },
        locations = {
            {
                x = 3452,
                z = 3720,
            },
        },
    },
    {
        name = "Dunstan",
        ids = {
            [1082] = true,
        },
        locations = {
            {
                x = 2926,
                z = 3551,
            },
        },
    },
    {
        name = "Duradel",
        ids = {
            [8476] = true,
            [8483] = true,
        },
        locations = {
            {
                x = 2869,
                z = 2982,
            },
            {
                x = 2994,
                z = 3339,
            },
        },
    },
    {
        name = "Dusky Wigglebill",
        ids = {
            [23544] = true,
        },
        locations = {
            {
                x = 4743,
                z = 3426,
            },
        },
    },
    {
        name = "Dustin the Time Mage",
        ids = {
            [31669] = true,
        },
        locations = {
            {
                x = 3099,
                z = 3176,
            },
        },
    },
    {
        name = "Dwarf",
        ids = {
            [4315] = true,
        },
        locations = {
            {
                x = 3224,
                z = 3286,
            },
        },
    },
    {
        name = "Dwarf (Mining Guild)",
        ids = {},
        locations = {
            {
                x = 3019,
                z = 3339,
            },
        },
    },
    {
        name = "Dwarven Miner",
        ids = {
            [6518] = true,
            [6519] = true,
            [6520] = true,
            [8967] = true,
        },
        locations = {
            {
                x = 2576,
                z = 3480,
            },
            {
                x = 2692,
                z = 3330,
            },
            {
                x = 2721,
                z = 3342,
            },
        },
    },
    {
        name = "Eadburg",
        ids = {
            [1072] = true,
        },
        locations = {
            {
                x = 2896,
                z = 3568,
            },
        },
    },
    {
        name = "Eagle",
        ids = {
            [5120] = true,
        },
        locations = {
            {
                x = 2319,
                z = 3477,
            },
            {
                x = 2323,
                z = 3485,
            },
            {
                x = 2334,
                z = 3485,
            },
            {
                x = 2334,
                z = 3495,
            },
        },
    },
    {
        name = "Easty",
        ids = {
            [26928] = true,
        },
        locations = {
            {
                x = 3363,
                z = 3380,
            },
        },
    },
    {
        name = "Eblis",
        ids = {
            [1922] = true,
            [1924] = true,
        },
        locations = {
            {
                x = 3185,
                z = 2983,
            },
            {
                x = 3213,
                z = 2957,
            },
        },
    },
    {
        name = "Echo plinth",
        ids = {
            [23937] = true,
        },
        locations = {
            {
                x = 2261,
                z = 3552,
            },
            {
                x = 2261,
                z = 3555,
            },
            {
                x = 2269,
                z = 3544,
            },
            {
                x = 2269,
                z = 3563,
            },
            {
                x = 2271,
                z = 3550,
            },
            {
                x = 2271,
                z = 3557,
            },
            {
                x = 2273,
                z = 3543,
            },
            {
                x = 2273,
                z = 3564,
            },
            {
                x = 2274,
                z = 3550,
            },
            {
                x = 2274,
                z = 3557,
            },
            {
                x = 2277,
                z = 3544,
            },
            {
                x = 2277,
                z = 3563,
            },
        },
    },
    {
        name = "Ed",
        ids = {
            [28492] = true,
            [28499] = true,
        },
        locations = {
            {
                x = 3128,
                z = 3342,
            },
            {
                x = 3132,
                z = 3371,
            },
        },
    },
    {
        name = "Edmond",
        ids = {
            [1785] = true,
            [3213] = true,
        },
        locations = {
            {
                x = 2566,
                z = 3334,
            },
            {
                x = 2568,
                z = 3334,
            },
            {
                x = 3092,
                z = 3748,
            },
            {
                x = 3092,
                z = 3798,
            },
        },
    },
    {
        name = "Eduardo (student)",
        ids = {},
        locations = {
            {
                x = 3335,
                z = 3411,
            },
        },
    },
    {
        name = "Edward",
        ids = {
            [1782] = true,
        },
        locations = {
            {
                x = 3354,
                z = 3884,
            },
        },
    },
    {
        name = "Effigy",
        ids = {
            [5598] = true,
        },
        locations = {
            {
                x = 2639,
                z = 3219,
            },
        },
    },
    {
        name = "Egg",
        ids = {
            [8075] = true,
        },
        locations = {
            {
                x = 2939,
                z = 3681,
            },
        },
    },
    {
        name = "Egil",
        ids = {
            [129] = true,
        },
        locations = {
            {
                x = 3039,
                z = 3339,
            },
        },
    },
    {
        name = "Eir",
        ids = {
            [6658] = true,
        },
        locations = {
            {
                x = 2711,
                z = 3677,
            },
            {
                x = 2765,
                z = 3608,
            },
        },
    },
    {
        name = "Elder Guard",
        ids = {
            [1461] = true,
            [1462] = true,
        },
        locations = {
            {
                x = 2798,
                z = 2760,
            },
            {
                x = 2801,
                z = 2757,
            },
        },
    },
    {
        name = "Eldgrim",
        ids = {
            [1285] = true,
        },
        locations = {
            {
                x = 2658,
                z = 3674,
            },
        },
    },
    {
        name = "Elena",
        ids = {
            [335] = true,
            [19596] = true,
            [19603] = true,
        },
        locations = {
            {
                x = 2529,
                z = 3292,
            },
            {
                x = 2536,
                z = 3270,
            },
            {
                x = 2549,
                z = 3317,
            },
            {
                x = 2592,
                z = 3336,
            },
        },
    },
    {
        name = "Elena Suerten",
        ids = {
            [18202] = true,
        },
        locations = {
            {
                x = 3130,
                z = 3232,
            },
        },
    },
    {
        name = "Elf hermit",
        ids = {
            [19518] = true,
        },
        locations = {
            {
                x = 2169,
                z = 3086,
            },
        },
    },
    {
        name = "Elf musician",
        ids = {
            [8723] = true,
        },
        locations = {
            {
                x = 2255,
                z = 3190,
            },
        },
    },
    {
        name = "Elf Tracker",
        ids = {
            [1199] = true,
        },
        locations = {
            {
                x = 2257,
                z = 3149,
            },
        },
    },
    {
        name = "Eli",
        ids = {
            [17345] = true,
        },
        locations = {
            {
                x = 3021,
                z = 3295,
            },
        },
    },
    {
        name = "Elisabeta",
        ids = {
            [3540] = true,
        },
        locations = {
            {
                x = 3490,
                z = 3241,
            },
        },
    },
    {
        name = "Elissa",
        ids = {
            [1912] = true,
        },
        locations = {
            {
                x = 3380,
                z = 3442,
            },
        },
    },
    {
        name = "Elite Lumbridge guardsman",
        ids = {
            [17483] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3225,
            },
            {
                x = 3250,
                z = 3226,
            },
        },
    },
    {
        name = "Elkoy",
        ids = {
            [473] = true,
            [474] = true,
        },
        locations = {
            {
                x = 2504,
                z = 3191,
            },
            {
                x = 2514,
                z = 3159,
            },
        },
    },
    {
        name = "Ellamaria",
        ids = {
            [2581] = true,
        },
        locations = {
            {
                x = 3228,
                z = 3477,
            },
        },
    },
    {
        name = "Ellena",
        ids = {
            [2331] = true,
        },
        locations = {
            {
                x = 2861,
                z = 3432,
            },
        },
    },
    {
        name = "Elliot",
        ids = {
            [31055] = true,
        },
        locations = {
            {
                x = 2967,
                z = 3410,
            },
        },
    },
    {
        name = "Ellis",
        ids = {
            [2824] = true,
        },
        locations = {
            {
                x = 3275,
                z = 3195,
            },
        },
    },
    {
        name = "Elly the Camel",
        ids = {
            [2810] = true,
        },
        locations = {
            {
                x = 3311,
                z = 3208,
            },
        },
    },
    {
        name = "Elof",
        ids = {
            [6653] = true,
        },
        locations = {
            {
                x = 3037,
                z = 3336,
            },
        },
    },
    {
        name = "Elon",
        ids = {
            [24072] = true,
        },
        locations = {
            {
                x = 3289,
                z = 2921,
            },
        },
    },
    {
        name = "Elstan",
        ids = {
            [2323] = true,
        },
        locations = {
            {
                x = 3053,
                z = 3308,
            },
        },
    },
    {
        name = "Eluned",
        ids = {
            [404] = true,
        },
        locations = {
            {
                x = 2182,
                z = 3202,
            },
            {
                x = 2205,
                z = 3160,
            },
            {
                x = 2268,
                z = 3222,
            },
            {
                x = 2291,
                z = 3147,
            },
        },
    },
    {
        name = "Embalmer",
        ids = {
            [1980] = true,
        },
        locations = {
            {
                x = 3282,
                z = 2766,
            },
        },
    },
    {
        name = "Emilia",
        ids = {
            [3549] = true,
        },
        locations = {
            {
                x = 3482,
                z = 3210,
            },
        },
    },
    {
        name = "Emily",
        ids = {
            [736] = true,
        },
        locations = {
            {
                x = 2954,
                z = 3373,
            },
        },
    },
    {
        name = "Emir Ali Mirza",
        ids = {
            [15809] = true,
        },
        locations = {
            {
                x = 3292,
                z = 3148,
            },
        },
    },
    {
        name = "Emmett",
        ids = {
            [14801] = true,
        },
        locations = {
            {
                x = 2361,
                z = 3381,
            },
        },
    },
    {
        name = "Emperor Wing",
        ids = {
            [24070] = true,
        },
        locations = {
            {
                x = 3288,
                z = 2918,
            },
        },
    },
    {
        name = "Enchanted Broom",
        ids = {
            [4521] = true,
            [4522] = true,
        },
        locations = {
            {
                x = 2066,
                z = 3914,
            },
            {
                x = 2087,
                z = 3908,
            },
        },
    },
    {
        name = "Enchanted Bucket",
        ids = {
            [4524] = true,
            [4525] = true,
        },
        locations = {
            {
                x = 2085,
                z = 3890,
            },
            {
                x = 2090,
                z = 3889,
            },
        },
    },
    {
        name = "Endwyr, Emissary of Seren",
        ids = {
            [17133] = true,
        },
        locations = {
            {
                x = 3012,
                z = 3171,
            },
        },
    },
    {
        name = "Engineer",
        ids = {
            [3282] = true,
        },
        locations = {
            {
                x = 3008,
                z = 3442,
            },
        },
    },
    {
        name = "Engineering assistant",
        ids = {
            [3280] = true,
            [3281] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3451,
            },
            {
                x = 3019,
                z = 3443,
            },
        },
    },
    {
        name = "Enriched bright wisp",
        ids = {
            [18154] = true,
        },
        locations = {
            {
                x = 3289,
                z = 3389,
            },
        },
    },
    {
        name = "Enriched brilliant wisp",
        ids = {},
        locations = {
            {
                x = 3397,
                z = 3309,
            },
        },
    },
    {
        name = "Enriched cursed wisp",
        ids = {
            [23161] = true,
        },
        locations = {
            {
                x = 3141,
                z = 3726,
            },
        },
    },
    {
        name = "Enriched flickering wisp",
        ids = {
            [18152] = true,
        },
        locations = {
            {
                x = 2999,
                z = 3407,
            },
        },
    },
    {
        name = "Enriched gleaming wisp",
        ids = {
            [18160] = true,
        },
        locations = {
            {
                x = 2876,
                z = 3051,
            },
        },
    },
    {
        name = "Enriched glowing wisp",
        ids = {
            [18156] = true,
        },
        locations = {
            {
                x = 2732,
                z = 3426,
            },
        },
    },
    {
        name = "Enriched incandescent wisp",
        ids = {
            [18172] = true,
        },
        locations = {
            {
                x = 2280,
                z = 3055,
            },
        },
    },
    {
        name = "Enriched luminous wisp",
        ids = {
            [18170] = true,
        },
        locations = {
            {
                x = 3298,
                z = 2654,
            },
        },
    },
    {
        name = "Enriched lustrous wisp",
        ids = {
            [18164] = true,
        },
        locations = {
            {
                x = 3464,
                z = 3537,
            },
        },
    },
    {
        name = "Enriched radiant wisp",
        ids = {
            [18168] = true,
        },
        locations = {
            {
                x = 3812,
                z = 3553,
            },
        },
    },
    {
        name = "Enriched sparkling wisp",
        ids = {
            [18158] = true,
        },
        locations = {
            {
                x = 2767,
                z = 3587,
            },
        },
    },
    {
        name = "Enriched vibrant wisp",
        ids = {
            [18162] = true,
        },
        locations = {
            {
                x = 2418,
                z = 2869,
            },
        },
    },
    {
        name = "Entrance Guardian",
        ids = {
            [3097] = true,
        },
        locations = {
            {
                x = 3363,
                z = 3304,
            },
        },
    },
    {
        name = "Eoin",
        ids = {
            [2368] = true,
        },
        locations = {
            {
                x = 2337,
                z = 3175,
            },
        },
    },
    {
        name = "Eric",
        ids = {
            [5499] = true,
        },
        locations = {
            {
                x = 2403,
                z = 3809,
            },
        },
    },
    {
        name = "Erjolf",
        ids = {
            [7404] = true,
            [7405] = true,
        },
        locations = {
            {
                x = 2695,
                z = 3794,
            },
            {
                x = 2736,
                z = 3730,
            },
        },
    },
    {
        name = "Erskine",
        ids = {
            [23163] = true,
        },
        locations = {
            {
                x = 3103,
                z = 3520,
            },
        },
    },
    {
        name = "Escaping slave",
        ids = {
            [4985] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3025,
            },
        },
    },
    {
        name = "Estocada",
        ids = {
            [3670] = true,
        },
        locations = {
            {
                x = 3313,
                z = 3213,
            },
        },
    },
    {
        name = "Estrith",
        ids = {
            [9714] = true,
        },
        locations = {
            {
                x = 3433,
                z = 3680,
            },
        },
    },
    {
        name = "Etta Stone",
        ids = {
            [28681] = true,
        },
        locations = {
            {
                x = 3314,
                z = 3242,
            },
        },
    },
    {
        name = "Eudav",
        ids = {
            [2352] = true,
        },
        locations = {
            {
                x = 2334,
                z = 3182,
            },
        },
    },
    {
        name = "Eva",
        ids = {
            [26809] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3408,
            },
        },
    },
    {
        name = "Evil Bob",
        ids = {
            [16850] = true,
        },
        locations = {
            {
                x = 3100,
                z = 3280,
            },
        },
    },
    {
        name = "Evil Dave",
        ids = {
            [3378] = true,
        },
        locations = {
            {
                x = 3077,
                z = 3493,
            },
        },
    },
    {
        name = "Examiner",
        ids = {
            [618] = true,
            [4566] = true,
            [4567] = true,
            [26335] = true,
        },
        locations = {
            {
                x = 3351,
                z = 3345,
            },
            {
                x = 3354,
                z = 3346,
            },
            {
                x = 3357,
                z = 3345,
            },
            {
                x = 3364,
                z = 3408,
            },
        },
    },
    {
        name = "Explorer Jack",
        ids = {
            [7969] = true,
        },
        locations = {
            {
                x = 3204,
                z = 3241,
            },
        },
    },
    {
        name = "Ezekial",
        ids = {
            [7190] = true,
            [13754] = true,
        },
        locations = {
            {
                x = 2732,
                z = 3290,
            },
            {
                x = 3488,
                z = 3703,
            },
        },
    },
    {
        name = "Ezekial Lovecraft",
        ids = {
            [7190] = true,
        },
        locations = {
            {
                x = 2732,
                z = 3290,
            },
        },
    },
    {
        name = "Ezreal",
        ids = {
            [26937] = true,
        },
        locations = {
            {
                x = 3320,
                z = 3382,
            },
        },
    },
    {
        name = "Fadli",
        ids = {
            [958] = true,
        },
        locations = {
            {
                x = 3383,
                z = 3269,
            },
        },
    },
    {
        name = "Faisal the Barman",
        ids = {
            [26839] = true,
        },
        locations = {
            {
                x = 3361,
                z = 2955,
            },
        },
    },
    {
        name = "Faizan Augour",
        ids = {
            [18197] = true,
        },
        locations = {
            {
                x = 3129,
                z = 3231,
            },
        },
    },
    {
        name = "Famine",
        ids = {
            [25909] = true,
        },
        locations = {
            {
                x = 3150,
                z = 3190,
            },
        },
    },
    {
        name = "Fancy Dan",
        ids = {
            [4361] = true,
        },
        locations = {
            {
                x = 3801,
                z = 3015,
            },
        },
    },
    {
        name = "Fancy-dress shop owner",
        ids = {
            [554] = true,
        },
        locations = {
            {
                x = 3281,
                z = 3398,
            },
        },
    },
    {
        name = "Fanellaman",
        ids = {
            [2522] = true,
        },
        locations = {
            {
                x = 2759,
                z = 3096,
            },
        },
    },
    {
        name = "Farhad",
        ids = {
            [26896] = true,
        },
        locations = {
            {
                x = 3361,
                z = 3197,
            },
        },
    },
    {
        name = "Farid Morrisane (ores)",
        ids = {
            [6523] = true,
        },
        locations = {
            {
                x = 3181,
                z = 3501,
            },
        },
    },
    {
        name = "Farmer",
        ids = {
            [1377] = true,
            [1761] = true,
            [15001] = true,
            [15002] = true,
        },
        locations = {
            {
                x = 2538,
                z = 3852,
            },
            {
                x = 2883,
                z = 3471,
            },
            {
                x = 2885,
                z = 3472,
            },
            {
                x = 3113,
                z = 3275,
            },
        },
    },
    {
        name = "Farmer Brumty",
        ids = {
            [291] = true,
        },
        locations = {
            {
                x = 2593,
                z = 3358,
            },
        },
    },
    {
        name = "Farmer Fromund",
        ids = {
            [3917] = true,
        },
        locations = {
            {
                x = 2582,
                z = 3864,
            },
        },
    },
    {
        name = "Farmer in need (easy)",
        ids = {
            [26746] = true,
        },
        locations = {
            {
                x = 2644,
                z = 3348,
            },
        },
    },
    {
        name = "Faruq",
        ids = {
            [9159] = true,
        },
        locations = {
            {
                x = 3301,
                z = 3208,
            },
        },
    },
    {
        name = "Fat Tony",
        ids = {
            [596] = true,
        },
        locations = {
            {
                x = 3036,
                z = 3707,
            },
        },
    },
    {
        name = "Father",
        ids = {
            [23256] = true,
        },
        locations = {
            {
                x = 3094,
                z = 3476,
            },
        },
    },
    {
        name = "Father Aereck",
        ids = {
            [456] = true,
        },
        locations = {
            {
                x = 3246,
                z = 3205,
            },
        },
    },
    {
        name = "Father Badden",
        ids = {
            [2902] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3090,
            },
        },
    },
    {
        name = "Father Flint",
        ids = {
            [29813] = true,
        },
        locations = {
            {
                x = 3323,
                z = 3563,
            },
        },
    },
    {
        name = "Father Lawrence",
        ids = {
            [640] = true,
        },
        locations = {
            {
                x = 3254,
                z = 3484,
            },
        },
    },
    {
        name = "Father Reen",
        ids = {
            [2897] = true,
        },
        locations = {
            {
                x = 3271,
                z = 3158,
            },
        },
    },
    {
        name = "Father Urhney",
        ids = {
            [458] = true,
        },
        locations = {
            {
                x = 3208,
                z = 3150,
            },
        },
    },
    {
        name = "Fayeth",
        ids = {
            [2342] = true,
        },
        locations = {
            {
                x = 3193,
                z = 3233,
            },
        },
    },
    {
        name = "Fayez the Guard",
        ids = {
            [26821] = true,
        },
        locations = {
            {
                x = 3295,
                z = 3193,
            },
        },
    },
    {
        name = "Felkrash",
        ids = {
            [2951] = true,
        },
        locations = {
            {
                x = 3016,
                z = 3234,
            },
        },
    },
    {
        name = "Female slave",
        ids = {
            [1766] = true,
            [1791] = true,
        },
        locations = {
            {
                x = 3293,
                z = 3016,
            },
            {
                x = 3303,
                z = 3024,
            },
        },
    },
    {
        name = "Femi",
        ids = {
            [676] = true,
        },
        locations = {
            {
                x = 2459,
                z = 3382,
            },
        },
    },
    {
        name = "Fenton",
        ids = {
            [25871] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3368,
            },
        },
    },
    {
        name = "Fernahei",
        ids = {
            [517] = true,
        },
        locations = {
            {
                x = 2870,
                z = 2972,
            },
        },
    },
    {
        name = "Fidelio",
        ids = {
            [1040] = true,
        },
        locations = {
            {
                x = 3475,
                z = 3497,
            },
        },
    },
    {
        name = "Filliman Tarlock",
        ids = {
            [18561] = true,
        },
        locations = {
            {
                x = 3440,
                z = 3336,
            },
        },
    },
    {
        name = "Fish trader",
        ids = {
            [24548] = true,
        },
        locations = {
            {
                x = 3215,
                z = 2775,
            },
        },
    },
    {
        name = "Fisherman",
        ids = {
            [1302] = true,
            [15567] = true,
            [15568] = true,
            [21185] = true,
        },
        locations = {
            {
                x = 2031,
                z = 3802,
            },
            {
                x = 2576,
                z = 3529,
            },
            {
                x = 2618,
                z = 3385,
            },
            {
                x = 2641,
                z = 3699,
            },
        },
    },
    {
        name = "Fisherman Frodi",
        ids = {
            [1397] = true,
        },
        locations = {
            {
                x = 2576,
                z = 3851,
            },
        },
    },
    {
        name = "Fishmonger",
        ids = {
            [1315] = true,
            [1369] = true,
            [1393] = true,
        },
        locations = {
            {
                x = 2518,
                z = 3866,
            },
            {
                x = 2605,
                z = 3876,
            },
            {
                x = 2646,
                z = 3675,
            },
        },
    },
    {
        name = "Flickering wisp",
        ids = {},
        locations = {
            {
                x = 2991,
                z = 3417,
            },
            {
                x = 2996,
                z = 3404,
            },
            {
                x = 2997,
                z = 3406,
            },
            {
                x = 2997,
                z = 3415,
            },
            {
                x = 2998,
                z = 3407,
            },
            {
                x = 2998,
                z = 3408,
            },
            {
                x = 2998,
                z = 3412,
            },
            {
                x = 2999,
                z = 3409,
            },
            {
                x = 2999,
                z = 3410,
            },
            {
                x = 3000,
                z = 3404,
            },
            {
                x = 3003,
                z = 3406,
            },
            {
                x = 3006,
                z = 3404,
            },
        },
    },
    {
        name = "Flint",
        ids = {
            [14805] = true,
        },
        locations = {
            {
                x = 2362,
                z = 3381,
            },
        },
    },
    {
        name = "Flippers McGraw",
        ids = {
            [6668] = true,
        },
        locations = {
            {
                x = 3049,
                z = 3259,
            },
            {
                x = 3668,
                z = 2984,
            },
        },
    },
    {
        name = "Florin",
        ids = {
            [3550] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3242,
            },
        },
    },
    {
        name = "Flosi Dalksson",
        ids = {
            [5484] = true,
        },
        locations = {
            {
                x = 2418,
                z = 3813,
            },
        },
    },
    {
        name = "Flower Girl",
        ids = {
            [1378] = true,
        },
        locations = {
            {
                x = 2514,
                z = 3866,
            },
        },
    },
    {
        name = "Fluffs",
        ids = {
            [7744] = true,
        },
        locations = {
            {
                x = 3148,
                z = 3411,
            },
        },
    },
    {
        name = "Fly trap",
        ids = {
            [151] = true,
        },
        locations = {
            {
                x = 2755,
                z = 3156,
            },
            {
                x = 2761,
                z = 3155,
            },
        },
    },
    {
        name = "Flying Book",
        ids = {
            [3094] = true,
            [3095] = true,
        },
        locations = {
            {
                x = 3364,
                z = 3308,
            },
            {
                x = 3367,
                z = 3304,
            },
        },
    },
    {
        name = "Flying bugs",
        ids = {
            [7032] = true,
            [7033] = true,
            [7034] = true,
            [7035] = true,
            [7036] = true,
            [7040] = true,
            [7041] = true,
            [7042] = true,
            [7043] = true,
            [7091] = true,
            [7092] = true,
            [7093] = true,
            [7094] = true,
        },
        locations = {
            {
                x = 2525,
                z = 2852,
            },
            {
                x = 2526,
                z = 2854,
            },
            {
                x = 2527,
                z = 2851,
            },
            {
                x = 2527,
                z = 2853,
            },
            {
                x = 2536,
                z = 2839,
            },
            {
                x = 2538,
                z = 2841,
            },
            {
                x = 2539,
                z = 2838,
            },
            {
                x = 2541,
                z = 2837,
            },
            {
                x = 2542,
                z = 2839,
            },
            {
                x = 2551,
                z = 2863,
            },
            {
                x = 2553,
                z = 2862,
            },
            {
                x = 2562,
                z = 2863,
            },
            {
                x = 2563,
                z = 2862,
            },
        },
    },
    {
        name = "Flynn",
        ids = {
            [580] = true,
        },
        locations = {
            {
                x = 2951,
                z = 3386,
            },
        },
    },
    {
        name = "Foppish Pierre",
        ids = {
            [15086] = true,
        },
        locations = {
            {
                x = 2882,
                z = 3423,
            },
        },
    },
    {
        name = "Foreman George",
        ids = {
            [18522] = true,
        },
        locations = {
            {
                x = 3201,
                z = 3248,
            },
        },
    },
    {
        name = "Forester",
        ids = {
            [231] = true,
        },
        locations = {
            {
                x = 2650,
                z = 3468,
            },
        },
    },
    {
        name = "Forgotten warrior(facing down)",
        ids = {},
        locations = {
            {
                x = 2881,
                z = 3864,
            },
            {
                x = 2889,
                z = 3869,
            },
        },
    },
    {
        name = "Forgotten warrior(facing up)",
        ids = {},
        locations = {
            {
                x = 2883,
                z = 3873,
            },
            {
                x = 2894,
                z = 3858,
            },
        },
    },
    {
        name = "Forgotten warrior(sitting)",
        ids = {},
        locations = {
            {
                x = 2889,
                z = 3863,
            },
            {
                x = 2892,
                z = 3874,
            },
        },
    },
    {
        name = "Fortress guard",
        ids = {
            [18036] = true,
            [18037] = true,
        },
        locations = {
            {
                x = 3003,
                z = 3575,
            },
            {
                x = 3024,
                z = 3540,
            },
        },
    },
    {
        name = "Fortunato",
        ids = {
            [3671] = true,
        },
        locations = {
            {
                x = 3085,
                z = 3250,
            },
        },
    },
    {
        name = "Fossegrimen",
        ids = {},
        locations = {
            {
                x = 2625,
                z = 3600,
            },
        },
    },
    {
        name = "Francis",
        ids = {
            [2327] = true,
        },
        locations = {
            {
                x = 2814,
                z = 3337,
            },
        },
    },
    {
        name = "Frank",
        ids = {
            [6197] = true,
        },
        locations = {
            {
                x = 2742,
                z = 3577,
            },
        },
    },
    {
        name = "Franklin Caranos",
        ids = {
            [3823] = true,
        },
        locations = {
            {
                x = 2344,
                z = 3667,
            },
        },
    },
    {
        name = "Franscisco",
        ids = {
            [23919] = true,
        },
        locations = {
            {
                x = 2282,
                z = 3541,
            },
            {
                x = 2291,
                z = 3560,
            },
        },
    },
    {
        name = "Frawd",
        ids = {
            [7048] = true,
        },
        locations = {
            {
                x = 2545,
                z = 2836,
            },
        },
    },
    {
        name = "Freaky Forester",
        ids = {
            [16857] = true,
        },
        locations = {
            {
                x = 2628,
                z = 3489,
            },
        },
    },
    {
        name = "Fred the Farmer",
        ids = {
            [758] = true,
        },
        locations = {
            {
                x = 3206,
                z = 3290,
            },
        },
    },
    {
        name = "Freda",
        ids = {
            [15099] = true,
        },
        locations = {
            {
                x = 2820,
                z = 3556,
            },
        },
    },
    {
        name = "Fremennik banker",
        ids = {
            [9710] = true,
        },
        locations = {
            {
                x = 3448,
                z = 3720,
            },
        },
    },
    {
        name = "Fremennik shipmaster",
        ids = {
            [9707] = true,
            [9708] = true,
        },
        locations = {
            {
                x = 3254,
                z = 3170,
            },
            {
                x = 3513,
                z = 3694,
            },
        },
    },
    {
        name = "Fremennik warrior",
        ids = {
            [6706] = true,
            [9709] = true,
        },
        locations = {
            {
                x = 3242,
                z = 3171,
            },
            {
                x = 3273,
                z = 3179,
            },
        },
    },
    {
        name = "Frenita",
        ids = {
            [593] = true,
        },
        locations = {
            {
                x = 2566,
                z = 3098,
            },
        },
    },
    {
        name = "Freya Lune",
        ids = {
            [21169] = true,
        },
        locations = {
            {
                x = 2031,
                z = 3816,
            },
            {
                x = 2631,
                z = 3683,
            },
        },
    },
    {
        name = "Freygerd",
        ids = {
            [5493] = true,
        },
        locations = {
            {
                x = 2390,
                z = 3801,
            },
        },
    },
    {
        name = "Fridgeir",
        ids = {
            [1277] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3678,
            },
        },
    },
    {
        name = "Fridleif Shieldson",
        ids = {
            [5505] = true,
        },
        locations = {
            {
                x = 2334,
                z = 3800,
            },
        },
    },
    {
        name = "Frincos",
        ids = {
            [578] = true,
        },
        locations = {
            {
                x = 2808,
                z = 3342,
            },
        },
    },
    {
        name = "Frito",
        ids = {},
        locations = {
            {
                x = 3385,
                z = 3211,
            },
        },
    },
    {
        name = "Fritz the Glassblower",
        ids = {
            [4909] = true,
        },
        locations = {
            {
                x = 2831,
                z = 3350,
            },
        },
    },
    {
        name = "Frizzy Skernip",
        ids = {
            [4560] = true,
        },
        locations = {
            {
                x = 3060,
                z = 3256,
            },
        },
    },
    {
        name = "Frog",
        ids = {
            [2689] = true,
            [11466] = true,
        },
        locations = {
            {
                x = 2734,
                z = 3466,
            },
            {
                x = 2918,
                z = 3319,
            },
        },
    },
    {
        name = "Fur trader",
        ids = {
            [573] = true,
            [1316] = true,
        },
        locations = {
            {
                x = 2640,
                z = 3675,
            },
            {
                x = 2664,
                z = 3296,
            },
        },
    },
    {
        name = "Fycie",
        ids = {
            [1011] = true,
        },
        locations = {
            {
                x = 2631,
                z = 2999,
            },
        },
    },
    {
        name = "G.L.O. Caranock",
        ids = {
            [1427] = true,
        },
        locations = {
            {
                x = 2956,
                z = 3025,
            },
        },
    },
    {
        name = "Gabooty",
        ids = {
            [2519] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3065,
            },
        },
    },
    {
        name = "Gabriela",
        ids = {
            [13978] = true,
        },
        locations = {
            {
                x = 3514,
                z = 3209,
            },
        },
    },
    {
        name = "Gadrin",
        ids = {
            [3295] = true,
        },
        locations = {
            {
                x = 3019,
                z = 3337,
            },
        },
    },
    {
        name = "Gail",
        ids = {
            [25992] = true,
        },
        locations = {
            {
                x = 2225,
                z = 3658,
            },
        },
    },
    {
        name = "Gaius",
        ids = {
            [586] = true,
        },
        locations = {
            {
                x = 2930,
                z = 3550,
            },
        },
    },
    {
        name = "Galahad",
        ids = {
            [218] = true,
        },
        locations = {
            {
                x = 2612,
                z = 3474,
            },
        },
    },
    {
        name = "Gale Freshman",
        ids = {
            [29477] = true,
        },
        locations = {
            {
                x = 2902,
                z = 3536,
            },
        },
    },
    {
        name = "Garai",
        ids = {
            [3033] = true,
        },
        locations = {
            {
                x = 3436,
                z = 2901,
            },
        },
    },
    {
        name = "Garden supplier",
        ids = {
            [4251] = true,
        },
        locations = {
            {
                x = 3014,
                z = 3382,
            },
        },
    },
    {
        name = "Gardener Ghost",
        ids = {
            [1667] = true,
        },
        locations = {
            {
                x = 3551,
                z = 3561,
            },
        },
    },
    {
        name = "Gardener Gunnhild",
        ids = {
            [1398] = true,
        },
        locations = {
            {
                x = 2527,
                z = 3855,
            },
        },
    },
    {
        name = "Gargh",
        ids = {
            [2063] = true,
        },
        locations = {
            {
                x = 2413,
                z = 3053,
            },
        },
    },
    {
        name = "Garkor",
        ids = {
            [1411] = true,
        },
        locations = {
            {
                x = 2805,
                z = 2762,
            },
        },
    },
    {
        name = "Garth",
        ids = {
            [2330] = true,
        },
        locations = {
            {
                x = 2766,
                z = 3212,
            },
        },
    },
    {
        name = "Garv",
        ids = {
            [788] = true,
        },
        locations = {
            {
                x = 2776,
                z = 3186,
            },
        },
    },
    {
        name = "Gayle",
        ids = {},
        locations = {
            {
                x = 3335,
                z = 3236,
            },
        },
    },
    {
        name = "Gee'ka",
        ids = {
            [26985] = true,
        },
        locations = {
            {
                x = 2678,
                z = 3402,
            },
        },
    },
    {
        name = "Gem merchant",
        ids = {
            [570] = true,
            [13189] = true,
        },
        locations = {
            {
                x = 2669,
                z = 3302,
            },
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Gem trader",
        ids = {
            [540] = true,
            [24547] = true,
        },
        locations = {
            {
                x = 3221,
                z = 2789,
            },
            {
                x = 3288,
                z = 3207,
            },
        },
    },
    {
        name = "General Bentnoze",
        ids = {
            [4493] = true,
        },
        locations = {
            {
                x = 2958,
                z = 3513,
            },
        },
    },
    {
        name = "General Hining",
        ids = {
            [7121] = true,
        },
        locations = {
            {
                x = 2187,
                z = 3149,
            },
        },
    },
    {
        name = "General store merchant",
        ids = {
            [13190] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "General Wartface",
        ids = {
            [4494] = true,
        },
        locations = {
            {
                x = 2957,
                z = 3513,
            },
        },
    },
    {
        name = "Geoff",
        ids = {
            [9168] = true,
        },
        locations = {
            {
                x = 2663,
                z = 3274,
            },
        },
    },
    {
        name = "Geoffrey",
        ids = {
            [8590] = true,
        },
        locations = {
            {
                x = 2744,
                z = 3443,
            },
        },
    },
    {
        name = "George Laxmeister",
        ids = {
            [3826] = true,
        },
        locations = {
            {
                x = 2323,
                z = 3684,
            },
        },
    },
    {
        name = "Gerald",
        ids = {
            [303] = true,
        },
        locations = {
            {
                x = 2528,
                z = 3414,
            },
        },
    },
    {
        name = "Gerrant",
        ids = {
            [558] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3225,
            },
        },
    },
    {
        name = "Gertrude",
        ids = {
            [780] = true,
        },
        locations = {
            {
                x = 3151,
                z = 3410,
            },
        },
    },
    {
        name = "Ghaslor the Elder",
        ids = {
            [3029] = true,
        },
        locations = {
            {
                x = 3441,
                z = 2933,
            },
        },
    },
    {
        name = "Ghommal",
        ids = {
            [8266] = true,
            [8277] = true,
        },
        locations = {
            {
                x = 2879,
                z = 3541,
            },
            {
                x = 2994,
                z = 3343,
            },
        },
    },
    {
        name = "Ghost",
        ids = {
            [27312] = true,
        },
        locations = {
            {
                x = 3089,
                z = 3342,
            },
            {
                x = 3089,
                z = 3344,
            },
            {
                x = 3089,
                z = 3346,
            },
        },
    },
    {
        name = "Ghost banker",
        ids = {
            [1702] = true,
        },
        locations = {
            {
                x = 3687,
                z = 3464,
            },
            {
                x = 3688,
                z = 3464,
            },
            {
                x = 3690,
                z = 3464,
            },
            {
                x = 3691,
                z = 3464,
            },
        },
    },
    {
        name = "Ghost captain",
        ids = {
            [1704] = true,
            [1705] = true,
        },
        locations = {
            {
                x = 3691,
                z = 3513,
            },
            {
                x = 3703,
                z = 3487,
            },
        },
    },
    {
        name = "Ghost disciple",
        ids = {
            [1686] = true,
        },
        locations = {
            {
                x = 3655,
                z = 3516,
            },
            {
                x = 3662,
                z = 3516,
            },
        },
    },
    {
        name = "Ghost guard",
        ids = {
            [1706] = true,
        },
        locations = {
            {
                x = 3652,
                z = 3484,
            },
            {
                x = 3652,
                z = 3487,
            },
            {
                x = 3658,
                z = 3508,
            },
            {
                x = 3661,
                z = 3508,
            },
        },
    },
    {
        name = "Ghost innkeeper",
        ids = {
            [1700] = true,
        },
        locations = {
            {
                x = 3681,
                z = 3496,
            },
        },
    },
    {
        name = "Ghost sailor",
        ids = {
            [1703] = true,
        },
        locations = {
            {
                x = 3686,
                z = 3503,
            },
            {
                x = 3689,
                z = 3508,
            },
            {
                x = 3690,
                z = 3514,
            },
            {
                x = 3691,
                z = 3512,
            },
            {
                x = 3698,
                z = 3497,
            },
            {
                x = 3704,
                z = 3496,
            },
        },
    },
    {
        name = "Ghost shopkeeper",
        ids = {
            [1699] = true,
        },
        locations = {
            {
                x = 3658,
                z = 3477,
            },
        },
    },
    {
        name = "Ghost villager",
        ids = {
            [1697] = true,
        },
        locations = {
            {
                x = 3658,
                z = 3465,
            },
            {
                x = 3661,
                z = 3494,
            },
            {
                x = 3661,
                z = 3497,
            },
            {
                x = 3662,
                z = 3463,
            },
            {
                x = 3662,
                z = 3502,
            },
            {
                x = 3665,
                z = 3493,
            },
            {
                x = 3668,
                z = 3474,
            },
            {
                x = 3672,
                z = 3503,
            },
            {
                x = 3673,
                z = 3479,
            },
            {
                x = 3675,
                z = 3496,
            },
            {
                x = 3679,
                z = 3474,
            },
            {
                x = 3684,
                z = 3485,
            },
        },
    },
    {
        name = "Ghostly piper",
        ids = {
            [8713] = true,
        },
        locations = {
            {
                x = 3246,
                z = 3842,
            },
        },
    },
    {
        name = "Ghul Invoker",
        ids = {
            [22986] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3544,
            },
        },
    },
    {
        name = "Gideon Bede",
        ids = {
            [19501] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3483,
            },
        },
    },
    {
        name = "Giles",
        ids = {
            [16847] = true,
        },
        locations = {
            {
                x = 3165,
                z = 3475,
            },
        },
    },
    {
        name = "Gileth",
        ids = {
            [2344] = true,
        },
        locations = {
            {
                x = 2488,
                z = 3179,
            },
        },
    },
    {
        name = "Gillie Groats",
        ids = {
            [3807] = true,
        },
        locations = {
            {
                x = 3254,
                z = 3274,
            },
        },
    },
    {
        name = "Gjalp",
        ids = {
            [8070] = true,
        },
        locations = {
            {
                x = 3089,
                z = 3515,
            },
        },
    },
    {
        name = "Gleaming wisp",
        ids = {},
        locations = {
            {
                x = 2876,
                z = 3040,
            },
            {
                x = 2877,
                z = 3041,
            },
            {
                x = 2877,
                z = 3051,
            },
            {
                x = 2878,
                z = 3062,
            },
            {
                x = 2879,
                z = 3051,
            },
            {
                x = 2879,
                z = 3053,
            },
            {
                x = 2879,
                z = 3059,
            },
            {
                x = 2880,
                z = 3053,
            },
            {
                x = 2881,
                z = 3051,
            },
            {
                x = 2881,
                z = 3053,
            },
            {
                x = 2881,
                z = 3059,
            },
            {
                x = 2881,
                z = 3063,
            },
            {
                x = 2887,
                z = 3052,
            },
        },
    },
    {
        name = "Glowing wisp",
        ids = {},
        locations = {
            {
                x = 2724,
                z = 3414,
            },
            {
                x = 2726,
                z = 3427,
            },
            {
                x = 2728,
                z = 3413,
            },
            {
                x = 2734,
                z = 3425,
            },
            {
                x = 2735,
                z = 3428,
            },
            {
                x = 2736,
                z = 3427,
            },
            {
                x = 2737,
                z = 3424,
            },
            {
                x = 2739,
                z = 3429,
            },
            {
                x = 2742,
                z = 3426,
            },
            {
                x = 2742,
                z = 3428,
            },
            {
                x = 2743,
                z = 3427,
            },
            {
                x = 2746,
                z = 3429,
            },
            {
                x = 2749,
                z = 3432,
            },
        },
    },
    {
        name = "Glum",
        ids = {
            [7077] = true,
        },
        locations = {
            {
                x = 2617,
                z = 2856,
            },
        },
    },
    {
        name = "Gnome ball referee",
        ids = {
            [635] = true,
        },
        locations = {
            {
                x = 2384,
                z = 3488,
            },
        },
    },
    {
        name = "Gnome baller",
        ids = {
            [621] = true,
            [625] = true,
            [629] = true,
        },
        locations = {
            {
                x = 2391,
                z = 3484,
            },
            {
                x = 2391,
                z = 3487,
            },
            {
                x = 2391,
                z = 3489,
            },
            {
                x = 2391,
                z = 3492,
            },
            {
                x = 2396,
                z = 3485,
            },
            {
                x = 2396,
                z = 3487,
            },
            {
                x = 2396,
                z = 3489,
            },
            {
                x = 2396,
                z = 3491,
            },
            {
                x = 2400,
                z = 3483,
            },
            {
                x = 2400,
                z = 3485,
            },
            {
                x = 2400,
                z = 3487,
            },
            {
                x = 2400,
                z = 3489,
            },
            {
                x = 2400,
                z = 3491,
            },
            {
                x = 2400,
                z = 3493,
            },
        },
    },
    {
        name = "Gnome Banker",
        ids = {
            [19086] = true,
        },
        locations = {
            {
                x = 2886,
                z = 3535,
            },
        },
    },
    {
        name = "Gnome Child T-shirt",
        ids = {
            [29446] = true,
            [29447] = true,
        },
        locations = {
            {
                x = 3177,
                z = 3479,
            },
            {
                x = 3180,
                z = 3481,
            },
        },
    },
    {
        name = "Gnome Coach",
        ids = {
            [2802] = true,
        },
        locations = {
            {
                x = 2406,
                z = 3498,
            },
        },
    },
    {
        name = "Gnome trainer",
        ids = {
            [162] = true,
        },
        locations = {
            {
                x = 2469,
                z = 3423,
            },
            {
                x = 2469,
                z = 3434,
            },
            {
                x = 2470,
                z = 3426,
            },
            {
                x = 2477,
                z = 3426,
            },
            {
                x = 2479,
                z = 3427,
            },
            {
                x = 2482,
                z = 3422,
            },
            {
                x = 2489,
                z = 3423,
            },
            {
                x = 2489,
                z = 3427,
            },
            {
                x = 2490,
                z = 3435,
            },
        },
    },
    {
        name = "Gnome winger",
        ids = {
            [633] = true,
        },
        locations = {
            {
                x = 2393,
                z = 3483,
            },
            {
                x = 2393,
                z = 3493,
            },
        },
    },
    {
        name = "Gnormadium Avlafrim",
        ids = {
            [1800] = true,
        },
        locations = {
            {
                x = 2544,
                z = 2973,
            },
        },
    },
    {
        name = "Goblin musician",
        ids = {
            [8712] = true,
        },
        locations = {
            {
                x = 3140,
                z = 3642,
            },
            {
                x = 3142,
                z = 3642,
            },
        },
    },
    {
        name = "Goebie",
        ids = {
            [21366] = true,
            [21367] = true,
            [21369] = true,
        },
        locations = {
            {
                x = 3401,
                z = 2874,
            },
            {
                x = 3408,
                z = 2876,
            },
            {
                x = 3414,
                z = 2878,
            },
            {
                x = 3416,
                z = 2872,
            },
        },
    },
    {
        name = "Golden butterfly",
        ids = {
            [26944] = true,
        },
        locations = {
            {
                x = 3780,
                z = 3216,
            },
        },
    },
    {
        name = "Golden sheep",
        ids = {
            [1271] = true,
            [1272] = true,
            [5172] = true,
            [5173] = true,
        },
        locations = {
            {
                x = 2761,
                z = 3608,
            },
            {
                x = 2763,
                z = 3610,
            },
            {
                x = 2763,
                z = 3612,
            },
            {
                x = 2764,
                z = 3606,
            },
            {
                x = 2766,
                z = 3605,
            },
            {
                x = 2768,
                z = 3610,
            },
            {
                x = 2769,
                z = 3607,
            },
        },
    },
    {
        name = "Golrana",
        ids = {
            [5760] = true,
        },
        locations = {
            {
                x = 2538,
                z = 3171,
            },
        },
    },
    {
        name = "Golrie",
        ids = {
            [2612] = true,
        },
        locations = {
            {
                x = 2519,
                z = 3166,
            },
        },
    },
    {
        name = "Goomah",
        ids = {
            [25190] = true,
        },
        locations = {
            {
                x = 2593,
                z = 3410,
            },
        },
    },
    {
        name = "Gorajo hoardstalker",
        ids = {
            [20289] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 3436,
                z = 3699,
            },
        },
    },
    {
        name = "Gordon",
        ids = {
            [24071] = true,
        },
        locations = {
            {
                x = 3284,
                z = 2914,
            },
        },
    },
    {
        name = "Goreu",
        ids = {
            [2363] = true,
        },
        locations = {
            {
                x = 2337,
                z = 3159,
            },
        },
    },
    {
        name = "Gossip",
        ids = {
            [813] = true,
        },
        locations = {
            {
                x = 2742,
                z = 3555,
            },
        },
    },
    {
        name = "Goth leprechaun",
        ids = {
            [8000] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 2989,
                z = 3693,
            },
            {
                x = 3145,
                z = 3824,
            },
        },
    },
    {
        name = "Goutbones",
        ids = {
            [18910] = true,
        },
        locations = {
            {
                x = 2969,
                z = 3482,
            },
        },
    },
    {
        name = "Grand Exchange clerk",
        ids = {
            [2240] = true,
            [2241] = true,
            [24539] = true,
            [24540] = true,
            [24541] = true,
            [24542] = true,
            [24853] = true,
            [24854] = true,
        },
        locations = {
            {
                x = 3159,
                z = 3493,
            },
            {
                x = 3163,
                z = 3497,
            },
            {
                x = 3166,
                z = 3486,
            },
            {
                x = 3170,
                z = 3490,
            },
            {
                x = 3234,
                z = 2757,
            },
            {
                x = 3234,
                z = 2765,
            },
            {
                x = 3235,
                z = 2755,
            },
            {
                x = 3236,
                z = 2765,
            },
        },
    },
    {
        name = "Grand Exchange Tutor",
        ids = {
            [6521] = true,
        },
        locations = {
            {
                x = 3164,
                z = 3475,
            },
        },
    },
    {
        name = "Grand Vizier Ehsan (Merchant)",
        ids = {
            [24487] = true,
        },
        locations = {
            {
                x = 3195,
                z = 2771,
            },
        },
    },
    {
        name = "Grand Vizier Hassan",
        ids = {
            [24649] = true,
            [24653] = true,
        },
        locations = {
            {
                x = 3197,
                z = 2771,
            },
            {
                x = 3294,
                z = 3149,
            },
        },
    },
    {
        name = "Grandpa Jack",
        ids = {
            [230] = true,
        },
        locations = {
            {
                x = 2650,
                z = 3452,
            },
        },
    },
    {
        name = "Granny Potterington",
        ids = {
            [25839] = true,
        },
        locations = {
            {
                x = 2646,
                z = 3357,
            },
        },
    },
    {
        name = "Granny Rowan",
        ids = {
            [26135] = true,
        },
        locations = {
            {
                x = 3296,
                z = 3568,
            },
        },
    },
    {
        name = "Gravingas",
        ids = {
            [1685] = true,
        },
        locations = {
            {
                x = 3660,
                z = 3499,
            },
        },
    },
    {
        name = "Greasycheeks",
        ids = {
            [6127] = true,
        },
        locations = {
            {
                x = 2467,
                z = 3183,
            },
        },
    },
    {
        name = "Green salamander",
        ids = {
            [5117] = true,
        },
        locations = {
            {
                x = 3532,
                z = 3446,
            },
            {
                x = 3537,
                z = 3445,
            },
            {
                x = 3537,
                z = 3451,
            },
            {
                x = 3547,
                z = 3442,
            },
            {
                x = 3549,
                z = 3437,
            },
            {
                x = 3549,
                z = 3449,
            },
            {
                x = 3552,
                z = 3450,
            },
            {
                x = 3554,
                z = 3440,
            },
            {
                x = 3554,
                z = 3453,
            },
            {
                x = 3556,
                z = 3438,
            },
            {
                x = 3558,
                z = 3444,
            },
            {
                x = 3562,
                z = 3435,
            },
        },
    },
    {
        name = "Green wisp",
        ids = {
            [2436] = true,
        },
        locations = {
            {
                x = 2221,
                z = 2851,
            },
            {
                x = 2228,
                z = 2839,
            },
            {
                x = 2314,
                z = 2868,
            },
        },
    },
    {
        name = "Greengrocer",
        ids = {
            [1370] = true,
            [1394] = true,
        },
        locations = {
            {
                x = 2516,
                z = 3864,
            },
            {
                x = 2602,
                z = 3876,
            },
        },
    },
    {
        name = "Greg",
        ids = {
            [28488] = true,
            [28497] = true,
        },
        locations = {
            {
                x = 3084,
                z = 3331,
            },
            {
                x = 3125,
                z = 3345,
            },
        },
    },
    {
        name = "Greldo",
        ids = {
            [18206] = true,
        },
        locations = {
            {
                x = 2956,
                z = 3501,
            },
        },
    },
    {
        name = "Grendt",
        ids = {
            [5501] = true,
        },
        locations = {
            {
                x = 2408,
                z = 3815,
            },
        },
    },
    {
        name = "Grew",
        ids = {
            [854] = true,
        },
        locations = {
            {
                x = 2513,
                z = 3084,
            },
        },
    },
    {
        name = "Grigan Kaninus",
        ids = {
            [14079] = true,
        },
        locations = {
            {
                x = 3637,
                z = 3379,
            },
        },
    },
    {
        name = "Grigore",
        ids = {
            [3546] = true,
        },
        locations = {
            {
                x = 3489,
                z = 3222,
            },
        },
    },
    {
        name = "Grimgnash",
        ids = {
            [5997] = true,
        },
        locations = {
            {
                x = 2865,
                z = 3496,
            },
        },
    },
    {
        name = "Grish",
        ids = {
            [2038] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3051,
            },
        },
    },
    {
        name = "Grouch",
        ids = {},
        locations = {
            {
                x = 3346,
                z = 3207,
            },
        },
    },
    {
        name = "Grr'bah",
        ids = {
            [15241] = true,
        },
        locations = {
            {
                x = 2533,
                z = 2848,
            },
        },
    },
    {
        name = "Grubb",
        ids = {
            [7075] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2583,
                z = 2865,
            },
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Grubor",
        ids = {
            [789] = true,
        },
        locations = {
            {
                x = 2812,
                z = 3171,
            },
        },
    },
    {
        name = "Grug",
        ids = {
            [2041] = true,
        },
        locations = {
            {
                x = 2446,
                z = 3049,
            },
        },
    },
    {
        name = "Gruh",
        ids = {
            [2065] = true,
        },
        locations = {
            {
                x = 2349,
                z = 3064,
            },
        },
    },
    {
        name = "Grum",
        ids = {
            [556] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3248,
            },
        },
    },
    {
        name = "Grump",
        ids = {},
        locations = {
            {
                x = 3369,
                z = 3251,
            },
        },
    },
    {
        name = "Grundt",
        ids = {
            [19653] = true,
            [19656] = true,
        },
        locations = {
            {
                x = 2408,
                z = 3815,
            },
            {
                x = 2602,
                z = 3053,
            },
        },
    },
    {
        name = "Grunsh",
        ids = {
            [19649] = true,
        },
        locations = {
            {
                x = 2524,
                z = 3047,
            },
        },
    },
    {
        name = "Grunther",
        ids = {
            [15244] = true,
        },
        locations = {
            {
                x = 2596,
                z = 2865,
            },
        },
    },
    {
        name = "Gruva Patrull",
        ids = {
            [5500] = true,
        },
        locations = {
            {
                x = 2398,
                z = 3814,
            },
        },
    },
    {
        name = "Guard",
        ids = {
            [344] = true,
            [345] = true,
            [346] = true,
            [368] = true,
            [678] = true,
            [812] = true,
            [1076] = true,
            [1077] = true,
            [1296] = true,
            [1297] = true,
            [1805] = true,
            [1806] = true,
            [5491] = true,
            [5492] = true,
            [11271] = true,
            [13971] = true,
            [15094] = true,
            [15583] = true,
            [22535] = true,
        },
        locations = {
            {
                x = 2387,
                z = 3797,
            },
            {
                x = 2387,
                z = 3800,
            },
            {
                x = 2406,
                z = 3850,
            },
            {
                x = 2407,
                z = 3851,
            },
            {
                x = 2408,
                z = 3806,
            },
            {
                x = 2408,
                z = 3852,
            },
            {
                x = 2409,
                z = 3853,
            },
            {
                x = 2410,
                z = 3854,
            },
            {
                x = 2411,
                z = 3795,
            },
            {
                x = 2411,
                z = 3855,
            },
            {
                x = 2414,
                z = 3795,
            },
            {
                x = 2414,
                z = 3824,
            },
            {
                x = 2417,
                z = 3824,
            },
            {
                x = 2508,
                z = 3370,
            },
            {
                x = 2510,
                z = 3378,
            },
            {
                x = 2511,
                z = 3383,
            },
            {
                x = 2512,
                z = 3374,
            },
            {
                x = 2515,
                z = 3356,
            },
            {
                x = 2518,
                z = 3371,
            },
            {
                x = 2519,
                z = 3356,
            },
            {
                x = 2519,
                z = 3366,
            },
            {
                x = 2521,
                z = 3383,
            },
            {
                x = 2524,
                z = 3362,
            },
            {
                x = 2525,
                z = 3369,
            },
            {
                x = 2525,
                z = 3380,
            },
            {
                x = 2525,
                z = 3383,
            },
            {
                x = 2531,
                z = 3368,
            },
            {
                x = 2570,
                z = 3275,
            },
            {
                x = 2655,
                z = 3426,
            },
            {
                x = 2655,
                z = 3429,
            },
            {
                x = 2657,
                z = 3663,
            },
            {
                x = 2659,
                z = 3438,
            },
            {
                x = 2660,
                z = 3663,
            },
            {
                x = 2663,
                z = 3425,
            },
            {
                x = 2666,
                z = 3415,
            },
            {
                x = 2669,
                z = 3415,
            },
            {
                x = 2669,
                z = 3441,
            },
            {
                x = 2670,
                z = 3438,
            },
            {
                x = 2673,
                z = 3439,
            },
            {
                x = 2675,
                z = 3428,
            },
            {
                x = 2680,
                z = 3290,
            },
            {
                x = 2682,
                z = 3430,
            },
            {
                x = 2741,
                z = 3562,
            },
            {
                x = 2764,
                z = 3653,
            },
            {
                x = 2780,
                z = 3658,
            },
            {
                x = 2897,
                z = 3565,
            },
            {
                x = 2899,
                z = 3555,
            },
            {
                x = 2941,
                z = 3437,
            },
            {
                x = 2941,
                z = 3442,
            },
            {
                x = 3211,
                z = 3436,
            },
            {
                x = 3263,
                z = 3407,
            },
            {
                x = 3411,
                z = 3474,
            },
            {
                x = 3413,
                z = 3472,
            },
        },
    },
    {
        name = "Guard (Courthouse)",
        ids = {
            [6183] = true,
            [6184] = true,
        },
        locations = {
            {
                x = 2736,
                z = 3470,
            },
        },
    },
    {
        name = "Guard Captain",
        ids = {
            [3109] = true,
        },
        locations = {
            {
                x = 2551,
                z = 3078,
            },
        },
    },
    {
        name = "Guard Captain Roarkwin",
        ids = {
            [22930] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3185,
            },
        },
    },
    {
        name = "Guard captain Sofia",
        ids = {
            [30105] = true,
        },
        locations = {
            {
                x = 3289,
                z = 3537,
            },
        },
    },
    {
        name = "Guardian of the Vault",
        ids = {
            [25033] = true,
        },
        locations = {
            {
                x = 3145,
                z = 3489,
            },
        },
    },
    {
        name = "Guardsman Peale",
        ids = {
            [7890] = true,
        },
        locations = {
            {
                x = 3208,
                z = 3227,
            },
        },
    },
    {
        name = "Gudrik",
        ids = {
            [26661] = true,
        },
        locations = {
            {
                x = 3029,
                z = 3229,
            },
        },
    },
    {
        name = "Gudrun",
        ids = {
            [2864] = true,
            [2869] = true,
        },
        locations = {
            {
                x = 3081,
                z = 3415,
            },
            {
                x = 3162,
                z = 3434,
            },
        },
    },
    {
        name = "Guidor",
        ids = {
            [343] = true,
        },
        locations = {
            {
                x = 3284,
                z = 3382,
            },
        },
    },
    {
        name = "Guidor's wife",
        ids = {
            [342] = true,
        },
        locations = {
            {
                x = 3281,
                z = 3383,
            },
        },
    },
    {
        name = "Guildmaster",
        ids = {
            [198] = true,
        },
        locations = {
            {
                x = 3191,
                z = 3362,
            },
        },
    },
    {
        name = "Guildmaster Tony",
        ids = {
            [26381] = true,
        },
        locations = {
            {
                x = 3325,
                z = 3381,
            },
        },
    },
    {
        name = "Guinea Pig",
        ids = {},
        locations = {
            {
                x = 2991,
                z = 3387,
            },
            {
                x = 3345,
                z = 3206,
            },
        },
    },
    {
        name = "Gull",
        ids = {
            [146] = true,
            [450] = true,
            [451] = true,
            [1179] = true,
            [1322] = true,
            [1323] = true,
            [1324] = true,
            [1325] = true,
            [1400] = true,
            [2726] = true,
            [2727] = true,
            [9717] = true,
        },
        locations = {
            {
                x = 2580,
                z = 3892,
            },
            {
                x = 2581,
                z = 3888,
            },
            {
                x = 2585,
                z = 3896,
            },
            {
                x = 2602,
                z = 3901,
            },
            {
                x = 2624,
                z = 3702,
            },
            {
                x = 2625,
                z = 3710,
            },
            {
                x = 2628,
                z = 3701,
            },
            {
                x = 2628,
                z = 3706,
            },
            {
                x = 2630,
                z = 3710,
            },
            {
                x = 2632,
                z = 3700,
            },
            {
                x = 2633,
                z = 3707,
            },
            {
                x = 2635,
                z = 3697,
            },
            {
                x = 2635,
                z = 3703,
            },
            {
                x = 2636,
                z = 3710,
            },
            {
                x = 2639,
                z = 3702,
            },
            {
                x = 2694,
                z = 3752,
            },
            {
                x = 2697,
                z = 3755,
            },
            {
                x = 2700,
                z = 3758,
            },
            {
                x = 2704,
                z = 3760,
            },
            {
                x = 2708,
                z = 3760,
            },
            {
                x = 2714,
                z = 3760,
            },
            {
                x = 2818,
                z = 3133,
            },
            {
                x = 2824,
                z = 3133,
            },
            {
                x = 2829,
                z = 3131,
            },
            {
                x = 2833,
                z = 3134,
            },
            {
                x = 2937,
                z = 3104,
            },
            {
                x = 2969,
                z = 3146,
            },
            {
                x = 2974,
                z = 3068,
            },
            {
                x = 2977,
                z = 3052,
            },
            {
                x = 2987,
                z = 3034,
            },
            {
                x = 2990,
                z = 3025,
            },
            {
                x = 2992,
                z = 3040,
            },
            {
                x = 2994,
                z = 3138,
            },
            {
                x = 3013,
                z = 2961,
            },
            {
                x = 3015,
                z = 2995,
            },
            {
                x = 3040,
                z = 2957,
            },
            {
                x = 3051,
                z = 2976,
            },
            {
                x = 3054,
                z = 2970,
            },
            {
                x = 3067,
                z = 2997,
            },
            {
                x = 3079,
                z = 3229,
            },
            {
                x = 3085,
                z = 3219,
            },
            {
                x = 3348,
                z = 3612,
            },
            {
                x = 3351,
                z = 3631,
            },
            {
                x = 3380,
                z = 3629,
            },
            {
                x = 3381,
                z = 3756,
            },
            {
                x = 3392,
                z = 3603,
            },
            {
                x = 3392,
                z = 3638,
            },
            {
                x = 3416,
                z = 3608,
            },
            {
                x = 3431,
                z = 3624,
            },
            {
                x = 3477,
                z = 3643,
            },
            {
                x = 3506,
                z = 3679,
            },
            {
                x = 3515,
                z = 3760,
            },
        },
    },
    {
        name = "Gullible tourist",
        ids = {
            [24432] = true,
        },
        locations = {
            {
                x = 3171,
                z = 2613,
            },
        },
    },
    {
        name = "Gunnar Holdstrom",
        ids = {
            [5511] = true,
        },
        locations = {
            {
                x = 2325,
                z = 3794,
            },
        },
    },
    {
        name = "Gunnjorn",
        ids = {
            [607] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3548,
            },
        },
    },
    {
        name = "Guthix jadinko",
        ids = {
            [13164] = true,
        },
        locations = {
            {
                x = 2971,
                z = 2905,
            },
            {
                x = 2974,
                z = 2909,
            },
            {
                x = 2975,
                z = 2913,
            },
            {
                x = 2977,
                z = 2911,
            },
            {
                x = 2979,
                z = 2907,
            },
            {
                x = 2979,
                z = 2910,
            },
        },
    },
    {
        name = "Guy",
        ids = {
            [32347] = true,
        },
        locations = {
            {
                x = 2878,
                z = 3521,
            },
        },
    },
    {
        name = "Gwir",
        ids = {
            [8894] = true,
        },
        locations = {
            {
                x = 2352,
                z = 3179,
            },
        },
    },
    {
        name = "H.A.M. Member",
        ids = {
            [4321] = true,
        },
        locations = {
            {
                x = 3230,
                z = 3285,
            },
        },
    },
    {
        name = "Hadley",
        ids = {
            [302] = true,
        },
        locations = {
            {
                x = 2516,
                z = 3428,
            },
        },
    },
    {
        name = "Hairdresser",
        ids = {
            [598] = true,
        },
        locations = {
            {
                x = 2946,
                z = 3379,
            },
        },
    },
    {
        name = "Hajedy",
        ids = {
            [510] = true,
        },
        locations = {
            {
                x = 2779,
                z = 3211,
            },
        },
    },
    {
        name = "Hakeem the Mayor",
        ids = {
            [1869] = true,
        },
        locations = {
            {
                x = 3360,
                z = 2970,
            },
        },
    },
    {
        name = "Hamab",
        ids = {
            [1437] = true,
        },
        locations = {
            {
                x = 2781,
                z = 2793,
            },
        },
    },
    {
        name = "Hamal the Chieftain",
        ids = {
            [1807] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3663,
            },
        },
    },
    {
        name = "Hamid",
        ids = {
            [1008] = true,
        },
        locations = {
            {
                x = 3132,
                z = 2803,
            },
        },
    },
    {
        name = "Haming",
        ids = {
            [1362] = true,
        },
        locations = {
            {
                x = 2604,
                z = 3881,
            },
        },
    },
    {
        name = "Hank",
        ids = {
            [8864] = true,
        },
        locations = {
            {
                x = 3195,
                z = 3254,
            },
        },
    },
    {
        name = "Hans",
        ids = {
            [0] = true,
        },
        locations = {
            {
                x = 3210,
                z = 3218,
            },
        },
    },
    {
        name = "Happy",
        ids = {
            [31035] = true,
        },
        locations = {
            {
                x = 3339,
                z = 3256,
            },
        },
    },
    {
        name = "Happy imp",
        ids = {
            [24163] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3478,
            },
        },
    },
    {
        name = "Hari",
        ids = {
            [3330] = true,
        },
        locations = {
            {
                x = 3133,
                z = 3509,
            },
        },
    },
    {
        name = "Harpoon",
        ids = {
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
        },
    },
    {
        name = "Harrallak Menarous",
        ids = {
            [8267] = true,
        },
        locations = {
            {
                x = 2866,
                z = 3542,
            },
        },
    },
    {
        name = "Harrison",
        ids = {
            [23138] = true,
        },
        locations = {
            {
                x = 3242,
                z = 3608,
            },
        },
    },
    {
        name = "Harry",
        ids = {
            [576] = true,
        },
        locations = {
            {
                x = 2824,
                z = 3429,
            },
        },
    },
    {
        name = "Harvey",
        ids = {
            [24812] = true,
        },
        locations = {
            {
                x = 2925,
                z = 3355,
            },
        },
    },
    {
        name = "Hawk",
        ids = {
            [31051] = true,
        },
        locations = {
            {
                x = 3238,
                z = 3288,
            },
        },
    },
    {
        name = "Hazelmere",
        ids = {
            [669] = true,
        },
        locations = {
            {
                x = 2678,
                z = 3086,
            },
            {
                x = 2997,
                z = 3341,
            },
        },
    },
    {
        name = "Head chef",
        ids = {
            [847] = true,
        },
        locations = {
            {
                x = 3143,
                z = 3444,
            },
        },
    },
    {
        name = "Head Farmer Jones",
        ids = {
            [14860] = true,
        },
        locations = {
            {
                x = 2889,
                z = 3468,
            },
        },
    },
    {
        name = "Head mourner",
        ids = {
            [716] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3286,
            },
        },
    },
    {
        name = "Head of Research",
        ids = {
            [26938] = true,
        },
        locations = {
            {
                x = 3365,
                z = 3354,
            },
        },
    },
    {
        name = "Headless moss golem",
        ids = {
            [24839] = true,
        },
        locations = {
            {
                x = 2339,
                z = 2844,
            },
        },
    },
    {
        name = "Heedi",
        ids = {
            [31499] = true,
        },
        locations = {
            {
                x = 2331,
                z = 3583,
            },
        },
    },
    {
        name = "Helda",
        ids = {
            [5201] = true,
        },
        locations = {
            {
                x = 3099,
                z = 3370,
            },
        },
    },
    {
        name = "Helen",
        ids = {
            [26935] = true,
        },
        locations = {
            {
                x = 3385,
                z = 3384,
            },
        },
    },
    {
        name = "Helena",
        ids = {
            [13977] = true,
        },
        locations = {
            {
                x = 3484,
                z = 3207,
            },
        },
    },
    {
        name = "Helga",
        ids = {
            [1364] = true,
        },
        locations = {
            {
                x = 2614,
                z = 3883,
            },
        },
    },
    {
        name = "Hengrad",
        ids = {
            [263] = true,
        },
        locations = {
            {
                x = 2598,
                z = 3142,
            },
        },
    },
    {
        name = "Henryeta Carnillean",
        ids = {
            [889] = true,
        },
        locations = {
            {
                x = 2574,
                z = 3273,
            },
        },
    },
    {
        name = "Henutemipet",
        ids = {
            [24697] = true,
        },
        locations = {
            {
                x = 3200,
                z = 2656,
            },
        },
    },
    {
        name = "Herald of Falador",
        ids = {
            [13939] = true,
        },
        locations = {
            {
                x = 3036,
                z = 3356,
            },
        },
    },
    {
        name = "Herald of Lumbridge",
        ids = {
            [32430] = true,
        },
        locations = {
            {
                x = 3199,
                z = 3249,
            },
        },
    },
    {
        name = "Herald of Varrock",
        ids = {
            [13938] = true,
        },
        locations = {
            {
                x = 3240,
                z = 3433,
            },
        },
    },
    {
        name = "Herbalist",
        ids = {
            [15015] = true,
        },
        locations = {
            {
                x = 2918,
                z = 3487,
            },
        },
    },
    {
        name = "Herman Caranos",
        ids = {
            [3822] = true,
        },
        locations = {
            {
                x = 2354,
                z = 3683,
            },
        },
    },
    {
        name = "Herquin",
        ids = {
            [584] = true,
        },
        locations = {
            {
                x = 2944,
                z = 3334,
            },
        },
    },
    {
        name = "Heskel",
        ids = {
            [2340] = true,
        },
        locations = {
            {
                x = 3001,
                z = 3373,
            },
        },
    },
    {
        name = "Hetty",
        ids = {
            [307] = true,
        },
        locations = {
            {
                x = 2968,
                z = 3206,
            },
        },
    },
    {
        name = "Hickton",
        ids = {
            [575] = true,
        },
        locations = {
            {
                x = 2825,
                z = 3455,
            },
        },
    },
    {
        name = "Hieromonk Genjiro",
        ids = {
            [24715] = true,
        },
        locations = {
            {
                x = 3171,
                z = 2611,
            },
        },
    },
    {
        name = "High Priest",
        ids = {
            [216] = true,
            [1985] = true,
        },
        locations = {
            {
                x = 2851,
                z = 3349,
            },
            {
                x = 3311,
                z = 2729,
            },
        },
    },
    {
        name = "Highwayman",
        ids = {
            [22707] = true,
        },
        locations = {
            {
                x = 2940,
                z = 3142,
            },
        },
    },
    {
        name = "Hild",
        ids = {
            [1090] = true,
        },
        locations = {
            {
                x = 2914,
                z = 3523,
            },
        },
    },
    {
        name = "Hilda",
        ids = {
            [13464] = true,
        },
        locations = {
            {
                x = 3386,
                z = 3618,
            },
        },
    },
    {
        name = "Hisamitsu",
        ids = {
            [24716] = true,
        },
        locations = {
            {
                x = 3170,
                z = 2614,
            },
        },
    },
    {
        name = "Hiylik Myna",
        ids = {
            [1514] = true,
        },
        locations = {
            {
                x = 3440,
                z = 3486,
            },
            {
                x = 3479,
                z = 3238,
            },
        },
    },
    {
        name = "Hobbes",
        ids = {
            [808] = true,
        },
        locations = {
            {
                x = 2736,
                z = 3575,
            },
        },
    },
    {
        name = "Hofuthand (armour and weapons)",
        ids = {
            [6527] = true,
        },
        locations = {
            {
                x = 3148,
                z = 3483,
            },
        },
    },
    {
        name = "Holgart",
        ids = {
            [700] = true,
        },
        locations = {
            {
                x = 2720,
                z = 3306,
            },
        },
    },
    {
        name = "Holstein, Emissary of the Godless",
        ids = {
            [17137] = true,
        },
        locations = {
            {
                x = 3043,
                z = 3254,
            },
        },
    },
    {
        name = "Honest Jimmy",
        ids = {
            [4362] = true,
        },
        locations = {
            {
                x = 3812,
                z = 3021,
            },
        },
    },
    {
        name = "Hooded pirate",
        ids = {
            [25288] = true,
        },
        locations = {
            {
                x = 3849,
                z = 3014,
            },
        },
    },
    {
        name = "Hooknosed Jack",
        ids = {
            [2948] = true,
        },
        locations = {
            {
                x = 3268,
                z = 3400,
            },
        },
    },
    {
        name = "Hops",
        ids = {
            [340] = true,
            [341] = true,
        },
        locations = {
            {
                x = 2930,
                z = 3218,
            },
            {
                x = 3268,
                z = 3389,
            },
        },
    },
    {
        name = "Horacio",
        ids = {
            [845] = true,
        },
        locations = {
            {
                x = 2635,
                z = 3311,
            },
        },
    },
    {
        name = "Horned graahk",
        ids = {
            [5105] = true,
        },
        locations = {
            {
                x = 2766,
                z = 3008,
            },
            {
                x = 2767,
                z = 3005,
            },
            {
                x = 2774,
                z = 3002,
            },
            {
                x = 2781,
                z = 3001,
            },
        },
    },
    {
        name = "Horses (Harvest Hollow)",
        ids = {},
        locations = {
            {
                x = 2882,
                z = 3513,
            },
            {
                x = 2884,
                z = 3520,
            },
            {
                x = 2889,
                z = 3514,
            },
            {
                x = 2890,
                z = 3522,
            },
        },
    },
    {
        name = "Horvik",
        ids = {
            [549] = true,
        },
        locations = {
            {
                x = 3229,
                z = 3438,
            },
        },
    },
    {
        name = "House",
        ids = {
            [4512] = true,
        },
        locations = {
            {
                x = 2082,
                z = 3929,
            },
        },
    },
    {
        name = "HRH Hrafn",
        ids = {
            [5479] = true,
        },
        locations = {
            {
                x = 2408,
                z = 3802,
            },
        },
    },
    {
        name = "Hring Hring",
        ids = {
            [5483] = true,
        },
        locations = {
            {
                x = 2398,
                z = 3798,
            },
        },
    },
    {
        name = "Hudon",
        ids = {
            [305] = true,
        },
        locations = {
            {
                x = 2511,
                z = 3484,
            },
        },
    },
    {
        name = "Hugh",
        ids = {
            [24073] = true,
        },
        locations = {
            {
                x = 3285,
                z = 2916,
            },
        },
    },
    {
        name = "Hunting expert",
        ids = {
            [5113] = true,
        },
        locations = {
            {
                x = 2525,
                z = 2917,
            },
        },
    },
    {
        name = "I'rk",
        ids = {
            [15239] = true,
        },
        locations = {
            {
                x = 2598,
                z = 2864,
            },
        },
    },
    {
        name = "Ian",
        ids = {
            [1779] = true,
        },
        locations = {
            {
                x = 2967,
                z = 3765,
            },
        },
    },
    {
        name = "Ian Gower",
        ids = {
            [22796] = true,
        },
        locations = {
            {
                x = 3254,
                z = 3355,
            },
        },
    },
    {
        name = "Ice troll",
        ids = {
            [1935] = true,
        },
        locations = {
            {
                x = 2841,
                z = 3738,
            },
        },
    },
    {
        name = "Iconis",
        ids = {
            [8879] = true,
        },
        locations = {
            {
                x = 2928,
                z = 3322,
            },
        },
    },
    {
        name = "Icthlarin",
        ids = {
            [18464] = true,
            [26291] = true,
        },
        locations = {
            {
                x = 2894,
                z = 3572,
            },
            {
                x = 3378,
                z = 3484,
            },
        },
    },
    {
        name = "Idris",
        ids = {
            [1186] = true,
        },
        locations = {
            {
                x = 2310,
                z = 3214,
            },
        },
    },
    {
        name = "Ifaba",
        ids = {
            [1436] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 2754,
                z = 2775,
            },
        },
    },
    {
        name = "Iffie",
        ids = {
            [2778] = true,
        },
        locations = {
            {
                x = 3204,
                z = 3419,
            },
        },
    },
    {
        name = "Ignatius Vulcan",
        ids = {
            [4946] = true,
        },
        locations = {
            {
                x = 2719,
                z = 3431,
            },
        },
    },
    {
        name = "Ikis Krum",
        ids = {
            [12237] = true,
        },
        locations = {
            {
                x = 3047,
                z = 3365,
            },
        },
    },
    {
        name = "Ileana",
        ids = {
            [3547] = true,
        },
        locations = {
            {
                x = 3514,
                z = 3228,
            },
        },
    },
    {
        name = "Ilfeen",
        ids = {
            [6555] = true,
        },
        locations = {
            {
                x = 2346,
                z = 3173,
            },
        },
    },
    {
        name = "Ilona",
        ids = {
            [9632] = true,
        },
        locations = {
            {
                x = 3244,
                z = 3197,
            },
        },
    },
    {
        name = "Ima",
        ids = {
            [964] = true,
        },
        locations = {
            {
                x = 3329,
                z = 3252,
            },
        },
    },
    {
        name = "Imhapi",
        ids = {
            [24694] = true,
        },
        locations = {
            {
                x = 3253,
                z = 2783,
            },
        },
    },
    {
        name = "Imiago",
        ids = {
            [871] = true,
        },
        locations = {
            {
                x = 2795,
                z = 3104,
            },
        },
    },
    {
        name = "Imperial district musician",
        ids = {
            [24609] = true,
        },
        locations = {
            {
                x = 3086,
                z = 2696,
            },
            {
                x = 3088,
                z = 2694,
            },
        },
    },
    {
        name = "Imperial guard",
        ids = {
            [15018] = true,
        },
        locations = {
            {
                x = 2919,
                z = 3525,
            },
            {
                x = 2921,
                z = 3545,
            },
        },
    },
    {
        name = "Impling collector",
        ids = {
            [24780] = true,
        },
        locations = {
            {
                x = 3230,
                z = 2729,
            },
        },
    },
    {
        name = "Incandescent wisp",
        ids = {
            [18171] = true,
        },
        locations = {
            {
                x = 2273,
                z = 3045,
            },
            {
                x = 2273,
                z = 3064,
            },
            {
                x = 2280,
                z = 3042,
            },
            {
                x = 2283,
                z = 3055,
            },
            {
                x = 2285,
                z = 3061,
            },
            {
                x = 2285,
                z = 3064,
            },
            {
                x = 2287,
                z = 3064,
            },
            {
                x = 2291,
                z = 3060,
            },
            {
                x = 2292,
                z = 3055,
            },
            {
                x = 2293,
                z = 3059,
            },
            {
                x = 2296,
                z = 3055,
            },
        },
    },
    {
        name = "Information clerk",
        ids = {
            [5938] = true,
        },
        locations = {
            {
                x = 3253,
                z = 3454,
            },
        },
    },
    {
        name = "Inga",
        ids = {
            [1314] = true,
        },
        locations = {
            {
                x = 2674,
                z = 3677,
            },
        },
    },
    {
        name = "Ingrid Hradson",
        ids = {
            [3696] = true,
        },
        locations = {
            {
                x = 2670,
                z = 3662,
            },
        },
    },
    {
        name = "Inhamat",
        ids = {
            [24702] = true,
        },
        locations = {
            {
                x = 3144,
                z = 2813,
            },
        },
    },
    {
        name = "Intern",
        ids = {
            [26889] = true,
            [26890] = true,
        },
        locations = {
            {
                x = 3368,
                z = 3194,
            },
            {
                x = 3376,
                z = 3189,
            },
        },
    },
    {
        name = "Iona",
        ids = {
            [2369] = true,
        },
        locations = {
            {
                x = 2335,
                z = 3169,
            },
        },
    },
    {
        name = "Irena",
        ids = {
            [4986] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3113,
            },
        },
    },
    {
        name = "Iroh, the Group Ironman tutor",
        ids = {
            [31406] = true,
        },
        locations = {
            {
                x = 2284,
                z = 2662,
            },
        },
    },
    {
        name = "Irwin Feaselbaum",
        ids = {
            [2066] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3246,
            },
        },
    },
    {
        name = "Isis",
        ids = {
            [14791] = true,
        },
        locations = {
            {
                x = 2363,
                z = 3380,
            },
        },
    },
    {
        name = "Islwyn",
        ids = {
            [1680] = true,
        },
        locations = {
            {
                x = 2182,
                z = 3202,
            },
            {
                x = 2205,
                z = 3160,
            },
            {
                x = 2268,
                z = 3222,
            },
            {
                x = 2291,
                z = 3147,
            },
        },
    },
    {
        name = "Isma'il the Kebab seller",
        ids = {
            [1865] = true,
        },
        locations = {
            {
                x = 3352,
                z = 2974,
            },
        },
    },
    {
        name = "Ivan",
        ids = {
            [3552] = true,
        },
        locations = {
            {
                x = 3508,
                z = 3208,
            },
        },
    },
    {
        name = "Ivan Strom",
        ids = {
            [7708] = true,
            [22538] = true,
        },
        locations = {
            {
                x = 3430,
                z = 3485,
            },
            {
                x = 3484,
                z = 3243,
            },
        },
    },
    {
        name = "Ivar",
        ids = {
            [17083] = true,
        },
        locations = {
            {
                x = 3038,
                z = 3343,
            },
        },
    },
    {
        name = "Ivy Sophista",
        ids = {
            [8417] = true,
        },
        locations = {
            {
                x = 2917,
                z = 3449,
            },
        },
    },
    {
        name = "Jack",
        ids = {
            [5020] = true,
        },
        locations = {
            {
                x = 2904,
                z = 3178,
            },
        },
    },
    {
        name = "Jack of Spades",
        ids = {
            [24641] = true,
        },
        locations = {
            {
                x = 3194,
                z = 2770,
            },
        },
    },
    {
        name = "Jack Oval",
        ids = {
            [14877] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3501,
            },
        },
    },
    {
        name = "Jack Seagull",
        ids = {
            [2690] = true,
        },
        locations = {
            {
                x = 3047,
                z = 3256,
            },
        },
    },
    {
        name = "Jack the yak",
        ids = {
            [25842] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3360,
            },
        },
    },
    {
        name = "Jacquelyn",
        ids = {
            [14869] = true,
        },
        locations = {
            {
                x = 3221,
                z = 3221,
            },
            {
                x = 3221,
                z = 3224,
            },
        },
    },
    {
        name = "Jade",
        ids = {
            [4296] = true,
        },
        locations = {
            {
                x = 2841,
                z = 3538,
            },
        },
    },
    {
        name = "Jadid",
        ids = {
            [966] = true,
        },
        locations = {
            {
                x = 3359,
                z = 3221,
            },
        },
    },
    {
        name = "Jagbakoba",
        ids = {
            [2525] = true,
        },
        locations = {
            {
                x = 2799,
                z = 3047,
            },
        },
    },
    {
        name = "Jalal the Drunk",
        ids = {
            [26838] = true,
        },
        locations = {
            {
                x = 3360,
                z = 2957,
            },
        },
    },
    {
        name = "Jambon",
        ids = {
            [20985] = true,
        },
        locations = {
            {
                x = 3076,
                z = 3258,
            },
        },
    },
    {
        name = "Jamila",
        ids = {
            [5267] = true,
        },
        locations = {
            {
                x = 3306,
                z = 2781,
            },
        },
    },
    {
        name = "Jaraah",
        ids = {
            [962] = true,
        },
        locations = {
            {
                x = 3294,
                z = 3218,
            },
        },
    },
    {
        name = "Jarvald",
        ids = {
            [2438] = true,
        },
        locations = {
            {
                x = 2544,
                z = 3761,
            },
            {
                x = 2621,
                z = 3683,
            },
        },
    },
    {
        name = "Jasim the Camel",
        ids = {
            [1873] = true,
        },
        locations = {
            {
                x = 3342,
                z = 2962,
            },
        },
    },
    {
        name = "Jatix",
        ids = {
            [14854] = true,
        },
        locations = {
            {
                x = 2919,
                z = 3431,
            },
        },
    },
    {
        name = "Jayene Kliyn",
        ids = {
            [14055] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3240,
            },
        },
    },
    {
        name = "Jeb",
        ids = {
            [4860] = true,
        },
        locations = {
            {
                x = 2719,
                z = 3304,
            },
        },
    },
    {
        name = "Jeed",
        ids = {
            [969] = true,
        },
        locations = {
            {
                x = 3377,
                z = 3272,
            },
        },
    },
    {
        name = "Jeff",
        ids = {
            [5022] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3172,
            },
        },
    },
    {
        name = "Jeffery",
        ids = {
            [637] = true,
        },
        locations = {
            {
                x = 3108,
                z = 3500,
            },
        },
    },
    {
        name = "Jennifer",
        ids = {
            [2913] = true,
        },
        locations = {
            {
                x = 3493,
                z = 3090,
            },
        },
    },
    {
        name = "Jeremy Clerksin",
        ids = {
            [3327] = true,
        },
        locations = {
            {
                x = 3253,
                z = 3477,
            },
        },
    },
    {
        name = "Jerico",
        ids = {
            [366] = true,
        },
        locations = {
            {
                x = 2612,
                z = 3324,
            },
        },
    },
    {
        name = "Jess the human",
        ids = {
            [24431] = true,
        },
        locations = {
            {
                x = 3141,
                z = 2843,
            },
        },
    },
    {
        name = "Jessika",
        ids = {
            [11662] = true,
        },
        locations = {
            {
                x = 2675,
                z = 2651,
            },
        },
    },
    {
        name = "Jethick",
        ids = {
            [725] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3305,
            },
        },
    },
    {
        name = "Jex",
        ids = {
            [5279] = true,
        },
        locations = {
            {
                x = 3302,
                z = 2801,
            },
        },
    },
    {
        name = "Jhonatan",
        ids = {
            [24707] = true,
        },
        locations = {
            {
                x = 3098,
                z = 2699,
            },
        },
    },
    {
        name = "Jill",
        ids = {
            [5021] = true,
        },
        locations = {
            {
                x = 2907,
                z = 3174,
            },
        },
    },
    {
        name = "Jiminua",
        ids = {
            [560] = true,
        },
        locations = {
            {
                x = 2766,
                z = 3122,
            },
        },
    },
    {
        name = "Jimmy",
        ids = {},
        locations = {
            {
                x = 3330,
                z = 3452,
            },
        },
    },
    {
        name = "Jimmy Dazzler",
        ids = {
            [2949] = true,
        },
        locations = {
            {
                x = 2562,
                z = 3320,
            },
        },
    },
    {
        name = "Joe",
        ids = {
            [261] = true,
            [3163] = true,
        },
        locations = {
            {
                x = 2587,
                z = 3142,
            },
            {
                x = 3122,
                z = 3248,
            },
            {
                x = 3666,
                z = 2990,
            },
        },
    },
    {
        name = "Jofridr Mordstatter",
        ids = {
            [5509] = true,
        },
        locations = {
            {
                x = 2335,
                z = 3806,
            },
        },
    },
    {
        name = "Jogre",
        ids = {
            [26900] = true,
            [26901] = true,
        },
        locations = {
            {
                x = 2420,
                z = 2816,
            },
            {
                x = 2423,
                z = 2818,
            },
        },
    },
    {
        name = "Johanhus Ulsbrecht",
        ids = {
            [28203] = true,
            [28204] = true,
        },
        locations = {
            {
                x = 2530,
                z = 2948,
            },
            {
                x = 3360,
                z = 3357,
            },
        },
    },
    {
        name = "John Wyrd",
        ids = {
            [18200] = true,
        },
        locations = {
            {
                x = 3126,
                z = 3228,
            },
        },
    },
    {
        name = "Jokul",
        ids = {
            [1810] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3671,
            },
        },
    },
    {
        name = "Jones",
        ids = {
            [9693] = true,
        },
        locations = {
            {
                x = 2590,
                z = 3420,
            },
        },
    },
    {
        name = "Jorral",
        ids = {
            [2932] = true,
        },
        locations = {
            {
                x = 2437,
                z = 3347,
            },
        },
    },
    {
        name = "Joshua",
        ids = {
            [229] = true,
        },
        locations = {
            {
                x = 2629,
                z = 3415,
            },
        },
    },
    {
        name = "Juan",
        ids = {
            [23920] = true,
        },
        locations = {
            {
                x = 2268,
                z = 3538,
            },
            {
                x = 2292,
                z = 3548,
            },
        },
    },
    {
        name = "Julienne, Emissary of Saradomin",
        ids = {
            [17132] = true,
        },
        locations = {
            {
                x = 3014,
                z = 3368,
            },
        },
    },
    {
        name = "Juna",
        ids = {
            [29135] = true,
        },
        locations = {
            {
                x = 2279,
                z = 2844,
            },
        },
    },
    {
        name = "Jungle forester",
        ids = {
            [401] = true,
            [402] = true,
        },
        locations = {
            {
                x = 2759,
                z = 2944,
            },
            {
                x = 2764,
                z = 2944,
            },
            {
                x = 2792,
                z = 2944,
            },
            {
                x = 2798,
                z = 2944,
            },
            {
                x = 2817,
                z = 2940,
            },
            {
                x = 2824,
                z = 2940,
            },
            {
                x = 2863,
                z = 2941,
            },
            {
                x = 2872,
                z = 2941,
            },
            {
                x = 2935,
                z = 2945,
            },
        },
    },
    {
        name = "Justin Servil",
        ids = {
            [267] = true,
            [7541] = true,
        },
        locations = {
            {
                x = 2567,
                z = 3200,
            },
            {
                x = 2601,
                z = 3168,
            },
        },
    },
    {
        name = "K'Chunk",
        ids = {
            [11319] = true,
        },
        locations = {
            {
                x = 3763,
                z = 2922,
            },
        },
    },
    {
        name = "Kael Forshaw",
        ids = {
            [21660] = true,
        },
        locations = {
            {
                x = 3640,
                z = 3366,
            },
        },
    },
    {
        name = "Kai",
        ids = {},
        locations = {
            {
                x = 3356,
                z = 3215,
            },
        },
    },
    {
        name = "Kalron",
        ids = {
            [486] = true,
        },
        locations = {
            {
                x = 2521,
                z = 3177,
            },
        },
    },
    {
        name = "Kanel",
        ids = {
            [784] = true,
        },
        locations = {
            {
                x = 3155,
                z = 3406,
            },
        },
    },
    {
        name = "Kangai Mau",
        ids = {
            [846] = true,
        },
        locations = {
            {
                x = 2791,
                z = 3182,
            },
        },
    },
    {
        name = "Kaqemeex",
        ids = {
            [455] = true,
            [27754] = true,
        },
        locations = {
            {
                x = 2924,
                z = 3484,
            },
            {
                x = 3327,
                z = 3340,
            },
        },
    },
    {
        name = "Kara-Meir",
        ids = {
            [21321] = true,
        },
        locations = {
            {
                x = 3101,
                z = 2860,
            },
        },
    },
    {
        name = "Karaday",
        ids = {
            [2513] = true,
        },
        locations = {
            {
                x = 2799,
                z = 3084,
            },
        },
    },
    {
        name = "Karam",
        ids = {
            [1420] = true,
        },
        locations = {
            {
                x = 2767,
                z = 2776,
            },
        },
    },
    {
        name = "Karim",
        ids = {
            [543] = true,
        },
        locations = {
            {
                x = 3269,
                z = 3183,
            },
        },
    },
    {
        name = "Karl",
        ids = {
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Karma the chameleon",
        ids = {
            [8580] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3371,
            },
        },
    },
    {
        name = "Katarina (student)",
        ids = {
            [617] = true,
        },
        locations = {
            {
                x = 3357,
                z = 3426,
            },
        },
    },
    {
        name = "Kathy Corkat",
        ids = {
            [3831] = true,
        },
        locations = {
            {
                x = 2357,
                z = 3640,
            },
            {
                x = 2368,
                z = 3486,
            },
        },
    },
    {
        name = "Katrine",
        ids = {
            [642] = true,
        },
        locations = {
            {
                x = 3186,
                z = 3385,
            },
        },
    },
    {
        name = "Kaylee",
        ids = {
            [3217] = true,
        },
        locations = {
            {
                x = 2957,
                z = 3370,
            },
        },
    },
    {
        name = "Kazemde",
        ids = {
            [3039] = true,
        },
        locations = {
            {
                x = 3414,
                z = 2906,
            },
        },
    },
    {
        name = "Keepa Kettilon",
        ids = {
            [5487] = true,
        },
        locations = {
            {
                x = 2417,
                z = 3817,
            },
        },
    },
    {
        name = "Kelvin",
        ids = {
            [260] = true,
        },
        locations = {
            {
                x = 2589,
                z = 3142,
            },
        },
    },
    {
        name = "Kent",
        ids = {
            [701] = true,
            [7195] = true,
        },
        locations = {
            {
                x = 2730,
                z = 3282,
            },
            {
                x = 2793,
                z = 3321,
            },
        },
    },
    {
        name = "Kenton Decarte",
        ids = {
            [24363] = true,
        },
        locations = {
            {
                x = 2678,
                z = 2682,
            },
        },
    },
    {
        name = "Khamud",
        ids = {
            [24690] = true,
        },
        locations = {
            {
                x = 3169,
                z = 2800,
            },
        },
    },
    {
        name = "Kharid Scorpion",
        ids = {
            [386] = true,
        },
        locations = {
            {
                x = 2550,
                z = 3569,
            },
            {
                x = 2552,
                z = 3570,
            },
        },
    },
    {
        name = "Kharl",
        ids = {
            [24710] = true,
        },
        locations = {
            {
                x = 3138,
                z = 2774,
            },
        },
    },
    {
        name = "Kharshai",
        ids = {
            [23619] = true,
        },
        locations = {
            {
                x = 2729,
                z = 3882,
            },
        },
    },
    {
        name = "Khattak",
        ids = {
            [24687] = true,
        },
        locations = {
            {
                x = 3241,
                z = 2793,
            },
        },
    },
    {
        name = "Khazard Guard",
        ids = {
            [253] = true,
            [254] = true,
            [7504] = true,
            [7505] = true,
            [7506] = true,
            [7507] = true,
            [7508] = true,
            [7509] = true,
            [7510] = true,
            [7511] = true,
            [7512] = true,
            [7513] = true,
            [7514] = true,
            [7515] = true,
            [7518] = true,
            [7519] = true,
            [7520] = true,
        },
        locations = {
            {
                x = 2564,
                z = 3146,
            },
            {
                x = 2564,
                z = 3153,
            },
            {
                x = 2566,
                z = 3142,
            },
            {
                x = 2567,
                z = 3149,
            },
            {
                x = 2569,
                z = 3144,
            },
            {
                x = 2570,
                z = 3142,
            },
            {
                x = 2578,
                z = 3159,
            },
            {
                x = 2578,
                z = 3164,
            },
            {
                x = 2584,
                z = 3142,
            },
            {
                x = 2588,
                z = 3174,
            },
            {
                x = 2589,
                z = 3148,
            },
            {
                x = 2589,
                z = 3174,
            },
            {
                x = 2590,
                z = 3148,
            },
            {
                x = 2594,
                z = 3148,
            },
            {
                x = 2594,
                z = 3174,
            },
            {
                x = 2595,
                z = 3148,
            },
            {
                x = 2595,
                z = 3174,
            },
            {
                x = 2599,
                z = 3174,
            },
            {
                x = 2600,
                z = 3174,
            },
            {
                x = 2601,
                z = 3174,
            },
            {
                x = 2616,
                z = 3172,
            },
        },
    },
    {
        name = "Khazard launderer",
        ids = {
            [8428] = true,
        },
        locations = {
            {
                x = 2564,
                z = 3172,
            },
        },
    },
    {
        name = "Khazard warlord",
        ids = {
            [477] = true,
        },
        locations = {
            {
                x = 2457,
                z = 3302,
            },
        },
    },
    {
        name = "Khemu",
        ids = {},
        locations = {
            {
                x = 3338,
                z = 3213,
            },
        },
    },
    {
        name = "Khnum",
        ids = {
            [15865] = true,
        },
        locations = {
            {
                x = 3123,
                z = 3243,
            },
        },
    },
    {
        name = "Khoochak",
        ids = {
            [15813] = true,
        },
        locations = {
            {
                x = 3291,
                z = 3149,
            },
        },
    },
    {
        name = "Kilo Duck",
        ids = {
            [29960] = true,
        },
        locations = {
            {
                x = 3055,
                z = 3291,
            },
        },
    },
    {
        name = "Kilron",
        ids = {
            [349] = true,
        },
        locations = {
            {
                x = 2556,
                z = 3266,
            },
        },
    },
    {
        name = "Kimberly",
        ids = {
            [7191] = true,
        },
        locations = {
            {
                x = 2714,
                z = 3308,
            },
        },
    },
    {
        name = "King Arthur",
        ids = {
            [251] = true,
        },
        locations = {
            {
                x = 2764,
                z = 3515,
            },
        },
    },
    {
        name = "King Black Dragon T-shirt",
        ids = {
            [29444] = true,
            [29445] = true,
        },
        locations = {
            {
                x = 3176,
                z = 3478,
            },
            {
                x = 3179,
                z = 3482,
            },
        },
    },
    {
        name = "King Bolren",
        ids = {
            [469] = true,
        },
        locations = {
            {
                x = 2542,
                z = 3169,
            },
        },
    },
    {
        name = "King Gjuki Sorvott IV",
        ids = {
            [5478] = true,
        },
        locations = {
            {
                x = 2407,
                z = 3802,
            },
        },
    },
    {
        name = "King Narnode Shareen",
        ids = {
            [670] = true,
        },
        locations = {
            {
                x = 2466,
                z = 3497,
            },
        },
    },
    {
        name = "King Roald",
        ids = {
            [648] = true,
        },
        locations = {
            {
                x = 3222,
                z = 3476,
            },
        },
    },
    {
        name = "King Slime",
        ids = {
            [26801] = true,
        },
        locations = {
            {
                x = 2956,
                z = 3219,
            },
        },
    },
    {
        name = "Kipple",
        ids = {
            [20390] = true,
        },
        locations = {
            {
                x = 3130,
                z = 3167,
            },
        },
    },
    {
        name = "Kitten",
        ids = {
            [25406] = true,
        },
        locations = {
            {
                x = 3731,
                z = 2971,
            },
        },
    },
    {
        name = "Kjedelig Uppsen",
        ids = {
            [5518] = true,
        },
        locations = {
            {
                x = 2338,
                z = 3798,
            },
        },
    },
    {
        name = "Kjell",
        ids = {
            [2872] = true,
        },
        locations = {
            {
                x = 3079,
                z = 3414,
            },
        },
    },
    {
        name = "Klaas",
        ids = {
            [19659] = true,
        },
        locations = {
            {
                x = 2601,
                z = 3054,
            },
        },
    },
    {
        name = "Klarense",
        ids = {
            [744] = true,
        },
        locations = {
            {
                x = 3047,
                z = 3204,
            },
        },
    },
    {
        name = "Klenter",
        ids = {
            [2013] = true,
        },
        locations = {
            {
                x = 3289,
                z = 2783,
            },
        },
    },
    {
        name = "Knight",
        ids = {
            [660] = true,
            [6202] = true,
        },
        locations = {
            {
                x = 2910,
                z = 3730,
            },
            {
                x = 3043,
                z = 3378,
            },
            {
                x = 3044,
                z = 3378,
            },
            {
                x = 3045,
                z = 3378,
            },
            {
                x = 3046,
                z = 3378,
            },
            {
                x = 3047,
                z = 3378,
            },
            {
                x = 3048,
                z = 3378,
            },
        },
    },
    {
        name = "Knight Ami",
        ids = {
            [11514] = true,
        },
        locations = {
            {
                x = 2672,
                z = 2648,
            },
        },
    },
    {
        name = "Knight Bernard",
        ids = {
            [11521] = true,
        },
        locations = {
            {
                x = 2671,
                z = 2656,
            },
        },
    },
    {
        name = "Knight Diana",
        ids = {
            [11515] = true,
        },
        locations = {
            {
                x = 2669,
                z = 2661,
            },
        },
    },
    {
        name = "Knight Dorian",
        ids = {
            [12196] = true,
        },
        locations = {
            {
                x = 2637,
                z = 2680,
            },
        },
    },
    {
        name = "Knight Mikhal",
        ids = {
            [11518] = true,
        },
        locations = {
            {
                x = 2675,
                z = 2661,
            },
        },
    },
    {
        name = "Koftik",
        ids = {
            [972] = true,
            [19646] = true,
        },
        locations = {
            {
                x = 2439,
                z = 3316,
            },
            {
                x = 2529,
                z = 3289,
            },
            {
                x = 2549,
                z = 3315,
            },
        },
    },
    {
        name = "Kortan",
        ids = {
            [591] = true,
        },
        locations = {
            {
                x = 2615,
                z = 3292,
            },
        },
    },
    {
        name = "Kragen",
        ids = {
            [2325] = true,
        },
        locations = {
            {
                x = 2660,
                z = 3374,
            },
        },
    },
    {
        name = "Kringk",
        ids = {
            [7099] = true,
            [7102] = true,
        },
        locations = {
            {
                x = 2576,
                z = 2840,
            },
            {
                x = 2585,
                z = 2844,
            },
        },
    },
    {
        name = "Kruk",
        ids = {
            [1441] = true,
        },
        locations = {
            {
                x = 2726,
                z = 2765,
            },
        },
    },
    {
        name = "Lachtopher",
        ids = {
            [7870] = true,
        },
        locations = {
            {
                x = 3225,
                z = 3238,
            },
        },
    },
    {
        name = "Lady Keli",
        ids = {
            [15801] = true,
            [15876] = true,
        },
        locations = {
            {
                x = 3128,
                z = 3198,
            },
            {
                x = 3207,
                z = 3081,
            },
        },
    },
    {
        name = "Lady Niya",
        ids = {},
        locations = {
            {
                x = 3164,
                z = 3368,
            },
        },
    },
    {
        name = "Lady Servil",
        ids = {
            [258] = true,
        },
        locations = {
            {
                x = 2566,
                z = 3201,
            },
        },
    },
    {
        name = "Laidee Gnonock",
        ids = {
            [8492] = true,
        },
        locations = {
            {
                x = 2879,
                z = 3543,
            },
        },
    },
    {
        name = "Lakki the delivery dwarf",
        ids = {
            [7728] = true,
        },
        locations = {
            {
                x = 3008,
                z = 3434,
            },
        },
    },
    {
        name = "Lalli",
        ids = {
            [1270] = true,
        },
        locations = {
            {
                x = 2770,
                z = 3622,
            },
        },
    },
    {
        name = "Lamp trader",
        ids = {
            [24549] = true,
        },
        locations = {
            {
                x = 3231,
                z = 2788,
            },
        },
    },
    {
        name = "Laniakea",
        ids = {
            [26558] = true,
        },
        locations = {
            {
                x = 3390,
                z = 3417,
            },
        },
    },
    {
        name = "Lanthus",
        ids = {
            [1526] = true,
            [26748] = true,
        },
        locations = {
            {
                x = 2442,
                z = 3089,
            },
            {
                x = 2649,
                z = 3350,
            },
        },
    },
    {
        name = "Lara",
        ids = {
            [24075] = true,
        },
        locations = {
            {
                x = 3286,
                z = 2925,
            },
        },
    },
    {
        name = "Larrissa",
        ids = {
            [1336] = true,
        },
        locations = {
            {
                x = 2508,
                z = 3635,
            },
        },
    },
    {
        name = "Larry",
        ids = {
            [7574] = true,
            [8693] = true,
        },
        locations = {
            {
                x = 2592,
                z = 3264,
            },
            {
                x = 2596,
                z = 3266,
            },
        },
    },
    {
        name = "Launa",
        ids = {},
        locations = {
            {
                x = 3309,
                z = 3453,
            },
        },
    },
    {
        name = "Lazim",
        ids = {
            [3143] = true,
        },
        locations = {
            {
                x = 3191,
                z = 2926,
            },
        },
    },
    {
        name = "Lazy Khazard Guard",
        ids = {
            [7550] = true,
        },
        locations = {
            {
                x = 2616,
                z = 3143,
            },
        },
    },
    {
        name = "Lea",
        ids = {
            [31845] = true,
        },
        locations = {
            {
                x = 3002,
                z = 3437,
            },
        },
    },
    {
        name = "Lead Archaeologist Kerner",
        ids = {
            [31578] = true,
        },
        locations = {
            {
                x = 3476,
                z = 3090,
            },
        },
    },
    {
        name = "Leaf",
        ids = {
            [30527] = true,
        },
        locations = {
            {
                x = 3296,
                z = 3567,
            },
        },
    },
    {
        name = "Leatherworker",
        ids = {
            [680] = true,
        },
        locations = {
            {
                x = 2677,
                z = 3434,
            },
        },
    },
    {
        name = "Leela",
        ids = {},
        locations = {
            {
                x = 3122,
                z = 3259,
            },
            {
                x = 3200,
                z = 2823,
            },
        },
    },
    {
        name = "Legends' guard",
        ids = {
            [398] = true,
            [399] = true,
        },
        locations = {
            {
                x = 2726,
                z = 3349,
            },
            {
                x = 2731,
                z = 3348,
            },
        },
    },
    {
        name = "Lensa",
        ids = {
            [5494] = true,
        },
        locations = {
            {
                x = 2412,
                z = 3808,
            },
        },
    },
    {
        name = "Leo",
        ids = {
            [16867] = true,
        },
        locations = {
            {
                x = 2611,
                z = 3301,
            },
        },
    },
    {
        name = "Leon",
        ids = {
            [5111] = true,
        },
        locations = {
            {
                x = 2567,
                z = 3085,
            },
        },
    },
    {
        name = "Leonard",
        ids = {
            [0] = true,
        },
        locations = {
            {
                x = 2903,
                z = 3536,
            },
        },
    },
    {
        name = "Leslie",
        ids = {},
        locations = {
            {
                x = 2963,
                z = 3403,
            },
        },
    },
    {
        name = "Lidio",
        ids = {
            [4293] = true,
        },
        locations = {
            {
                x = 2842,
                z = 3547,
            },
        },
    },
    {
        name = "Lieutenant Schepbur",
        ids = {
            [3817] = true,
        },
        locations = {
            {
                x = 2515,
                z = 3205,
            },
        },
    },
    {
        name = "Lieutenant York",
        ids = {
            [18041] = true,
        },
        locations = {
            {
                x = 3023,
                z = 3558,
            },
        },
    },
    {
        name = "Lilly",
        ids = {
            [4294] = true,
        },
        locations = {
            {
                x = 2845,
                z = 3549,
            },
        },
    },
    {
        name = "Lina",
        ids = {
            [14796] = true,
        },
        locations = {
            {
                x = 2360,
                z = 3375,
            },
        },
    },
    {
        name = "Linford",
        ids = {
            [24810] = true,
        },
        locations = {
            {
                x = 2185,
                z = 3154,
            },
        },
    },
    {
        name = "Ling (contracts)",
        ids = {
            [23033] = true,
        },
        locations = {
            {
                x = 4777,
                z = 3404,
            },
        },
    },
    {
        name = "Lisah",
        ids = {
            [24696] = true,
        },
        locations = {
            {
                x = 3210,
                z = 2795,
            },
        },
    },
    {
        name = "Lisse Isaakson",
        ids = {
            [5513] = true,
        },
        locations = {
            {
                x = 2350,
                z = 3802,
            },
        },
    },
    {
        name = "Listless dead",
        ids = {
            [9722] = true,
            [9723] = true,
        },
        locations = {
            {
                x = 3392,
                z = 3713,
            },
            {
                x = 3395,
                z = 3757,
            },
            {
                x = 3407,
                z = 3635,
            },
            {
                x = 3418,
                z = 3717,
            },
            {
                x = 3426,
                z = 3753,
            },
            {
                x = 3428,
                z = 3773,
            },
            {
                x = 3428,
                z = 3783,
            },
            {
                x = 3444,
                z = 3647,
            },
            {
                x = 3456,
                z = 3683,
            },
            {
                x = 3459,
                z = 3655,
            },
            {
                x = 3463,
                z = 3671,
            },
            {
                x = 3472,
                z = 3681,
            },
            {
                x = 3489,
                z = 3762,
            },
            {
                x = 3489,
                z = 3773,
            },
            {
                x = 3506,
                z = 3731,
            },
            {
                x = 3510,
                z = 3665,
            },
        },
    },
    {
        name = "Litara",
        ids = {
            [4376] = true,
        },
        locations = {
            {
                x = 3083,
                z = 3423,
            },
        },
    },
    {
        name = "Loba",
        ids = {
            [28495] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3345,
            },
        },
    },
    {
        name = "Lobster",
        ids = {
            [9720] = true,
        },
        locations = {
            {
                x = 3386,
                z = 3627,
            },
            {
                x = 3388,
                z = 3608,
            },
            {
                x = 3403,
                z = 3614,
            },
            {
                x = 3411,
                z = 3625,
            },
            {
                x = 3439,
                z = 3633,
            },
        },
    },
    {
        name = "Local",
        ids = {
            [268] = true,
        },
        locations = {
            {
                x = 2583,
                z = 3171,
            },
        },
    },
    {
        name = "Local Gnome",
        ids = {
            [485] = true,
        },
        locations = {
            {
                x = 2541,
                z = 3168,
            },
            {
                x = 2541,
                z = 3171,
            },
            {
                x = 2542,
                z = 3167,
            },
            {
                x = 2542,
                z = 3172,
            },
        },
    },
    {
        name = "Local mage",
        ids = {
            [8347] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3485,
            },
        },
    },
    {
        name = "Local thug",
        ids = {
            [8468] = true,
        },
        locations = {
            {
                x = 2574,
                z = 3321,
            },
            {
                x = 3128,
                z = 3485,
            },
        },
    },
    {
        name = "Lokar Searunner",
        ids = {
            [4537] = true,
            [25446] = true,
        },
        locations = {
            {
                x = 2214,
                z = 3794,
            },
            {
                x = 2621,
                z = 3688,
            },
        },
    },
    {
        name = "Loki",
        ids = {},
        locations = {
            {
                x = 3329,
                z = 3228,
            },
        },
    },
    {
        name = "Lokkir",
        ids = {
            [24718] = true,
        },
        locations = {
            {
                x = 3194,
                z = 2615,
            },
        },
    },
    {
        name = "Longbow Ben",
        ids = {
            [2691] = true,
        },
        locations = {
            {
                x = 3047,
                z = 3255,
            },
        },
    },
    {
        name = "Longhall Bouncer",
        ids = {
            [1278] = true,
        },
        locations = {
            {
                x = 2667,
                z = 3684,
            },
        },
    },
    {
        name = "Longramble",
        ids = {
            [6318] = true,
        },
        locations = {
            {
                x = 2340,
                z = 3096,
            },
        },
    },
    {
        name = "Lord Alexei Jovkai",
        ids = {
            [22540] = true,
        },
        locations = {
            {
                x = 3488,
                z = 3476,
            },
            {
                x = 3550,
                z = 3359,
            },
        },
    },
    {
        name = "Lord Iorwerth",
        ids = {
            [1182] = true,
        },
        locations = {
            {
                x = 2205,
                z = 3252,
            },
        },
    },
    {
        name = "Lord Rologarth",
        ids = {
            [1672] = true,
        },
        locations = {
            {
                x = 3552,
                z = 3550,
            },
        },
    },
    {
        name = "Louie Legs",
        ids = {
            [542] = true,
        },
        locations = {
            {
                x = 3316,
                z = 3175,
            },
        },
    },
    {
        name = "Louisa",
        ids = {
            [809] = true,
        },
        locations = {
            {
                x = 2734,
                z = 3581,
            },
        },
    },
    {
        name = "Lowe",
        ids = {
            [550] = true,
        },
        locations = {
            {
                x = 3232,
                z = 3423,
            },
        },
    },
    {
        name = "Lubufu",
        ids = {
            [1171] = true,
        },
        locations = {
            {
                x = 2770,
                z = 3169,
            },
        },
    },
    {
        name = "Lucille",
        ids = {
            [15469] = true,
        },
        locations = {
            {
                x = 2946,
                z = 3207,
            },
        },
    },
    {
        name = "Lumberjack Leif",
        ids = {
            [1395] = true,
        },
        locations = {
            {
                x = 2550,
                z = 3869,
            },
        },
    },
    {
        name = "Lumbridge guard dog",
        ids = {
            [14937] = true,
        },
        locations = {
            {
                x = 3235,
                z = 3228,
            },
        },
    },
    {
        name = "Lumbridge guardsman",
        ids = {
            [17797] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3225,
            },
            {
                x = 3250,
                z = 3226,
            },
        },
    },
    {
        name = "Lumbridge guardsman (patrolling)",
        ids = {
            [14938] = true,
        },
        locations = {
            {
                x = 3232,
                z = 3228,
            },
        },
    },
    {
        name = "Lumbridge guardsman (stationary)",
        ids = {
            [14936] = true,
        },
        locations = {
            {
                x = 3236,
                z = 3228,
            },
        },
    },
    {
        name = "Lumbridge Sage",
        ids = {
            [2244] = true,
        },
        locations = {
            {
                x = 3238,
                z = 3219,
            },
        },
    },
    {
        name = "Lumdo",
        ids = {
            [1408] = true,
        },
        locations = {
            {
                x = 2803,
                z = 2707,
            },
            {
                x = 2891,
                z = 2724,
            },
        },
    },
    {
        name = "Luminata",
        ids = {
            [3565] = true,
        },
        locations = {
            {
                x = 3504,
                z = 3235,
            },
        },
    },
    {
        name = "Luminous wisp",
        ids = {},
        locations = {
            {
                x = 3295,
                z = 2655,
            },
            {
                x = 3297,
                z = 2650,
            },
            {
                x = 3304,
                z = 2655,
            },
            {
                x = 3304,
                z = 2660,
            },
            {
                x = 3306,
                z = 2667,
            },
            {
                x = 3311,
                z = 2664,
            },
            {
                x = 3312,
                z = 2662,
            },
            {
                x = 3314,
                z = 2663,
            },
            {
                x = 3316,
                z = 2660,
            },
            {
                x = 3317,
                z = 2657,
            },
            {
                x = 3317,
                z = 2659,
            },
            {
                x = 3319,
                z = 2655,
            },
        },
    },
    {
        name = "Lumo",
        ids = {
            [1413] = true,
        },
        locations = {
            {
                x = 2775,
                z = 2796,
            },
        },
    },
    {
        name = "Luna",
        ids = {
            [28493] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3344,
            },
        },
    },
    {
        name = "Luscion",
        ids = {
            [3543] = true,
        },
        locations = {
            {
                x = 3491,
                z = 3242,
            },
        },
    },
    {
        name = "Lustrous wisp",
        ids = {},
        locations = {
            {
                x = 3458,
                z = 3544,
            },
            {
                x = 3460,
                z = 3529,
            },
            {
                x = 3462,
                z = 3537,
            },
            {
                x = 3464,
                z = 3530,
            },
            {
                x = 3465,
                z = 3536,
            },
            {
                x = 3468,
                z = 3530,
            },
            {
                x = 3469,
                z = 3532,
            },
            {
                x = 3470,
                z = 3525,
            },
            {
                x = 3470,
                z = 3532,
            },
            {
                x = 3471,
                z = 3527,
            },
            {
                x = 3471,
                z = 3533,
            },
            {
                x = 3474,
                z = 3532,
            },
        },
    },
    {
        name = "Luthas",
        ids = {
            [379] = true,
        },
        locations = {
            {
                x = 2939,
                z = 3154,
            },
        },
    },
    {
        name = "Lydia",
        ids = {},
        locations = {
            {
                x = 3367,
                z = 2984,
            },
        },
    },
    {
        name = "Lyra",
        ids = {
            [2326] = true,
        },
        locations = {
            {
                x = 3601,
                z = 3527,
            },
        },
    },
    {
        name = "Mabel",
        ids = {
            [11627] = true,
        },
        locations = {
            {
                x = 3142,
                z = 3303,
            },
        },
    },
    {
        name = "Macaroni Penguin",
        ids = {
            [4252] = true,
        },
        locations = {
            {
                x = 2571,
                z = 3907,
            },
        },
    },
    {
        name = "Madame Shih",
        ids = {
            [25398] = true,
        },
        locations = {
            {
                x = 2972,
                z = 2975,
            },
        },
    },
    {
        name = "Maemi",
        ids = {
            [18564] = true,
        },
        locations = {
            {
                x = 3099,
                z = 3369,
            },
        },
    },
    {
        name = "Mage of Zamorak",
        ids = {
            [2257] = true,
            [2260] = true,
            [6370] = true,
        },
        locations = {
            {
                x = 2455,
                z = 3232,
            },
            {
                x = 3106,
                z = 3558,
            },
            {
                x = 3260,
                z = 3383,
            },
        },
    },
    {
        name = "Magestix",
        ids = {
            [14866] = true,
        },
        locations = {
            {
                x = 2931,
                z = 3449,
            },
        },
    },
    {
        name = "Maggie",
        ids = {
            [8078] = true,
        },
        locations = {
            {
                x = 3082,
                z = 3298,
            },
        },
    },
    {
        name = "Magnus Gram",
        ids = {
            [5488] = true,
        },
        locations = {
            {
                x = 2416,
                z = 3799,
            },
        },
    },
    {
        name = "Maid",
        ids = {
            [11304] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3330,
            },
        },
    },
    {
        name = "Maisa",
        ids = {
            [6792] = true,
            [31708] = true,
            [31716] = true,
        },
        locations = {
            {
                x = 3243,
                z = 2729,
            },
            {
                x = 3308,
                z = 2730,
            },
            {
                x = 3316,
                z = 2727,
            },
        },
    },
    {
        name = "Major Mary Rancour",
        ids = {
            [14850] = true,
        },
        locations = {
            {
                x = 2917,
                z = 3561,
            },
        },
    },
    {
        name = "Major Nigel Corothers",
        ids = {
            [22663] = true,
        },
        locations = {
            {
                x = 2917,
                z = 3561,
            },
        },
    },
    {
        name = "Makeover Mage",
        ids = {
            [2676] = true,
        },
        locations = {
            {
                x = 2916,
                z = 3323,
            },
        },
    },
    {
        name = "Makhredrup",
        ids = {
            [24708] = true,
        },
        locations = {
            {
                x = 3216,
                z = 2704,
            },
        },
    },
    {
        name = "Malak",
        ids = {
            [1920] = true,
        },
        locations = {
            {
                x = 3497,
                z = 3478,
            },
        },
    },
    {
        name = "Malala",
        ids = {
            [24686] = true,
        },
        locations = {
            {
                x = 3163,
                z = 2793,
            },
        },
    },
    {
        name = "Malcolm",
        ids = {
            [25844] = true,
        },
        locations = {
            {
                x = 2636,
                z = 3356,
            },
        },
    },
    {
        name = "Male slave",
        ids = {
            [825] = true,
            [1753] = true,
            [1768] = true,
        },
        locations = {
            {
                x = 3286,
                z = 3017,
            },
            {
                x = 3299,
                z = 3018,
            },
            {
                x = 3303,
                z = 3025,
            },
        },
    },
    {
        name = "Malignius Mortifer",
        ids = {
            [2713] = true,
        },
        locations = {
            {
                x = 3001,
                z = 3267,
            },
        },
    },
    {
        name = "Malik the Carter",
        ids = {
            [26837] = true,
        },
        locations = {
            {
                x = 3421,
                z = 2914,
            },
        },
    },
    {
        name = "Mama",
        ids = {
            [3164] = true,
        },
        locations = {
            {
                x = 3663,
                z = 2980,
            },
        },
    },
    {
        name = "Mami Rimba",
        ids = {
            [15234] = true,
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3058,
                z = 3517,
            },
        },
    },
    {
        name = "Mamma Bufetta",
        ids = {
            [2507] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3076,
            },
        },
    },
    {
        name = "Man",
        ids = {
            [1086] = true,
            [4589] = true,
            [4593] = true,
            [15038] = true,
        },
        locations = {
            {
                x = 2966,
                z = 3267,
            },
            {
                x = 3090,
                z = 3267,
            },
            {
                x = 3092,
                z = 3259,
            },
            {
                x = 3209,
                z = 3251,
            },
        },
    },
    {
        name = "Mandrith",
        ids = {
            [6537] = true,
            [29450] = true,
        },
        locations = {
            {
                x = 2891,
                z = 3522,
            },
            {
                x = 3051,
                z = 3953,
            },
            {
                x = 3091,
                z = 3495,
            },
            {
                x = 3096,
                z = 3478,
            },
        },
    },
    {
        name = "Manni the Reveller",
        ids = {
            [1286] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3675,
            },
        },
    },
    {
        name = "Maria",
        ids = {
            [20205] = true,
        },
        locations = {
            {
                x = 3360,
                z = 3481,
            },
        },
    },
    {
        name = "Maria Gadderanks",
        ids = {
            [14102] = true,
        },
        locations = {
            {
                x = 3669,
                z = 3401,
            },
        },
    },
    {
        name = "Maria Gunnars",
        ids = {
            [5507] = true,
            [5508] = true,
        },
        locations = {
            {
                x = 2311,
                z = 3781,
            },
            {
                x = 2644,
                z = 3710,
            },
        },
    },
    {
        name = "Mariah",
        ids = {
            [11519] = true,
        },
        locations = {
            {
                x = 2675,
                z = 2656,
            },
        },
    },
    {
        name = "Marion",
        ids = {
            [9166] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3272,
            },
        },
    },
    {
        name = "Marius Giste",
        ids = {
            [5933] = true,
        },
        locations = {
            {
                x = 3254,
                z = 3443,
            },
        },
    },
    {
        name = "Market guard",
        ids = {
            [11269] = true,
        },
        locations = {
            {
                x = 3214,
                z = 3425,
            },
        },
    },
    {
        name = "Market seller",
        ids = {
            [1866] = true,
        },
        locations = {
            {
                x = 3359,
                z = 2987,
            },
        },
    },
    {
        name = "Markus",
        ids = {
            [16839] = true,
        },
        locations = {
            {
                x = 3419,
                z = 3525,
            },
        },
    },
    {
        name = "Martha Rehnison",
        ids = {
            [722] = true,
        },
        locations = {
            {
                x = 2531,
                z = 3333,
            },
        },
    },
    {
        name = "Martin the Master Gardener",
        ids = {
            [3299] = true,
        },
        locations = {
            {
                x = 3077,
                z = 3255,
            },
        },
    },
    {
        name = "Martina Scorsby",
        ids = {
            [3326] = true,
        },
        locations = {
            {
                x = 3256,
                z = 3481,
            },
        },
    },
    {
        name = "Master Crafter",
        ids = {
            [805] = true,
        },
        locations = {
            {
                x = 2931,
                z = 3273,
            },
        },
    },
    {
        name = "Master Farmer",
        ids = {
            [2234] = true,
            [2235] = true,
            [32427] = true,
        },
        locations = {
            {
                x = 2619,
                z = 3354,
            },
            {
                x = 2808,
                z = 3435,
            },
            {
                x = 3080,
                z = 3250,
            },
            {
                x = 3203,
                z = 3258,
            },
            {
                x = 3231,
                z = 3347,
            },
        },
    },
    {
        name = "Master fisher",
        ids = {
            [308] = true,
        },
        locations = {
            {
                x = 2613,
                z = 3394,
            },
        },
    },
    {
        name = "Matilda",
        ids = {
            [1365] = true,
        },
        locations = {
            {
                x = 2603,
                z = 3871,
            },
        },
    },
    {
        name = "Matthias",
        ids = {
            [5092] = true,
        },
        locations = {
            {
                x = 2376,
                z = 3606,
            },
        },
    },
    {
        name = "Matty Ock",
        ids = {
            [26932] = true,
        },
        locations = {
            {
                x = 3320,
                z = 3374,
            },
        },
    },
    {
        name = "Maverick",
        ids = {
            [13824] = true,
        },
        locations = {
            {
                x = 2949,
                z = 2956,
            },
        },
    },
    {
        name = "Mawnis Burowgar",
        ids = {
            [5530] = true,
        },
        locations = {
            {
                x = 2335,
                z = 3799,
            },
        },
    },
    {
        name = "Mawrth",
        ids = {
            [2366] = true,
        },
        locations = {
            {
                x = 2331,
                z = 3165,
            },
        },
    },
    {
        name = "Max",
        ids = {
            [3705] = true,
        },
        locations = {
            {
                x = 3230,
                z = 3461,
            },
        },
    },
    {
        name = "May",
        ids = {
            [25868] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3369,
            },
        },
    },
    {
        name = "May Stormbrewer",
        ids = {
            [18198] = true,
        },
        locations = {
            {
                x = 3134,
                z = 3234,
            },
        },
    },
    {
        name = "Mayor Hobb",
        ids = {
            [4854] = true,
        },
        locations = {
            {
                x = 2711,
                z = 3292,
            },
        },
    },
    {
        name = "Maysa the Hag",
        ids = {
            [1871] = true,
        },
        locations = {
            {
                x = 3344,
                z = 2989,
            },
        },
    },
    {
        name = "Mazchna",
        ids = {
            [8482] = true,
        },
        locations = {
            {
                x = 3512,
                z = 3509,
            },
        },
    },
    {
        name = "Mazion",
        ids = {
            [3114] = true,
        },
        locations = {
            {
                x = 2818,
                z = 3342,
            },
        },
    },
    {
        name = "Mechanayak",
        ids = {
            [27257] = true,
        },
        locations = {
            {
                x = 2878,
                z = 3521,
            },
        },
    },
    {
        name = "Medjed",
        ids = {},
        locations = {
            {
                x = 3324,
                z = 3220,
            },
        },
    },
    {
        name = "Meegle",
        ids = {
            [4597] = true,
        },
        locations = {
            {
                x = 2378,
                z = 3433,
            },
        },
    },
    {
        name = "Meena",
        ids = {
            [24552] = true,
        },
        locations = {
            {
                x = 3214,
                z = 2664,
            },
            {
                x = 3214,
                z = 2668,
            },
        },
    },
    {
        name = "Megan",
        ids = {
            [25998] = true,
        },
        locations = {
            {
                x = 2197,
                z = 3694,
            },
        },
    },
    {
        name = "Meiyerditch citizen",
        ids = {
            [4717] = true,
            [4718] = true,
            [4719] = true,
            [4720] = true,
            [4721] = true,
            [4722] = true,
            [4723] = true,
            [4724] = true,
            [4725] = true,
            [4726] = true,
            [4727] = true,
            [4728] = true,
            [4729] = true,
            [4730] = true,
            [4734] = true,
            [4735] = true,
            [4736] = true,
            [4737] = true,
            [4738] = true,
            [4739] = true,
            [4740] = true,
            [4741] = true,
            [4742] = true,
            [4743] = true,
            [4744] = true,
            [4745] = true,
            [14186] = true,
            [14187] = true,
            [14188] = true,
            [14189] = true,
        },
        locations = {
            {
                x = 3592,
                z = 3222,
            },
            {
                x = 3592,
                z = 3227,
            },
            {
                x = 3593,
                z = 3187,
            },
            {
                x = 3593,
                z = 3200,
            },
            {
                x = 3594,
                z = 3215,
            },
            {
                x = 3595,
                z = 3212,
            },
            {
                x = 3595,
                z = 3264,
            },
            {
                x = 3596,
                z = 3184,
            },
            {
                x = 3596,
                z = 3265,
            },
            {
                x = 3597,
                z = 3247,
            },
            {
                x = 3598,
                z = 3207,
            },
            {
                x = 3599,
                z = 3190,
            },
            {
                x = 3599,
                z = 3285,
            },
            {
                x = 3600,
                z = 3280,
            },
            {
                x = 3601,
                z = 3284,
            },
            {
                x = 3602,
                z = 3275,
            },
            {
                x = 3603,
                z = 3195,
            },
            {
                x = 3603,
                z = 3215,
            },
            {
                x = 3603,
                z = 3266,
            },
            {
                x = 3603,
                z = 3285,
            },
            {
                x = 3604,
                z = 3222,
            },
            {
                x = 3605,
                z = 3218,
            },
            {
                x = 3605,
                z = 3268,
            },
            {
                x = 3605,
                z = 3284,
            },
            {
                x = 3606,
                z = 3209,
            },
            {
                x = 3607,
                z = 3285,
            },
            {
                x = 3608,
                z = 3189,
            },
            {
                x = 3608,
                z = 3201,
            },
            {
                x = 3609,
                z = 3207,
            },
            {
                x = 3610,
                z = 3217,
            },
            {
                x = 3610,
                z = 3272,
            },
            {
                x = 3611,
                z = 3285,
            },
            {
                x = 3612,
                z = 3211,
            },
            {
                x = 3613,
                z = 3222,
            },
            {
                x = 3615,
                z = 3207,
            },
            {
                x = 3615,
                z = 3283,
            },
            {
                x = 3616,
                z = 3256,
            },
            {
                x = 3616,
                z = 3273,
            },
            {
                x = 3617,
                z = 3215,
            },
            {
                x = 3618,
                z = 3225,
            },
            {
                x = 3618,
                z = 3276,
            },
            {
                x = 3619,
                z = 3207,
            },
            {
                x = 3619,
                z = 3230,
            },
            {
                x = 3620,
                z = 3200,
            },
            {
                x = 3620,
                z = 3214,
            },
            {
                x = 3620,
                z = 3219,
            },
            {
                x = 3620,
                z = 3301,
            },
            {
                x = 3620,
                z = 3321,
            },
            {
                x = 3621,
                z = 3201,
            },
            {
                x = 3621,
                z = 3284,
            },
            {
                x = 3621,
                z = 3319,
            },
            {
                x = 3621,
                z = 3325,
            },
            {
                x = 3622,
                z = 3325,
            },
            {
                x = 3623,
                z = 3189,
            },
            {
                x = 3623,
                z = 3212,
            },
            {
                x = 3623,
                z = 3228,
            },
            {
                x = 3623,
                z = 3283,
            },
            {
                x = 3624,
                z = 3196,
            },
            {
                x = 3624,
                z = 3205,
            },
            {
                x = 3624,
                z = 3271,
            },
            {
                x = 3624,
                z = 3281,
            },
            {
                x = 3625,
                z = 3214,
            },
            {
                x = 3627,
                z = 3204,
            },
            {
                x = 3627,
                z = 3231,
            },
            {
                x = 3627,
                z = 3281,
            },
            {
                x = 3627,
                z = 3292,
            },
            {
                x = 3628,
                z = 3283,
            },
            {
                x = 3629,
                z = 3280,
            },
            {
                x = 3630,
                z = 3308,
            },
            {
                x = 3631,
                z = 3300,
            },
            {
                x = 3631,
                z = 3325,
            },
            {
                x = 3632,
                z = 3196,
            },
            {
                x = 3632,
                z = 3265,
            },
            {
                x = 3632,
                z = 3286,
            },
            {
                x = 3632,
                z = 3299,
            },
            {
                x = 3633,
                z = 3233,
            },
            {
                x = 3634,
                z = 3269,
            },
            {
                x = 3634,
                z = 3310,
            },
            {
                x = 3635,
                z = 3271,
            },
            {
                x = 3636,
                z = 3280,
            },
            {
                x = 3637,
                z = 3232,
            },
            {
                x = 3637,
                z = 3275,
            },
            {
                x = 3638,
                z = 3296,
            },
            {
                x = 3638,
                z = 3317,
            },
            {
                x = 3638,
                z = 3319,
            },
            {
                x = 3639,
                z = 3290,
            },
            {
                x = 3640,
                z = 3286,
            },
            {
                x = 3641,
                z = 3278,
            },
            {
                x = 3642,
                z = 3282,
            },
        },
    },
    {
        name = "Melana Moonlander",
        ids = {
            [4516] = true,
        },
        locations = {
            {
                x = 2095,
                z = 3906,
            },
        },
    },
    {
        name = "Melina",
        ids = {
            [2933] = true,
        },
        locations = {
            {
                x = 3674,
                z = 3484,
            },
        },
    },
    {
        name = "Memory fragment",
        ids = {
            [22307] = true,
        },
        locations = {
            {
                x = 2259,
                z = 3058,
            },
            {
                x = 2259,
                z = 3064,
            },
            {
                x = 2261,
                z = 3051,
            },
            {
                x = 2262,
                z = 3040,
            },
            {
                x = 2263,
                z = 3044,
            },
            {
                x = 2263,
                z = 3054,
            },
            {
                x = 2264,
                z = 3062,
            },
            {
                x = 2266,
                z = 3051,
            },
            {
                x = 2268,
                z = 3039,
            },
            {
                x = 2268,
                z = 3046,
            },
            {
                x = 2268,
                z = 3055,
            },
            {
                x = 2272,
                z = 3042,
            },
            {
                x = 2274,
                z = 3058,
            },
            {
                x = 2274,
                z = 3064,
            },
            {
                x = 2275,
                z = 3053,
            },
            {
                x = 2276,
                z = 3047,
            },
            {
                x = 2279,
                z = 3043,
            },
            {
                x = 2280,
                z = 3061,
            },
            {
                x = 2282,
                z = 3056,
            },
            {
                x = 2286,
                z = 3044,
            },
            {
                x = 2286,
                z = 3060,
            },
            {
                x = 2286,
                z = 3064,
            },
            {
                x = 2288,
                z = 3050,
            },
            {
                x = 2288,
                z = 3055,
            },
        },
    },
    {
        name = "Memstix",
        ids = {
            [16887] = true,
        },
        locations = {
            {
                x = 2932,
                z = 3478,
            },
        },
    },
    {
        name = "Menaphite accountant",
        ids = {
            [24503] = true,
        },
        locations = {
            {
                x = 3104,
                z = 2693,
            },
        },
    },
    {
        name = "Menaphite architect",
        ids = {
            [24502] = true,
        },
        locations = {
            {
                x = 3208,
                z = 2754,
            },
        },
    },
    {
        name = "Menaphite beggar",
        ids = {
            [24743] = true,
        },
        locations = {
            {
                x = 3160,
                z = 2782,
            },
            {
                x = 3240,
                z = 2761,
            },
            {
                x = 3240,
                z = 2762,
            },
        },
    },
    {
        name = "Menaphite citizen",
        ids = {
            [24437] = true,
            [24438] = true,
            [24439] = true,
            [24440] = true,
            [24441] = true,
            [24442] = true,
            [24443] = true,
            [24444] = true,
            [24445] = true,
            [24446] = true,
            [24447] = true,
            [24448] = true,
            [24449] = true,
            [24450] = true,
            [24451] = true,
            [24452] = true,
            [24453] = true,
            [24455] = true,
            [24456] = true,
            [24457] = true,
            [24458] = true,
            [24505] = true,
            [24506] = true,
            [24507] = true,
            [24508] = true,
            [24509] = true,
            [24511] = true,
            [24512] = true,
            [24741] = true,
            [24742] = true,
        },
        locations = {
            {
                x = 3095,
                z = 2731,
            },
            {
                x = 3096,
                z = 2731,
            },
            {
                x = 3115,
                z = 2744,
            },
            {
                x = 3115,
                z = 2745,
            },
            {
                x = 3115,
                z = 2747,
            },
            {
                x = 3116,
                z = 2746,
            },
            {
                x = 3133,
                z = 2701,
            },
            {
                x = 3145,
                z = 2807,
            },
            {
                x = 3156,
                z = 2811,
            },
            {
                x = 3160,
                z = 2808,
            },
            {
                x = 3161,
                z = 2805,
            },
            {
                x = 3166,
                z = 2655,
            },
            {
                x = 3171,
                z = 2647,
            },
            {
                x = 3179,
                z = 2698,
            },
            {
                x = 3195,
                z = 2637,
            },
            {
                x = 3204,
                z = 2629,
            },
            {
                x = 3204,
                z = 2659,
            },
            {
                x = 3216,
                z = 2627,
            },
            {
                x = 3217,
                z = 2626,
            },
            {
                x = 3217,
                z = 2679,
            },
            {
                x = 3218,
                z = 2642,
            },
            {
                x = 3218,
                z = 2680,
            },
            {
                x = 3222,
                z = 2667,
            },
            {
                x = 3226,
                z = 2725,
            },
            {
                x = 3227,
                z = 2726,
            },
            {
                x = 3227,
                z = 2732,
            },
            {
                x = 3227,
                z = 2733,
            },
            {
                x = 3228,
                z = 2667,
            },
            {
                x = 3230,
                z = 2667,
            },
            {
                x = 3231,
                z = 2666,
            },
            {
                x = 3231,
                z = 2674,
            },
            {
                x = 3232,
                z = 2675,
            },
            {
                x = 3237,
                z = 2805,
            },
            {
                x = 3238,
                z = 2741,
            },
            {
                x = 3239,
                z = 2740,
            },
            {
                x = 3248,
                z = 2758,
            },
            {
                x = 3249,
                z = 2759,
            },
            {
                x = 3255,
                z = 2782,
            },
            {
                x = 3255,
                z = 2783,
            },
            {
                x = 3255,
                z = 2785,
            },
            {
                x = 3256,
                z = 2783,
            },
            {
                x = 3256,
                z = 2784,
            },
        },
    },
    {
        name = "Menaphite dentist",
        ids = {
            [24504] = true,
        },
        locations = {
            {
                x = 3236,
                z = 2749,
            },
        },
    },
    {
        name = "Menaphite embalmer",
        ids = {
            [24500] = true,
        },
        locations = {
            {
                x = 3165,
                z = 2815,
            },
        },
    },
    {
        name = "Menaphite forge worker",
        ids = {
            [24497] = true,
        },
        locations = {
            {
                x = 3151,
                z = 2799,
            },
        },
    },
    {
        name = "Menaphite gardener",
        ids = {
            [24501] = true,
        },
        locations = {
            {
                x = 3131,
                z = 2797,
            },
        },
    },
    {
        name = "Menaphite guard",
        ids = {
            [5277] = true,
            [24533] = true,
            [24534] = true,
            [24535] = true,
            [24536] = true,
            [24537] = true,
            [24538] = true,
            [24662] = true,
            [24663] = true,
            [24667] = true,
            [24668] = true,
            [24670] = true,
            [24672] = true,
            [24674] = true,
            [24733] = true,
            [24734] = true,
            [24735] = true,
            [24736] = true,
            [24737] = true,
            [24738] = true,
            [24739] = true,
            [24740] = true,
            [24774] = true,
        },
        locations = {
            {
                x = 3117,
                z = 2756,
            },
            {
                x = 3150,
                z = 2815,
            },
            {
                x = 3153,
                z = 2803,
            },
            {
                x = 3162,
                z = 2639,
            },
            {
                x = 3162,
                z = 2643,
            },
            {
                x = 3162,
                z = 2814,
            },
            {
                x = 3167,
                z = 2693,
            },
            {
                x = 3167,
                z = 2695,
            },
            {
                x = 3168,
                z = 2727,
            },
            {
                x = 3168,
                z = 2731,
            },
            {
                x = 3169,
                z = 2616,
            },
            {
                x = 3170,
                z = 2726,
            },
            {
                x = 3170,
                z = 2732,
            },
            {
                x = 3170,
                z = 2795,
            },
            {
                x = 3170,
                z = 2799,
            },
            {
                x = 3171,
                z = 2616,
            },
            {
                x = 3171,
                z = 2620,
            },
            {
                x = 3171,
                z = 2794,
            },
            {
                x = 3171,
                z = 2800,
            },
            {
                x = 3173,
                z = 2616,
            },
            {
                x = 3175,
                z = 2734,
            },
            {
                x = 3177,
                z = 2795,
            },
            {
                x = 3177,
                z = 2799,
            },
            {
                x = 3179,
                z = 2797,
            },
            {
                x = 3185,
                z = 2619,
            },
            {
                x = 3187,
                z = 2619,
            },
            {
                x = 3187,
                z = 2641,
            },
            {
                x = 3189,
                z = 2619,
            },
            {
                x = 3197,
                z = 2719,
            },
            {
                x = 3198,
                z = 2774,
            },
            {
                x = 3200,
                z = 2726,
            },
            {
                x = 3200,
                z = 2732,
            },
            {
                x = 3200,
                z = 2774,
            },
            {
                x = 3205,
                z = 2711,
            },
            {
                x = 3205,
                z = 2747,
            },
            {
                x = 3205,
                z = 2810,
            },
            {
                x = 3206,
                z = 2808,
            },
            {
                x = 3208,
                z = 2808,
            },
            {
                x = 3209,
                z = 2711,
            },
            {
                x = 3209,
                z = 2747,
            },
            {
                x = 3209,
                z = 2810,
            },
            {
                x = 3214,
                z = 2725,
            },
            {
                x = 3214,
                z = 2733,
            },
            {
                x = 3224,
                z = 2714,
            },
            {
                x = 3224,
                z = 2744,
            },
            {
                x = 3230,
                z = 2714,
            },
            {
                x = 3230,
                z = 2744,
            },
            {
                x = 3230,
                z = 2752,
            },
            {
                x = 3236,
                z = 2739,
            },
            {
                x = 3242,
                z = 2728,
            },
            {
                x = 3242,
                z = 2730,
            },
            {
                x = 3249,
                z = 2727,
            },
            {
                x = 3249,
                z = 2729,
            },
            {
                x = 3249,
                z = 2731,
            },
            {
                x = 3250,
                z = 2760,
            },
            {
                x = 3259,
                z = 2728,
            },
            {
                x = 3259,
                z = 2730,
            },
            {
                x = 3260,
                z = 2729,
            },
        },
    },
    {
        name = "Menaphite Leader",
        ids = {
            [1899] = true,
        },
        locations = {
            {
                x = 3334,
                z = 2956,
            },
        },
    },
    {
        name = "Menaphite military recruiter",
        ids = {
            [24499] = true,
        },
        locations = {
            {
                x = 3158,
                z = 2768,
            },
        },
    },
    {
        name = "Menaphite perfume seller",
        ids = {
            [24498] = true,
        },
        locations = {
            {
                x = 3196,
                z = 2795,
            },
        },
    },
    {
        name = "Menaphite plover herder",
        ids = {
            [24496] = true,
        },
        locations = {
            {
                x = 3194,
                z = 2672,
            },
        },
    },
    {
        name = "Menaphite royal guard",
        ids = {
            [24460] = true,
        },
        locations = {
            {
                x = 3212,
                z = 2761,
            },
            {
                x = 3212,
                z = 2763,
            },
        },
    },
    {
        name = "Menaphite Smuggler",
        ids = {
            [25109] = true,
        },
        locations = {
            {
                x = 3378,
                z = 3139,
            },
        },
    },
    {
        name = "Menhet",
        ids = {
            [24691] = true,
        },
        locations = {
            {
                x = 3186,
                z = 2801,
            },
        },
    },
    {
        name = "Mercenary Adventurer",
        ids = {
            [1048] = true,
        },
        locations = {
            {
                x = 3439,
                z = 3486,
            },
        },
    },
    {
        name = "Mercenary Captain",
        ids = {
            [830] = true,
        },
        locations = {
            {
                x = 3270,
                z = 3029,
            },
        },
    },
    {
        name = "Merchant",
        ids = {
            [15011] = true,
            [15012] = true,
            [23221] = true,
            [23222] = true,
        },
        locations = {
            {
                x = 2804,
                z = 3434,
            },
            {
                x = 2811,
                z = 3434,
            },
            {
                x = 3206,
                z = 3253,
            },
            {
                x = 3207,
                z = 3265,
            },
        },
    },
    {
        name = "Merchant district musician",
        ids = {
            [24610] = true,
        },
        locations = {
            {
                x = 3224,
                z = 2782,
            },
        },
    },
    {
        name = "Meredith",
        ids = {
            [20469] = true,
        },
        locations = {
            {
                x = 2323,
                z = 3269,
            },
        },
    },
    {
        name = "Merethiel",
        ids = {
            [25508] = true,
        },
        locations = {
            {
                x = 2269,
                z = 2829,
            },
        },
    },
    {
        name = "Meskhenet",
        ids = {
            [3035] = true,
        },
        locations = {
            {
                x = 3427,
                z = 2900,
            },
        },
    },
    {
        name = "Mess Sergeant Ramsey",
        ids = {
            [14881] = true,
        },
        locations = {
            {
                x = 2896,
                z = 3442,
            },
        },
    },
    {
        name = "Meteora",
        ids = {
            [4515] = true,
        },
        locations = {
            {
                x = 2082,
                z = 3894,
            },
        },
    },
    {
        name = "Miazrqa",
        ids = {
            [5988] = true,
        },
        locations = {
            {
                x = 2967,
                z = 3473,
            },
        },
    },
    {
        name = "Mieliki Tapio",
        ids = {
            [25851] = true,
        },
        locations = {
            {
                x = 2644,
                z = 3352,
            },
        },
    },
    {
        name = "Mihail",
        ids = {
            [3560] = true,
        },
        locations = {
            {
                x = 3480,
                z = 3222,
            },
        },
    },
    {
        name = "Mike",
        ids = {
            [3166] = true,
        },
        locations = {
            {
                x = 3695,
                z = 2978,
            },
        },
    },
    {
        name = "Miles",
        ids = {
            [16844] = true,
        },
        locations = {
            {
                x = 3165,
                z = 3475,
            },
        },
    },
    {
        name = "Milk seller",
        ids = {
            [11547] = true,
        },
        locations = {
            {
                x = 2738,
                z = 3562,
            },
            {
                x = 3037,
                z = 3301,
            },
        },
    },
    {
        name = "Millie Miller",
        ids = {
            [3806] = true,
        },
        locations = {
            {
                x = 3167,
                z = 3306,
            },
        },
    },
    {
        name = "Milton the Miller",
        ids = {
            [1739] = true,
        },
        locations = {
            {
                x = 2633,
                z = 3382,
            },
        },
    },
    {
        name = "Mime",
        ids = {
            [16868] = true,
        },
        locations = {
            {
                x = 3046,
                z = 3384,
            },
        },
    },
    {
        name = "Mine-cart driver",
        ids = {
            [841] = true,
        },
        locations = {
            {
                x = 3287,
                z = 3022,
            },
        },
    },
    {
        name = "Miner",
        ids = {
            [5498] = true,
        },
        locations = {
            {
                x = 2392,
                z = 3800,
            },
            {
                x = 2409,
                z = 3820,
            },
            {
                x = 2412,
                z = 3801,
            },
        },
    },
    {
        name = "Miner Magnus",
        ids = {
            [1396] = true,
        },
        locations = {
            {
                x = 2526,
                z = 3893,
            },
        },
    },
    {
        name = "Minerva",
        ids = {
            [29546] = true,
        },
        locations = {
            {
                x = 3018,
                z = 3376,
            },
        },
    },
    {
        name = "Mira",
        ids = {
            [31027] = true,
        },
        locations = {
            {
                x = 2848,
                z = 3162,
            },
        },
    },
    {
        name = "Misdrievus Vakan",
        ids = {
            [14119] = true,
        },
        locations = {
            {
                x = 3605,
                z = 3367,
            },
        },
    },
    {
        name = "Miss Schism",
        ids = {
            [2634] = true,
        },
        locations = {
            {
                x = 3095,
                z = 3252,
            },
        },
    },
    {
        name = "Mister Gully",
        ids = {
            [22940] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3247,
            },
        },
    },
    {
        name = "Moldark, Emissary of Zamorak",
        ids = {
            [17135] = true,
        },
        locations = {
            {
                x = 3105,
                z = 3509,
            },
        },
    },
    {
        name = "Moldof",
        ids = {
            [1363] = true,
        },
        locations = {
            {
                x = 2594,
                z = 3886,
            },
        },
    },
    {
        name = "Molly",
        ids = {
            [28691] = true,
        },
        locations = {
            {
                x = 2467,
                z = 3483,
            },
            {
                x = 2467,
                z = 3486,
            },
            {
                x = 3389,
                z = 3260,
            },
        },
    },
    {
        name = "Monk",
        ids = {
            [5610] = true,
            [5611] = true,
            [5671] = true,
            [5672] = true,
        },
        locations = {
            {
                x = 3784,
                z = 2824,
            },
            {
                x = 3785,
                z = 2827,
            },
            {
                x = 3788,
                z = 2825,
            },
            {
                x = 3788,
                z = 2826,
            },
        },
    },
    {
        name = "Monk (Lost City)",
        ids = {
            [32435] = true,
        },
        locations = {
            {
                x = 3150,
                z = 3207,
            },
        },
    },
    {
        name = "Monk of Entrana",
        ids = {
            [657] = true,
            [658] = true,
            [2728] = true,
            [2729] = true,
            [2730] = true,
            [2731] = true,
        },
        locations = {
            {
                x = 2830,
                z = 3335,
            },
            {
                x = 2835,
                z = 3336,
            },
            {
                x = 2839,
                z = 3335,
            },
            {
                x = 3045,
                z = 3236,
            },
            {
                x = 3046,
                z = 3234,
            },
            {
                x = 3049,
                z = 3235,
            },
        },
    },
    {
        name = "Monkey",
        ids = {
            [1463] = true,
            [2301] = true,
        },
        locations = {
            {
                x = 2600,
                z = 3276,
            },
            {
                x = 2601,
                z = 3276,
            },
            {
                x = 2601,
                z = 3277,
            },
            {
                x = 2601,
                z = 3278,
            },
            {
                x = 2602,
                z = 3279,
            },
            {
                x = 2602,
                z = 3282,
            },
            {
                x = 2604,
                z = 3276,
            },
            {
                x = 2605,
                z = 3280,
            },
            {
                x = 2605,
                z = 3281,
            },
            {
                x = 2606,
                z = 3280,
            },
            {
                x = 3181,
                z = 3043,
            },
            {
                x = 3311,
                z = 3108,
            },
            {
                x = 3347,
                z = 2942,
            },
            {
                x = 3350,
                z = 3000,
            },
            {
                x = 3400,
                z = 2918,
            },
        },
    },
    {
        name = "Monkey Child",
        ids = {
            [1452] = true,
        },
        locations = {
            {
                x = 2743,
                z = 2795,
            },
        },
    },
    {
        name = "Monkey colonist",
        ids = {
            [13196] = true,
        },
        locations = {
            {
                x = 3223,
                z = 2987,
            },
            {
                x = 3225,
                z = 2987,
            },
        },
    },
    {
        name = "Monkey guard",
        ids = {
            [13239] = true,
            [13242] = true,
        },
        locations = {
            {
                x = 2790,
                z = 2792,
            },
            {
                x = 2806,
                z = 2794,
            },
        },
    },
    {
        name = "Monkey knife fighter",
        ids = {
            [13192] = true,
            [13211] = true,
        },
        locations = {
            {
                x = 2749,
                z = 2796,
            },
            {
                x = 2749,
                z = 2799,
            },
            {
                x = 2751,
                z = 2801,
            },
            {
                x = 2753,
                z = 2797,
            },
            {
                x = 2755,
                z = 2800,
            },
            {
                x = 3221,
                z = 2989,
            },
            {
                x = 3224,
                z = 2992,
            },
            {
                x = 3231,
                z = 2989,
            },
        },
    },
    {
        name = "Monkey minder",
        ids = {
            [1469] = true,
            [7572] = true,
            [7573] = true,
        },
        locations = {
            {
                x = 2595,
                z = 3277,
            },
            {
                x = 2602,
                z = 3274,
            },
            {
                x = 2608,
                z = 3279,
            },
        },
    },
    {
        name = "Moorrissey",
        ids = {
            [27073] = true,
        },
        locations = {
            {
                x = 2886,
                z = 3521,
            },
        },
    },
    {
        name = "Mord Gunnars",
        ids = {
            [5481] = true,
            [5482] = true,
        },
        locations = {
            {
                x = 2421,
                z = 3781,
            },
            {
                x = 2644,
                z = 3709,
            },
        },
    },
    {
        name = "Mordaut Jr",
        ids = {
            [30737] = true,
        },
        locations = {
            {
                x = 3282,
                z = 3566,
            },
        },
    },
    {
        name = "Morgan",
        ids = {
            [755] = true,
            [28501] = true,
        },
        locations = {
            {
                x = 3098,
                z = 3268,
            },
            {
                x = 3125,
                z = 3342,
            },
        },
    },
    {
        name = "Morris",
        ids = {
            [227] = true,
        },
        locations = {
            {
                x = 2643,
                z = 3440,
            },
        },
    },
    {
        name = "Morten Holdstrom",
        ids = {
            [5510] = true,
        },
        locations = {
            {
                x = 2332,
                z = 3803,
            },
        },
    },
    {
        name = "Morvran",
        ids = {
            [1188] = true,
        },
        locations = {
            {
                x = 2310,
                z = 3214,
            },
        },
    },
    {
        name = "Mosol Rei",
        ids = {
            [500] = true,
        },
        locations = {
            {
                x = 2883,
                z = 2951,
            },
        },
    },
    {
        name = "Mossy rock",
        ids = {
            [24851] = true,
            [24852] = true,
        },
        locations = {
            {
                x = 2330,
                z = 2917,
            },
            {
                x = 2332,
                z = 2914,
            },
            {
                x = 2332,
                z = 2916,
            },
            {
                x = 2333,
                z = 2913,
            },
            {
                x = 2336,
                z = 2910,
            },
            {
                x = 2338,
                z = 2915,
            },
            {
                x = 2339,
                z = 2911,
            },
            {
                x = 2340,
                z = 2907,
            },
        },
    },
    {
        name = "Mostafa the Camel",
        ids = {
            [16712] = true,
        },
        locations = {
            {
                x = 3170,
                z = 2912,
            },
        },
    },
    {
        name = "Mother",
        ids = {
            [23255] = true,
        },
        locations = {
            {
                x = 3092,
                z = 3477,
            },
        },
    },
    {
        name = "Mountain Goat",
        ids = {
            [1140] = true,
            [1141] = true,
            [1819] = true,
            [1820] = true,
            [5166] = true,
            [5167] = true,
            [5171] = true,
        },
        locations = {
            {
                x = 2793,
                z = 3674,
            },
            {
                x = 2794,
                z = 3677,
            },
            {
                x = 2795,
                z = 3675,
            },
            {
                x = 2796,
                z = 3677,
            },
            {
                x = 2798,
                z = 3842,
            },
            {
                x = 2804,
                z = 3843,
            },
            {
                x = 2807,
                z = 3843,
            },
            {
                x = 2888,
                z = 3668,
            },
            {
                x = 2891,
                z = 3674,
            },
            {
                x = 2897,
                z = 3689,
            },
            {
                x = 2900,
                z = 3671,
            },
            {
                x = 2900,
                z = 3680,
            },
        },
    },
    {
        name = "Mouse",
        ids = {
            [25860] = true,
        },
        locations = {
            {
                x = 2643,
                z = 3374,
            },
            {
                x = 2681,
                z = 3346,
            },
        },
    },
    {
        name = "Movario",
        ids = {
            [26952] = true,
        },
        locations = {
            {
                x = 3264,
                z = 3507,
            },
        },
    },
    {
        name = "Mr Ex",
        ids = {
            [3709] = true,
        },
        locations = {
            {
                x = 3088,
                z = 3507,
            },
        },
    },
    {
        name = "Mr Mordaut",
        ids = {
            [30733] = true,
        },
        locations = {
            {
                x = 3308,
                z = 3543,
            },
        },
    },
    {
        name = "Mrs Gord",
        ids = {
            [11517] = true,
        },
        locations = {
            {
                x = 2666,
                z = 2662,
            },
        },
    },
    {
        name = "Mubariz",
        ids = {
            [957] = true,
        },
        locations = {
            {
                x = 3312,
                z = 3214,
            },
        },
    },
    {
        name = "Muggh",
        ids = {
            [7062] = true,
        },
        locations = {
            {
                x = 2571,
                z = 2840,
            },
        },
    },
    {
        name = "Mundsen",
        ids = {
            [18124] = true,
        },
        locations = {
            {
                x = 2647,
                z = 3686,
            },
        },
    },
    {
        name = "Munsim",
        ids = {
            [26899] = true,
        },
        locations = {
            {
                x = 3375,
                z = 3198,
            },
        },
    },
    {
        name = "Murcaily",
        ids = {
            [2528] = true,
        },
        locations = {
            {
                x = 2816,
                z = 3083,
            },
        },
    },
    {
        name = "Murderer",
        ids = {
            [23257] = true,
        },
        locations = {
            {
                x = 3093,
                z = 3482,
            },
        },
    },
    {
        name = "Murknose, Emissary of Bandos",
        ids = {
            [17131] = true,
        },
        locations = {
            {
                x = 2957,
                z = 3490,
            },
        },
    },
    {
        name = "Murky Matt (runes)",
        ids = {
            [6525] = true,
        },
        locations = {
            {
                x = 3184,
                z = 3492,
            },
        },
    },
    {
        name = "Murky Pat",
        ids = {
            [13625] = true,
        },
        locations = {
            {
                x = 2113,
                z = 3942,
            },
        },
    },
    {
        name = "Murphy",
        ids = {
            [463] = true,
        },
        locations = {
            {
                x = 2668,
                z = 3162,
            },
        },
    },
    {
        name = "Muruwoi",
        ids = {
            [1450] = true,
        },
        locations = {
            {
                x = 2804,
                z = 2764,
            },
        },
    },
    {
        name = "Musa the Smith",
        ids = {
            [26822] = true,
        },
        locations = {
            {
                x = 3302,
                z = 3190,
            },
        },
    },
    {
        name = "Museum guard",
        ids = {
            [5941] = true,
            [5943] = true,
            [26936] = true,
        },
        locations = {
            {
                x = 3260,
                z = 3447,
            },
            {
                x = 3263,
                z = 3441,
            },
            {
                x = 3350,
                z = 3399,
            },
        },
    },
    {
        name = "Mushroom",
        ids = {
            [1139] = true,
        },
        locations = {
            {
                x = 2839,
                z = 3683,
            },
        },
    },
    {
        name = "Musician",
        ids = {
            [29] = true,
            [30] = true,
            [3463] = true,
            [5439] = true,
            [5442] = true,
            [8698] = true,
            [8699] = true,
            [8700] = true,
            [8701] = true,
            [8702] = true,
            [8703] = true,
            [8704] = true,
            [8705] = true,
            [8706] = true,
            [8707] = true,
            [8708] = true,
            [8709] = true,
            [8716] = true,
            [8717] = true,
            [8718] = true,
            [8721] = true,
            [14628] = true,
            [14629] = true,
        },
        locations = {
            {
                x = 2363,
                z = 3492,
            },
            {
                x = 2526,
                z = 3096,
            },
            {
                x = 2536,
                z = 3861,
            },
            {
                x = 2605,
                z = 3385,
            },
            {
                x = 2630,
                z = 3196,
            },
            {
                x = 2655,
                z = 3694,
            },
            {
                x = 2657,
                z = 3570,
            },
            {
                x = 2760,
                z = 3644,
            },
            {
                x = 2849,
                z = 3437,
            },
            {
                x = 2967,
                z = 3412,
            },
            {
                x = 3017,
                z = 3277,
            },
            {
                x = 3057,
                z = 3472,
            },
            {
                x = 3110,
                z = 3253,
            },
            {
                x = 3145,
                z = 3472,
            },
            {
                x = 3153,
                z = 3422,
            },
            {
                x = 3233,
                z = 3233,
            },
            {
                x = 3282,
                z = 2798,
            },
            {
                x = 3289,
                z = 3339,
            },
            {
                x = 3291,
                z = 3214,
            },
            {
                x = 3291,
                z = 3455,
            },
            {
                x = 3309,
                z = 3126,
            },
            {
                x = 3402,
                z = 3148,
            },
            {
                x = 3403,
                z = 3151,
            },
            {
                x = 3582,
                z = 3524,
            },
        },
    },
    {
        name = "My Arm",
        ids = {
            [4947] = true,
        },
        locations = {
            {
                x = 2815,
                z = 3683,
            },
        },
    },
    {
        name = "Mysterious ghost",
        ids = {
            [2381] = true,
            [2382] = true,
            [2383] = true,
            [2384] = true,
            [2385] = true,
            [2388] = true,
            [2389] = true,
            [2390] = true,
            [2391] = true,
            [2392] = true,
            [2393] = true,
        },
        locations = {
            {
                x = 2396,
                z = 3481,
            },
            {
                x = 2555,
                z = 3445,
            },
            {
                x = 2850,
                z = 3348,
            },
            {
                x = 2950,
                z = 3820,
            },
            {
                x = 3022,
                z = 3946,
            },
            {
                x = 3034,
                z = 3701,
            },
            {
                x = 3044,
                z = 3204,
            },
            {
                x = 3068,
                z = 3858,
            },
            {
                x = 3112,
                z = 3158,
            },
            {
                x = 3162,
                z = 2982,
            },
            {
                x = 3218,
                z = 3677,
            },
        },
    },
    {
        name = "Mysterious Old Man",
        ids = {
            [16873] = true,
        },
        locations = {
            {
                x = 3100,
                z = 3279,
            },
        },
    },
    {
        name = "Mystical wisp",
        ids = {},
        locations = {
            {
                x = 2886,
                z = 3050,
            },
        },
    },
    {
        name = "Naff",
        ids = {
            [359] = true,
        },
        locations = {
            {
                x = 3203,
                z = 3435,
            },
        },
    },
    {
        name = "Naida",
        ids = {
            [28674] = true,
        },
        locations = {
            {
                x = 3383,
                z = 3252,
            },
        },
    },
    {
        name = "Nails Newton",
        ids = {
            [15085] = true,
        },
        locations = {
            {
                x = 2881,
                z = 3444,
            },
        },
    },
    {
        name = "Nanuq",
        ids = {
            [8076] = true,
        },
        locations = {
            {
                x = 2933,
                z = 3772,
            },
        },
    },
    {
        name = "Nardah Banker",
        ids = {
            [3046] = true,
        },
        locations = {
            {
                x = 3425,
                z = 2889,
            },
            {
                x = 3425,
                z = 2891,
            },
            {
                x = 3425,
                z = 2893,
            },
            {
                x = 3425,
                z = 2894,
            },
        },
    },
    {
        name = "Nastroth",
        ids = {
            [6539] = true,
        },
        locations = {
            {
                x = 3220,
                z = 3209,
            },
        },
    },
    {
        name = "Nathifa",
        ids = {
            [5264] = true,
        },
        locations = {
            {
                x = 3287,
                z = 2697,
            },
            {
                x = 3300,
                z = 2762,
            },
        },
    },
    {
        name = "Natural historian",
        ids = {
            [7457] = true,
        },
        locations = {
            {
                x = 2735,
                z = 3824,
            },
        },
    },
    {
        name = "Navigator Jemi",
        ids = {
            [22944] = true,
            [22967] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3258,
            },
            {
                x = 3232,
                z = 2664,
            },
            {
                x = 4748,
                z = 3398,
            },
        },
    },
    {
        name = "Necrovarus",
        ids = {
            [1684] = true,
        },
        locations = {
            {
                x = 3660,
                z = 3516,
            },
        },
    },
    {
        name = "Ned",
        ids = {
            [918] = true,
            [6082] = true,
            [6083] = true,
        },
        locations = {
            {
                x = 2849,
                z = 3235,
            },
            {
                x = 3050,
                z = 3208,
            },
            {
                x = 3100,
                z = 3257,
            },
        },
    },
    {
        name = "Nefertari",
        ids = {
            [24699] = true,
        },
        locations = {
            {
                x = 3234,
                z = 2779,
            },
        },
    },
    {
        name = "Neferti the Camel",
        ids = {
            [2815] = true,
        },
        locations = {
            {
                x = 3293,
                z = 2755,
            },
        },
    },
    {
        name = "Nefret, Priestess of Elidinis",
        ids = {
            [31235] = true,
            [31238] = true,
            [31241] = true,
        },
        locations = {
            {
                x = 3164,
                z = 3510,
            },
        },
    },
    {
        name = "Negative energy",
        ids = {
            [23378] = true,
        },
        locations = {
            {
                x = 4785,
                z = 3564,
            },
            {
                x = 4785,
                z = 3566,
            },
        },
    },
    {
        name = "Neil",
        ids = {
            [1784] = true,
        },
        locations = {
            {
                x = 3016,
                z = 3704,
            },
        },
    },
    {
        name = "Neite",
        ids = {
            [1992] = true,
        },
        locations = {
            {
                x = 3298,
                z = 2757,
            },
        },
    },
    {
        name = "Nen",
        ids = {},
        locations = {
            {
                x = 3379,
                z = 3255,
            },
        },
    },
    {
        name = "Netty",
        ids = {
            [1695] = true,
        },
        locations = {
            {
                x = 3463,
                z = 3558,
            },
        },
    },
    {
        name = "Nex Hunter",
        ids = {},
        locations = {
            {
                x = 2906,
                z = 3546,
            },
        },
    },
    {
        name = "Nex Warrior",
        ids = {},
        locations = {
            {
                x = 2906,
                z = 3546,
            },
        },
    },
    {
        name = "Nhitpyx",
        ids = {
            [3342] = true,
            [3343] = true,
        },
        locations = {
            {
                x = 3320,
                z = 3308,
            },
            {
                x = 3326,
                z = 3293,
            },
        },
    },
    {
        name = "Niamh",
        ids = {},
        locations = {
            {
                x = 2396,
                z = 3480,
            },
        },
    },
    {
        name = "Nic",
        ids = {
            [28627] = true,
        },
        locations = {
            {
                x = 3185,
                z = 3470,
            },
        },
    },
    {
        name = "Nic the trader",
        ids = {
            [25651] = true,
        },
        locations = {
            {
                x = 3014,
                z = 3250,
            },
            {
                x = 3175,
                z = 3469,
            },
            {
                x = 3210,
                z = 3256,
            },
        },
    },
    {
        name = "Nicholas Angle",
        ids = {
            [14879] = true,
        },
        locations = {
            {
                x = 2896,
                z = 3467,
            },
        },
    },
    {
        name = "Nickolaus",
        ids = {
            [5125] = true,
        },
        locations = {
            {
                x = 2318,
                z = 3503,
            },
        },
    },
    {
        name = "Nicoleta",
        ids = {
            [3561] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3223,
            },
        },
    },
    {
        name = "Nigel (yak)",
        ids = {},
        locations = {
            {
                x = 3159,
                z = 3456,
            },
        },
    },
    {
        name = "Niles",
        ids = {
            [16844] = true,
        },
        locations = {
            {
                x = 3165,
                z = 3475,
            },
        },
    },
    {
        name = "Nina",
        ids = {
            [31039] = true,
        },
        locations = {
            {
                x = 3100,
                z = 3182,
            },
        },
    },
    {
        name = "Nkuku",
        ids = {
            [3032] = true,
        },
        locations = {
            {
                x = 3415,
                z = 2938,
            },
        },
    },
    {
        name = "Nora",
        ids = {
            [19349] = true,
        },
        locations = {
            {
                x = 2927,
                z = 3530,
            },
        },
    },
    {
        name = "Nora T. Hagg",
        ids = {
            [896] = true,
        },
        locations = {
            {
                x = 2898,
                z = 3363,
            },
        },
    },
    {
        name = "Norman",
        ids = {
            [8203] = true,
        },
        locations = {
            {
                x = 3085,
                z = 3301,
            },
        },
    },
    {
        name = "Noterazzo",
        ids = {
            [597] = true,
        },
        locations = {
            {
                x = 3025,
                z = 3701,
            },
        },
    },
    {
        name = "Nulodion",
        ids = {
            [209] = true,
        },
        locations = {
            {
                x = 3012,
                z = 3440,
            },
        },
    },
    {
        name = "Nurse",
        ids = {
            [15017] = true,
        },
        locations = {
            {
                x = 2932,
                z = 3571,
            },
        },
    },
    {
        name = "Nurse Sarah",
        ids = {
            [373] = true,
        },
        locations = {
            {
                x = 2516,
                z = 3274,
            },
        },
    },
    {
        name = "Nyriki Tapio",
        ids = {
            [15750] = true,
        },
        locations = {
            {
                x = 2498,
                z = 2937,
            },
        },
    },
    {
        name = "Obli",
        ids = {
            [516] = true,
        },
        locations = {
            {
                x = 2824,
                z = 2959,
            },
        },
    },
    {
        name = "Observatory assistant",
        ids = {
            [6118] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3189,
            },
        },
    },
    {
        name = "Observatory professor",
        ids = {
            [6119] = true,
        },
        locations = {
            {
                x = 2439,
                z = 3186,
            },
        },
    },
    {
        name = "Ocellus",
        ids = {
            [17143] = true,
        },
        locations = {
            {
                x = 2507,
                z = 2888,
            },
        },
    },
    {
        name = "Ocga",
        ids = {
            [1085] = true,
        },
        locations = {
            {
                x = 2922,
                z = 3537,
            },
        },
    },
    {
        name = "Odd Old Man",
        ids = {
            [9173] = true,
        },
        locations = {
            {
                x = 3362,
                z = 3505,
            },
        },
    },
    {
        name = "Oedipuss",
        ids = {
            [24409] = true,
        },
        locations = {
            {
                x = 3149,
                z = 2647,
            },
        },
    },
    {
        name = "Og",
        ids = {
            [853] = true,
        },
        locations = {
            {
                x = 2506,
                z = 3116,
            },
        },
    },
    {
        name = "Ogre",
        ids = {
            [26902] = true,
            [26904] = true,
        },
        locations = {
            {
                x = 2394,
                z = 2837,
            },
            {
                x = 2399,
                z = 2816,
            },
        },
    },
    {
        name = "Ogre boat",
        ids = {
            [3469] = true,
            [3470] = true,
        },
        locations = {
            {
                x = 2655,
                z = 2964,
            },
            {
                x = 2753,
                z = 3081,
            },
        },
    },
    {
        name = "Ogre chef",
        ids = {
            [13174] = true,
        },
        locations = {
            {
                x = 2324,
                z = 3060,
            },
            {
                x = 2583,
                z = 2967,
            },
        },
    },
    {
        name = "Ogre cook",
        ids = {
            [791] = true,
        },
        locations = {
            {
                x = 2450,
                z = 3056,
            },
            {
                x = 2563,
                z = 3009,
            },
            {
                x = 2583,
                z = 2967,
            },
        },
    },
    {
        name = "Ogre guard",
        ids = {
            [858] = true,
            [859] = true,
            [860] = true,
            [861] = true,
            [2042] = true,
            [2043] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3038,
            },
            {
                x = 2452,
                z = 3030,
            },
            {
                x = 2454,
                z = 3047,
            },
            {
                x = 2501,
                z = 3012,
            },
            {
                x = 2503,
                z = 3011,
            },
            {
                x = 2505,
                z = 3062,
            },
            {
                x = 2507,
                z = 3062,
            },
            {
                x = 2526,
                z = 3018,
            },
            {
                x = 2529,
                z = 3019,
            },
            {
                x = 2549,
                z = 3029,
            },
            {
                x = 2551,
                z = 3031,
            },
        },
    },
    {
        name = "Ogre merchant",
        ids = {
            [874] = true,
        },
        locations = {
            {
                x = 2528,
                z = 3048,
            },
        },
    },
    {
        name = "Ogre shaman",
        ids = {
            [26905] = true,
        },
        locations = {
            {
                x = 2429,
                z = 2827,
            },
        },
    },
    {
        name = "Ogre trader",
        ids = {
            [873] = true,
            [875] = true,
            [876] = true,
        },
        locations = {
            {
                x = 2513,
                z = 3034,
            },
            {
                x = 2518,
                z = 3035,
            },
            {
                x = 2525,
                z = 3043,
            },
        },
    },
    {
        name = "Ogre trader (Dal)",
        ids = {},
        locations = {
            {
                x = 2518,
                z = 3037,
            },
        },
    },
    {
        name = "Ogress banker",
        ids = {
            [7049] = true,
            [7050] = true,
        },
        locations = {
            {
                x = 2553,
                z = 2837,
            },
            {
                x = 2553,
                z = 2839,
            },
        },
    },
    {
        name = "Olaf Hradson",
        ids = {
            [2621] = true,
        },
        locations = {
            {
                x = 2724,
                z = 3729,
            },
        },
    },
    {
        name = "Olaf the Bard",
        ids = {
            [1269] = true,
        },
        locations = {
            {
                x = 2673,
                z = 3683,
            },
        },
    },
    {
        name = "Old man",
        ids = {
            [30179] = true,
        },
        locations = {
            {
                x = 3463,
                z = 3558,
            },
        },
    },
    {
        name = "Old Man Ral",
        ids = {
            [4708] = true,
        },
        locations = {
            {
                x = 3602,
                z = 3209,
            },
        },
    },
    {
        name = "Olivia",
        ids = {
            [2233] = true,
            [24712] = true,
        },
        locations = {
            {
                x = 3079,
                z = 3253,
            },
            {
                x = 3180,
                z = 2616,
            },
        },
    },
    {
        name = "Ollie the Camel",
        ids = {
            [2811] = true,
        },
        locations = {
            {
                x = 3291,
                z = 3209,
            },
        },
    },
    {
        name = "Omart",
        ids = {
            [350] = true,
        },
        locations = {
            {
                x = 2559,
                z = 3266,
            },
        },
    },
    {
        name = "Oneiromancer",
        ids = {
            [4511] = true,
        },
        locations = {
            {
                x = 2151,
                z = 3868,
            },
        },
    },
    {
        name = "Oracle",
        ids = {
            [746] = true,
        },
        locations = {
            {
                x = 3013,
                z = 3501,
            },
        },
    },
    {
        name = "Orange salamander",
        ids = {
            [5114] = true,
        },
        locations = {
            {
                x = 3402,
                z = 3134,
            },
            {
                x = 3403,
                z = 3090,
            },
            {
                x = 3405,
                z = 3101,
            },
            {
                x = 3405,
                z = 3133,
            },
            {
                x = 3407,
                z = 3132,
            },
            {
                x = 3408,
                z = 3095,
            },
            {
                x = 3410,
                z = 3088,
            },
            {
                x = 3412,
                z = 3081,
            },
            {
                x = 3414,
                z = 3075,
            },
            {
                x = 3415,
                z = 3080,
            },
            {
                x = 3417,
                z = 3073,
            },
        },
    },
    {
        name = "Orge",
        ids = {
            [26903] = true,
        },
        locations = {
            {
                x = 2384,
                z = 2818,
            },
        },
    },
    {
        name = "Orla Fairweather",
        ids = {
            [18196] = true,
            [23784] = true,
        },
        locations = {
            {
                x = 2289,
                z = 3554,
            },
            {
                x = 3133,
                z = 3231,
            },
        },
    },
    {
        name = "Orlando Smith",
        ids = {
            [16882] = true,
        },
        locations = {
            {
                x = 2701,
                z = 3372,
            },
        },
    },
    {
        name = "Oronwen",
        ids = {
            [2353] = true,
        },
        locations = {
            {
                x = 2324,
                z = 3179,
            },
        },
    },
    {
        name = "Orry",
        ids = {
            [8067] = true,
        },
        locations = {
            {
                x = 3313,
                z = 3513,
            },
        },
    },
    {
        name = "Osman",
        ids = {
            [5283] = true,
            [15907] = true,
            [24648] = true,
        },
        locations = {
            {
                x = 3196,
                z = 2769,
            },
            {
                x = 3290,
                z = 3157,
            },
            {
                x = 3292,
                z = 2821,
            },
        },
    },
    {
        name = "Ospak",
        ids = {
            [1274] = true,
        },
        locations = {
            {
                x = 2660,
                z = 3680,
            },
        },
    },
    {
        name = "Otavea",
        ids = {
            [29003] = true,
        },
        locations = {
            {
                x = 3386,
                z = 3421,
            },
        },
    },
    {
        name = "Otto Godblessed",
        ids = {
            [2725] = true,
        },
        locations = {
            {
                x = 2501,
                z = 3487,
            },
        },
    },
    {
        name = "Overwatch Mornid",
        ids = {
            [21712] = true,
        },
        locations = {
            {
                x = 3589,
                z = 3357,
            },
        },
    },
    {
        name = "Owner fell down the hole and never came back yak",
        ids = {
            [26795] = true,
        },
        locations = {
            {
                x = 3161,
                z = 3244,
            },
        },
    },
    {
        name = "Ozan",
        ids = {
            [13961] = true,
            [13964] = true,
            [15787] = true,
            [15788] = true,
            [15789] = true,
            [15791] = true,
            [15792] = true,
            [15856] = true,
            [15857] = true,
            [15858] = true,
            [15859] = true,
        },
        locations = {
            {
                x = 2978,
                z = 3419,
            },
            {
                x = 3094,
                z = 3276,
            },
            {
                x = 3124,
                z = 3246,
            },
            {
                x = 3127,
                z = 3204,
            },
            {
                x = 3194,
                z = 3355,
            },
            {
                x = 3211,
                z = 3080,
            },
            {
                x = 3223,
                z = 3115,
            },
            {
                x = 3273,
                z = 3087,
            },
            {
                x = 3290,
                z = 3180,
            },
            {
                x = 3295,
                z = 3110,
            },
            {
                x = 3295,
                z = 3180,
            },
        },
    },
    {
        name = "Oziach",
        ids = {
            [747] = true,
        },
        locations = {
            {
                x = 3068,
                z = 3516,
            },
        },
    },
    {
        name = "Padomenes",
        ids = {
            [23777] = true,
        },
        locations = {
            {
                x = 2977,
                z = 3342,
            },
        },
    },
    {
        name = "Palace guard",
        ids = {
            [15900] = true,
            [15903] = true,
            [15904] = true,
            [15905] = true,
            [15906] = true,
        },
        locations = {
            {
                x = 3292,
                z = 3164,
            },
            {
                x = 3309,
                z = 3171,
            },
            {
                x = 3310,
                z = 3170,
            },
            {
                x = 3310,
                z = 3172,
            },
            {
                x = 3311,
                z = 3171,
            },
        },
    },
    {
        name = "Pale wisp",
        ids = {},
        locations = {
            {
                x = 3106,
                z = 3227,
            },
            {
                x = 3110,
                z = 3230,
            },
            {
                x = 3111,
                z = 3229,
            },
            {
                x = 3112,
                z = 3219,
            },
            {
                x = 3112,
                z = 3226,
            },
            {
                x = 3114,
                z = 3223,
            },
            {
                x = 3116,
                z = 3220,
            },
            {
                x = 3118,
                z = 3212,
            },
            {
                x = 3120,
                z = 3209,
            },
            {
                x = 3121,
                z = 3212,
            },
            {
                x = 3128,
                z = 3220,
            },
        },
    },
    {
        name = "Panning archaeologist",
        ids = {
            [4569] = true,
            [4648] = true,
        },
        locations = {
            {
                x = 3382,
                z = 3372,
            },
            {
                x = 3387,
                z = 3379,
            },
        },
    },
    {
        name = "Panning guide",
        ids = {
            [620] = true,
        },
        locations = {
            {
                x = 3375,
                z = 3371,
            },
        },
    },
    {
        name = "Papa Mambo",
        ids = {
            [3122] = true,
        },
        locations = {
            {
                x = 2950,
                z = 2936,
            },
        },
    },
    {
        name = "Papillo Bergmal",
        ids = {
            [23921] = true,
        },
        locations = {
            {
                x = 2258,
                z = 3555,
            },
            {
                x = 2278,
                z = 3556,
            },
        },
    },
    {
        name = "Papillo Goldblum",
        ids = {
            [23924] = true,
        },
        locations = {
            {
                x = 2271,
                z = 3553,
            },
        },
    },
    {
        name = "Papillo Lorenzae",
        ids = {
            [23922] = true,
        },
        locations = {
            {
                x = 2266,
                z = 3551,
            },
            {
                x = 2276,
                z = 3547,
            },
        },
    },
    {
        name = "Papillo Tempestae",
        ids = {
            [23923] = true,
        },
        locations = {
            {
                x = 2267,
                z = 3559,
            },
        },
    },
    {
        name = "Parcel Pete",
        ids = {
            [29791] = true,
        },
        locations = {
            {
                x = 3178,
                z = 3505,
            },
        },
    },
    {
        name = "Parrot",
        ids = {
            [4373] = true,
            [4374] = true,
        },
        locations = {
            {
                x = 3822,
                z = 2954,
            },
            {
                x = 3822,
                z = 3005,
            },
        },
    },
    {
        name = "Parrots",
        ids = {
            [1215] = true,
        },
        locations = {
            {
                x = 2612,
                z = 3287,
            },
            {
                x = 2613,
                z = 3287,
            },
        },
    },
    {
        name = "Parroty Pete",
        ids = {
            [1216] = true,
        },
        locations = {
            {
                x = 2611,
                z = 3285,
            },
        },
    },
    {
        name = "Party Pete",
        ids = {
            [659] = true,
            [29436] = true,
        },
        locations = {
            {
                x = 3052,
                z = 3373,
            },
            {
                x = 3178,
                z = 3480,
            },
        },
    },
    {
        name = "Patch",
        ids = {
            [16633] = true,
            [16634] = true,
            [16635] = true,
            [16636] = true,
        },
        locations = {
            {
                x = 3034,
                z = 3378,
            },
            {
                x = 3083,
                z = 3265,
            },
            {
                x = 3146,
                z = 3410,
            },
            {
                x = 3251,
                z = 3399,
            },
            {
                x = 3315,
                z = 3140,
            },
        },
    },
    {
        name = "Patchy",
        ids = {
            [4359] = true,
        },
        locations = {
            {
                x = 3677,
                z = 2978,
            },
        },
    },
    {
        name = "Patrick",
        ids = {
            [7095] = true,
        },
        locations = {
            {
                x = 2609,
                z = 2863,
            },
        },
    },
    {
        name = "Paul",
        ids = {
            [22792] = true,
        },
        locations = {
            {
                x = 3256,
                z = 3355,
            },
        },
    },
    {
        name = "Pauline Polaris",
        ids = {
            [13619] = true,
            [13626] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2073,
                z = 3920,
            },
            {
                x = 2111,
                z = 3942,
            },
            {
                x = 2112,
                z = 3942,
            },
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Pawya",
        ids = {
            [7012] = true,
        },
        locations = {
            {
                x = 2180,
                z = 3201,
            },
            {
                x = 2182,
                z = 3203,
            },
            {
                x = 2182,
                z = 3205,
            },
            {
                x = 2191,
                z = 3219,
            },
            {
                x = 2193,
                z = 3223,
            },
            {
                x = 2197,
                z = 3227,
            },
            {
                x = 2199,
                z = 3226,
            },
            {
                x = 2200,
                z = 3228,
            },
            {
                x = 2225,
                z = 3145,
            },
            {
                x = 2226,
                z = 3140,
            },
            {
                x = 2243,
                z = 3191,
            },
            {
                x = 2250,
                z = 3184,
            },
            {
                x = 2252,
                z = 3250,
            },
            {
                x = 2253,
                z = 3180,
            },
            {
                x = 2255,
                z = 3186,
            },
            {
                x = 2256,
                z = 3252,
            },
            {
                x = 2257,
                z = 3256,
            },
            {
                x = 2257,
                z = 3261,
            },
            {
                x = 2262,
                z = 3262,
            },
            {
                x = 2264,
                z = 3238,
            },
            {
                x = 2267,
                z = 3243,
            },
            {
                x = 2269,
                z = 3245,
            },
            {
                x = 2269,
                z = 3249,
            },
            {
                x = 2270,
                z = 3239,
            },
            {
                x = 2289,
                z = 3148,
            },
            {
                x = 2289,
                z = 3152,
            },
            {
                x = 2291,
                z = 3150,
            },
            {
                x = 2294,
                z = 3152,
            },
        },
    },
    {
        name = "Pazuzu",
        ids = {},
        locations = {
            {
                x = 3440,
                z = 3485,
            },
        },
    },
    {
        name = "Peanut",
        ids = {
            [7098] = true,
        },
        locations = {
            {
                x = 2611,
                z = 2864,
            },
        },
    },
    {
        name = "Peer the Seer",
        ids = {
            [1288] = true,
        },
        locations = {
            {
                x = 2634,
                z = 3668,
            },
        },
    },
    {
        name = "Peksa",
        ids = {
            [538] = true,
        },
        locations = {
            {
                x = 3076,
                z = 3429,
            },
        },
    },
    {
        name = "Pelican",
        ids = {
            [1181] = true,
        },
        locations = {
            {
                x = 2914,
                z = 3106,
            },
            {
                x = 2934,
                z = 3105,
            },
        },
    },
    {
        name = "Penda",
        ids = {
            [1087] = true,
        },
        locations = {
            {
                x = 2915,
                z = 3523,
            },
        },
    },
    {
        name = "Penelope",
        ids = {
            [7096] = true,
        },
        locations = {
            {
                x = 2610,
                z = 2865,
            },
        },
    },
    {
        name = "Penguin",
        ids = {
            [5445] = true,
        },
        locations = {
            {
                x = 2596,
                z = 3270,
            },
        },
    },
    {
        name = "Penguin henchman",
        ids = {
            [24076] = true,
        },
        locations = {
            {
                x = 3281,
                z = 2912,
            },
            {
                x = 3281,
                z = 2921,
            },
            {
                x = 3283,
                z = 2910,
            },
            {
                x = 3283,
                z = 2923,
            },
            {
                x = 3291,
                z = 2922,
            },
            {
                x = 3292,
                z = 2919,
            },
        },
    },
    {
        name = "Penguin Hunter area",
        ids = {},
        locations = {
            {
                x = 2709,
                z = 3735,
            },
        },
    },
    {
        name = "Penguin keeper",
        ids = {
            [6891] = true,
        },
        locations = {
            {
                x = 2598,
                z = 3272,
            },
        },
    },
    {
        name = "Penwie",
        ids = {
            [4578] = true,
        },
        locations = {
            {
                x = 2932,
                z = 2972,
            },
        },
    },
    {
        name = "Peppermint boy",
        ids = {
            [3307600759] = true,
        },
        locations = {
            {
                x = 2883,
                z = 3522,
            },
        },
    },
    {
        name = "Peppermint girl",
        ids = {
            [30759] = true,
        },
        locations = {
            {
                x = 2882,
                z = 3522,
            },
        },
    },
    {
        name = "Perdita",
        ids = {
            [25509] = true,
        },
        locations = {
            {
                x = 2268,
                z = 2829,
            },
        },
    },
    {
        name = "Pestilence",
        ids = {
            [27310] = true,
        },
        locations = {
            {
                x = 3080,
                z = 3287,
            },
            {
                x = 3099,
                z = 3340,
            },
        },
    },
    {
        name = "Pestilent Torva Trovekeeper",
        ids = {},
        locations = {
            {
                x = 2906,
                z = 3544,
            },
        },
    },
    {
        name = "Pet shop owner",
        ids = {
            [6892] = true,
            [6893] = true,
        },
        locations = {
            {
                x = 2576,
                z = 3078,
            },
            {
                x = 2932,
                z = 3433,
            },
        },
    },
    {
        name = "Peter",
        ids = {
            [7097] = true,
            [13175] = true,
            [26124] = true,
            [26126] = true,
            [26800] = true,
            [31031] = true,
        },
        locations = {
            {
                x = 2611,
                z = 2862,
            },
            {
                x = 2657,
                z = 3668,
            },
            {
                x = 2906,
                z = 3544,
            },
            {
                x = 2956,
                z = 3207,
            },
            {
                x = 3151,
                z = 3413,
            },
            {
                x = 3158,
                z = 3475,
            },
            {
                x = 3239,
                z = 3215,
            },
        },
    },
    {
        name = "Phantuwti Fanstuwi Farsight",
        ids = {
            [1798] = true,
        },
        locations = {
            {
                x = 2705,
                z = 3474,
            },
        },
    },
    {
        name = "Phil",
        ids = {
            [8949] = true,
        },
        locations = {
            {
                x = 3038,
                z = 3366,
            },
        },
    },
    {
        name = "Philipe Carnillean",
        ids = {
            [888] = true,
        },
        locations = {
            {
                x = 2573,
                z = 3268,
            },
        },
    },
    {
        name = "Philop",
        ids = {
            [782] = true,
        },
        locations = {
            {
                x = 3150,
                z = 3407,
            },
        },
    },
    {
        name = "Phlegmatic imp",
        ids = {
            [24166] = true,
        },
        locations = {
            {
                x = 3184,
                z = 3166,
            },
        },
    },
    {
        name = "Phoenix",
        ids = {
            [14783] = true,
        },
        locations = {
            {
                x = 2361,
                z = 3375,
            },
        },
    },
    {
        name = "Pia",
        ids = {
            [24704] = true,
        },
        locations = {
            {
                x = 3229,
                z = 2791,
            },
        },
    },
    {
        name = "Pickle the cat",
        ids = {
            [25841] = true,
        },
        locations = {
            {
                x = 2653,
                z = 3357,
            },
        },
    },
    {
        name = "Pickpocket Andy",
        ids = {
            [17372] = true,
        },
        locations = {
            {
                x = 3069,
                z = 3263,
            },
        },
    },
    {
        name = "Pickpocket Bert",
        ids = {
            [17373] = true,
        },
        locations = {
            {
                x = 3070,
                z = 3262,
            },
        },
    },
    {
        name = "Pickpocket Chris",
        ids = {
            [17374] = true,
        },
        locations = {
            {
                x = 3069,
                z = 3261,
            },
        },
    },
    {
        name = "Pickpocket Dan",
        ids = {
            [17375] = true,
        },
        locations = {
            {
                x = 3070,
                z = 3260,
            },
        },
    },
    {
        name = "Pickpocket Edd",
        ids = {
            [17376] = true,
        },
        locations = {
            {
                x = 3069,
                z = 3259,
            },
        },
    },
    {
        name = "Pierre",
        ids = {
            [807] = true,
        },
        locations = {
            {
                x = 2750,
                z = 3576,
            },
        },
    },
    {
        name = "Piglet",
        ids = {
            [2242] = true,
            [2243] = true,
        },
        locations = {
            {
                x = 3075,
                z = 3259,
            },
            {
                x = 3077,
                z = 3257,
            },
            {
                x = 3078,
                z = 3259,
            },
        },
    },
    {
        name = "Pigzilla",
        ids = {
            [17344] = true,
        },
        locations = {
            {
                x = 3076,
                z = 3258,
            },
        },
    },
    {
        name = "Pikkupstix",
        ids = {
            [6988] = true,
        },
        locations = {
            {
                x = 2929,
                z = 3448,
            },
        },
    },
    {
        name = "Pilg",
        ids = {
            [2040] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3046,
            },
        },
    },
    {
        name = "Pillory guard",
        ids = {
            [16874] = true,
        },
        locations = {
            {
                x = 2602,
                z = 3103,
            },
            {
                x = 2679,
                z = 3487,
            },
            {
                x = 3224,
                z = 3409,
            },
        },
    },
    {
        name = "Pillory Guard",
        ids = {
            [2573] = true,
        },
        locations = {
            {
                x = 3091,
                z = 3243,
            },
        },
    },
    {
        name = "Pirate",
        ids = {
            [3160] = true,
            [3167] = true,
            [3168] = true,
            [3169] = true,
            [3170] = true,
            [3171] = true,
            [3172] = true,
            [3173] = true,
            [3174] = true,
            [3175] = true,
            [3176] = true,
            [3177] = true,
            [3178] = true,
            [3179] = true,
            [3180] = true,
            [3181] = true,
            [3182] = true,
            [3183] = true,
            [3184] = true,
            [3185] = true,
            [3186] = true,
            [14342] = true,
            [14344] = true,
            [25305] = true,
            [25306] = true,
        },
        locations = {
            {
                x = 3649,
                z = 3004,
            },
            {
                x = 3653,
                z = 3006,
            },
            {
                x = 3655,
                z = 2973,
            },
            {
                x = 3656,
                z = 2960,
            },
            {
                x = 3656,
                z = 2992,
            },
            {
                x = 3658,
                z = 2952,
            },
            {
                x = 3660,
                z = 3005,
            },
            {
                x = 3663,
                z = 2978,
            },
            {
                x = 3664,
                z = 2992,
            },
            {
                x = 3664,
                z = 2995,
            },
            {
                x = 3665,
                z = 2983,
            },
            {
                x = 3665,
                z = 2990,
            },
            {
                x = 3665,
                z = 2995,
            },
            {
                x = 3665,
                z = 3006,
            },
            {
                x = 3666,
                z = 2976,
            },
            {
                x = 3666,
                z = 2977,
            },
            {
                x = 3666,
                z = 2983,
            },
            {
                x = 3667,
                z = 2963,
            },
            {
                x = 3667,
                z = 2981,
            },
            {
                x = 3667,
                z = 2993,
            },
            {
                x = 3668,
                z = 2994,
            },
            {
                x = 3670,
                z = 2979,
            },
            {
                x = 3670,
                z = 2983,
            },
            {
                x = 3671,
                z = 2978,
            },
            {
                x = 3672,
                z = 2967,
            },
            {
                x = 3673,
                z = 3006,
            },
            {
                x = 3675,
                z = 2954,
            },
            {
                x = 3675,
                z = 2975,
            },
            {
                x = 3675,
                z = 2985,
            },
            {
                x = 3675,
                z = 2988,
            },
            {
                x = 3676,
                z = 2949,
            },
            {
                x = 3676,
                z = 2991,
            },
            {
                x = 3678,
                z = 2957,
            },
            {
                x = 3678,
                z = 3003,
            },
            {
                x = 3679,
                z = 2950,
            },
            {
                x = 3679,
                z = 3495,
            },
            {
                x = 3682,
                z = 2947,
            },
            {
                x = 3682,
                z = 3006,
            },
            {
                x = 3683,
                z = 2948,
            },
            {
                x = 3683,
                z = 2954,
            },
            {
                x = 3683,
                z = 2971,
            },
            {
                x = 3684,
                z = 2949,
            },
            {
                x = 3686,
                z = 2955,
            },
            {
                x = 3688,
                z = 3006,
            },
            {
                x = 3690,
                z = 2979,
            },
            {
                x = 3691,
                z = 2977,
            },
            {
                x = 3691,
                z = 2984,
            },
            {
                x = 3692,
                z = 3005,
            },
            {
                x = 3695,
                z = 2950,
            },
            {
                x = 3695,
                z = 2969,
            },
            {
                x = 3697,
                z = 2990,
            },
            {
                x = 3698,
                z = 2997,
            },
            {
                x = 3701,
                z = 3006,
            },
            {
                x = 3710,
                z = 3004,
            },
        },
    },
    {
        name = "Pirate impling",
        ids = {
            [7867] = true,
        },
        locations = {
            {
                x = 3786,
                z = 2975,
            },
            {
                x = 3809,
                z = 2977,
            },
            {
                x = 3835,
                z = 2976,
            },
        },
    },
    {
        name = "Pirate Jackie the Fruit",
        ids = {
            [1055] = true,
        },
        locations = {
            {
                x = 2811,
                z = 3192,
            },
        },
    },
    {
        name = "Pirate Pete",
        ids = {
            [2825] = true,
        },
        locations = {
            {
                x = 3680,
                z = 3537,
            },
        },
    },
    {
        name = "Plague cow",
        ids = {
            [1998] = true,
            [1999] = true,
            [2000] = true,
        },
        locations = {
            {
                x = 3277,
                z = 2797,
            },
            {
                x = 3279,
                z = 2790,
            },
            {
                x = 3279,
                z = 2801,
            },
        },
    },
    {
        name = "Plank maker",
        ids = {
            [18560] = true,
        },
        locations = {
            {
                x = 2954,
                z = 3231,
            },
        },
    },
    {
        name = "Platinum Pernix Armour",
        ids = {
            [29437] = true,
            [29438] = true,
        },
        locations = {
            {
                x = 3162,
                z = 3473,
            },
            {
                x = 3167,
                z = 3473,
            },
        },
    },
    {
        name = "Platinum Torva Armour",
        ids = {
            [29441] = true,
            [29442] = true,
        },
        locations = {
            {
                x = 3162,
                z = 3471,
            },
            {
                x = 3167,
                z = 3471,
            },
        },
    },
    {
        name = "Platinum Virtus Armour",
        ids = {
            [29439] = true,
            [29440] = true,
        },
        locations = {
            {
                x = 3162,
                z = 3472,
            },
            {
                x = 3167,
                z = 3472,
            },
        },
    },
    {
        name = "Platypus",
        ids = {
            [7021] = true,
            [7022] = true,
            [7023] = true,
        },
        locations = {
            {
                x = 2503,
                z = 2821,
            },
            {
                x = 2510,
                z = 2822,
            },
            {
                x = 2552,
                z = 2821,
            },
        },
    },
    {
        name = "Plover bird",
        ids = {
            [24493] = true,
        },
        locations = {
            {
                x = 3275,
                z = 2682,
            },
            {
                x = 3278,
                z = 2685,
            },
            {
                x = 3279,
                z = 2675,
            },
            {
                x = 3279,
                z = 2682,
            },
            {
                x = 3279,
                z = 2685,
            },
            {
                x = 3281,
                z = 2677,
            },
            {
                x = 3281,
                z = 2680,
            },
            {
                x = 3284,
                z = 2670,
            },
            {
                x = 3284,
                z = 2676,
            },
            {
                x = 3285,
                z = 2664,
            },
            {
                x = 3286,
                z = 2674,
            },
            {
                x = 3287,
                z = 2670,
            },
            {
                x = 3289,
                z = 2666,
            },
            {
                x = 3289,
                z = 2668,
            },
            {
                x = 3291,
                z = 2664,
            },
            {
                x = 3292,
                z = 2662,
            },
        },
    },
    {
        name = "Poison Salesman",
        ids = {
            [820] = true,
        },
        locations = {
            {
                x = 2695,
                z = 3495,
            },
        },
    },
    {
        name = "Polletix",
        ids = {
            [3340] = true,
        },
        locations = {
            {
                x = 3326,
                z = 3309,
            },
        },
    },
    {
        name = "Polly Paw",
        ids = {
            [16099] = true,
        },
        locations = {
            {
                x = 3208,
                z = 3260,
            },
        },
    },
    {
        name = "Pompous merchant",
        ids = {
            [14911] = true,
        },
        locations = {
            {
                x = 2893,
                z = 3435,
            },
            {
                x = 2896,
                z = 3435,
            },
        },
    },
    {
        name = "Pontak",
        ids = {
            [1309] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3652,
            },
        },
    },
    {
        name = "Port district musician",
        ids = {
            [24612] = true,
        },
        locations = {
            {
                x = 3141,
                z = 2647,
            },
        },
    },
    {
        name = "Port Sarim guard (sleeping)",
        ids = {},
        locations = {
            {
                x = 3019,
                z = 3185,
            },
        },
    },
    {
        name = "Portmaster Kags",
        ids = {
            [24570] = true,
        },
        locations = {
            {
                x = 3033,
                z = 2673,
            },
            {
                x = 3122,
                z = 2631,
            },
            {
                x = 3271,
                z = 2646,
            },
        },
    },
    {
        name = "Positive energy",
        ids = {
            [23377] = true,
        },
        locations = {
            {
                x = 4784,
                z = 3559,
            },
            {
                x = 4786,
                z = 3564,
            },
        },
    },
    {
        name = "Postie Pete",
        ids = {
            [3805] = true,
            [29790] = true,
        },
        locations = {
            {
                x = 2446,
                z = 3097,
            },
            {
                x = 3179,
                z = 3504,
            },
        },
    },
    {
        name = "Postie Pete-za",
        ids = {
            [27513] = true,
        },
        locations = {
            {
                x = 3238,
                z = 3462,
            },
        },
    },
    {
        name = "Potter",
        ids = {
            [4579] = true,
        },
        locations = {
            {
                x = 3092,
                z = 3283,
            },
        },
    },
    {
        name = "Pox",
        ids = {
            [2943] = true,
        },
        locations = {
            {
                x = 3268,
                z = 3399,
            },
        },
    },
    {
        name = "Praistan Ebola",
        ids = {
            [4562] = true,
        },
        locations = {
            {
                x = 2799,
                z = 3202,
            },
        },
    },
    {
        name = "Prezleek (yak trader)",
        ids = {
            [25846] = true,
        },
        locations = {
            {
                x = 2643,
                z = 3352,
            },
        },
    },
    {
        name = "Prickly kebbit",
        ids = {
            [5086] = true,
        },
        locations = {
            {
                x = 2307,
                z = 3605,
            },
            {
                x = 2307,
                z = 3606,
            },
            {
                x = 2307,
                z = 3620,
            },
            {
                x = 2307,
                z = 3621,
            },
            {
                x = 2308,
                z = 3642,
            },
            {
                x = 2310,
                z = 3642,
            },
            {
                x = 2319,
                z = 3595,
            },
            {
                x = 2320,
                z = 3595,
            },
            {
                x = 2321,
                z = 3643,
            },
            {
                x = 2321,
                z = 3644,
            },
            {
                x = 2323,
                z = 3614,
            },
            {
                x = 2323,
                z = 3628,
            },
            {
                x = 2324,
                z = 3614,
            },
            {
                x = 2324,
                z = 3628,
            },
            {
                x = 2327,
                z = 3635,
            },
            {
                x = 2328,
                z = 3635,
            },
            {
                x = 2336,
                z = 3631,
            },
            {
                x = 2336,
                z = 3632,
            },
            {
                x = 2342,
                z = 3641,
            },
            {
                x = 2343,
                z = 3641,
            },
        },
    },
    {
        name = "Priest",
        ids = {
            [31] = true,
            [358] = true,
            [1988] = true,
            [1989] = true,
        },
        locations = {
            {
                x = 2529,
                z = 3285,
            },
            {
                x = 2616,
                z = 3308,
            },
            {
                x = 3294,
                z = 2820,
            },
            {
                x = 3300,
                z = 2730,
            },
            {
                x = 3300,
                z = 2820,
            },
            {
                x = 3307,
                z = 2728,
            },
            {
                x = 3307,
                z = 2732,
            },
            {
                x = 3308,
                z = 2730,
            },
        },
    },
    {
        name = "Primrose",
        ids = {
            [26326] = true,
        },
        locations = {
            {
                x = 2196,
                z = 3694,
            },
        },
    },
    {
        name = "Prince Ali Mirza",
        ids = {
            [15808] = true,
            [15891] = true,
        },
        locations = {
            {
                x = 3129,
                z = 3196,
            },
            {
                x = 3205,
                z = 3083,
            },
        },
    },
    {
        name = "Prison Pete",
        ids = {
            [16875] = true,
        },
        locations = {
            {
                x = 3016,
                z = 3181,
            },
        },
    },
    {
        name = "Prissy Scilla",
        ids = {
            [1037] = true,
        },
        locations = {
            {
                x = 2438,
                z = 3418,
            },
        },
    },
    {
        name = "Private Paldon",
        ids = {
            [5034] = true,
        },
        locations = {
            {
                x = 2526,
                z = 3575,
            },
        },
    },
    {
        name = "Private Pendron",
        ids = {
            [5032] = true,
        },
        locations = {
            {
                x = 2525,
                z = 3564,
            },
        },
    },
    {
        name = "Private Pierreb",
        ids = {
            [5033] = true,
        },
        locations = {
            {
                x = 2520,
                z = 3568,
            },
        },
    },
    {
        name = "Professor",
        ids = {
            [26895] = true,
        },
        locations = {
            {
                x = 3350,
                z = 3356,
            },
        },
    },
    {
        name = "Professor Arblenap",
        ids = {
            [7731] = true,
        },
        locations = {
            {
                x = 3003,
                z = 3470,
            },
        },
    },
    {
        name = "Professor Henry",
        ids = {
            [7143] = true,
        },
        locations = {
            {
                x = 3084,
                z = 3458,
            },
        },
    },
    {
        name = "Professor Imblewyn",
        ids = {
            [4586] = true,
        },
        locations = {
            {
                x = 2590,
                z = 3092,
            },
        },
    },
    {
        name = "Professor Onglewip",
        ids = {
            [4585] = true,
        },
        locations = {
            {
                x = 3110,
                z = 3157,
            },
        },
    },
    {
        name = "Prosecutor",
        ids = {
            [6185] = true,
            [11465] = true,
        },
        locations = {
            {
                x = 2736,
                z = 3470,
            },
        },
    },
    {
        name = "Psamtik",
        ids = {
            [24701] = true,
        },
        locations = {
            {
                x = 3236,
                z = 2799,
            },
        },
    },
    {
        name = "Pub musician",
        ids = {
            [24608] = true,
        },
        locations = {
            {
                x = 3172,
                z = 2647,
            },
            {
                x = 3173,
                z = 2646,
            },
        },
    },
    {
        name = "Puffin",
        ids = {
            [5614] = true,
        },
        locations = {
            {
                x = 3779,
                z = 2826,
            },
            {
                x = 3789,
                z = 2817,
            },
            {
                x = 3794,
                z = 2821,
            },
            {
                x = 3808,
                z = 2823,
            },
            {
                x = 3812,
                z = 2861,
            },
            {
                x = 3813,
                z = 2822,
            },
            {
                x = 3818,
                z = 2862,
            },
            {
                x = 3819,
                z = 2870,
            },
            {
                x = 3821,
                z = 2824,
            },
            {
                x = 3831,
                z = 2828,
            },
        },
    },
    {
        name = "Pumpkin Pete",
        ids = {
            [30598] = true,
        },
        locations = {
            {
                x = 3316,
                z = 3553,
            },
        },
    },
    {
        name = "Purple wisp",
        ids = {
            [25450] = true,
        },
        locations = {
            {
                x = 2226,
                z = 2866,
            },
            {
                x = 2228,
                z = 2839,
            },
            {
                x = 2232,
                z = 2891,
            },
            {
                x = 2319,
                z = 2909,
            },
        },
    },
    {
        name = "Qaseem",
        ids = {
            [24764] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2797,
            },
        },
    },
    {
        name = "Qat",
        ids = {
            [24422] = true,
        },
        locations = {
            {
                x = 3095,
                z = 2724,
            },
        },
    },
    {
        name = "Quartermaster",
        ids = {
            [1208] = true,
        },
        locations = {
            {
                x = 2194,
                z = 3140,
            },
        },
    },
    {
        name = "Quartermaster Gully",
        ids = {
            [22940] = true,
            [22966] = true,
            [26043] = true,
        },
        locations = {
            {
                x = 3054,
                z = 3247,
            },
            {
                x = 3231,
                z = 2664,
            },
            {
                x = 3504,
                z = 3696,
            },
            {
                x = 4749,
                z = 3398,
            },
        },
    },
    {
        name = "Queen Slime",
        ids = {
            [26805] = true,
        },
        locations = {
            {
                x = 2960,
                z = 3199,
            },
        },
    },
    {
        name = "Quercus",
        ids = {
            [17065] = true,
        },
        locations = {
            {
                x = 3134,
                z = 3520,
            },
        },
    },
    {
        name = "Quoth the Raven",
        ids = {
            [29669] = true,
        },
        locations = {
            {
                x = 3111,
                z = 3921,
            },
        },
    },
    {
        name = "Radiant wisp",
        ids = {
            [18167] = true,
        },
        locations = {
            {
                x = 3806,
                z = 3551,
            },
            {
                x = 3808,
                z = 3559,
            },
            {
                x = 3809,
                z = 3553,
            },
            {
                x = 3810,
                z = 3568,
            },
            {
                x = 3811,
                z = 3552,
            },
            {
                x = 3811,
                z = 3557,
            },
            {
                x = 3811,
                z = 3558,
            },
            {
                x = 3812,
                z = 3555,
            },
            {
                x = 3813,
                z = 3559,
            },
            {
                x = 3814,
                z = 3559,
            },
            {
                x = 3816,
                z = 3556,
            },
            {
                x = 3816,
                z = 3559,
            },
            {
                x = 3817,
                z = 3554,
            },
        },
    },
    {
        name = "Radimus Erkle",
        ids = {
            [8271] = true,
            [8479] = true,
        },
        locations = {
            {
                x = 2724,
                z = 3368,
            },
            {
                x = 2724,
                z = 3377,
            },
        },
    },
    {
        name = "Radu",
        ids = {
            [3545] = true,
        },
        locations = {
            {
                x = 3511,
                z = 3224,
            },
        },
    },
    {
        name = "Raetul",
        ids = {
            [1982] = true,
        },
        locations = {
            {
                x = 3304,
                z = 2789,
            },
        },
    },
    {
        name = "Ragnar",
        ids = {
            [1808] = true,
        },
        locations = {
            {
                x = 2764,
                z = 3679,
            },
        },
    },
    {
        name = "Raheem the Farmer",
        ids = {
            [26823] = true,
        },
        locations = {
            {
                x = 3306,
                z = 3197,
            },
        },
    },
    {
        name = "Rain",
        ids = {},
        locations = {
            {
                x = 3211,
                z = 3425,
            },
        },
    },
    {
        name = "Raja",
        ids = {
            [24461] = true,
        },
        locations = {
            {
                x = 3217,
                z = 2701,
            },
        },
    },
    {
        name = "Ramara du Croissant",
        ids = {
            [3827] = true,
        },
        locations = {
            {
                x = 2344,
                z = 3678,
            },
        },
    },
    {
        name = "Rana the dyer",
        ids = {
            [2549] = true,
        },
        locations = {
            {
                x = 3364,
                z = 3001,
            },
        },
    },
    {
        name = "Ranael",
        ids = {
            [544] = true,
        },
        locations = {
            {
                x = 3318,
                z = 3166,
            },
        },
    },
    {
        name = "Ranging Guild Doorman",
        ids = {
            [679] = true,
        },
        locations = {
            {
                x = 2658,
                z = 3439,
            },
        },
    },
    {
        name = "Ranis Drakan",
        ids = {
            [14159] = true,
            [14161] = true,
        },
        locations = {
            {
                x = 3616,
                z = 3362,
            },
            {
                x = 3630,
                z = 3364,
            },
        },
    },
    {
        name = "Rantz",
        ids = {
            [8659] = true,
        },
        locations = {
            {
                x = 2630,
                z = 2981,
            },
        },
    },
    {
        name = "Raptor (dragon expert)",
        ids = {
            [25859] = true,
        },
        locations = {
            {
                x = 2643,
                z = 3352,
            },
        },
    },
    {
        name = "Rashid the Operator",
        ids = {
            [1902] = true,
        },
        locations = {
            {
                x = 3334,
                z = 2949,
            },
        },
    },
    {
        name = "Rasolo",
        ids = {
            [1972] = true,
        },
        locations = {
            {
                x = 2535,
                z = 3432,
            },
        },
    },
    {
        name = "Rat Burgiss",
        ids = {
            [5833] = true,
        },
        locations = {
            {
                x = 3267,
                z = 3333,
            },
        },
    },
    {
        name = "Raum Urda-Stein",
        ids = {
            [5485] = true,
        },
        locations = {
            {
                x = 2396,
                z = 3798,
            },
        },
    },
    {
        name = "Raven",
        ids = {
            [27092] = true,
        },
        locations = {
            {
                x = 2880,
                z = 3516,
            },
            {
                x = 2885,
                z = 3523,
            },
            {
                x = 3379,
                z = 3617,
            },
            {
                x = 3397,
                z = 3611,
            },
            {
                x = 3399,
                z = 3676,
            },
            {
                x = 3411,
                z = 3728,
            },
            {
                x = 3412,
                z = 3629,
            },
            {
                x = 3415,
                z = 3642,
            },
            {
                x = 3439,
                z = 3686,
            },
            {
                x = 3440,
                z = 3650,
            },
            {
                x = 3475,
                z = 3692,
            },
            {
                x = 3476,
                z = 3712,
            },
            {
                x = 3498,
                z = 3696,
            },
            {
                x = 3499,
                z = 3727,
            },
            {
                x = 3511,
                z = 3696,
            },
        },
    },
    {
        name = "Ravenous skeleton",
        ids = {
            [28510] = true,
        },
        locations = {
            {
                x = 3080,
                z = 3335,
            },
        },
    },
    {
        name = "Razmire Keelgan",
        ids = {
            [7899] = true,
        },
        locations = {
            {
                x = 3488,
                z = 3296,
            },
        },
    },
    {
        name = "Razvan",
        ids = {
            [3564] = true,
        },
        locations = {
            {
                x = 3492,
                z = 3235,
            },
        },
    },
    {
        name = "Recruiter",
        ids = {
            [720] = true,
        },
        locations = {
            {
                x = 2542,
                z = 3306,
            },
        },
    },
    {
        name = "Red salamander",
        ids = {
            [5115] = true,
        },
        locations = {
            {
                x = 2447,
                z = 3228,
            },
            {
                x = 2448,
                z = 3225,
            },
            {
                x = 2449,
                z = 3225,
            },
            {
                x = 2453,
                z = 3221,
            },
            {
                x = 2464,
                z = 3251,
            },
            {
                x = 2468,
                z = 3242,
            },
            {
                x = 2472,
                z = 3239,
            },
            {
                x = 2474,
                z = 3237,
            },
            {
                x = 2476,
                z = 3236,
            },
        },
    },
    {
        name = "Red wisp",
        ids = {
            [25448] = true,
        },
        locations = {
            {
                x = 2206,
                z = 2799,
            },
            {
                x = 2240,
                z = 2876,
            },
            {
                x = 2282,
                z = 2900,
            },
            {
                x = 2332,
                z = 2875,
            },
        },
    },
    {
        name = "Redbeard Frank",
        ids = {
            [375] = true,
        },
        locations = {
            {
                x = 3049,
                z = 3253,
            },
        },
    },
    {
        name = "Reeso",
        ids = {
            [3116] = true,
        },
        locations = {
            {
                x = 2667,
                z = 3706,
            },
        },
    },
    {
        name = "Regina",
        ids = {
            [27744] = true,
        },
        locations = {
            {
                x = 3109,
                z = 3336,
            },
        },
    },
    {
        name = "Registrar",
        ids = {
            [11272] = true,
        },
        locations = {
            {
                x = 2682,
                z = 3288,
            },
        },
    },
    {
        name = "Reinald",
        ids = {
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Relaxed imp",
        ids = {
            [24155] = true,
        },
        locations = {
            {
                x = 3123,
                z = 3398,
            },
        },
    },
    {
        name = "Reldo",
        ids = {
            [2660] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3495,
            },
        },
    },
    {
        name = "Relobo Blinyo (logs)",
        ids = {
            [6526] = true,
        },
        locations = {
            {
                x = 3175,
                z = 3477,
            },
        },
    },
    {
        name = "Remsai",
        ids = {
            [472] = true,
        },
        locations = {
            {
                x = 2524,
                z = 3169,
            },
        },
    },
    {
        name = "Researcher",
        ids = {
            [1867] = true,
            [4568] = true,
        },
        locations = {
            {
                x = 3357,
                z = 3396,
            },
            {
                x = 3364,
                z = 3355,
            },
        },
    },
    {
        name = "Restless ghost",
        ids = {
            [457] = true,
        },
        locations = {
            {
                x = 3245,
                z = 3192,
            },
        },
    },
    {
        name = "Rewards trader",
        ids = {
            [9711] = true,
        },
        locations = {
            {
                x = 3443,
                z = 3698,
            },
        },
    },
    {
        name = "Rhazien",
        ids = {
            [2337] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2591,
                z = 3865,
            },
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Rhonen",
        ids = {
            [2334] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3530,
            },
        },
    },
    {
        name = "Rhotep",
        ids = {
            [24693] = true,
        },
        locations = {
            {
                x = 3184,
                z = 2676,
            },
        },
    },
    {
        name = "Ric the trader",
        ids = {
            [24607] = true,
        },
        locations = {
            {
                x = 3227,
                z = 2721,
            },
        },
    },
    {
        name = "Richard",
        ids = {
            [1783] = true,
            [2306] = true,
        },
        locations = {
            {
                x = 2631,
                z = 3384,
            },
            {
                x = 3099,
                z = 3519,
            },
        },
    },
    {
        name = "Richie (NPC)",
        ids = {
            [27462] = true,
        },
        locations = {
            {
                x = 3172,
                z = 3492,
            },
        },
    },
    {
        name = "Rick",
        ids = {
            [11303] = true,
        },
        locations = {
            {
                x = 2663,
                z = 3334,
            },
        },
    },
    {
        name = "Rick Turpentine",
        ids = {
            [2476] = true,
        },
        locations = {
            {
                x = 3017,
                z = 3189,
            },
        },
    },
    {
        name = "Riddler crab",
        ids = {
            [24435] = true,
        },
        locations = {
            {
                x = 3171,
                z = 2613,
            },
        },
    },
    {
        name = "Riding Tutor Fabio",
        ids = {},
        locations = {
            {
                x = 3162,
                z = 3229,
            },
        },
    },
    {
        name = "Rimae Sirsalis",
        ids = {
            [4518] = true,
        },
        locations = {
            {
                x = 2104,
                z = 3907,
            },
        },
    },
    {
        name = "Rionasta",
        ids = {
            [2531] = true,
        },
        locations = {
            {
                x = 2782,
                z = 3094,
            },
        },
    },
    {
        name = "Roachey",
        ids = {
            [592] = true,
        },
        locations = {
            {
                x = 2588,
                z = 3405,
            },
        },
    },
    {
        name = "Roavar",
        ids = {
            [1042] = true,
        },
        locations = {
            {
                x = 3493,
                z = 3471,
            },
        },
    },
    {
        name = "Roberto",
        ids = {
            [23918] = true,
        },
        locations = {
            {
                x = 2255,
                z = 3550,
            },
            {
                x = 2284,
                z = 3565,
            },
        },
    },
    {
        name = "Robin",
        ids = {
            [1694] = true,
        },
        locations = {
            {
                x = 3672,
                z = 3491,
            },
        },
    },
    {
        name = "Robin (The Knight Before Christmas)",
        ids = {},
        locations = {
            {
                x = 2876,
                z = 3520,
            },
        },
    },
    {
        name = "Roddeck",
        ids = {
            [7909] = true,
        },
        locations = {
            {
                x = 3232,
                z = 3237,
            },
        },
    },
    {
        name = "Rogue",
        ids = {
            [8123] = true,
            [8124] = true,
        },
        locations = {
            {
                x = 3238,
                z = 3412,
            },
            {
                x = 3285,
                z = 3940,
            },
        },
    },
    {
        name = "Rokuh",
        ids = {},
        locations = {
            {
                x = 3434,
                z = 2908,
            },
        },
    },
    {
        name = "Rolad",
        ids = {
            [1841] = true,
        },
        locations = {
            {
                x = 3022,
                z = 3452,
            },
        },
    },
    {
        name = "Rolayne Twickit",
        ids = {
            [14021] = true,
        },
        locations = {
            {
                x = 3440,
                z = 3485,
            },
        },
    },
    {
        name = "Romily Weaklax",
        ids = {
            [3205] = true,
        },
        locations = {
            {
                x = 3141,
                z = 3448,
            },
        },
    },
    {
        name = "Rommik",
        ids = {
            [585] = true,
        },
        locations = {
            {
                x = 2945,
                z = 3196,
            },
        },
    },
    {
        name = "Rook",
        ids = {
            [9719] = true,
        },
        locations = {
            {
                x = 3382,
                z = 3617,
            },
            {
                x = 3396,
                z = 3614,
            },
            {
                x = 3406,
                z = 3631,
            },
            {
                x = 3417,
                z = 3644,
            },
            {
                x = 3474,
                z = 3691,
            },
            {
                x = 3497,
                z = 3697,
            },
        },
    },
    {
        name = "Rooster",
        ids = {
            [2312] = true,
        },
        locations = {
            {
                x = 3018,
                z = 3287,
            },
        },
    },
    {
        name = "Rory",
        ids = {
            [3609] = true,
        },
        locations = {
            {
                x = 3482,
                z = 3237,
            },
        },
    },
    {
        name = "Rose",
        ids = {
            [24074] = true,
        },
        locations = {
            {
                x = 3288,
                z = 2925,
            },
        },
    },
    {
        name = "Rosie",
        ids = {
            [30806] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3544,
            },
        },
    },
    {
        name = "Royal Guard",
        ids = {
            [15513] = true,
        },
        locations = {
            {
                x = 2665,
                z = 3335,
            },
        },
    },
    {
        name = "Royal Representative of Misthalin",
        ids = {
            [29830] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3521,
            },
        },
    },
    {
        name = "RPDT employee",
        ids = {
            [843] = true,
        },
        locations = {
            {
                x = 2644,
                z = 3274,
            },
            {
                x = 2644,
                z = 3276,
            },
            {
                x = 2647,
                z = 3271,
            },
        },
    },
    {
        name = "Ruby harvest",
        ids = {
            [5085] = true,
        },
        locations = {
            {
                x = 2308,
                z = 3598,
            },
            {
                x = 2311,
                z = 3611,
            },
            {
                x = 2313,
                z = 3538,
            },
            {
                x = 2314,
                z = 3551,
            },
            {
                x = 2314,
                z = 3572,
            },
            {
                x = 2314,
                z = 3582,
            },
            {
                x = 2315,
                z = 3613,
            },
            {
                x = 2316,
                z = 3603,
            },
            {
                x = 2318,
                z = 3579,
            },
            {
                x = 2319,
                z = 3597,
            },
            {
                x = 2320,
                z = 3535,
            },
            {
                x = 2321,
                z = 3586,
            },
            {
                x = 2321,
                z = 3605,
            },
            {
                x = 2323,
                z = 3552,
            },
            {
                x = 2324,
                z = 3594,
            },
            {
                x = 2324,
                z = 3612,
            },
            {
                x = 2325,
                z = 3543,
            },
            {
                x = 2326,
                z = 3527,
            },
            {
                x = 2326,
                z = 3600,
            },
            {
                x = 2328,
                z = 3598,
            },
            {
                x = 2331,
                z = 3540,
            },
            {
                x = 2333,
                z = 3600,
            },
            {
                x = 2334,
                z = 3544,
            },
            {
                x = 2334,
                z = 3586,
            },
            {
                x = 2338,
                z = 3591,
            },
            {
                x = 2338,
                z = 3599,
            },
            {
                x = 2339,
                z = 3546,
            },
            {
                x = 2339,
                z = 3557,
            },
            {
                x = 2342,
                z = 3540,
            },
            {
                x = 2342,
                z = 3615,
            },
            {
                x = 2343,
                z = 3525,
            },
            {
                x = 2348,
                z = 3534,
            },
            {
                x = 2349,
                z = 3554,
            },
            {
                x = 2352,
                z = 3540,
            },
            {
                x = 2352,
                z = 3549,
            },
            {
                x = 2352,
                z = 3583,
            },
            {
                x = 2354,
                z = 3573,
            },
            {
                x = 2358,
                z = 3563,
            },
            {
                x = 2361,
                z = 3549,
            },
            {
                x = 2362,
                z = 3557,
            },
            {
                x = 2365,
                z = 3569,
            },
        },
    },
    {
        name = "Rufus",
        ids = {
            [1038] = true,
        },
        locations = {
            {
                x = 3507,
                z = 3496,
            },
        },
    },
    {
        name = "Rug merchant",
        ids = {
            [13238] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Runestax",
        ids = {
            [17062] = true,
        },
        locations = {
            {
                x = 2931,
                z = 3478,
            },
        },
    },
    {
        name = "Rupert the Beard",
        ids = {
            [5998] = true,
        },
        locations = {
            {
                x = 2970,
                z = 3473,
            },
        },
    },
    {
        name = "Rutmir Arnhold",
        ids = {
            [15044] = true,
        },
        locations = {
            {
                x = 2584,
                z = 2856,
            },
        },
    },
    {
        name = "Sabeil",
        ids = {
            [965] = true,
        },
        locations = {
            {
                x = 3359,
                z = 3243,
            },
        },
    },
    {
        name = "Sabre-toothed kebbit",
        ids = {
            [5087] = true,
        },
        locations = {
            {
                x = 2705,
                z = 3780,
            },
            {
                x = 2707,
                z = 3774,
            },
            {
                x = 2711,
                z = 3768,
            },
            {
                x = 2711,
                z = 3778,
            },
            {
                x = 2712,
                z = 3773,
            },
            {
                x = 2714,
                z = 3770,
            },
            {
                x = 2715,
                z = 3764,
            },
            {
                x = 2715,
                z = 3766,
            },
            {
                x = 2715,
                z = 3779,
            },
            {
                x = 2716,
                z = 3770,
            },
            {
                x = 2717,
                z = 3776,
            },
            {
                x = 2720,
                z = 3764,
            },
        },
    },
    {
        name = "Sabre-toothed kyatt",
        ids = {
            [5103] = true,
        },
        locations = {
            {
                x = 2696,
                z = 3790,
            },
            {
                x = 2702,
                z = 3790,
            },
            {
                x = 2708,
                z = 3796,
            },
            {
                x = 2725,
                z = 3791,
            },
            {
                x = 2734,
                z = 3780,
            },
            {
                x = 2741,
                z = 3790,
            },
        },
    },
    {
        name = "Sabrina",
        ids = {
            [24706] = true,
        },
        locations = {
            {
                x = 3096,
                z = 2697,
            },
        },
    },
    {
        name = "Safalaan",
        ids = {
            [4711] = true,
            [21586] = true,
            [21588] = true,
        },
        locations = {
            {
                x = 3589,
                z = 3335,
            },
            {
                x = 3637,
                z = 3366,
            },
            {
                x = 3682,
                z = 3189,
            },
        },
    },
    {
        name = "Safta Doc",
        ids = {
            [2516] = true,
        },
        locations = {
            {
                x = 2790,
                z = 3100,
            },
        },
    },
    {
        name = "Sailor",
        ids = {
            [1304] = true,
            [1385] = true,
        },
        locations = {
            {
                x = 2581,
                z = 3847,
            },
            {
                x = 2629,
                z = 3693,
            },
        },
    },
    {
        name = "Sam",
        ids = {
            [1787] = true,
        },
        locations = {
            {
                x = 3046,
                z = 3628,
            },
        },
    },
    {
        name = "Sam the sheepdog",
        ids = {
            [25840] = true,
        },
        locations = {
            {
                x = 2647,
                z = 3356,
            },
        },
    },
    {
        name = "Sami the Camel Man",
        ids = {
            [26840] = true,
        },
        locations = {
            {
                x = 3350,
                z = 2967,
            },
        },
    },
    {
        name = "Sammy Servil",
        ids = {
            [264] = true,
            [7533] = true,
        },
        locations = {
            {
                x = 2565,
                z = 3200,
            },
            {
                x = 2602,
                z = 3154,
            },
        },
    },
    {
        name = "Samuel LeBaux",
        ids = {
            [20938] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3240,
            },
        },
    },
    {
        name = "San Fan",
        ids = {
            [4360] = true,
        },
        locations = {
            {
                x = 3824,
                z = 3015,
            },
        },
    },
    {
        name = "Sand storm",
        ids = {
            [2921] = true,
        },
        locations = {
            {
                x = 3472,
                z = 3086,
            },
            {
                x = 3475,
                z = 3100,
            },
            {
                x = 3482,
                z = 3084,
            },
            {
                x = 3489,
                z = 3102,
            },
        },
    },
    {
        name = "Sandwich lady",
        ids = {
            [11466] = true,
            [16880] = true,
        },
        locations = {
            {
                x = 2655,
                z = 3310,
            },
            {
                x = 2734,
                z = 3466,
            },
        },
    },
    {
        name = "Sandy",
        ids = {
            [3110] = true,
            [3111] = true,
        },
        locations = {
            {
                x = 2787,
                z = 3176,
            },
            {
                x = 2788,
                z = 3176,
            },
        },
    },
    {
        name = "Sanfew",
        ids = {
            [454] = true,
        },
        locations = {
            {
                x = 2916,
                z = 3438,
            },
        },
    },
    {
        name = "Sanguine imp",
        ids = {
            [24152] = true,
            [24155] = true,
        },
        locations = {
            {
                x = 3123,
                z = 3398,
            },
            {
                x = 3127,
                z = 3410,
            },
        },
    },
    {
        name = "Sanguinus Varnis",
        ids = {
            [14078] = true,
        },
        locations = {
            {
                x = 3667,
                z = 3380,
            },
        },
    },
    {
        name = "Sani",
        ids = {
            [4905] = true,
        },
        locations = {
            {
                x = 3187,
                z = 3423,
            },
        },
    },
    {
        name = "Saniboch",
        ids = {
            [1595] = true,
        },
        locations = {
            {
                x = 2745,
                z = 3152,
            },
        },
    },
    {
        name = "Santa's head elf",
        ids = {
            [29792] = true,
        },
        locations = {
            {
                x = 3177,
                z = 3508,
            },
        },
    },
    {
        name = "Sara Onnear",
        ids = {
            [18201] = true,
        },
        locations = {
            {
                x = 3125,
                z = 3231,
            },
        },
    },
    {
        name = "Saradomin",
        ids = {
            [18035] = true,
        },
        locations = {
            {
                x = 3051,
                z = 3504,
            },
        },
    },
    {
        name = "Saradomin jadinko",
        ids = {
            [13163] = true,
        },
        locations = {
            {
                x = 2971,
                z = 2905,
            },
            {
                x = 2974,
                z = 2909,
            },
            {
                x = 2975,
                z = 2913,
            },
            {
                x = 2977,
                z = 2911,
            },
            {
                x = 2979,
                z = 2907,
            },
            {
                x = 2979,
                z = 2910,
            },
        },
    },
    {
        name = "Saradominist preacher",
        ids = {
            [18251] = true,
        },
        locations = {
            {
                x = 3161,
                z = 3222,
            },
        },
    },
    {
        name = "Sarah",
        ids = {
            [2304] = true,
        },
        locations = {
            {
                x = 3038,
                z = 3292,
            },
        },
    },
    {
        name = "Sarble",
        ids = {
            [4599] = true,
        },
        locations = {
            {
                x = 2417,
                z = 3517,
            },
        },
    },
    {
        name = "Sarius Guile",
        ids = {
            [4861] = true,
        },
        locations = {
            {
                x = 3590,
                z = 3337,
            },
        },
    },
    {
        name = "Sassilik",
        ids = {
            [1313] = true,
            [5496] = true,
        },
        locations = {
            {
                x = 2402,
                z = 3802,
            },
            {
                x = 2627,
                z = 3654,
            },
        },
    },
    {
        name = "Sawmill operator",
        ids = {
            [12239] = true,
        },
        locations = {
            {
                x = 2734,
                z = 3466,
            },
        },
    },
    {
        name = "Sbott",
        ids = {
            [1041] = true,
        },
        locations = {
            {
                x = 3490,
                z = 3503,
            },
        },
    },
    {
        name = "Scalectrix",
        ids = {
            [15055] = true,
        },
        locations = {
            {
                x = 2881,
                z = 3430,
            },
        },
    },
    {
        name = "Scarablet",
        ids = {
            [24462] = true,
        },
        locations = {
            {
                x = 3242,
                z = 2664,
            },
        },
    },
    {
        name = "Scarg",
        ids = {
            [2064] = true,
        },
        locations = {
            {
                x = 2380,
                z = 3043,
            },
        },
    },
    {
        name = "Schoolboy",
        ids = {
            [5946] = true,
        },
        locations = {
            {
                x = 3261,
                z = 3455,
            },
        },
    },
    {
        name = "Schoolgirl",
        ids = {
            [5984] = true,
        },
        locations = {
            {
                x = 3263,
                z = 3452,
            },
        },
    },
    {
        name = "Scopulus",
        ids = {
            [21318] = true,
        },
        locations = {
            {
                x = 3097,
                z = 2866,
            },
        },
    },
    {
        name = "Scout",
        ids = {
            [5570] = true,
            [5574] = true,
            [5575] = true,
            [5576] = true,
        },
        locations = {
            {
                x = 2457,
                z = 3357,
            },
            {
                x = 2835,
                z = 3053,
            },
            {
                x = 3072,
                z = 3336,
            },
            {
                x = 3301,
                z = 3100,
            },
        },
    },
    {
        name = "Scribe",
        ids = {
            [5915] = true,
        },
        locations = {
            {
                x = 3174,
                z = 3467,
            },
        },
    },
    {
        name = "Seaman Thresnor",
        ids = {
            [378] = true,
        },
        locations = {
            {
                x = 3026,
                z = 3217,
            },
        },
    },
    {
        name = "Seasinger Jemi",
        ids = {
            [22943] = true,
        },
        locations = {
            {
                x = 2956,
                z = 3208,
            },
        },
    },
    {
        name = "Seddu",
        ids = {
            [3038] = true,
        },
        locations = {
            {
                x = 3407,
                z = 2926,
            },
        },
    },
    {
        name = "Seegud",
        ids = {
            [7052] = true,
        },
        locations = {
            {
                x = 2571,
                z = 2855,
            },
        },
    },
    {
        name = "Seer",
        ids = {
            [388] = true,
        },
        locations = {
            {
                x = 2702,
                z = 3475,
            },
            {
                x = 2705,
                z = 3473,
            },
            {
                x = 2714,
                z = 3471,
            },
            {
                x = 2716,
                z = 3485,
            },
        },
    },
    {
        name = "Selena",
        ids = {
            [2332] = true,
        },
        locations = {
            {
                x = 2578,
                z = 3101,
            },
        },
    },
    {
        name = "Selene",
        ids = {
            [4517] = true,
        },
        locations = {
            {
                x = 2085,
                z = 3913,
            },
        },
    },
    {
        name = "Sennefer",
        ids = {
            [24700] = true,
        },
        locations = {
            {
                x = 3150,
                z = 2796,
            },
        },
    },
    {
        name = "Sensei Hakase",
        ids = {
            [24717] = true,
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3172,
                z = 2614,
            },
        },
    },
    {
        name = "Sentinel Bloodmortis",
        ids = {
            [14114] = true,
        },
        locations = {
            {
                x = 3599,
                z = 3340,
            },
        },
    },
    {
        name = "Sentinel Draemus",
        ids = {
            [14082] = true,
        },
        locations = {
            {
                x = 3621,
                z = 3401,
            },
        },
    },
    {
        name = "Sentinel Gorthaur",
        ids = {
            [14083] = true,
        },
        locations = {
            {
                x = 3603,
                z = 3384,
            },
        },
    },
    {
        name = "Sentinel Mortshade",
        ids = {
            [14081] = true,
        },
        locations = {
            {
                x = 3660,
                z = 3378,
            },
        },
    },
    {
        name = "Sentinel Noctantine",
        ids = {
            [14112] = true,
        },
        locations = {
            {
                x = 3603,
                z = 3374,
            },
        },
    },
    {
        name = "Sentinel Plaguemanst",
        ids = {
            [14113] = true,
        },
        locations = {
            {
                x = 3587,
                z = 3358,
            },
        },
    },
    {
        name = "Septhys",
        ids = {
            [24695] = true,
        },
        locations = {
            {
                x = 3212,
                z = 2762,
            },
        },
    },
    {
        name = "Sera",
        ids = {
            [14810] = true,
        },
        locations = {
            {
                x = 2362,
                z = 3375,
            },
        },
    },
    {
        name = "Sergeant Mossfists",
        ids = {
            [5889] = true,
        },
        locations = {
            {
                x = 3183,
                z = 3161,
            },
        },
    },
    {
        name = "Sergeant Slimetoes",
        ids = {
            [5890] = true,
        },
        locations = {
            {
                x = 3181,
                z = 3161,
            },
        },
    },
    {
        name = "Sergeant-at-Arms",
        ids = {
            [5914] = true,
        },
        locations = {
            {
                x = 3183,
                z = 3472,
            },
        },
    },
    {
        name = "Sergiu",
        ids = {
            [3544] = true,
        },
        locations = {
            {
                x = 3503,
                z = 3231,
            },
        },
    },
    {
        name = "Servant",
        ids = {
            [1081] = true,
        },
        locations = {
            {
                x = 2895,
                z = 3566,
            },
        },
    },
    {
        name = "Seth Groats",
        ids = {
            [452] = true,
        },
        locations = {
            {
                x = 3223,
                z = 3293,
            },
        },
    },
    {
        name = "Seth Minas (site manager)",
        ids = {
            [26380] = true,
        },
        locations = {
            {
                x = 3328,
                z = 3383,
            },
        },
    },
    {
        name = "Shadow Gem Shopkeeper",
        ids = {},
        locations = {
            {
                x = 2906,
                z = 3544,
            },
        },
    },
    {
        name = "Shady Character",
        ids = {
            [15003] = true,
            [15004] = true,
        },
        locations = {
            {
                x = 2890,
                z = 3439,
            },
            {
                x = 2891,
                z = 3440,
            },
        },
    },
    {
        name = "Shady Crafter",
        ids = {
            [31244] = true,
        },
        locations = {
            {
                x = 3193,
                z = 3506,
            },
        },
    },
    {
        name = "Shady ghost",
        ids = {
            [24131] = true,
        },
        locations = {
            {
                x = 3666,
                z = 3523,
            },
        },
    },
    {
        name = "Shamus",
        ids = {
            [654] = true,
        },
        locations = {
            {
                x = 3154,
                z = 3192,
            },
        },
    },
    {
        name = "Shanomi",
        ids = {
            [4290] = true,
        },
        locations = {
            {
                x = 2854,
                z = 3537,
            },
        },
    },
    {
        name = "Shantay",
        ids = {
            [836] = true,
        },
        locations = {
            {
                x = 3304,
                z = 3118,
            },
        },
    },
    {
        name = "Shark",
        ids = {
            [40] = true,
            [16843] = true,
        },
        locations = {
            {
                x = 2793,
                z = 3220,
            },
            {
                x = 3003,
                z = 3069,
            },
            {
                x = 3007,
                z = 3063,
            },
        },
    },
    {
        name = "Shauna",
        ids = {},
        locations = {
            {
                x = 3412,
                z = 3167,
            },
        },
    },
    {
        name = "Shebit",
        ids = {
            [24414] = true,
        },
        locations = {
            {
                x = 3172,
                z = 2803,
            },
        },
    },
    {
        name = "Sheep",
        ids = {
            [3579] = true,
            [8876] = true,
        },
        locations = {
            {
                x = 3187,
                z = 3292,
            },
            {
                x = 3195,
                z = 3292,
            },
            {
                x = 3198,
                z = 3293,
            },
        },
    },
    {
        name = "Sheepdog",
        ids = {
            [2311] = true,
        },
        locations = {
            {
                x = 3035,
                z = 3295,
            },
        },
    },
    {
        name = "Shilop",
        ids = {
            [781] = true,
        },
        locations = {
            {
                x = 3221,
                z = 3434,
            },
        },
    },
    {
        name = "Shiratti the Custodian",
        ids = {
            [3044] = true,
        },
        locations = {
            {
                x = 3424,
                z = 2929,
            },
        },
    },
    {
        name = "Shop assistant",
        ids = {
            [521] = true,
            [523] = true,
            [525] = true,
            [527] = true,
            [529] = true,
            [531] = true,
            [552] = true,
            [11678] = true,
            [24551] = true,
        },
        locations = {
            {
                x = 2902,
                z = 3152,
            },
            {
                x = 2948,
                z = 3219,
            },
            {
                x = 2955,
                z = 3389,
            },
            {
                x = 3081,
                z = 3511,
            },
            {
                x = 3205,
                z = 3399,
            },
            {
                x = 3214,
                z = 3243,
            },
            {
                x = 3217,
                z = 3411,
            },
            {
                x = 3244,
                z = 2782,
            },
            {
                x = 3317,
                z = 3182,
            },
        },
    },
    {
        name = "Shopkeeper",
        ids = {
            [520] = true,
            [522] = true,
            [524] = true,
            [526] = true,
            [528] = true,
            [530] = true,
            [551] = true,
            [555] = true,
            [561] = true,
            [24550] = true,
        },
        locations = {
            {
                x = 2514,
                z = 3385,
            },
            {
                x = 2640,
                z = 3171,
            },
            {
                x = 2655,
                z = 3152,
            },
            {
                x = 2947,
                z = 3219,
            },
            {
                x = 2957,
                z = 3386,
            },
            {
                x = 3080,
                z = 3511,
            },
            {
                x = 3203,
                z = 3397,
            },
            {
                x = 3214,
                z = 3240,
            },
            {
                x = 3218,
                z = 3415,
            },
            {
                x = 3245,
                z = 2787,
            },
            {
                x = 3317,
                z = 3184,
            },
        },
    },
    {
        name = "Shopkeeper Kofi",
        ids = {
            [11674] = true,
        },
        locations = {
            {
                x = 2902,
                z = 3150,
            },
        },
    },
    {
        name = "Shrine Ibis",
        ids = {
            [23555] = true,
        },
        locations = {
            {
                x = 4773,
                z = 3426,
            },
        },
    },
    {
        name = "Siamun",
        ids = {
            [1983] = true,
        },
        locations = {
            {
                x = 3314,
                z = 2784,
            },
        },
    },
    {
        name = "Sick-looking sheep (1)",
        ids = {},
        locations = {
            {
                x = 2609,
                z = 3344,
            },
            {
                x = 2610,
                z = 3343,
            },
            {
                x = 2610,
                z = 3345,
            },
        },
    },
    {
        name = "Sick-looking sheep (2)",
        ids = {},
        locations = {
            {
                x = 2616,
                z = 3370,
            },
            {
                x = 2617,
                z = 3371,
            },
            {
                x = 2618,
                z = 3370,
            },
        },
    },
    {
        name = "Sick-looking sheep (3)",
        ids = {},
        locations = {
            {
                x = 2560,
                z = 3389,
            },
            {
                x = 2561,
                z = 3388,
            },
            {
                x = 2561,
                z = 3390,
            },
        },
    },
    {
        name = "Sick-looking sheep (4)",
        ids = {},
        locations = {
            {
                x = 2610,
                z = 3385,
            },
            {
                x = 2611,
                z = 3384,
            },
            {
                x = 2612,
                z = 3385,
            },
        },
    },
    {
        name = "Sif",
        ids = {
            [25652] = true,
        },
        locations = {
            {
                x = 3358,
                z = 3872,
            },
        },
    },
    {
        name = "Sigli the Huntsman",
        ids = {
            [1281] = true,
        },
        locations = {
            {
                x = 2660,
                z = 3653,
            },
        },
    },
    {
        name = "Sigmund The Merchant",
        ids = {
            [1282] = true,
        },
        locations = {
            {
                x = 2641,
                z = 3680,
            },
        },
    },
    {
        name = "Sigurd",
        ids = {
            [3329] = true,
        },
        locations = {
            {
                x = 3113,
                z = 3413,
            },
        },
    },
    {
        name = "Silif",
        ids = {
            [8469] = true,
        },
        locations = {
            {
                x = 2989,
                z = 3341,
            },
        },
    },
    {
        name = "Silk merchant",
        ids = {
            [574] = true,
        },
        locations = {
            {
                x = 2655,
                z = 3302,
            },
        },
    },
    {
        name = "Silk trader",
        ids = {
            [539] = true,
        },
        locations = {
            {
                x = 3299,
                z = 3207,
            },
        },
    },
    {
        name = "Silver merchant",
        ids = {
            [569] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3316,
            },
        },
    },
    {
        name = "Simon",
        ids = {
            [1786] = true,
        },
        locations = {
            {
                x = 3236,
                z = 3600,
            },
        },
    },
    {
        name = "Simon Templeton",
        ids = {
            [3123] = true,
        },
        locations = {
            {
                x = 3349,
                z = 2827,
            },
        },
    },
    {
        name = "Simona",
        ids = {
            [3562] = true,
        },
        locations = {
            {
                x = 3499,
                z = 3241,
            },
        },
    },
    {
        name = "Sinclair Guard dog",
        ids = {
            [821] = true,
        },
        locations = {
            {
                x = 2750,
                z = 3580,
            },
        },
    },
    {
        name = "Sinco Doar",
        ids = {
            [5936] = true,
        },
        locations = {
            {
                x = 3266,
                z = 3445,
            },
        },
    },
    {
        name = "Sinister Stranger",
        ids = {
            [226] = true,
        },
        locations = {
            {
                x = 2637,
                z = 3440,
            },
        },
    },
    {
        name = "Sir Amik Varze",
        ids = {
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
        },
    },
    {
        name = "Sir Atcha",
        ids = {
            [26922] = true,
        },
        locations = {
            {
                x = 2961,
                z = 3346,
            },
        },
    },
    {
        name = "Sir Edmond",
        ids = {
            [19586] = true,
        },
        locations = {
            {
                x = 2589,
                z = 3296,
            },
        },
    },
    {
        name = "Sir Prysin",
        ids = {
            [9359] = true,
        },
        locations = {
            {
                x = 3204,
                z = 3471,
            },
            {
                x = 3204,
                z = 3472,
            },
        },
    },
    {
        name = "Sir Rebrum",
        ids = {
            [15460] = true,
        },
        locations = {
            {
                x = 2991,
                z = 3237,
            },
        },
    },
    {
        name = "Sir Tendeth",
        ids = {
            [14318] = true,
        },
        locations = {
            {
                x = 3667,
                z = 2978,
            },
        },
    },
    {
        name = "Sir Vant",
        ids = {
            [8848] = true,
        },
        locations = {
            {
                x = 2960,
                z = 3350,
            },
        },
    },
    {
        name = "Sir Vile",
        ids = {
            [23308] = true,
            [23312] = true,
        },
        locations = {
            {
                x = 2963,
                z = 3333,
            },
            {
                x = 3013,
                z = 3524,
            },
        },
    },
    {
        name = "Sir Yaktrick Moore",
        ids = {
            [26844] = true,
        },
        locations = {
            {
                x = 2887,
                z = 3524,
            },
        },
    },
    {
        name = "Sirsal Banker",
        ids = {
            [4519] = true,
        },
        locations = {
            {
                x = 2097,
                z = 3921,
            },
            {
                x = 2098,
                z = 3921,
            },
        },
    },
    {
        name = "Sister Catherina",
        ids = {
            [14636] = true,
            [14637] = true,
            [14638] = true,
        },
        locations = {
            {
                x = 3399,
                z = 3152,
            },
            {
                x = 3405,
                z = 3165,
            },
            {
                x = 3448,
                z = 3159,
            },
        },
    },
    {
        name = "Sister Cecilia",
        ids = {
            [14661] = true,
            [14662] = true,
        },
        locations = {
            {
                x = 3444,
                z = 3159,
            },
            {
                x = 3444,
                z = 3167,
            },
        },
    },
    {
        name = "Sister Elena",
        ids = {
            [14667] = true,
        },
        locations = {
            {
                x = 3429,
                z = 3176,
            },
        },
    },
    {
        name = "Skaldrun",
        ids = {
            [4732] = true,
        },
        locations = {
            {
                x = 3429,
                z = 3701,
            },
        },
    },
    {
        name = "Skeleton",
        ids = {},
        locations = {
            {
                x = 3231,
                z = 3503,
            },
        },
    },
    {
        name = "Skippy",
        ids = {
            [22648] = true,
        },
        locations = {
            {
                x = 2983,
                z = 3196,
            },
        },
    },
    {
        name = "Skot",
        ids = {
            [18122] = true,
        },
        locations = {
            {
                x = 2645,
                z = 3686,
            },
        },
    },
    {
        name = "Skulgrimen",
        ids = {
            [1303] = true,
        },
        locations = {
            {
                x = 2663,
                z = 3694,
            },
        },
    },
    {
        name = "Skuli Myrka",
        ids = {
            [5486] = true,
        },
        locations = {
            {
                x = 2394,
                z = 3805,
            },
        },
    },
    {
        name = "Slave",
        ids = {
            [1978] = true,
            [1979] = true,
        },
        locations = {
            {
                x = 3283,
                z = 2769,
            },
            {
                x = 3294,
                z = 2762,
            },
            {
                x = 3297,
                z = 2798,
            },
            {
                x = 3298,
                z = 2793,
            },
            {
                x = 3304,
                z = 2770,
            },
            {
                x = 3306,
                z = 2760,
            },
            {
                x = 3306,
                z = 2774,
            },
        },
    },
    {
        name = "Slave fighter",
        ids = {
            [262] = true,
            [267] = true,
        },
        locations = {
            {
                x = 2595,
                z = 3142,
            },
            {
                x = 2601,
                z = 3168,
            },
            {
                x = 2616,
                z = 3160,
            },
            {
                x = 2616,
                z = 3163,
            },
        },
    },
    {
        name = "Sleeping Monkey",
        ids = {
            [1451] = true,
        },
        locations = {
            {
                x = 2760,
                z = 2771,
            },
        },
    },
    {
        name = "Slug Hemligssen",
        ids = {
            [5520] = true,
        },
        locations = {
            {
                x = 2336,
                z = 3811,
            },
        },
    },
    {
        name = "Smellytoes",
        ids = {
            [6128] = true,
        },
        locations = {
            {
                x = 2465,
                z = 3183,
            },
        },
    },
    {
        name = "Smiddi Ryak",
        ids = {
            [14055] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3240,
            },
        },
    },
    {
        name = "Smith",
        ids = {
            [3162] = true,
        },
        locations = {
            {
                x = 3689,
                z = 2954,
            },
        },
    },
    {
        name = "Snake",
        ids = {
            [1875] = true,
        },
        locations = {
            {
                x = 3354,
                z = 2952,
            },
        },
    },
    {
        name = "Snarrk",
        ids = {
            [15238] = true,
        },
        locations = {
            {
                x = 2581,
                z = 2866,
            },
        },
    },
    {
        name = "Snarrl",
        ids = {
            [15237] = true,
        },
        locations = {
            {
                x = 2559,
                z = 2858,
            },
        },
    },
    {
        name = "Snert",
        ids = {
            [15235] = true,
        },
        locations = {
            {
                x = 2518,
                z = 2842,
            },
        },
    },
    {
        name = "Snow imp boy",
        ids = {
            [32457] = true,
        },
        locations = {
            {
                x = 3162,
                z = 3509,
            },
        },
    },
    {
        name = "Snowman girl",
        ids = {
            [32456] = true,
        },
        locations = {
            {
                x = 3161,
                z = 3509,
            },
        },
    },
    {
        name = "Snurgh",
        ids = {
            [7057] = true,
        },
        locations = {
            {
                x = 2596,
                z = 2845,
            },
        },
    },
    {
        name = "Solihib",
        ids = {
            [1433] = true,
        },
        locations = {
            {
                x = 2769,
                z = 2789,
            },
        },
    },
    {
        name = "Solomon",
        ids = {
            [18808] = true,
        },
        locations = {
            {
                x = 3174,
                z = 3457,
            },
        },
    },
    {
        name = "Someone faster",
        ids = {
            [23271] = true,
        },
        locations = {
            {
                x = 3249,
                z = 3402,
            },
        },
    },
    {
        name = "Someone slower",
        ids = {
            [23273] = true,
        },
        locations = {
            {
                x = 3240,
                z = 3401,
            },
        },
    },
    {
        name = "Someone stronger",
        ids = {
            [23270] = true,
        },
        locations = {
            {
                x = 3249,
                z = 3400,
            },
        },
    },
    {
        name = "Someone weaker",
        ids = {
            [23272] = true,
        },
        locations = {
            {
                x = 3241,
                z = 3402,
            },
        },
    },
    {
        name = "Sonje",
        ids = {
            [26222] = true,
        },
        locations = {
            {
                x = 3501,
                z = 3696,
            },
        },
    },
    {
        name = "Sophanem guard",
        ids = {
            [5269] = true,
            [5271] = true,
            [5273] = true,
            [5275] = true,
        },
        locations = {
            {
                x = 3285,
                z = 2785,
            },
            {
                x = 3289,
                z = 2762,
            },
            {
                x = 3302,
                z = 2799,
            },
            {
                x = 3304,
                z = 2778,
            },
            {
                x = 3305,
                z = 2766,
            },
            {
                x = 3308,
                z = 2765,
            },
        },
    },
    {
        name = "Soran, Emissary of Zaros",
        ids = {
            [17136] = true,
        },
        locations = {
            {
                x = 3183,
                z = 3417,
            },
        },
    },
    {
        name = "Sorin",
        ids = {
            [21511] = true,
        },
        locations = {
            {
                x = 3513,
                z = 3234,
            },
        },
    },
    {
        name = "Soul Reaver",
        ids = {
            [28983] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3546,
            },
        },
    },
    {
        name = "Sparkling wisp",
        ids = {
            [18157] = true,
        },
        locations = {
            {
                x = 2761,
                z = 3595,
            },
            {
                x = 2766,
                z = 3590,
            },
            {
                x = 2767,
                z = 3588,
            },
            {
                x = 2767,
                z = 3589,
            },
            {
                x = 2769,
                z = 3601,
            },
            {
                x = 2770,
                z = 3588,
            },
            {
                x = 2771,
                z = 3604,
            },
            {
                x = 2772,
                z = 3596,
            },
            {
                x = 2773,
                z = 3605,
            },
            {
                x = 2774,
                z = 3592,
            },
            {
                x = 2775,
                z = 3594,
            },
            {
                x = 2778,
                z = 3598,
            },
        },
    },
    {
        name = "Sparky",
        ids = {
            [25016] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3277,
            },
        },
    },
    {
        name = "Spencer",
        ids = {
            [31478] = true,
        },
        locations = {
            {
                x = 3167,
                z = 3510,
            },
        },
    },
    {
        name = "Sphinx",
        ids = {
            [1990] = true,
        },
        locations = {
            {
                x = 3298,
                z = 2787,
            },
        },
    },
    {
        name = "Spice seller",
        ids = {
            [572] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3296,
            },
        },
    },
    {
        name = "Spider",
        ids = {
            [1221] = true,
        },
        locations = {
            {
                x = 3566,
                z = 3457,
            },
            {
                x = 3567,
                z = 3504,
            },
            {
                x = 3597,
                z = 3489,
            },
            {
                x = 3611,
                z = 3462,
            },
            {
                x = 3620,
                z = 3500,
            },
            {
                x = 3636,
                z = 3484,
            },
        },
    },
    {
        name = "Spined larupia",
        ids = {
            [5104] = true,
        },
        locations = {
            {
                x = 2544,
                z = 2910,
            },
            {
                x = 2550,
                z = 2904,
            },
            {
                x = 2556,
                z = 2895,
            },
            {
                x = 2563,
                z = 2888,
            },
            {
                x = 2573,
                z = 2883,
            },
        },
    },
    {
        name = "Spirit of Scorpius",
        ids = {
            [492] = true,
        },
        locations = {
            {
                x = 2465,
                z = 3227,
            },
        },
    },
    {
        name = "Spotted kebbit",
        ids = {
            [5098] = true,
        },
        locations = {
            {
                x = 2370,
                z = 3587,
            },
            {
                x = 2370,
                z = 3591,
            },
            {
                x = 2372,
                z = 3584,
            },
            {
                x = 2379,
                z = 3585,
            },
            {
                x = 2382,
                z = 3584,
            },
            {
                x = 2384,
                z = 3586,
            },
            {
                x = 2391,
                z = 3592,
            },
        },
    },
    {
        name = "Spria",
        ids = {
            [8480] = true,
        },
        locations = {
            {
                x = 2890,
                z = 3548,
            },
        },
    },
    {
        name = "Spring Picnic girl",
        ids = {
            [30839] = true,
        },
        locations = {
            {
                x = 2883,
                z = 3518,
            },
        },
    },
    {
        name = "Squire",
        ids = {
            [3790] = true,
            [3791] = true,
            [3792] = true,
            [3793] = true,
            [3794] = true,
            [3795] = true,
            [3796] = true,
            [3797] = true,
            [3798] = true,
            [3799] = true,
            [3800] = true,
            [3801] = true,
            [11502] = true,
        },
        locations = {
            {
                x = 2630,
                z = 2656,
            },
            {
                x = 2637,
                z = 2661,
            },
            {
                x = 2637,
                z = 2667,
            },
            {
                x = 2649,
                z = 2655,
            },
            {
                x = 2651,
                z = 2664,
            },
            {
                x = 2651,
                z = 2674,
            },
            {
                x = 2659,
                z = 2647,
            },
            {
                x = 2661,
                z = 2647,
            },
            {
                x = 2661,
                z = 2650,
            },
            {
                x = 2661,
                z = 2657,
            },
            {
                x = 2666,
                z = 2657,
            },
            {
                x = 2675,
                z = 2650,
            },
            {
                x = 3041,
                z = 3202,
            },
        },
    },
    {
        name = "Squire (Intermediate)",
        ids = {
            [6140] = true,
        },
        locations = {
            {
                x = 2637,
                z = 2630,
            },
        },
    },
    {
        name = "Squire (Novice)",
        ids = {
            [3802] = true,
        },
        locations = {
            {
                x = 2650,
                z = 2633,
            },
        },
    },
    {
        name = "Squire (Veteran)",
        ids = {
            [6141] = true,
        },
        locations = {
            {
                x = 2633,
                z = 2646,
            },
        },
    },
    {
        name = "Squire Asrol",
        ids = {
            [606] = true,
        },
        locations = {
            {
                x = 2975,
                z = 3343,
            },
        },
    },
    {
        name = "Squire Cerlyn",
        ids = {
            [6512] = true,
        },
        locations = {
            {
                x = 2960,
                z = 3339,
            },
        },
    },
    {
        name = "Squire Fyre",
        ids = {
            [8066] = true,
        },
        locations = {
            {
                x = 3346,
                z = 3513,
            },
        },
    },
    {
        name = "Squire Sam",
        ids = {
            [11520] = true,
        },
        locations = {
            {
                x = 2677,
                z = 2660,
            },
        },
    },
    {
        name = "Squirrel",
        ids = {
            [3283] = true,
            [3284] = true,
            [3285] = true,
        },
        locations = {
            {
                x = 2967,
                z = 3450,
            },
            {
                x = 2970,
                z = 3441,
            },
            {
                x = 2980,
                z = 3438,
            },
            {
                x = 3026,
                z = 3432,
            },
            {
                x = 3033,
                z = 3436,
            },
            {
                x = 3038,
                z = 3428,
            },
            {
                x = 3044,
                z = 3423,
            },
            {
                x = 3048,
                z = 3418,
            },
            {
                x = 3049,
                z = 3427,
            },
            {
                x = 3054,
                z = 3418,
            },
            {
                x = 3063,
                z = 3423,
            },
        },
    },
    {
        name = "Stacey",
        ids = {
            [28694] = true,
        },
        locations = {
            {
                x = 2224,
                z = 3657,
            },
            {
                x = 3330,
                z = 3245,
            },
        },
    },
    {
        name = "Stanford",
        ids = {
            [811] = true,
        },
        locations = {
            {
                x = 2731,
                z = 3579,
            },
        },
    },
    {
        name = "Stankers",
        ids = {
            [383] = true,
        },
        locations = {
            {
                x = 2575,
                z = 3486,
            },
        },
    },
    {
        name = "Stanky Morgan",
        ids = {
            [6667] = true,
        },
        locations = {
            {
                x = 3047,
                z = 3257,
            },
            {
                x = 3666,
                z = 2984,
            },
        },
    },
    {
        name = "Stanley Limelight",
        ids = {
            [21056] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3082,
            },
            {
                x = 2530,
                z = 3577,
            },
            {
                x = 2663,
                z = 3155,
            },
            {
                x = 2667,
                z = 2639,
            },
            {
                x = 2954,
                z = 3415,
            },
            {
                x = 3818,
                z = 3021,
            },
        },
    },
    {
        name = "Stiles",
        ids = {
            [11267] = true,
        },
        locations = {
            {
                x = 2851,
                z = 3143,
            },
        },
    },
    {
        name = "Stonemason",
        ids = {
            [5261] = true,
        },
        locations = {
            {
                x = 3316,
                z = 2756,
            },
        },
    },
    {
        name = "Strange Old Man",
        ids = {
            [2024] = true,
        },
        locations = {
            {
                x = 3565,
                z = 3288,
            },
        },
    },
    {
        name = "Strange Old Mane",
        ids = {
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
        },
    },
    {
        name = "Strange plant",
        ids = {
            [8640] = true,
        },
        locations = {
            {
                x = 2738,
                z = 3196,
            },
        },
    },
    {
        name = "Stranger",
        ids = {
            [2020] = true,
        },
        locations = {
            {
                x = 3386,
                z = 3274,
            },
            {
                x = 3503,
                z = 3477,
            },
        },
    },
    {
        name = "Stray dog",
        ids = {
            [4766] = true,
            [4767] = true,
            [16709] = true,
            [16710] = true,
            [18810] = true,
            [20497] = true,
        },
        locations = {
            {
                x = 3168,
                z = 3440,
            },
            {
                x = 3200,
                z = 3399,
            },
            {
                x = 3233,
                z = 3394,
            },
            {
                x = 3262,
                z = 3410,
            },
            {
                x = 3277,
                z = 3381,
            },
            {
                x = 3279,
                z = 3520,
            },
            {
                x = 3318,
                z = 3553,
            },
            {
                x = 3602,
                z = 3205,
            },
            {
                x = 3605,
                z = 3282,
            },
            {
                x = 3609,
                z = 3186,
            },
            {
                x = 3621,
                z = 3213,
            },
            {
                x = 3622,
                z = 3219,
            },
            {
                x = 3625,
                z = 3200,
            },
            {
                x = 3630,
                z = 3261,
            },
            {
                x = 3636,
                z = 3284,
            },
            {
                x = 3637,
                z = 3313,
            },
            {
                x = 3641,
                z = 3301,
            },
        },
    },
    {
        name = "Street urchin",
        ids = {
            [1868] = true,
        },
        locations = {
            {
                x = 3352,
                z = 2958,
            },
            {
                x = 3355,
                z = 2972,
            },
            {
                x = 3364,
                z = 2980,
            },
        },
    },
    {
        name = "Strykewyrm hunter",
        ids = {
            [14621] = true,
        },
        locations = {
            {
                x = 3388,
                z = 3167,
            },
        },
    },
    {
        name = "Strykewyrm Jim",
        ids = {
            [24713] = true,
        },
        locations = {
            {
                x = 3166,
                z = 2615,
            },
        },
    },
    {
        name = "Stubthumb",
        ids = {
            [8072] = true,
        },
        locations = {
            {
                x = 2971,
                z = 3515,
            },
        },
    },
    {
        name = "Student",
        ids = {
            [7152] = true,
            [7153] = true,
            [7154] = true,
            [7155] = true,
            [7156] = true,
            [7157] = true,
        },
        locations = {
            {
                x = 3077,
                z = 3453,
            },
            {
                x = 3077,
                z = 3457,
            },
            {
                x = 3079,
                z = 3455,
            },
            {
                x = 3079,
                z = 3457,
            },
            {
                x = 3081,
                z = 3453,
            },
            {
                x = 3081,
                z = 3455,
            },
        },
    },
    {
        name = "Styrmir",
        ids = {
            [1275] = true,
        },
        locations = {
            {
                x = 2657,
                z = 3680,
            },
        },
    },
    {
        name = "Suak",
        ids = {
            [6654] = true,
        },
        locations = {
            {
                x = 3059,
                z = 3344,
            },
        },
    },
    {
        name = "Suit of armour",
        ids = {
            [31393] = true,
        },
        locations = {
            {
                x = 2985,
                z = 3343,
            },
        },
    },
    {
        name = "Summer",
        ids = {
            [13482] = true,
        },
        locations = {
            {
                x = 3257,
                z = 3519,
            },
        },
    },
    {
        name = "Sumona",
        ids = {
            [7779] = true,
        },
        locations = {
            {
                x = 3358,
                z = 2993,
            },
        },
    },
    {
        name = "Surgeon General Tafani",
        ids = {
            [961] = true,
        },
        locations = {
            {
                x = 3294,
                z = 3218,
            },
        },
    },
    {
        name = "Surok Magis",
        ids = {
            [5834] = true,
            [8442] = true,
        },
        locations = {
            {
                x = 2989,
                z = 3345,
            },
            {
                x = 3211,
                z = 3493,
            },
        },
    },
    {
        name = "Survival expert",
        ids = {
            [22106] = true,
        },
        locations = {
            {
                x = 3001,
                z = 3110,
            },
        },
    },
    {
        name = "Svidi",
        ids = {
            [1809] = true,
        },
        locations = {
            {
                x = 2712,
                z = 3672,
            },
            {
                x = 2714,
                z = 3672,
            },
        },
    },
    {
        name = "Swamp toad",
        ids = {
            [1013] = true,
        },
        locations = {
            {
                x = 2332,
                z = 3061,
            },
            {
                x = 2332,
                z = 3063,
            },
            {
                x = 2333,
                z = 3060,
            },
            {
                x = 2334,
                z = 3065,
            },
            {
                x = 2335,
                z = 3067,
            },
            {
                x = 2336,
                z = 3059,
            },
            {
                x = 2336,
                z = 3068,
            },
            {
                x = 2337,
                z = 3067,
            },
            {
                x = 2338,
                z = 3056,
            },
            {
                x = 2338,
                z = 3061,
            },
            {
                x = 2339,
                z = 3066,
            },
            {
                x = 2340,
                z = 3056,
            },
            {
                x = 2341,
                z = 3062,
            },
            {
                x = 2342,
                z = 3057,
            },
            {
                x = 2342,
                z = 3062,
            },
            {
                x = 2391,
                z = 3053,
            },
            {
                x = 2392,
                z = 3051,
            },
            {
                x = 2394,
                z = 3043,
            },
            {
                x = 2394,
                z = 3045,
            },
            {
                x = 2394,
                z = 3056,
            },
            {
                x = 2395,
                z = 3052,
            },
            {
                x = 2397,
                z = 3040,
            },
            {
                x = 2397,
                z = 3053,
            },
            {
                x = 2398,
                z = 3047,
            },
            {
                x = 2399,
                z = 3046,
            },
            {
                x = 2400,
                z = 3040,
            },
            {
                x = 2402,
                z = 3042,
            },
            {
                x = 2523,
                z = 2977,
            },
            {
                x = 2524,
                z = 2981,
            },
            {
                x = 2525,
                z = 2975,
            },
            {
                x = 2528,
                z = 2983,
            },
            {
                x = 2530,
                z = 2978,
            },
            {
                x = 2543,
                z = 2984,
            },
            {
                x = 2545,
                z = 2988,
            },
            {
                x = 2547,
                z = 2982,
            },
            {
                x = 2551,
                z = 2985,
            },
            {
                x = 2595,
                z = 2964,
            },
            {
                x = 2595,
                z = 2968,
            },
            {
                x = 2596,
                z = 2962,
            },
            {
                x = 2596,
                z = 2970,
            },
            {
                x = 2599,
                z = 2962,
            },
            {
                x = 2599,
                z = 2970,
            },
            {
                x = 2602,
                z = 2969,
            },
            {
                x = 2603,
                z = 2966,
            },
        },
    },
    {
        name = "Swan",
        ids = {
            [3296] = true,
        },
        locations = {
            {
                x = 2958,
                z = 3358,
            },
            {
                x = 2961,
                z = 3360,
            },
            {
                x = 2967,
                z = 3361,
            },
            {
                x = 2970,
                z = 3359,
            },
            {
                x = 2975,
                z = 3358,
            },
            {
                x = 2978,
                z = 3358,
            },
            {
                x = 2989,
                z = 3383,
            },
        },
    },
    {
        name = "Swarm",
        ids = {
            [411] = true,
        },
        locations = {
            {
                x = 2883,
                z = 3155,
            },
            {
                x = 2883,
                z = 3160,
            },
        },
    },
    {
        name = "Swensen the Navigator",
        ids = {
            [1283] = true,
        },
        locations = {
            {
                x = 2646,
                z = 3660,
            },
        },
    },
    {
        name = "Sydekix",
        ids = {
            [3341] = true,
        },
        locations = {
            {
                x = 3325,
                z = 3306,
            },
        },
    },
    {
        name = "Sylas",
        ids = {
            [5987] = true,
        },
        locations = {
            {
                x = 2912,
                z = 3379,
            },
        },
    },
    {
        name = "Talent scout",
        ids = {
            [14362] = true,
            [14363] = true,
            [14364] = true,
        },
        locations = {
            {
                x = 2477,
                z = 3440,
            },
            {
                x = 2544,
                z = 3550,
            },
            {
                x = 2774,
                z = 2747,
            },
            {
                x = 3003,
                z = 3932,
            },
            {
                x = 3332,
                z = 3244,
            },
            {
                x = 3350,
                z = 2831,
            },
        },
    },
    {
        name = "Talsar",
        ids = {
            [16827] = true,
        },
        locations = {
            {
                x = 3430,
                z = 3692,
            },
        },
    },
    {
        name = "Tam McGrubor",
        ids = {
            [14414] = true,
        },
        locations = {
            {
                x = 2918,
                z = 3541,
            },
        },
    },
    {
        name = "Tamayu",
        ids = {
            [2487] = true,
            [2488] = true,
        },
        locations = {
            {
                x = 2800,
                z = 3057,
            },
            {
                x = 2844,
                z = 3042,
            },
        },
    },
    {
        name = "Tamble",
        ids = {
            [4574] = true,
        },
        locations = {
            {
                x = 2442,
                z = 3503,
            },
        },
    },
    {
        name = "Tanner",
        ids = {
            [2320] = true,
        },
        locations = {
            {
                x = 3188,
                z = 3407,
            },
        },
    },
    {
        name = "Tanya Hyde",
        ids = {
            [28212] = true,
        },
        locations = {
            {
                x = 2881,
                z = 3487,
            },
        },
    },
    {
        name = "Taria",
        ids = {
            [2336] = true,
        },
        locations = {
            {
                x = 2940,
                z = 3223,
            },
            {
                x = 2941,
                z = 3257,
            },
        },
    },
    {
        name = "Tarik",
        ids = {
            [4478] = true,
        },
        locations = {
            {
                x = 3289,
                z = 2787,
            },
        },
    },
    {
        name = "Tarquin",
        ids = {
            [3328] = true,
        },
        locations = {
            {
                x = 3203,
                z = 3344,
            },
        },
    },
    {
        name = "Tassie Slipcast",
        ids = {
            [1793] = true,
        },
        locations = {
            {
                x = 3084,
                z = 3408,
            },
        },
    },
    {
        name = "Taxidermist",
        ids = {
            [4246] = true,
        },
        locations = {
            {
                x = 3480,
                z = 3484,
            },
        },
    },
    {
        name = "Tea seller",
        ids = {
            [595] = true,
        },
        locations = {
            {
                x = 3271,
                z = 3411,
            },
        },
    },
    {
        name = "Teclyn",
        ids = {
            [2861] = true,
        },
        locations = {
            {
                x = 2344,
                z = 3163,
            },
        },
    },
    {
        name = "Ted Rehnison",
        ids = {
            [721] = true,
        },
        locations = {
            {
                x = 2531,
                z = 3331,
            },
        },
    },
    {
        name = "Teelee",
        ids = {
            [24829] = true,
        },
        locations = {
            {
                x = 2289,
                z = 2801,
            },
        },
    },
    {
        name = "Tefibi",
        ids = {
            [24692] = true,
        },
        locations = {
            {
                x = 3157,
                z = 2772,
            },
        },
    },
    {
        name = "Tegid",
        ids = {
            [1213] = true,
        },
        locations = {
            {
                x = 2920,
                z = 3418,
            },
        },
    },
    {
        name = "Telekinetic Guardian",
        ids = {},
        locations = {
            {
                x = 3363,
                z = 3300,
            },
        },
    },
    {
        name = "Teodor",
        ids = {
            [21521] = true,
        },
        locations = {
            {
                x = 3504,
                z = 3242,
            },
        },
    },
    {
        name = "Teplin Macagan",
        ids = {
            [3402] = true,
        },
        locations = {
            {
                x = 2560,
                z = 2842,
            },
        },
    },
    {
        name = "Terrorchick",
        ids = {
            [137] = true,
        },
        locations = {
            {
                x = 2440,
                z = 3500,
            },
            {
                x = 2440,
                z = 3502,
            },
        },
    },
    {
        name = "Terry (2015 April Fools)",
        ids = {
            [20935] = true,
        },
        locations = {
            {
                x = 3119,
                z = 3380,
            },
        },
    },
    {
        name = "Terry Balando",
        ids = {
            [619] = true,
        },
        locations = {
            {
                x = 3363,
                z = 3346,
            },
        },
    },
    {
        name = "Terry Gord",
        ids = {
            [11516] = true,
        },
        locations = {
            {
                x = 2666,
                z = 2652,
            },
        },
    },
    {
        name = "Thaerisk Cemphier",
        ids = {
            [27753] = true,
        },
        locations = {
            {
                x = 3317,
                z = 3355,
            },
        },
    },
    {
        name = "Thaki the delivery dwarf",
        ids = {
            [7115] = true,
        },
        locations = {
            {
                x = 3051,
                z = 3259,
            },
        },
    },
    {
        name = "Thakkrad Sigmundson",
        ids = {
            [5506] = true,
        },
        locations = {
            {
                x = 2334,
                z = 3798,
            },
        },
    },
    {
        name = "The Curator",
        ids = {
            [22306] = true,
            [22455] = true,
            [29178] = true,
        },
        locations = {
            {
                x = 2886,
                z = 3522,
            },
            {
                x = 2898,
                z = 3553,
            },
            {
                x = 3380,
                z = 2875,
            },
        },
    },
    {
        name = "The death of innocence",
        ids = {},
        locations = {
            {
                x = 3093,
                z = 3478,
            },
        },
    },
    {
        name = "The Face",
        ids = {
            [2950] = true,
        },
        locations = {
            {
                x = 3019,
                z = 3231,
            },
            {
                x = 3019,
                z = 3251,
            },
        },
    },
    {
        name = "The Iron Link",
        ids = {
            [22708] = true,
        },
        locations = {
            {
                x = 2939,
                z = 3132,
            },
        },
    },
    {
        name = "The Lady of the Lake",
        ids = {
            [250] = true,
        },
        locations = {
            {
                x = 2924,
                z = 3405,
            },
        },
    },
    {
        name = "The making of a monster",
        ids = {},
        locations = {
            {
                x = 3244,
                z = 3400,
            },
        },
    },
    {
        name = "The Monkey's Aunt",
        ids = {
            [1454] = true,
        },
        locations = {
            {
                x = 2738,
                z = 2794,
            },
        },
    },
    {
        name = "The Postcat",
        ids = {
            [24417] = true,
        },
        locations = {
            {
                x = 3141,
                z = 2853,
            },
        },
    },
    {
        name = "The Raptor",
        ids = {
            [13955] = true,
            [15474] = true,
            [30043] = true,
        },
        locations = {
            {
                x = 2995,
                z = 3231,
            },
            {
                x = 3290,
                z = 3540,
            },
            {
                x = 3292,
                z = 3543,
            },
            {
                x = 3464,
                z = 3700,
            },
        },
    },
    {
        name = "The Sage",
        ids = {
            [32250] = true,
        },
        locations = {
            {
                x = 3222,
                z = 3215,
            },
        },
    },
    {
        name = "Theh Orses",
        ids = {
            [406] = true,
        },
        locations = {
            {
                x = 2777,
                z = 3213,
            },
        },
    },
    {
        name = "Theho Rses",
        ids = {
            [413] = true,
        },
        locations = {
            {
                x = 2833,
                z = 2952,
            },
        },
    },
    {
        name = "Thessalia",
        ids = {
            [548] = true,
        },
        locations = {
            {
                x = 3204,
                z = 3417,
            },
        },
    },
    {
        name = "Thias Leacke",
        ids = {
            [5935] = true,
        },
        locations = {
            {
                x = 3260,
                z = 3442,
            },
        },
    },
    {
        name = "Thistle",
        ids = {
            [1214] = true,
        },
        locations = {
            {
                x = 2880,
                z = 3668,
            },
            {
                x = 2886,
                z = 3668,
            },
            {
                x = 2887,
                z = 3660,
            },
            {
                x = 2892,
                z = 3671,
            },
            {
                x = 2898,
                z = 3682,
            },
            {
                x = 2899,
                z = 3668,
            },
            {
                x = 2901,
                z = 3679,
            },
        },
    },
    {
        name = "Thok of Daemonheim",
        ids = {
            [9713] = true,
        },
        locations = {
            {
                x = 3439,
                z = 3698,
            },
        },
    },
    {
        name = "Thomas",
        ids = {
            [26577] = true,
        },
        locations = {
            {
                x = 3223,
                z = 3402,
            },
        },
    },
    {
        name = "Thora the Barkeep",
        ids = {
            [1300] = true,
        },
        locations = {
            {
                x = 2662,
                z = 3673,
            },
        },
    },
    {
        name = "Thorkel Silkbeard",
        ids = {
            [5480] = true,
        },
        locations = {
            {
                x = 2409,
                z = 3804,
            },
        },
    },
    {
        name = "Thorvald the Warrior",
        ids = {
            [1289] = true,
        },
        locations = {
            {
                x = 2666,
                z = 3693,
            },
        },
    },
    {
        name = "Thuddley",
        ids = {
            [15240] = true,
        },
        locations = {
            {
                x = 2517,
                z = 2840,
            },
        },
    },
    {
        name = "Thump",
        ids = {
            [7100] = true,
            [7101] = true,
        },
        locations = {
            {
                x = 2585,
                z = 2842,
            },
            {
                x = 2586,
                z = 2840,
            },
        },
    },
    {
        name = "Thurgo",
        ids = {
            [604] = true,
        },
        locations = {
            {
                x = 3001,
                z = 3144,
            },
        },
    },
    {
        name = "Tiadeche",
        ids = {
            [2483] = true,
            [2484] = true,
        },
        locations = {
            {
                x = 2781,
                z = 3057,
            },
            {
                x = 2912,
                z = 3118,
            },
        },
    },
    {
        name = "Tick-Tock",
        ids = {},
        locations = {
            {
                x = 3377,
                z = 3259,
            },
        },
    },
    {
        name = "Ticket Merchant",
        ids = {
            [694] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3429,
            },
            {
                x = 2659,
                z = 3431,
            },
        },
    },
    {
        name = "Tindel Marchant",
        ids = {
            [1799] = true,
        },
        locations = {
            {
                x = 2678,
                z = 3153,
            },
        },
    },
    {
        name = "Tinsay",
        ids = {
            [2485] = true,
            [2486] = true,
        },
        locations = {
            {
                x = 2764,
                z = 2976,
            },
            {
                x = 2790,
                z = 3054,
            },
        },
    },
    {
        name = "Tinse Torpe",
        ids = {
            [5937] = true,
        },
        locations = {
            {
                x = 3267,
                z = 3444,
            },
        },
    },
    {
        name = "Tithe master",
        ids = {
            [3634] = true,
        },
        locations = {
            {
                x = 3590,
                z = 3365,
            },
        },
    },
    {
        name = "Toban",
        ids = {
            [855] = true,
        },
        locations = {
            {
                x = 2576,
                z = 3027,
            },
        },
    },
    {
        name = "Tool leprechaun",
        ids = {
            [3021] = true,
            [3121] = true,
            [7557] = true,
            [7558] = true,
            [7559] = true,
            [7560] = true,
            [7561] = true,
            [7562] = true,
            [7563] = true,
            [7564] = true,
            [7565] = true,
            [7567] = true,
            [7569] = true,
            [24796] = true,
        },
        locations = {
            {
                x = 2439,
                z = 3414,
            },
            {
                x = 2478,
                z = 3444,
            },
            {
                x = 2491,
                z = 3178,
            },
            {
                x = 2573,
                z = 3107,
            },
            {
                x = 2589,
                z = 3863,
            },
            {
                x = 2618,
                z = 3223,
            },
            {
                x = 2632,
                z = 3313,
            },
            {
                x = 2660,
                z = 3376,
            },
            {
                x = 2671,
                z = 3525,
            },
            {
                x = 2764,
                z = 3210,
            },
            {
                x = 2789,
                z = 3465,
            },
            {
                x = 2797,
                z = 3104,
            },
            {
                x = 2812,
                z = 3334,
            },
            {
                x = 2859,
                z = 3430,
            },
            {
                x = 2887,
                z = 3463,
            },
            {
                x = 2939,
                z = 3219,
            },
            {
                x = 2953,
                z = 2908,
            },
            {
                x = 3004,
                z = 3376,
            },
            {
                x = 3056,
                z = 3310,
            },
            {
                x = 3064,
                z = 3255,
            },
            {
                x = 3087,
                z = 3352,
            },
            {
                x = 3173,
                z = 2765,
            },
            {
                x = 3182,
                z = 3354,
            },
            {
                x = 3229,
                z = 3457,
            },
            {
                x = 3231,
                z = 3248,
            },
            {
                x = 3231,
                z = 3320,
            },
            {
                x = 3318,
                z = 3203,
            },
            {
                x = 3341,
                z = 3205,
            },
            {
                x = 3357,
                z = 3542,
            },
            {
                x = 3449,
                z = 3474,
            },
            {
                x = 3604,
                z = 3528,
            },
            {
                x = 3796,
                z = 2837,
            },
        },
    },
    {
        name = "Tool Leprechaun",
        ids = {
            [4965] = true,
        },
        locations = {
            {
                x = 2810,
                z = 3676,
            },
        },
    },
    {
        name = "Toothless",
        ids = {},
        locations = {
            {
                x = 3396,
                z = 3247,
            },
        },
    },
    {
        name = "Torbrund",
        ids = {
            [1276] = true,
        },
        locations = {
            {
                x = 2658,
                z = 3679,
            },
        },
    },
    {
        name = "Torrell",
        ids = {
            [2338] = true,
        },
        locations = {
            {
                x = 2617,
                z = 3227,
            },
        },
    },
    {
        name = "Torsteg",
        ids = {
            [13463] = true,
        },
        locations = {
            {
                x = 3387,
                z = 3619,
            },
        },
    },
    {
        name = "Tostig",
        ids = {
            [1079] = true,
        },
        locations = {
            {
                x = 2891,
                z = 3447,
            },
        },
    },
    {
        name = "Town crier",
        ids = {
            [6135] = true,
            [6136] = true,
            [6137] = true,
            [6138] = true,
            [6139] = true,
        },
        locations = {
            {
                x = 2665,
                z = 3311,
            },
            {
                x = 2739,
                z = 3481,
            },
            {
                x = 2952,
                z = 3380,
            },
            {
                x = 3079,
                z = 3249,
            },
            {
                x = 3253,
                z = 3429,
            },
        },
    },
    {
        name = "Town Guard",
        ids = {
            [1298] = true,
            [1299] = true,
        },
        locations = {
            {
                x = 2660,
                z = 3646,
            },
            {
                x = 2663,
                z = 3646,
            },
        },
    },
    {
        name = "Tracker gnome 1",
        ids = {
            [481] = true,
        },
        locations = {
            {
                x = 2502,
                z = 3261,
            },
        },
    },
    {
        name = "Tracker gnome 2",
        ids = {
            [482] = true,
        },
        locations = {
            {
                x = 2524,
                z = 3257,
            },
        },
    },
    {
        name = "Tracker gnome 3",
        ids = {
            [483] = true,
        },
        locations = {
            {
                x = 2496,
                z = 3235,
            },
        },
    },
    {
        name = "Trader Crewmember",
        ids = {
            [4651] = true,
            [4652] = true,
            [4653] = true,
            [4654] = true,
            [4655] = true,
            [4656] = true,
            [7065] = true,
            [7066] = true,
            [22692] = true,
            [24730] = true,
            [24731] = true,
        },
        locations = {
            {
                x = 2144,
                z = 3122,
            },
            {
                x = 2145,
                z = 3122,
            },
            {
                x = 2619,
                z = 2856,
            },
            {
                x = 2621,
                z = 2857,
            },
            {
                x = 2673,
                z = 3144,
            },
            {
                x = 2675,
                z = 3144,
            },
            {
                x = 2759,
                z = 3239,
            },
            {
                x = 2760,
                z = 3239,
            },
            {
                x = 2793,
                z = 3407,
            },
            {
                x = 2794,
                z = 3407,
            },
            {
                x = 2954,
                z = 3156,
            },
            {
                x = 2954,
                z = 3157,
            },
            {
                x = 3001,
                z = 3033,
            },
            {
                x = 3001,
                z = 3034,
            },
            {
                x = 3039,
                z = 3191,
            },
            {
                x = 3042,
                z = 3190,
            },
            {
                x = 3140,
                z = 2662,
            },
            {
                x = 3143,
                z = 2662,
            },
            {
                x = 3671,
                z = 2930,
            },
            {
                x = 3672,
                z = 2930,
            },
            {
                x = 3701,
                z = 3502,
            },
            {
                x = 3701,
                z = 3503,
            },
        },
    },
    {
        name = "Trader Stan",
        ids = {
            [4650] = true,
        },
        locations = {
            {
                x = 3033,
                z = 3190,
            },
        },
    },
    {
        name = "Trader Sven",
        ids = {
            [4716] = true,
        },
        locations = {
            {
                x = 3603,
                z = 3201,
            },
        },
    },
    {
        name = "Trainee",
        ids = {
            [26884] = true,
            [26885] = true,
            [26886] = true,
            [26919] = true,
        },
        locations = {
            {
                x = 3348,
                z = 3375,
            },
            {
                x = 3348,
                z = 3387,
            },
            {
                x = 3350,
                z = 3408,
            },
            {
                x = 3380,
                z = 3382,
            },
            {
                x = 3728,
                z = 3221,
            },
            {
                x = 3766,
                z = 3211,
            },
        },
    },
    {
        name = "Trainee adventurer",
        ids = {
            [22327] = true,
            [22328] = true,
            [22330] = true,
            [22331] = true,
            [22332] = true,
        },
        locations = {
            {
                x = 3341,
                z = 2883,
            },
            {
                x = 3341,
                z = 2886,
            },
            {
                x = 3342,
                z = 2891,
            },
            {
                x = 3343,
                z = 2870,
            },
            {
                x = 3343,
                z = 2890,
            },
            {
                x = 3344,
                z = 2870,
            },
            {
                x = 3349,
                z = 2892,
            },
            {
                x = 3353,
                z = 2879,
            },
            {
                x = 3353,
                z = 2884,
            },
            {
                x = 3380,
                z = 2909,
            },
            {
                x = 3381,
                z = 2908,
            },
            {
                x = 3385,
                z = 2903,
            },
            {
                x = 3386,
                z = 2912,
            },
            {
                x = 3387,
                z = 2911,
            },
        },
    },
    {
        name = "Trainer Nacklepen",
        ids = {
            [3818] = true,
        },
        locations = {
            {
                x = 2421,
                z = 3525,
            },
        },
    },
    {
        name = "Tramp",
        ids = {
            [11] = true,
            [2792] = true,
            [2793] = true,
            [2794] = true,
        },
        locations = {
            {
                x = 2606,
                z = 3100,
            },
            {
                x = 2683,
                z = 3484,
            },
            {
                x = 3228,
                z = 3412,
            },
            {
                x = 3235,
                z = 3401,
            },
        },
    },
    {
        name = "Tree",
        ids = {
            [1226] = true,
        },
        locations = {
            {
                x = 3556,
                z = 3470,
            },
            {
                x = 3570,
                z = 3507,
            },
            {
                x = 3577,
                z = 3493,
            },
            {
                x = 3579,
                z = 3477,
            },
            {
                x = 3586,
                z = 3482,
            },
            {
                x = 3596,
                z = 3477,
            },
            {
                x = 3600,
                z = 3506,
            },
            {
                x = 3607,
                z = 3497,
            },
            {
                x = 3610,
                z = 3465,
            },
            {
                x = 3613,
                z = 3491,
            },
            {
                x = 3617,
                z = 3514,
            },
            {
                x = 3619,
                z = 3502,
            },
            {
                x = 3628,
                z = 3476,
            },
            {
                x = 3629,
                z = 3509,
            },
            {
                x = 3630,
                z = 3489,
            },
        },
    },
    {
        name = "Trefaji",
        ids = {
            [1431] = true,
        },
        locations = {
            {
                x = 2768,
                z = 2803,
            },
        },
    },
    {
        name = "Trevelian",
        ids = {
            [20470] = true,
        },
        locations = {
            {
                x = 2226,
                z = 3133,
            },
        },
    },
    {
        name = "Treznor",
        ids = {
            [2341] = true,
        },
        locations = {
            {
                x = 3226,
                z = 3458,
            },
        },
    },
    {
        name = "Tribal Weapon Salesman",
        ids = {
            [692] = true,
        },
        locations = {
            {
                x = 2661,
                z = 3419,
            },
        },
    },
    {
        name = "Trobert",
        ids = {
            [1884] = true,
        },
        locations = {
            {
                x = 2806,
                z = 3174,
            },
        },
    },
    {
        name = "Trogen Konungarde",
        ids = {
            [5519] = true,
        },
        locations = {
            {
                x = 2338,
                z = 3800,
            },
        },
    },
    {
        name = "Trogs",
        ids = {
            [8202] = true,
        },
        locations = {
            {
                x = 3075,
                z = 3299,
            },
        },
    },
    {
        name = "Troll child",
        ids = {
            [1932] = true,
        },
        locations = {
            {
                x = 2835,
                z = 3740,
            },
        },
    },
    {
        name = "Troll father",
        ids = {
            [1947] = true,
        },
        locations = {
            {
                x = 2833,
                z = 3740,
            },
        },
    },
    {
        name = "Troll mother",
        ids = {
            [1945] = true,
            [1949] = true,
        },
        locations = {
            {
                x = 2825,
                z = 3811,
            },
            {
                x = 2836,
                z = 3740,
            },
        },
    },
    {
        name = "Trufitus",
        ids = {
            [740] = true,
        },
        locations = {
            {
                x = 2809,
                z = 3086,
            },
        },
    },
    {
        name = "Tuai Leit gem trader",
        ids = {
            [24433] = true,
        },
        locations = {
            {
                x = 3173,
                z = 2613,
            },
        },
    },
    {
        name = "Tunks",
        ids = {
            [21822] = true,
            [21878] = true,
        },
        locations = {
            {
                x = 3105,
                z = 2855,
            },
            {
                x = 3110,
                z = 2854,
            },
        },
    },
    {
        name = "Turael",
        ids = {
            [8474] = true,
            [8480] = true,
        },
        locations = {
            {
                x = 2890,
                z = 3548,
            },
            {
                x = 2996,
                z = 3339,
            },
        },
    },
    {
        name = "Tutab",
        ids = {
            [1435] = true,
        },
        locations = {
            {
                x = 2757,
                z = 2770,
            },
        },
    },
    {
        name = "Twig",
        ids = {
            [14786] = true,
        },
        locations = {
            {
                x = 2360,
                z = 3380,
            },
        },
    },
    {
        name = "Twilight of the Gods/Quick guide",
        ids = {},
        locations = {
            {
                x = 3318,
                z = 3340,
            },
        },
    },
    {
        name = "Twilight Pegasus",
        ids = {
            [26855] = true,
        },
        locations = {
            {
                x = 2887,
                z = 3520,
            },
        },
    },
    {
        name = "Tyke",
        ids = {
            [15236] = true,
        },
        locations = {
            {
                x = 2531,
                z = 2850,
            },
        },
    },
    {
        name = "Tyras guard",
        ids = {
            [7120] = true,
        },
        locations = {
            {
                x = 2181,
                z = 3184,
            },
        },
    },
    {
        name = "TzHaar-Mej-Jal",
        ids = {
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
        },
    },
    {
        name = "Ube",
        ids = {
            [8068] = true,
        },
        locations = {
            {
                x = 3234,
                z = 3526,
            },
        },
    },
    {
        name = "Uglug Nar",
        ids = {
            [2039] = true,
        },
        locations = {
            {
                x = 2442,
                z = 3049,
            },
        },
    },
    {
        name = "Ulizius",
        ids = {
            [1054] = true,
        },
        locations = {
            {
                x = 3444,
                z = 3459,
            },
        },
    },
    {
        name = "Ulsquire Shauncy",
        ids = {
            [7898] = true,
        },
        locations = {
            {
                x = 3496,
                z = 3289,
            },
        },
    },
    {
        name = "Unarmed monkey guard",
        ids = {
            [13193] = true,
        },
        locations = {
            {
                x = 3226,
                z = 2984,
            },
        },
    },
    {
        name = "Undead broav",
        ids = {
            [14331] = true,
        },
        locations = {
            {
                x = 2838,
                z = 3901,
            },
            {
                x = 2887,
                z = 3870,
            },
            {
                x = 2891,
                z = 3884,
            },
            {
                x = 2915,
                z = 3867,
            },
            {
                x = 2919,
                z = 3860,
            },
            {
                x = 2921,
                z = 3878,
            },
        },
    },
    {
        name = "Undead mage",
        ids = {
            [8486] = true,
        },
        locations = {
            {
                x = 2907,
                z = 3804,
            },
            {
                x = 2908,
                z = 3811,
            },
            {
                x = 2912,
                z = 3809,
            },
            {
                x = 2918,
                z = 3822,
            },
            {
                x = 2923,
                z = 3820,
            },
            {
                x = 2925,
                z = 3827,
            },
        },
    },
    {
        name = "Undead tree",
        ids = {
            [152] = true,
        },
        locations = {
            {
                x = 3103,
                z = 3347,
            },
            {
                x = 3107,
                z = 3337,
            },
            {
                x = 3107,
                z = 3342,
            },
            {
                x = 3107,
                z = 3344,
            },
            {
                x = 3108,
                z = 3346,
            },
            {
                x = 3111,
                z = 3339,
            },
            {
                x = 3111,
                z = 3348,
            },
            {
                x = 3115,
                z = 3344,
            },
            {
                x = 3120,
                z = 3344,
            },
            {
                x = 3122,
                z = 3335,
            },
            {
                x = 3137,
                z = 3359,
            },
            {
                x = 3138,
                z = 3352,
            },
            {
                x = 3140,
                z = 3360,
            },
        },
    },
    {
        name = "Unferth",
        ids = {
            [2654] = true,
        },
        locations = {
            {
                x = 2929,
                z = 3539,
            },
        },
    },
    {
        name = "Urbi",
        ids = {
            [5266] = true,
            [32101] = true,
        },
        locations = {
            {
                x = 3289,
                z = 2806,
            },
            {
                x = 3300,
                z = 2762,
            },
        },
    },
    {
        name = "Urist Loric",
        ids = {
            [11270] = true,
        },
        locations = {
            {
                x = 3222,
                z = 3424,
            },
        },
    },
    {
        name = "Urluk",
        ids = {
            [24528] = true,
        },
        locations = {
            {
                x = 3210,
                z = 2784,
            },
        },
    },
    {
        name = "Usi",
        ids = {
            [3031] = true,
        },
        locations = {
            {
                x = 3428,
                z = 2908,
            },
        },
    },
    {
        name = "Uwogo",
        ids = {
            [1449] = true,
        },
        locations = {
            {
                x = 2801,
                z = 2764,
            },
        },
    },
    {
        name = "Vagabond Knight's armour",
        ids = {
            [29473] = true,
            [29474] = true,
        },
        locations = {
            {
                x = 2888,
                z = 3523,
            },
            {
                x = 2889,
                z = 3523,
            },
        },
    },
    {
        name = "Vala",
        ids = {
            [29340] = true,
        },
        locations = {
            {
                x = 3126,
                z = 3519,
            },
        },
    },
    {
        name = "Valentina Kaust",
        ids = {
            [14080] = true,
        },
        locations = {
            {
                x = 3629,
                z = 3387,
            },
        },
    },
    {
        name = "Valeria",
        ids = {
            [21516] = true,
        },
        locations = {
            {
                x = 3509,
                z = 3209,
            },
        },
    },
    {
        name = "Valerie",
        ids = {
            [31059] = true,
        },
        locations = {
            {
                x = 2969,
                z = 3281,
            },
        },
    },
    {
        name = "Valerio",
        ids = {
            [14640] = true,
            [14641] = true,
        },
        locations = {
            {
                x = 3400,
                z = 3149,
            },
            {
                x = 3426,
                z = 3177,
            },
        },
    },
    {
        name = "Vanessa",
        ids = {
            [2305] = true,
        },
        locations = {
            {
                x = 2785,
                z = 3453,
            },
        },
    },
    {
        name = "Vanligga Gastfrihet",
        ids = {},
        locations = {
            {
                x = 2407,
                z = 3813,
            },
        },
    },
    {
        name = "Vannaka",
        ids = {
            [1597] = true,
            [22067] = true,
        },
        locations = {
            {
                x = 3002,
                z = 3112,
            },
            {
                x = 3091,
                z = 3478,
            },
            {
                x = 3093,
                z = 3184,
            },
        },
    },
    {
        name = "Vasile",
        ids = {
            [22630] = true,
        },
        locations = {
            {
                x = 3484,
                z = 3238,
            },
        },
    },
    {
        name = "Vasquen",
        ids = {
            [2333] = true,
        },
        locations = {
            {
                x = 3226,
                z = 3311,
            },
        },
    },
    {
        name = "Veliaf Hurtz",
        ids = {
            [22543] = true,
        },
        locations = {
            {
                x = 3512,
                z = 3538,
            },
        },
    },
    {
        name = "Velorina",
        ids = {
            [1683] = true,
        },
        locations = {
            {
                x = 3678,
                z = 3510,
            },
        },
    },
    {
        name = "Velrak the explorer",
        ids = {
            [24151] = true,
        },
        locations = {
            {
                x = 2883,
                z = 3400,
            },
        },
    },
    {
        name = "Velucia",
        ids = {},
        locations = {
            {
                x = 3342,
                z = 3385,
            },
        },
    },
    {
        name = "Veronica",
        ids = {
            [285] = true,
        },
        locations = {
            {
                x = 3110,
                z = 3330,
            },
        },
    },
    {
        name = "Vertida Sefalatis",
        ids = {
            [14190] = true,
            [14192] = true,
            [21643] = true,
        },
        locations = {
            {
                x = 3599,
                z = 3258,
            },
            {
                x = 3611,
                z = 3265,
            },
            {
                x = 3638,
                z = 3367,
            },
        },
    },
    {
        name = "Vestri",
        ids = {
            [3679] = true,
        },
        locations = {
            {
                x = 2805,
                z = 3462,
            },
        },
    },
    {
        name = "Vibrant wisp",
        ids = {
            [18161] = true,
        },
        locations = {
            {
                x = 2410,
                z = 2848,
            },
            {
                x = 2411,
                z = 2850,
            },
            {
                x = 2411,
                z = 2860,
            },
            {
                x = 2413,
                z = 2851,
            },
            {
                x = 2415,
                z = 2862,
            },
            {
                x = 2416,
                z = 2853,
            },
            {
                x = 2422,
                z = 2861,
            },
            {
                x = 2422,
                z = 2872,
            },
            {
                x = 2426,
                z = 2860,
            },
            {
                x = 2426,
                z = 2867,
            },
            {
                x = 2429,
                z = 2859,
            },
            {
                x = 2430,
                z = 2857,
            },
            {
                x = 2431,
                z = 2859,
            },
        },
    },
    {
        name = "Victor",
        ids = {
            [13976] = true,
            [25895] = true,
        },
        locations = {
            {
                x = 3099,
                z = 3323,
            },
            {
                x = 3482,
                z = 3208,
            },
        },
    },
    {
        name = "Victoria",
        ids = {
            [7872] = true,
        },
        locations = {
            {
                x = 3231,
                z = 3207,
            },
        },
    },
    {
        name = "Vigr",
        ids = {
            [19651] = true,
        },
        locations = {
            {
                x = 2602,
                z = 3054,
            },
        },
    },
    {
        name = "Vigroy",
        ids = {
            [511] = true,
        },
        locations = {
            {
                x = 2834,
                z = 2954,
            },
        },
    },
    {
        name = "Villager",
        ids = {
            [1887] = true,
            [1891] = true,
            [1895] = true,
        },
        locations = {
            {
                x = 3342,
                z = 2954,
            },
            {
                x = 3349,
                z = 2954,
            },
            {
                x = 3355,
                z = 2949,
            },
            {
                x = 3355,
                z = 2957,
            },
            {
                x = 3356,
                z = 2984,
            },
            {
                x = 3358,
                z = 2969,
            },
            {
                x = 3359,
                z = 2975,
            },
            {
                x = 3361,
                z = 2967,
            },
            {
                x = 3361,
                z = 2969,
            },
            {
                x = 3362,
                z = 2975,
            },
            {
                x = 3363,
                z = 2963,
            },
            {
                x = 3365,
                z = 2991,
            },
            {
                x = 3367,
                z = 2983,
            },
            {
                x = 3367,
                z = 2991,
            },
        },
    },
    {
        name = "Vio the trader",
        ids = {
            [1191] = true,
        },
        locations = {
            {
                x = 2887,
                z = 3525,
            },
        },
    },
    {
        name = "VIP area guard",
        ids = {},
        locations = {
            {
                x = 3184,
                z = 2738,
            },
            {
                x = 3187,
                z = 2738,
            },
        },
    },
    {
        name = "Void Knight",
        ids = {
            [3786] = true,
            [3788] = true,
            [3789] = true,
            [5956] = true,
        },
        locations = {
            {
                x = 2638,
                z = 2656,
            },
            {
                x = 2647,
                z = 2660,
            },
            {
                x = 2652,
                z = 2660,
            },
            {
                x = 2653,
                z = 2652,
            },
        },
    },
    {
        name = "Volf Olafson",
        ids = {
            [3695] = true,
        },
        locations = {
            {
                x = 2659,
                z = 3698,
            },
        },
    },
    {
        name = "Vyrewatch",
        ids = {
            [21718] = true,
            [21721] = true,
            [21724] = true,
        },
        locations = {
            {
                x = 3589,
                z = 3356,
            },
            {
                x = 3590,
                z = 3356,
            },
            {
                x = 3591,
                z = 3356,
            },
        },
    },
    {
        name = "Vyrewatch mine guard",
        ids = {
            [22545] = true,
        },
        locations = {
            {
                x = 3622,
                z = 3323,
            },
        },
    },
    {
        name = "Vyrewatch tither",
        ids = {
            [17498] = true,
            [17499] = true,
            [17500] = true,
        },
        locations = {
            {
                x = 3616,
                z = 3392,
            },
            {
                x = 3622,
                z = 3390,
            },
            {
                x = 3622,
                z = 3392,
            },
        },
    },
    {
        name = "Wafa",
        ids = {
            [24554] = true,
        },
        locations = {
            {
                x = 3220,
                z = 2775,
            },
        },
    },
    {
        name = "Waldo",
        ids = {},
        locations = {
            {
                x = 3171,
                z = 3537,
            },
        },
    },
    {
        name = "Wall guard",
        ids = {
            [13696] = true,
        },
        locations = {
            {
                x = 2873,
                z = 3553,
            },
        },
    },
    {
        name = "Wanderer",
        ids = {
            [2002] = true,
        },
        locations = {
            {
                x = 3315,
                z = 2849,
            },
        },
    },
    {
        name = "Wandering wyrmwood",
        ids = {
            [15110] = true,
        },
        locations = {
            {
                x = 2915,
                z = 3378,
            },
            {
                x = 2915,
                z = 3381,
            },
            {
                x = 2916,
                z = 3379,
            },
            {
                x = 2916,
                z = 3381,
            },
            {
                x = 2921,
                z = 3380,
            },
        },
    },
    {
        name = "Wannabe Cultist",
        ids = {
            [27748] = true,
        },
        locations = {
            {
                x = 3109,
                z = 3336,
            },
        },
    },
    {
        name = "Warrior",
        ids = {
            [32434] = true,
        },
        locations = {
            {
                x = 3148,
                z = 3206,
            },
        },
    },
    {
        name = "Waseem the Leaflet Dropper",
        ids = {
            [26817] = true,
        },
        locations = {
            {
                x = 3283,
                z = 3324,
            },
        },
    },
    {
        name = "Waydar",
        ids = {
            [1407] = true,
        },
        locations = {
            {
                x = 2897,
                z = 2727,
            },
        },
    },
    {
        name = "Waylan",
        ids = {},
        locations = {
            {
                x = 2946,
                z = 3207,
            },
        },
    },
    {
        name = "Waylan's soul",
        ids = {
            [15498] = true,
        },
        locations = {
            {
                x = 2950,
                z = 3205,
            },
        },
    },
    {
        name = "Wayne",
        ids = {
            [581] = true,
        },
        locations = {
            {
                x = 2973,
                z = 3312,
            },
        },
    },
    {
        name = "Weird Old Man",
        ids = {
            [1152] = true,
        },
        locations = {
            {
                x = 3232,
                z = 3108,
            },
        },
    },
    {
        name = "Wendle",
        ids = {
            [32345] = true,
            [323461] = true,
        },
        locations = {
            {
                x = 3161,
                z = 3509,
            },
        },
    },
    {
        name = "Wendy",
        ids = {},
        locations = {
            {
                x = 3082,
                z = 3298,
            },
        },
    },
    {
        name = "Werewolf",
        ids = {
            [1665] = true,
        },
        locations = {
            {
                x = 3544,
                z = 3462,
            },
        },
    },
    {
        name = "White knight",
        ids = {
            [15465] = true,
            [15466] = true,
            [15467] = true,
        },
        locations = {
            {
                x = 2990,
                z = 3240,
            },
            {
                x = 2991,
                z = 3235,
            },
            {
                x = 2994,
                z = 3242,
            },
            {
                x = 2997,
                z = 3239,
            },
        },
    },
    {
        name = "Wiglaf",
        ids = {
            [9716] = true,
        },
        locations = {
            {
                x = 3431,
                z = 3697,
            },
        },
    },
    {
        name = "Wilbur",
        ids = {
            [13107] = true,
        },
        locations = {
            {
                x = 2885,
                z = 3425,
            },
        },
    },
    {
        name = "Wild broav",
        ids = {},
        locations = {
            {
                x = 2499,
                z = 2910,
            },
        },
    },
    {
        name = "Wild kebbit",
        ids = {
            [5089] = true,
        },
        locations = {
            {
                x = 2306,
                z = 3541,
            },
            {
                x = 2307,
                z = 3541,
            },
            {
                x = 2307,
                z = 3577,
            },
            {
                x = 2309,
                z = 3577,
            },
            {
                x = 2315,
                z = 3523,
            },
            {
                x = 2315,
                z = 3526,
            },
            {
                x = 2316,
                z = 3560,
            },
            {
                x = 2318,
                z = 3560,
            },
            {
                x = 2330,
                z = 3550,
            },
            {
                x = 2330,
                z = 3552,
            },
            {
                x = 2342,
                z = 3544,
            },
            {
                x = 2343,
                z = 3544,
            },
            {
                x = 2348,
                z = 3523,
            },
            {
                x = 2349,
                z = 3523,
            },
            {
                x = 2350,
                z = 3563,
            },
            {
                x = 2351,
                z = 3563,
            },
            {
                x = 2362,
                z = 3577,
            },
            {
                x = 2362,
                z = 3578,
            },
            {
                x = 2363,
                z = 3537,
            },
            {
                x = 2363,
                z = 3540,
            },
        },
    },
    {
        name = "Wilfred",
        ids = {
            [4906] = true,
        },
        locations = {
            {
                x = 2959,
                z = 3415,
            },
        },
    },
    {
        name = "Wilfred Butternut",
        ids = {
            [5155] = true,
        },
        locations = {
            {
                x = 2663,
                z = 3385,
            },
        },
    },
    {
        name = "Will",
        ids = {
            [12238] = true,
        },
        locations = {
            {
                x = 2738,
                z = 3466,
            },
        },
    },
    {
        name = "William",
        ids = {
            [1778] = true,
        },
        locations = {
            {
                x = 3218,
                z = 3879,
            },
            {
                x = 3243,
                z = 3848,
            },
        },
    },
    {
        name = "Willow",
        ids = {
            [30075] = true,
        },
        locations = {
            {
                x = 3353,
                z = 3546,
            },
        },
    },
    {
        name = "Wilough",
        ids = {
            [783] = true,
        },
        locations = {
            {
                x = 3221,
                z = 3435,
            },
        },
    },
    {
        name = "Wingstone",
        ids = {
            [4577] = true,
        },
        locations = {
            {
                x = 3379,
                z = 2893,
            },
        },
    },
    {
        name = "Wise Old Man",
        ids = {
            [2253] = true,
            [2567] = true,
            [11569] = true,
            [28626] = true,
        },
        locations = {
            {
                x = 2953,
                z = 3224,
            },
            {
                x = 2965,
                z = 3216,
            },
            {
                x = 3088,
                z = 3255,
            },
            {
                x = 3090,
                z = 3250,
            },
            {
                x = 3169,
                z = 3460,
            },
        },
    },
    {
        name = "Wise Old Man T-shirt",
        ids = {
            [29448] = true,
            [29449] = true,
        },
        locations = {
            {
                x = 3177,
                z = 3478,
            },
            {
                x = 3180,
                z = 3482,
            },
        },
    },
    {
        name = "Wiskit",
        ids = {
            [3511] = true,
        },
        locations = {
            {
                x = 3514,
                z = 3240,
            },
        },
    },
    {
        name = "Witchaven villager",
        ids = {
            [4857] = true,
            [4858] = true,
            [4859] = true,
            [4880] = true,
            [4881] = true,
            [4882] = true,
        },
        locations = {
            {
                x = 2706,
                z = 3287,
            },
            {
                x = 2707,
                z = 3287,
            },
            {
                x = 2715,
                z = 3278,
            },
            {
                x = 2716,
                z = 3278,
            },
            {
                x = 2716,
                z = 3289,
            },
            {
                x = 2717,
                z = 3289,
            },
            {
                x = 2721,
                z = 3292,
            },
            {
                x = 2722,
                z = 3292,
            },
            {
                x = 2728,
                z = 3274,
            },
            {
                x = 2729,
                z = 3274,
            },
            {
                x = 2733,
                z = 3284,
            },
            {
                x = 2734,
                z = 3284,
            },
            {
                x = 2737,
                z = 3300,
            },
        },
    },
    {
        name = "Wittelstix",
        ids = {
            [27756] = true,
        },
        locations = {
            {
                x = 3310,
                z = 3350,
            },
        },
    },
    {
        name = "Wizard",
        ids = {
            [32436] = true,
        },
        locations = {
            {
                x = 3152,
                z = 3204,
            },
        },
    },
    {
        name = "Wizard Borann",
        ids = {
            [16169] = true,
        },
        locations = {
            {
                x = 3099,
                z = 3156,
            },
        },
    },
    {
        name = "Wizard Chambers",
        ids = {
            [21104] = true,
            [21319] = true,
            [32318] = true,
        },
        locations = {
            {
                x = 2283,
                z = 3687,
            },
            {
                x = 3095,
                z = 2868,
            },
            {
                x = 3249,
                z = 3168,
            },
        },
    },
    {
        name = "Wizard Cromperty",
        ids = {
            [844] = true,
        },
        locations = {
            {
                x = 2683,
                z = 3323,
            },
        },
    },
    {
        name = "Wizard Distentor",
        ids = {
            [462] = true,
        },
        locations = {
            {
                x = 2594,
                z = 3089,
            },
        },
    },
    {
        name = "Wizard Ilona",
        ids = {
            [9633] = true,
        },
        locations = {
            {
                x = 3244,
                z = 3198,
            },
        },
    },
    {
        name = "Wizard Myrtle",
        ids = {
            [22064] = true,
        },
        locations = {
            {
                x = 3000,
                z = 3112,
            },
            {
                x = 3094,
                z = 3184,
            },
        },
    },
    {
        name = "Wizard Rosalina",
        ids = {
            [32312] = true,
        },
        locations = {
            {
                x = 2281,
                z = 3692,
            },
        },
    },
    {
        name = "Wizard Trindy",
        ids = {},
        locations = {
            {
                x = 3345,
                z = 3396,
            },
        },
    },
    {
        name = "Wizard Valina",
        ids = {
            [16186] = true,
        },
        locations = {
            {
                x = 3101,
                z = 3169,
            },
        },
    },
    {
        name = "Wolf hunter",
        ids = {
            [13462] = true,
        },
        locations = {
            {
                x = 3084,
                z = 3421,
            },
        },
    },
    {
        name = "Woman",
        ids = {
            [32424] = true,
            [32425] = true,
            [32426] = true,
        },
        locations = {
            {
                x = 3210,
                z = 3252,
            },
            {
                x = 3214,
                z = 3252,
            },
            {
                x = 3214,
                z = 3253,
            },
        },
    },
    {
        name = "Worker district musician",
        ids = {
            [24611] = true,
        },
        locations = {
            {
                x = 3155,
                z = 2794,
            },
        },
    },
    {
        name = "Wounded Soldier",
        ids = {},
        locations = {
            {
                x = 2908,
                z = 3567,
            },
            {
                x = 2933,
                z = 3567,
            },
        },
    },
    {
        name = "Wydin",
        ids = {
            [557] = true,
        },
        locations = {
            {
                x = 3014,
                z = 3204,
            },
        },
    },
    {
        name = "Wyson the gardener",
        ids = {
            [36] = true,
        },
        locations = {
            {
                x = 2987,
                z = 3386,
            },
        },
    },
    {
        name = "Xenia",
        ids = {
            [11476] = true,
            [13948] = true,
            [13952] = true,
            [20401] = true,
        },
        locations = {
            {
                x = 2568,
                z = 3280,
            },
            {
                x = 3104,
                z = 3184,
            },
            {
                x = 3193,
                z = 3357,
            },
            {
                x = 3223,
                z = 3471,
            },
            {
                x = 3244,
                z = 3198,
            },
        },
    },
    {
        name = "Xuan",
        ids = {
            [13727] = true,
        },
        locations = {
            {
                x = 2926,
                z = 3535,
            },
            {
                x = 3208,
                z = 3433,
            },
        },
    },
    {
        name = "Yaktwee Swinmari Cianta",
        ids = {
            [12337] = true,
        },
        locations = {
            {
                x = 2403,
                z = 3374,
            },
        },
    },
    {
        name = "Yanni Salika",
        ids = {
            [515] = true,
        },
        locations = {
            {
                x = 2835,
                z = 2985,
            },
        },
    },
    {
        name = "Yellow wisp",
        ids = {
            [25452] = true,
        },
        locations = {
            {
                x = 2224,
                z = 2800,
            },
            {
                x = 2240,
                z = 2876,
            },
            {
                x = 2265,
                z = 2911,
            },
            {
                x = 2301,
                z = 2851,
            },
        },
    },
    {
        name = "Yohnus",
        ids = {
            [513] = true,
        },
        locations = {
            {
                x = 2857,
                z = 2963,
            },
        },
    },
    {
        name = "Young Ralph",
        ids = {
            [7859] = true,
        },
        locations = {
            {
                x = 3035,
                z = 2986,
            },
        },
    },
    {
        name = "Yrsa",
        ids = {
            [1301] = true,
        },
        locations = {
            {
                x = 2625,
                z = 3675,
            },
        },
    },
    {
        name = "Yrth",
        ids = {},
        locations = {
            {
                x = 2607,
                z = 3647,
            },
        },
    },
    {
        name = "Ysondria",
        ids = {
            [16898] = true,
        },
        locations = {
            {
                x = 3220,
                z = 3183,
            },
        },
    },
    {
        name = "Yulf Squecks",
        ids = {
            [4561] = true,
        },
        locations = {
            {
                x = 2616,
                z = 3859,
            },
        },
    },
    {
        name = "Zachory Bragg",
        ids = {},
        locations = {
            {
                x = 3440,
                z = 3485,
            },
        },
    },
    {
        name = "Zaff",
        ids = {
            [546] = true,
        },
        locations = {
            {
                x = 3203,
                z = 3433,
            },
        },
    },
    {
        name = "Zahra",
        ids = {
            [3036] = true,
            [24795] = true,
            [26747] = true,
        },
        locations = {
            {
                x = 2651,
                z = 3345,
            },
            {
                x = 3174,
                z = 2762,
            },
            {
                x = 3448,
                z = 2898,
            },
        },
    },
    {
        name = "Zahur",
        ids = {
            [3037] = true,
        },
        locations = {
            {
                x = 3442,
                z = 2886,
            },
        },
    },
    {
        name = "Zahwa",
        ids = {
            [963] = true,
        },
        locations = {
            {
                x = 3337,
                z = 3238,
            },
        },
    },
    {
        name = "Zaida",
        ids = {
            [25163] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3159,
                z = 3456,
            },
        },
    },
    {
        name = "Zamorak jadinko",
        ids = {
            [13157] = true,
            [13158] = true,
            [13159] = true,
            [13160] = true,
            [13161] = true,
            [13162] = true,
        },
        locations = {
            {
                x = 2971,
                z = 2905,
            },
            {
                x = 2974,
                z = 2909,
            },
            {
                x = 2975,
                z = 2913,
            },
            {
                x = 2977,
                z = 2911,
            },
            {
                x = 2979,
                z = 2907,
            },
            {
                x = 2979,
                z = 2910,
            },
        },
    },
    {
        name = "Zamorakian herbalist",
        ids = {
            [17476] = true,
        },
        locations = {
            {
                x = 3221,
                z = 3267,
            },
        },
    },
    {
        name = "Zavistic Rarve",
        ids = {
            [2059] = true,
        },
        locations = {
            {
                x = 2588,
                z = 3091,
            },
        },
    },
    {
        name = "Zealot",
        ids = {
            [1528] = true,
        },
        locations = {
            {
                x = 3444,
                z = 3258,
            },
        },
    },
    {
        name = "Zeid the Tailor",
        ids = {
            [26824] = true,
        },
        locations = {
            {
                x = 3300,
                z = 3198,
            },
        },
    },
    {
        name = "Zeke",
        ids = {
            [541] = true,
        },
        locations = {
            {
                x = 3288,
                z = 3190,
            },
        },
    },
    {
        name = "Zembo",
        ids = {},
        locations = {
            {
                x = 2926,
                z = 3145,
            },
        },
    },
    {
        name = "Zenesha",
        ids = {
            [589] = true,
        },
        locations = {
            {
                x = 2660,
                z = 3291,
            },
        },
    },
    {
        name = "Zoe",
        ids = {
            [29817] = true,
        },
        locations = {
            {
                x = 3296,
                z = 3558,
            },
        },
    },
    {
        name = "Zombie farmer",
        ids = {
            [13101] = true,
        },
        locations = {
            {
                x = 2947,
                z = 2909,
            },
        },
    },
    {
        name = "Zookeeper",
        ids = {
            [28] = true,
            [7570] = true,
            [7571] = true,
        },
        locations = {
            {
                x = 2603,
                z = 3284,
            },
            {
                x = 2611,
                z = 3269,
            },
            {
                x = 2619,
                z = 3279,
            },
        },
    },
    {
        name = "Zymthara",
        ids = {},
        locations = {
            {
                x = 3429,
                z = 3691,
            },
        },
    },
}
