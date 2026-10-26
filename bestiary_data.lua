-- bestiary_data.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: bestiary.lua, drop_menu.lua.
--[=[
BEGINNER WALKTHROUGH: bestiary_data.lua

This is DATA, not a group of functions. require('bestiary_data') returns the outer table.
Each anonymous { ... } block is ONE monster type. A comma after a block separates it
from the next record. There are three fields in each record:

  name = "Abyssal beast"     -- human-readable search/display name
  ids = {[28781] = true}     -- SET of accepted native NPC config IDs, not a numbered list
  locations = {             -- ordered LIST of reference positions for that monster type
      {x = 3008, z = 3755},  -- one point: x east/west, z north/south, in world tiles
      {x = 3014, z = 3749},  -- another possible reference point, not another config ID
      -- ... remaining positions for this same record ...
  }

[28781] is a numeric table KEY. It does not mean 'the 28,781st monster'. true means
membership in the ID set, not spawn count or current visibility. Several IDs can describe
variants of the same named type. No live entity is stored in this table.
The original locations use surface-map display tiles. The merge at the end adds sub-map
locations carrying areaID; missing areaID means surface (28). Never compare points on
different maps as if their display coordinates shared one world space.

Example reuse from another Lua file (this comment is not executed):
  local catalogue = require('bestiary_data')
  local entry = catalogue[1] -- lists normally begin at 1; inspect name, do not assume order
  print(entry.name)
  local matchingID = entry.ids[28781] == true
  for _, point in ipairs(entry.locations) do print(point.x, point.z) end
  local helpers = require('bestiary')
  local matches = helpers.search('abyssal')
  if matches[1] then
      local closest = helpers.nearest(matches[1], 3222, 3218)
      if closest then print(closest.x, closest.z) end
  end

Follow the flow: main.lua -> bestiary.lua.search -> virtual_results.lua -> selected record
-> bestiary.lua.nearest / reference_pins.lua.Draw. drop_menu.lua also builds an
ID lookup from these records. Editing this data does not spawn, locate or move live NPCs.
Use ipairs for ordered records/locations, and pairs or direct ids[configID] for the sparse set.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: bestiary.lua, drop_menu.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Bundled monster catalogue derived from RuneScape Wiki reference locations.
Schema: ordered array of {name, ids = {[NPC config ID] = true}, locations = {{x, z}, ...}}.
Coordinates are transformed surface-map tiles; array order also determines search order.
This is historical reference data, not live spawns. Preserve IDs and coordinate pairs.
Source/license/retrieval details: WIKI-NPCS.md (CC BY-NC-SA 3.0). No runtime network fetch.
]]

-- RuneScape Wiki contributors, CC BY-NC-SA 3.0; see WIKI-NPCS.md.
local data = {
    {
        name = "Abyssal beast",
        ids = {
            [28781] = true,
        },
        locations = {
            {
                x = 3008,
                z = 3755,
            },
            {
                x = 3014,
                z = 3749,
            },
            {
                x = 3017,
                z = 3764,
            },
            {
                x = 3086,
                z = 3808,
            },
            {
                x = 3087,
                z = 3801,
            },
            {
                x = 3088,
                z = 3810,
            },
            {
                x = 3093,
                z = 3815,
            },
            {
                x = 3094,
                z = 3819,
            },
            {
                x = 3095,
                z = 3810,
            },
            {
                x = 3101,
                z = 3805,
            },
            {
                x = 3102,
                z = 3823,
            },
            {
                x = 3103,
                z = 3816,
            },
            {
                x = 3107,
                z = 3811,
            },
            {
                x = 3114,
                z = 3809,
            },
            {
                x = 3117,
                z = 3801,
            },
            {
                x = 3123,
                z = 3807,
            },
            {
                x = 3130,
                z = 3810,
            },
        },
    },
    {
        name = "Abyssal demon",
        ids = {
            [1615] = true,
            [29342] = true,
        },
        locations = {
            {
                x = 3037,
                z = 3774,
            },
            {
                x = 3042,
                z = 3770,
            },
            {
                x = 3042,
                z = 3774,
            },
            {
                x = 3046,
                z = 3761,
            },
            {
                x = 3046,
                z = 3765,
            },
            {
                x = 3046,
                z = 3775,
            },
            {
                x = 3050,
                z = 3772,
            },
            {
                x = 3051,
                z = 3763,
            },
            {
                x = 3051,
                z = 3769,
            },
            {
                x = 3054,
                z = 3759,
            },
            {
                x = 3054,
                z = 3775,
            },
            {
                x = 3056,
                z = 3771,
            },
            {
                x = 3058,
                z = 3761,
            },
            {
                x = 3061,
                z = 3757,
            },
            {
                x = 3061,
                z = 3770,
            },
            {
                x = 3061,
                z = 3775,
            },
            {
                x = 3066,
                z = 3762,
            },
            {
                x = 3066,
                z = 3772,
            },
            {
                x = 3212,
                z = 3662,
            },
            {
                x = 3213,
                z = 3652,
            },
            {
                x = 3215,
                z = 3657,
            },
            {
                x = 3216,
                z = 3649,
            },
            {
                x = 3217,
                z = 3651,
            },
            {
                x = 3218,
                z = 3663,
            },
            {
                x = 3220,
                z = 3649,
            },
            {
                x = 3222,
                z = 3651,
            },
            {
                x = 3222,
                z = 3661,
            },
            {
                x = 3224,
                z = 3655,
            },
            {
                x = 3225,
                z = 3663,
            },
            {
                x = 3226,
                z = 3650,
            },
            {
                x = 3226,
                z = 3658,
            },
            {
                x = 3229,
                z = 3653,
            },
            {
                x = 3229,
                z = 3660,
            },
            {
                x = 3231,
                z = 3651,
            },
            {
                x = 3232,
                z = 3656,
            },
        },
    },
    {
        name = "Abyssal demon (elite)",
        ids = {
            [1615] = true,
            [29342] = true,
        },
        locations = {
            {
                x = 3037,
                z = 3774,
            },
            {
                x = 3042,
                z = 3770,
            },
            {
                x = 3042,
                z = 3774,
            },
            {
                x = 3046,
                z = 3761,
            },
            {
                x = 3046,
                z = 3765,
            },
            {
                x = 3046,
                z = 3775,
            },
            {
                x = 3050,
                z = 3772,
            },
            {
                x = 3051,
                z = 3763,
            },
            {
                x = 3051,
                z = 3769,
            },
            {
                x = 3054,
                z = 3759,
            },
            {
                x = 3054,
                z = 3775,
            },
            {
                x = 3056,
                z = 3771,
            },
            {
                x = 3058,
                z = 3761,
            },
            {
                x = 3061,
                z = 3757,
            },
            {
                x = 3061,
                z = 3770,
            },
            {
                x = 3061,
                z = 3775,
            },
            {
                x = 3066,
                z = 3762,
            },
            {
                x = 3066,
                z = 3772,
            },
            {
                x = 3212,
                z = 3662,
            },
            {
                x = 3213,
                z = 3652,
            },
            {
                x = 3215,
                z = 3657,
            },
            {
                x = 3216,
                z = 3649,
            },
            {
                x = 3217,
                z = 3651,
            },
            {
                x = 3218,
                z = 3663,
            },
            {
                x = 3220,
                z = 3649,
            },
            {
                x = 3222,
                z = 3651,
            },
            {
                x = 3222,
                z = 3661,
            },
            {
                x = 3224,
                z = 3655,
            },
            {
                x = 3225,
                z = 3663,
            },
            {
                x = 3226,
                z = 3650,
            },
            {
                x = 3226,
                z = 3658,
            },
            {
                x = 3229,
                z = 3653,
            },
            {
                x = 3229,
                z = 3660,
            },
            {
                x = 3231,
                z = 3651,
            },
            {
                x = 3232,
                z = 3656,
            },
        },
    },
    {
        name = "Abyssal lord",
        ids = {
            [28783] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3883,
            },
            {
                x = 3132,
                z = 3894,
            },
            {
                x = 3139,
                z = 3879,
            },
            {
                x = 3141,
                z = 3894,
            },
            {
                x = 3148,
                z = 3883,
            },
            {
                x = 3173,
                z = 3888,
            },
        },
    },
    {
        name = "Abyssal savage",
        ids = {
            [28782] = true,
        },
        locations = {
            {
                x = 3012,
                z = 3766,
            },
            {
                x = 3013,
                z = 3754,
            },
            {
                x = 3021,
                z = 3773,
            },
            {
                x = 3023,
                z = 3718,
            },
            {
                x = 3023,
                z = 3731,
            },
            {
                x = 3023,
                z = 3752,
            },
            {
                x = 3029,
                z = 3716,
            },
            {
                x = 3029,
                z = 3757,
            },
            {
                x = 3032,
                z = 3767,
            },
            {
                x = 3035,
                z = 3733,
            },
            {
                x = 3038,
                z = 3718,
            },
            {
                x = 3048,
                z = 3718,
            },
            {
                x = 3048,
                z = 3728,
            },
            {
                x = 3204,
                z = 3910,
            },
            {
                x = 3204,
                z = 3928,
            },
            {
                x = 3205,
                z = 3919,
            },
            {
                x = 3207,
                z = 3907,
            },
            {
                x = 3209,
                z = 3914,
            },
            {
                x = 3209,
                z = 3923,
            },
            {
                x = 3209,
                z = 3930,
            },
            {
                x = 3212,
                z = 3918,
            },
            {
                x = 3214,
                z = 3909,
            },
            {
                x = 3214,
                z = 3930,
            },
            {
                x = 3216,
                z = 3907,
            },
            {
                x = 3216,
                z = 3924,
            },
            {
                x = 3217,
                z = 3916,
            },
            {
                x = 3220,
                z = 3908,
            },
            {
                x = 3221,
                z = 3912,
            },
            {
                x = 3221,
                z = 3921,
            },
            {
                x = 3222,
                z = 3929,
            },
            {
                x = 3224,
                z = 3917,
            },
            {
                x = 3224,
                z = 3925,
            },
            {
                x = 3227,
                z = 3910,
            },
            {
                x = 3228,
                z = 3921,
            },
            {
                x = 3230,
                z = 3926,
            },
            {
                x = 3231,
                z = 3907,
            },
            {
                x = 3231,
                z = 3916,
            },
            {
                x = 3235,
                z = 3928,
            },
            {
                x = 3236,
                z = 3911,
            },
            {
                x = 3236,
                z = 3922,
            },
            {
                x = 3239,
                z = 3907,
            },
        },
    },
    {
        name = "Acheron mammoth",
        ids = {
            [22007] = true,
        },
        locations = {
            {
                x = 2950,
                z = 3935,
            },
            {
                x = 2958,
                z = 3945,
            },
            {
                x = 2972,
                z = 3950,
            },
            {
                x = 2975,
                z = 3921,
            },
            {
                x = 2981,
                z = 3957,
            },
            {
                x = 3016,
                z = 3934,
            },
            {
                x = 3036,
                z = 3913,
            },
        },
    },
    {
        name = "Adolescent White wolf",
        ids = {
            [96] = true,
        },
        locations = {
            {
                x = 2860,
                z = 3486,
            },
            {
                x = 2861,
                z = 3455,
            },
            {
                x = 2862,
                z = 3493,
            },
            {
                x = 2863,
                z = 3471,
            },
            {
                x = 2867,
                z = 3465,
            },
            {
                x = 2868,
                z = 3442,
            },
            {
                x = 2869,
                z = 3452,
            },
        },
    },
    {
        name = "Afflicted",
        ids = {
            [1257] = true,
            [1258] = true,
            [1261] = true,
            [1262] = true,
        },
        locations = {
            {
                x = 3466,
                z = 3306,
            },
            {
                x = 3466,
                z = 3309,
            },
            {
                x = 3469,
                z = 3308,
            },
            {
                x = 3471,
                z = 3285,
            },
            {
                x = 3472,
                z = 3304,
            },
            {
                x = 3474,
                z = 3293,
            },
            {
                x = 3475,
                z = 3274,
            },
            {
                x = 3476,
                z = 3288,
            },
            {
                x = 3477,
                z = 3308,
            },
            {
                x = 3479,
                z = 3300,
            },
            {
                x = 3481,
                z = 3277,
            },
            {
                x = 3481,
                z = 3305,
            },
            {
                x = 3485,
                z = 3271,
            },
            {
                x = 3487,
                z = 3277,
            },
            {
                x = 3488,
                z = 3284,
            },
            {
                x = 3491,
                z = 3291,
            },
            {
                x = 3493,
                z = 3299,
            },
            {
                x = 3495,
                z = 3285,
            },
            {
                x = 3496,
                z = 3271,
            },
            {
                x = 3499,
                z = 3298,
            },
            {
                x = 3502,
                z = 3277,
            },
            {
                x = 3503,
                z = 3288,
            },
            {
                x = 3503,
                z = 3302,
            },
            {
                x = 3504,
                z = 3281,
            },
            {
                x = 3506,
                z = 3304,
            },
            {
                x = 3509,
                z = 3284,
            },
            {
                x = 3511,
                z = 3300,
            },
            {
                x = 3515,
                z = 3302,
            },
            {
                x = 3517,
                z = 3285,
            },
        },
    },
    {
        name = "Air wizard",
        ids = {
            [2712] = true,
        },
        locations = {
            {
                x = 2999,
                z = 3264,
            },
        },
    },
    {
        name = "Airut",
        ids = {
            [18621] = true,
            [18622] = true,
        },
        locations = {
            {
                x = 2262,
                z = 3611,
            },
            {
                x = 2269,
                z = 3605,
            },
            {
                x = 2270,
                z = 3611,
            },
            {
                x = 2272,
                z = 3623,
            },
            {
                x = 2278,
                z = 3616,
            },
            {
                x = 2280,
                z = 3631,
            },
            {
                x = 2281,
                z = 3609,
            },
            {
                x = 2282,
                z = 3637,
            },
            {
                x = 2293,
                z = 3595,
            },
            {
                x = 2293,
                z = 3602,
            },
        },
    },
    {
        name = "Akrisae",
        ids = {
            [14348] = true,
        },
        locations = {
            {
                x = 2989,
                z = 3342,
            },
        },
    },
    {
        name = "Al Kharid warrior",
        ids = {
            [18] = true,
        },
        locations = {
            {
                x = 3283,
                z = 3170,
            },
            {
                x = 3284,
                z = 3166,
            },
            {
                x = 3284,
                z = 3174,
            },
            {
                x = 3288,
                z = 3168,
            },
            {
                x = 3291,
                z = 3169,
            },
            {
                x = 3295,
                z = 3168,
            },
            {
                x = 3301,
                z = 3166,
            },
            {
                x = 3301,
                z = 3170,
            },
            {
                x = 3301,
                z = 3174,
            },
        },
    },
    {
        name = "Ali the Wise",
        ids = {},
        locations = {
            {
                x = 3346,
                z = 3396,
            },
            {
                x = 3420,
                z = 2938,
            },
        },
    },
    {
        name = "Alrik",
        ids = {},
        locations = {
            {
                x = 2514,
                z = 3855,
            },
        },
    },
    {
        name = "Ambassador Jabari",
        ids = {
            [24658] = true,
        },
        locations = {
            {
                x = 3196,
                z = 2770,
            },
        },
    },
    {
        name = "Amphibious jadinko",
        ids = {
            [13121] = true,
            [13122] = true,
            [13123] = true,
            [13124] = true,
            [13125] = true,
            [13126] = true,
            [13127] = true,
            [13128] = true,
            [13129] = true,
        },
        locations = {
            {
                x = 2946,
                z = 2936,
            },
            {
                x = 2947,
                z = 2933,
            },
            {
                x = 2950,
                z = 2920,
            },
            {
                x = 2950,
                z = 2928,
            },
            {
                x = 2962,
                z = 2916,
            },
            {
                x = 2964,
                z = 2917,
            },
            {
                x = 2965,
                z = 2912,
            },
            {
                x = 2971,
                z = 2922,
            },
            {
                x = 2971,
                z = 2927,
            },
        },
    },
    {
        name = "Anagami",
        ids = {
            [23073] = true,
            [23074] = true,
        },
        locations = {
            {
                x = 4770,
                z = 3462,
            },
            {
                x = 4777,
                z = 3462,
            },
            {
                x = 4781,
                z = 3456,
            },
            {
                x = 4787,
                z = 3462,
            },
            {
                x = 4794,
                z = 3462,
            },
            {
                x = 4794,
                z = 3469,
            },
            {
                x = 4795,
                z = 3457,
            },
        },
    },
    {
        name = "Ankou",
        ids = {
            [4382] = true,
        },
        locations = {
            {
                x = 3139,
                z = 3747,
            },
            {
                x = 3141,
                z = 3737,
            },
            {
                x = 3157,
                z = 3735,
            },
            {
                x = 3164,
                z = 3727,
            },
            {
                x = 3165,
                z = 3746,
            },
            {
                x = 3172,
                z = 3713,
            },
            {
                x = 3177,
                z = 3724,
            },
        },
    },
    {
        name = "Ankou (elite)",
        ids = {
            [4382] = true,
        },
        locations = {
            {
                x = 3139,
                z = 3747,
            },
            {
                x = 3141,
                z = 3737,
            },
            {
                x = 3157,
                z = 3735,
            },
            {
                x = 3164,
                z = 3727,
            },
            {
                x = 3165,
                z = 3746,
            },
            {
                x = 3172,
                z = 3713,
            },
            {
                x = 3177,
                z = 3724,
            },
        },
    },
    {
        name = "Apep",
        ids = {
            [15802] = true,
            [15877] = true,
        },
        locations = {
            {
                x = 3130,
                z = 3196,
            },
            {
                x = 3205,
                z = 3082,
            },
        },
    },
    {
        name = "Aquatic jadinko",
        ids = {
            [13133] = true,
            [13134] = true,
            [13135] = true,
            [13136] = true,
            [13137] = true,
            [13138] = true,
            [13139] = true,
            [13140] = true,
            [13141] = true,
        },
        locations = {
            {
                x = 2948,
                z = 2884,
            },
            {
                x = 2948,
                z = 2893,
            },
            {
                x = 2948,
                z = 2897,
            },
            {
                x = 2955,
                z = 2891,
            },
            {
                x = 2956,
                z = 2895,
            },
            {
                x = 2964,
                z = 2901,
            },
            {
                x = 2967,
                z = 2898,
            },
            {
                x = 2968,
                z = 2900,
            },
            {
                x = 2969,
                z = 2897,
            },
        },
    },
    {
        name = "Archaeologist",
        ids = {},
        locations = {
            {
                x = 3356,
                z = 3401,
            },
            {
                x = 3797,
                z = 3184,
            },
        },
    },
    {
        name = "Archaeologist (excavation sites)",
        ids = {
            [26907] = true,
            [26908] = true,
            [26909] = true,
            [26911] = true,
            [26912] = true,
            [26913] = true,
            [26914] = true,
            [26915] = true,
            [26916] = true,
            [26917] = true,
            [26918] = true,
        },
        locations = {
            {
                x = 2385,
                z = 2826,
            },
            {
                x = 2521,
                z = 2902,
            },
            {
                x = 2676,
                z = 3402,
            },
            {
                x = 3343,
                z = 3143,
            },
            {
                x = 3345,
                z = 3147,
            },
            {
                x = 3368,
                z = 3504,
            },
            {
                x = 3413,
                z = 3657,
            },
            {
                x = 3441,
                z = 3529,
            },
            {
                x = 3443,
                z = 3528,
            },
            {
                x = 3551,
                z = 3268,
            },
            {
                x = 3557,
                z = 3268,
            },
            {
                x = 3693,
                z = 3215,
            },
            {
                x = 3717,
                z = 3153,
            },
            {
                x = 3721,
                z = 3169,
            },
            {
                x = 3727,
                z = 3180,
            },
            {
                x = 3729,
                z = 3184,
            },
            {
                x = 3729,
                z = 3274,
            },
            {
                x = 3730,
                z = 3183,
            },
            {
                x = 3736,
                z = 3138,
            },
            {
                x = 3742,
                z = 3243,
            },
            {
                x = 3748,
                z = 3206,
            },
            {
                x = 3750,
                z = 3146,
            },
            {
                x = 3764,
                z = 3204,
            },
            {
                x = 3765,
                z = 3144,
            },
            {
                x = 3773,
                z = 3216,
            },
            {
                x = 3819,
                z = 3175,
            },
        },
    },
    {
        name = "Armoured zombie",
        ids = {
            [14339] = true,
        },
        locations = {
            {
                x = 2844,
                z = 3843,
            },
        },
    },
    {
        name = "Azure skillchompa (Hunter)",
        ids = {
            [19442] = true,
        },
        locations = {
            {
                x = 2723,
                z = 3871,
            },
            {
                x = 2723,
                z = 3875,
            },
            {
                x = 2726,
                z = 3855,
            },
            {
                x = 2726,
                z = 3862,
            },
            {
                x = 2726,
                z = 3872,
            },
            {
                x = 2727,
                z = 3858,
            },
            {
                x = 2727,
                z = 3867,
            },
            {
                x = 2728,
                z = 3877,
            },
            {
                x = 2729,
                z = 3852,
            },
            {
                x = 2729,
                z = 3871,
            },
            {
                x = 2730,
                z = 3863,
            },
            {
                x = 2730,
                z = 3874,
            },
            {
                x = 2731,
                z = 3849,
            },
            {
                x = 2732,
                z = 3856,
            },
            {
                x = 2734,
                z = 3850,
            },
            {
                x = 2735,
                z = 3853,
            },
        },
    },
    {
        name = "Bandit (Kharidian Desert Bandit Camp)",
        ids = {
            [1926] = true,
            [1927] = true,
            [1928] = true,
            [1929] = true,
            [1930] = true,
            [1931] = true,
        },
        locations = {
            {
                x = 3157,
                z = 2986,
            },
            {
                x = 3157,
                z = 2989,
            },
            {
                x = 3158,
                z = 2977,
            },
            {
                x = 3158,
                z = 2987,
            },
            {
                x = 3159,
                z = 2977,
            },
            {
                x = 3159,
                z = 2979,
            },
            {
                x = 3161,
                z = 2977,
            },
            {
                x = 3161,
                z = 2981,
            },
            {
                x = 3161,
                z = 2982,
            },
            {
                x = 3161,
                z = 2983,
            },
            {
                x = 3161,
                z = 2986,
            },
            {
                x = 3162,
                z = 2987,
            },
            {
                x = 3162,
                z = 2989,
            },
            {
                x = 3163,
                z = 2977,
            },
            {
                x = 3163,
                z = 2980,
            },
            {
                x = 3163,
                z = 2982,
            },
            {
                x = 3163,
                z = 2986,
            },
            {
                x = 3164,
                z = 2978,
            },
            {
                x = 3164,
                z = 2984,
            },
            {
                x = 3165,
                z = 2960,
            },
            {
                x = 3168,
                z = 2989,
            },
            {
                x = 3171,
                z = 2975,
            },
            {
                x = 3173,
                z = 2972,
            },
            {
                x = 3173,
                z = 2981,
            },
            {
                x = 3175,
                z = 2974,
            },
            {
                x = 3180,
                z = 2992,
            },
            {
                x = 3183,
                z = 2974,
            },
            {
                x = 3183,
                z = 2975,
            },
            {
                x = 3185,
                z = 2985,
            },
            {
                x = 3187,
                z = 2984,
            },
            {
                x = 3272,
                z = 2977,
            },
            {
                x = 3280,
                z = 2957,
            },
            {
                x = 3281,
                z = 2969,
            },
            {
                x = 3293,
                z = 2959,
            },
            {
                x = 3302,
                z = 2977,
            },
        },
    },
    {
        name = "Bandit (Pollnivneach)",
        ids = {
            [1879] = true,
            [7478] = true,
        },
        locations = {
            {
                x = 3354,
                z = 3000,
            },
            {
                x = 3355,
                z = 2987,
            },
            {
                x = 3356,
                z = 2994,
            },
            {
                x = 3357,
                z = 3001,
            },
            {
                x = 3360,
                z = 2999,
            },
            {
                x = 3361,
                z = 3003,
            },
            {
                x = 3362,
                z = 2988,
            },
            {
                x = 3367,
                z = 2997,
            },
            {
                x = 3371,
                z = 2984,
            },
        },
    },
    {
        name = "Bandit Brawler",
        ids = {
            [195] = true,
            [23157] = true,
            [23158] = true,
        },
        locations = {
            {
                x = 3023,
                z = 3704,
            },
            {
                x = 3028,
                z = 3708,
            },
            {
                x = 3029,
                z = 3701,
            },
            {
                x = 3030,
                z = 3694,
            },
            {
                x = 3030,
                z = 3697,
            },
            {
                x = 3031,
                z = 3685,
            },
            {
                x = 3031,
                z = 3705,
            },
            {
                x = 3032,
                z = 3695,
            },
            {
                x = 3037,
                z = 3683,
            },
            {
                x = 3039,
                z = 3691,
            },
            {
                x = 3040,
                z = 3702,
            },
            {
                x = 3041,
                z = 3708,
            },
            {
                x = 3042,
                z = 3698,
            },
            {
                x = 3044,
                z = 3700,
            },
            {
                x = 3045,
                z = 3706,
            },
        },
    },
    {
        name = "Bandit looter",
        ids = {
            [7492] = true,
            [7493] = true,
            [7494] = true,
            [7495] = true,
            [7496] = true,
        },
        locations = {
            {
                x = 3488,
                z = 3028,
            },
            {
                x = 3489,
                z = 3032,
            },
            {
                x = 3490,
                z = 3040,
            },
            {
                x = 3496,
                z = 3042,
            },
            {
                x = 3500,
                z = 3040,
            },
        },
    },
    {
        name = "Banshee",
        ids = {
            [1612] = true,
        },
        locations = {
            {
                x = 3434,
                z = 3566,
            },
            {
                x = 3435,
                z = 3572,
            },
            {
                x = 3436,
                z = 3560,
            },
            {
                x = 3438,
                z = 3565,
            },
            {
                x = 3439,
                z = 3558,
            },
            {
                x = 3441,
                z = 3548,
            },
            {
                x = 3441,
                z = 3571,
            },
            {
                x = 3443,
                z = 3545,
            },
            {
                x = 3443,
                z = 3563,
            },
            {
                x = 3444,
                z = 3557,
            },
            {
                x = 3444,
                z = 3568,
            },
            {
                x = 3445,
                z = 3550,
            },
        },
    },
    {
        name = "Barbarian",
        ids = {
            [3246] = true,
            [3247] = true,
            [3248] = true,
            [3249] = true,
            [3250] = true,
            [3251] = true,
            [3252] = true,
            [3253] = true,
            [3255] = true,
            [3256] = true,
            [3257] = true,
            [3258] = true,
            [3259] = true,
            [3260] = true,
            [3261] = true,
            [3262] = true,
            [3263] = true,
        },
        locations = {
            {
                x = 2544,
                z = 3577,
            },
            {
                x = 2546,
                z = 3560,
            },
            {
                x = 2546,
                z = 3565,
            },
            {
                x = 2548,
                z = 3558,
            },
            {
                x = 2549,
                z = 3566,
            },
            {
                x = 2549,
                z = 3570,
            },
            {
                x = 2550,
                z = 3563,
            },
            {
                x = 3075,
                z = 3445,
            },
            {
                x = 3076,
                z = 3414,
            },
            {
                x = 3077,
                z = 3422,
            },
            {
                x = 3078,
                z = 3419,
            },
            {
                x = 3078,
                z = 3436,
            },
            {
                x = 3078,
                z = 3440,
            },
            {
                x = 3078,
                z = 3442,
            },
            {
                x = 3079,
                z = 3409,
            },
            {
                x = 3079,
                z = 3437,
            },
            {
                x = 3079,
                z = 3444,
            },
            {
                x = 3080,
                z = 3423,
            },
            {
                x = 3083,
                z = 3429,
            },
            {
                x = 3084,
                z = 3426,
            },
            {
                x = 3085,
                z = 3409,
            },
            {
                x = 3086,
                z = 3419,
            },
            {
                x = 3086,
                z = 3440,
            },
            {
                x = 3096,
                z = 3432,
            },
        },
    },
    {
        name = "Bark Blamish Snail",
        ids = {
            [1231] = true,
        },
        locations = {
            {
                x = 3430,
                z = 3310,
            },
            {
                x = 3430,
                z = 3311,
            },
            {
                x = 3439,
                z = 3312,
            },
            {
                x = 3439,
                z = 3354,
            },
            {
                x = 3448,
                z = 3268,
            },
            {
                x = 3450,
                z = 3308,
            },
            {
                x = 3495,
                z = 3418,
            },
            {
                x = 3498,
                z = 3420,
            },
            {
                x = 3505,
                z = 3433,
            },
            {
                x = 3510,
                z = 3435,
            },
            {
                x = 3530,
                z = 3435,
            },
        },
    },
    {
        name = "Bat",
        ids = {
            [412] = true,
        },
        locations = {
            {
                x = 3341,
                z = 3478,
            },
            {
                x = 3343,
                z = 3484,
            },
            {
                x = 3345,
                z = 3484,
            },
            {
                x = 3350,
                z = 3493,
            },
            {
                x = 3353,
                z = 3494,
            },
            {
                x = 3361,
                z = 3484,
            },
            {
                x = 3364,
                z = 3489,
            },
            {
                x = 3370,
                z = 3497,
            },
            {
                x = 3379,
                z = 3478,
            },
            {
                x = 3387,
                z = 3483,
            },
            {
                x = 3388,
                z = 3494,
            },
            {
                x = 3389,
                z = 3483,
            },
            {
                x = 3411,
                z = 3550,
            },
            {
                x = 3565,
                z = 3503,
            },
            {
                x = 3567,
                z = 3481,
            },
            {
                x = 3580,
                z = 3491,
            },
            {
                x = 3588,
                z = 3472,
            },
            {
                x = 3598,
                z = 3509,
            },
            {
                x = 3599,
                z = 3486,
            },
            {
                x = 3607,
                z = 3462,
            },
            {
                x = 3611,
                z = 3499,
            },
            {
                x = 3613,
                z = 3482,
            },
            {
                x = 3627,
                z = 3511,
            },
            {
                x = 3628,
                z = 3473,
            },
            {
                x = 3636,
                z = 3466,
            },
            {
                x = 3639,
                z = 3510,
            },
        },
    },
    {
        name = "Battle mage",
        ids = {
            [912] = true,
            [913] = true,
            [914] = true,
        },
        locations = {
            {
                x = 3098,
                z = 3926,
            },
            {
                x = 3098,
                z = 3943,
            },
            {
                x = 3100,
                z = 3928,
            },
            {
                x = 3100,
                z = 3941,
            },
            {
                x = 3102,
                z = 3930,
            },
            {
                x = 3102,
                z = 3939,
            },
            {
                x = 3110,
                z = 3935,
            },
            {
                x = 3113,
                z = 3935,
            },
            {
                x = 3116,
                z = 3935,
            },
        },
    },
    {
        name = "Bear cub",
        ids = {
            [1326] = true,
            [1327] = true,
        },
        locations = {
            {
                x = 2689,
                z = 3612,
            },
            {
                x = 2691,
                z = 3610,
            },
            {
                x = 2691,
                z = 3614,
            },
            {
                x = 2693,
                z = 3612,
            },
            {
                x = 2719,
                z = 3643,
            },
            {
                x = 2721,
                z = 3641,
            },
            {
                x = 2721,
                z = 3646,
            },
            {
                x = 2723,
                z = 3643,
            },
        },
    },
    {
        name = "Bedabin nomad fighter",
        ids = {
            [1239] = true,
        },
        locations = {
            {
                x = 3160,
                z = 3031,
            },
            {
                x = 3162,
                z = 3033,
            },
            {
                x = 3164,
                z = 3031,
            },
            {
                x = 3177,
                z = 3033,
            },
            {
                x = 3178,
                z = 3030,
            },
            {
                x = 3180,
                z = 3033,
            },
        },
    },
    {
        name = "Big Wolf",
        ids = {
            [6046] = true,
        },
        locations = {
            {
                x = 2841,
                z = 3495,
            },
        },
    },
    {
        name = "Billy Goat",
        ids = {
            [4932] = true,
            [4935] = true,
        },
        locations = {
            {
                x = 3324,
                z = 2841,
            },
            {
                x = 3397,
                z = 2932,
            },
            {
                x = 3413,
                z = 2888,
            },
        },
    },
    {
        name = "Bird",
        ids = {
            [1475] = true,
            [1476] = true,
        },
        locations = {
            {
                x = 2694,
                z = 2761,
            },
            {
                x = 2696,
                z = 2709,
            },
            {
                x = 2698,
                z = 2788,
            },
            {
                x = 2713,
                z = 2697,
            },
            {
                x = 2718,
                z = 2726,
            },
            {
                x = 2723,
                z = 2805,
            },
            {
                x = 2737,
                z = 2695,
            },
            {
                x = 2741,
                z = 2712,
            },
            {
                x = 2753,
                z = 2754,
            },
            {
                x = 2756,
                z = 2811,
            },
            {
                x = 2760,
                z = 2711,
            },
            {
                x = 2764,
                z = 2694,
            },
            {
                x = 2768,
                z = 2759,
            },
            {
                x = 2771,
                z = 2737,
            },
            {
                x = 2773,
                z = 2704,
            },
            {
                x = 2779,
                z = 2743,
            },
            {
                x = 2779,
                z = 2809,
            },
            {
                x = 2783,
                z = 2709,
            },
            {
                x = 2787,
                z = 2694,
            },
            {
                x = 2787,
                z = 2752,
            },
            {
                x = 2794,
                z = 2705,
            },
            {
                x = 2795,
                z = 2739,
            },
            {
                x = 2797,
                z = 2810,
            },
            {
                x = 2798,
                z = 2716,
            },
            {
                x = 2807,
                z = 2714,
            },
            {
                x = 2810,
                z = 2736,
            },
            {
                x = 2813,
                z = 2757,
            },
            {
                x = 2891,
                z = 2723,
            },
            {
                x = 2900,
                z = 2739,
            },
            {
                x = 2902,
                z = 2701,
            },
            {
                x = 2906,
                z = 2709,
            },
            {
                x = 2939,
                z = 2718,
            },
        },
    },
    {
        name = "Black bear",
        ids = {
            [106] = true,
        },
        locations = {
            {
                x = 2460,
                z = 3200,
            },
            {
                x = 2478,
                z = 3200,
            },
            {
                x = 2501,
                z = 3159,
            },
            {
                x = 2606,
                z = 3008,
            },
            {
                x = 2809,
                z = 3376,
            },
            {
                x = 2959,
                z = 3471,
            },
            {
                x = 2966,
                z = 3456,
            },
            {
                x = 2974,
                z = 3470,
            },
            {
                x = 3040,
                z = 3438,
            },
            {
                x = 3044,
                z = 3454,
            },
            {
                x = 3046,
                z = 3429,
            },
            {
                x = 3050,
                z = 3441,
            },
            {
                x = 3056,
                z = 3425,
            },
            {
                x = 3058,
                z = 3452,
            },
            {
                x = 3064,
                z = 3429,
            },
            {
                x = 3065,
                z = 3439,
            },
        },
    },
    {
        name = "Black demon",
        ids = {
            [84] = true,
        },
        locations = {
            {
                x = 3288,
                z = 3829,
            },
            {
                x = 3299,
                z = 3826,
            },
            {
                x = 3301,
                z = 3818,
            },
            {
                x = 3306,
                z = 3836,
            },
            {
                x = 3313,
                z = 3824,
            },
            {
                x = 3314,
                z = 3814,
            },
            {
                x = 3320,
                z = 3823,
            },
        },
    },
    {
        name = "Black Guard (Dwarven Mine entrance)",
        ids = {
            [3276] = true,
            [3277] = true,
            [3278] = true,
            [3279] = true,
        },
        locations = {
            {
                x = 3012,
                z = 3444,
            },
            {
                x = 3015,
                z = 3448,
            },
            {
                x = 3016,
                z = 3445,
            },
            {
                x = 3019,
                z = 3444,
            },
        },
    },
    {
        name = "Black Heather",
        ids = {
            [202] = true,
        },
        locations = {
            {
                x = 3039,
                z = 3700,
            },
        },
    },
    {
        name = "Black Knight",
        ids = {
            [178] = true,
        },
        locations = {
            {
                x = 3008,
                z = 3571,
            },
            {
                x = 3017,
                z = 3547,
            },
            {
                x = 3018,
                z = 3559,
            },
            {
                x = 3019,
                z = 3555,
            },
            {
                x = 3027,
                z = 3554,
            },
            {
                x = 3027,
                z = 3560,
            },
            {
                x = 3029,
                z = 3545,
            },
            {
                x = 3029,
                z = 3557,
            },
            {
                x = 3030,
                z = 3564,
            },
            {
                x = 3031,
                z = 3571,
            },
            {
                x = 3109,
                z = 3216,
            },
            {
                x = 3226,
                z = 3515,
            },
            {
                x = 3234,
                z = 3518,
            },
            {
                x = 3285,
                z = 3505,
            },
        },
    },
    {
        name = "Black unicorn",
        ids = {
            [133] = true,
        },
        locations = {
            {
                x = 2708,
                z = 3672,
            },
            {
                x = 2730,
                z = 3659,
            },
            {
                x = 3072,
                z = 3625,
            },
            {
                x = 3079,
                z = 3627,
            },
            {
                x = 3079,
                z = 3637,
            },
            {
                x = 3082,
                z = 3643,
            },
            {
                x = 3083,
                z = 3632,
            },
            {
                x = 3086,
                z = 3636,
            },
            {
                x = 3096,
                z = 3641,
            },
            {
                x = 3112,
                z = 3614,
            },
            {
                x = 3115,
                z = 3644,
            },
            {
                x = 3119,
                z = 3638,
            },
            {
                x = 3120,
                z = 3627,
            },
            {
                x = 3122,
                z = 3616,
            },
            {
                x = 3122,
                z = 3634,
            },
            {
                x = 3124,
                z = 3600,
            },
            {
                x = 3132,
                z = 3597,
            },
        },
    },
    {
        name = "Blood Blamish Snail",
        ids = {
            [1228] = true,
            [1233] = true,
        },
        locations = {
            {
                x = 3471,
                z = 3346,
            },
            {
                x = 3486,
                z = 3442,
            },
            {
                x = 3496,
                z = 3444,
            },
            {
                x = 3519,
                z = 3439,
            },
            {
                x = 3531,
                z = 3438,
            },
            {
                x = 3534,
                z = 3428,
            },
            {
                x = 3558,
                z = 3453,
            },
        },
    },
    {
        name = "Blue dragon",
        ids = {
            [55] = true,
        },
        locations = {
            {
                x = 2955,
                z = 3544,
            },
            {
                x = 2955,
                z = 3549,
            },
            {
                x = 2955,
                z = 3554,
            },
            {
                x = 2956,
                z = 3559,
            },
            {
                x = 2958,
                z = 3538,
            },
            {
                x = 2962,
                z = 3565,
            },
            {
                x = 2963,
                z = 3539,
            },
            {
                x = 2965,
                z = 3548,
            },
            {
                x = 2967,
                z = 3535,
            },
            {
                x = 2970,
                z = 3553,
            },
            {
                x = 2972,
                z = 3544,
            },
            {
                x = 2975,
                z = 3563,
            },
            {
                x = 2977,
                z = 3548,
            },
        },
    },
    {
        name = "Boris",
        ids = {
            [6026] = true,
        },
        locations = {
            {
                x = 3489,
                z = 3490,
            },
        },
    },
    {
        name = "Borrokar",
        ids = {
            [1307] = true,
        },
        locations = {
            {
                x = 2679,
                z = 3690,
            },
        },
    },
    {
        name = "Brigand",
        ids = {
            [6174] = true,
        },
        locations = {
            {
                x = 3356,
                z = 2994,
            },
            {
                x = 3357,
                z = 3001,
            },
            {
                x = 3360,
                z = 2999,
            },
            {
                x = 3367,
                z = 2997,
            },
        },
    },
    {
        name = "Broddi",
        ids = {
            [1390] = true,
        },
        locations = {
            {
                x = 2512,
                z = 3871,
            },
        },
    },
    {
        name = "Bruise Blamish Snail",
        ids = {
            [1230] = true,
            [1235] = true,
        },
        locations = {
            {
                x = 3473,
                z = 3346,
            },
            {
                x = 3474,
                z = 3347,
            },
            {
                x = 3485,
                z = 3441,
            },
            {
                x = 3486,
                z = 3440,
            },
            {
                x = 3517,
                z = 3437,
            },
            {
                x = 3520,
                z = 3407,
            },
        },
    },
    {
        name = "Bulbous crawler",
        ids = {
            [24831] = true,
        },
        locations = {
            {
                x = 2251,
                z = 2904,
            },
            {
                x = 2266,
                z = 2908,
            },
            {
                x = 2266,
                z = 2920,
            },
            {
                x = 2272,
                z = 2916,
            },
            {
                x = 2273,
                z = 2904,
            },
            {
                x = 2277,
                z = 2909,
            },
            {
                x = 2281,
                z = 2916,
            },
            {
                x = 2286,
                z = 2907,
            },
        },
    },
    {
        name = "Bunny",
        ids = {
            [1320] = true,
            [1321] = true,
        },
        locations = {
            {
                x = 2736,
                z = 3638,
            },
            {
                x = 2737,
                z = 3635,
            },
            {
                x = 2738,
                z = 3635,
            },
            {
                x = 2738,
                z = 3636,
            },
            {
                x = 2739,
                z = 3635,
            },
            {
                x = 2739,
                z = 3636,
            },
            {
                x = 2740,
                z = 3636,
            },
            {
                x = 2740,
                z = 3638,
            },
        },
    },
    {
        name = "Calf",
        ids = {
            [2310] = true,
            [12364] = true,
            [12366] = true,
        },
        locations = {
            {
                x = 2947,
                z = 3274,
            },
            {
                x = 3029,
                z = 3309,
            },
            {
                x = 3031,
                z = 3312,
            },
            {
                x = 3042,
                z = 3312,
            },
            {
                x = 3159,
                z = 3335,
            },
            {
                x = 3159,
                z = 3340,
            },
            {
                x = 3164,
                z = 3338,
            },
            {
                x = 3166,
                z = 3321,
            },
            {
                x = 3167,
                z = 3337,
            },
            {
                x = 3181,
                z = 3315,
            },
            {
                x = 3247,
                z = 3287,
            },
            {
                x = 3256,
                z = 3273,
            },
            {
                x = 3261,
                z = 3289,
            },
            {
                x = 3262,
                z = 3287,
            },
        },
    },
    {
        name = "Camel Warrior",
        ids = {
            [22001] = true,
        },
        locations = {
            {
                x = 3350,
                z = 2728,
            },
            {
                x = 3363,
                z = 2732,
            },
            {
                x = 3366,
                z = 2716,
            },
            {
                x = 3373,
                z = 2732,
            },
            {
                x = 3384,
                z = 2716,
            },
            {
                x = 3385,
                z = 2741,
            },
            {
                x = 3386,
                z = 2702,
            },
            {
                x = 3396,
                z = 2705,
            },
            {
                x = 3404,
                z = 2723,
            },
            {
                x = 3404,
                z = 2740,
            },
            {
                x = 3415,
                z = 2732,
            },
        },
    },
    {
        name = "Camp dweller",
        ids = {
            [1814] = true,
            [1815] = true,
            [1816] = true,
            [1817] = true,
            [1818] = true,
        },
        locations = {
            {
                x = 2776,
                z = 3659,
            },
            {
                x = 2779,
                z = 3663,
            },
            {
                x = 2784,
                z = 3659,
            },
            {
                x = 2785,
                z = 3664,
            },
            {
                x = 2786,
                z = 3658,
            },
        },
    },
    {
        name = "Cannibal jadinko",
        ids = {
            [13145] = true,
            [13146] = true,
            [13147] = true,
            [13148] = true,
            [13149] = true,
            [13150] = true,
            [13151] = true,
            [13152] = true,
            [13153] = true,
        },
        locations = {
            {
                x = 2946,
                z = 2887,
            },
            {
                x = 2948,
                z = 2886,
            },
            {
                x = 2949,
                z = 2891,
            },
            {
                x = 2950,
                z = 2886,
            },
            {
                x = 2956,
                z = 2890,
            },
            {
                x = 2959,
                z = 2893,
            },
            {
                x = 2963,
                z = 2909,
            },
            {
                x = 2965,
                z = 2895,
            },
            {
                x = 2970,
                z = 2899,
            },
        },
    },
    {
        name = "Cap'n Ekahi",
        ids = {
            [23010] = true,
        },
        locations = {
            {
                x = 4789,
                z = 3405,
            },
        },
    },
    {
        name = "Captured Meiyerditch citizen",
        ids = {
            [14140] = true,
            [14143] = true,
            [14146] = true,
            [14149] = true,
            [14152] = true,
        },
        locations = {
            {
                x = 3597,
                z = 3317,
            },
            {
                x = 3597,
                z = 3321,
            },
            {
                x = 3598,
                z = 3319,
            },
            {
                x = 3598,
                z = 3323,
            },
            {
                x = 3599,
                z = 3317,
            },
            {
                x = 3599,
                z = 3321,
            },
            {
                x = 3599,
                z = 3324,
            },
            {
                x = 3600,
                z = 3319,
            },
            {
                x = 3601,
                z = 3317,
            },
            {
                x = 3601,
                z = 3321,
            },
            {
                x = 3602,
                z = 3319,
            },
            {
                x = 3603,
                z = 3317,
            },
            {
                x = 3603,
                z = 3321,
            },
            {
                x = 3604,
                z = 3319,
            },
        },
    },
    {
        name = "Carnivorous chinchompa",
        ids = {
            [5080] = true,
        },
        locations = {
            {
                x = 2496,
                z = 2880,
            },
            {
                x = 2496,
                z = 2936,
            },
            {
                x = 2497,
                z = 2900,
            },
            {
                x = 2498,
                z = 2897,
            },
            {
                x = 2499,
                z = 2942,
            },
            {
                x = 2501,
                z = 2938,
            },
            {
                x = 2506,
                z = 2902,
            },
            {
                x = 2506,
                z = 2906,
            },
            {
                x = 2508,
                z = 2899,
            },
            {
                x = 2508,
                z = 2909,
            },
            {
                x = 2509,
                z = 2902,
            },
            {
                x = 2518,
                z = 2900,
            },
            {
                x = 2521,
                z = 2881,
            },
            {
                x = 2522,
                z = 2895,
            },
            {
                x = 2525,
                z = 2881,
            },
            {
                x = 2525,
                z = 2899,
            },
            {
                x = 2527,
                z = 2896,
            },
            {
                x = 2553,
                z = 2935,
            },
            {
                x = 2556,
                z = 2914,
            },
            {
                x = 2557,
                z = 2932,
            },
            {
                x = 2557,
                z = 2936,
            },
            {
                x = 2559,
                z = 2911,
            },
            {
                x = 2559,
                z = 2918,
            },
        },
    },
    {
        name = "Carrion jadinko",
        ids = {
            [13145] = true,
            [13146] = true,
            [13147] = true,
            [13148] = true,
            [13149] = true,
            [13150] = true,
            [13151] = true,
            [13152] = true,
            [13153] = true,
        },
        locations = {
            {
                x = 2946,
                z = 2887,
            },
            {
                x = 2948,
                z = 2886,
            },
            {
                x = 2949,
                z = 2891,
            },
            {
                x = 2950,
                z = 2886,
            },
            {
                x = 2956,
                z = 2890,
            },
            {
                x = 2959,
                z = 2893,
            },
            {
                x = 2963,
                z = 2909,
            },
            {
                x = 2965,
                z = 2895,
            },
            {
                x = 2970,
                z = 2899,
            },
        },
    },
    {
        name = "Chaos druid",
        ids = {
            [181] = true,
        },
        locations = {
            {
                x = 2561,
                z = 3355,
            },
            {
                x = 2561,
                z = 3357,
            },
            {
                x = 2563,
                z = 3355,
            },
            {
                x = 2563,
                z = 3358,
            },
        },
    },
    {
        name = "Chaos Elemental",
        ids = {
            [3200] = true,
        },
        locations = {
            {
                x = 3261,
                z = 3927,
            },
        },
    },
    {
        name = "Charming moth",
        ids = {},
        locations = {
            {
                x = 3364,
                z = 3725,
            },
            {
                x = 3365,
                z = 3750,
            },
            {
                x = 3367,
                z = 3738,
            },
            {
                x = 3370,
                z = 3746,
            },
            {
                x = 3371,
                z = 3733,
            },
            {
                x = 3371,
                z = 3753,
            },
            {
                x = 3373,
                z = 3727,
            },
            {
                x = 3373,
                z = 3741,
            },
            {
                x = 3378,
                z = 3752,
            },
            {
                x = 3379,
                z = 3729,
            },
            {
                x = 3379,
                z = 3740,
            },
            {
                x = 3384,
                z = 3737,
            },
        },
    },
    {
        name = "Chicken",
        ids = {
            [41] = true,
            [1017] = true,
            [1401] = true,
            [1402] = true,
            [2313] = true,
            [2314] = true,
            [2315] = true,
            [11256] = true,
            [11257] = true,
            [15051] = true,
            [15052] = true,
            [15053] = true,
            [15054] = true,
        },
        locations = {
            {
                x = 2184,
                z = 3152,
            },
            {
                x = 2185,
                z = 3152,
            },
            {
                x = 2186,
                z = 3153,
            },
            {
                x = 2512,
                z = 3862,
            },
            {
                x = 2512,
                z = 3867,
            },
            {
                x = 2514,
                z = 3859,
            },
            {
                x = 2516,
                z = 3865,
            },
            {
                x = 2537,
                z = 3892,
            },
            {
                x = 2539,
                z = 3893,
            },
            {
                x = 2545,
                z = 3893,
            },
            {
                x = 2547,
                z = 3893,
            },
            {
                x = 2553,
                z = 3562,
            },
            {
                x = 2553,
                z = 3565,
            },
            {
                x = 2554,
                z = 3563,
            },
            {
                x = 2601,
                z = 3874,
            },
            {
                x = 2601,
                z = 3878,
            },
            {
                x = 2602,
                z = 3877,
            },
            {
                x = 2606,
                z = 3867,
            },
            {
                x = 2611,
                z = 3897,
            },
            {
                x = 2612,
                z = 3900,
            },
            {
                x = 2617,
                z = 3897,
            },
            {
                x = 2650,
                z = 3441,
            },
            {
                x = 2650,
                z = 3442,
            },
            {
                x = 2651,
                z = 3441,
            },
            {
                x = 2651,
                z = 3442,
            },
            {
                x = 2679,
                z = 3663,
            },
            {
                x = 2679,
                z = 3665,
            },
            {
                x = 2680,
                z = 3664,
            },
            {
                x = 2681,
                z = 3663,
            },
            {
                x = 2691,
                z = 3273,
            },
            {
                x = 2691,
                z = 3277,
            },
            {
                x = 2692,
                z = 3271,
            },
            {
                x = 2695,
                z = 3274,
            },
            {
                x = 2735,
                z = 3559,
            },
            {
                x = 2736,
                z = 3562,
            },
            {
                x = 2738,
                z = 3560,
            },
            {
                x = 2780,
                z = 3064,
            },
            {
                x = 2788,
                z = 3061,
            },
            {
                x = 2805,
                z = 3064,
            },
            {
                x = 2808,
                z = 3067,
            },
            {
                x = 2816,
                z = 3561,
            },
            {
                x = 2818,
                z = 3559,
            },
            {
                x = 2819,
                z = 3561,
            },
            {
                x = 2819,
                z = 3562,
            },
            {
                x = 2846,
                z = 3374,
            },
            {
                x = 2850,
                z = 3368,
            },
            {
                x = 2850,
                z = 3371,
            },
            {
                x = 2852,
                z = 3370,
            },
            {
                x = 2853,
                z = 3368,
            },
            {
                x = 2853,
                z = 3373,
            },
            {
                x = 2884,
                z = 3475,
            },
            {
                x = 2884,
                z = 3477,
            },
            {
                x = 2886,
                z = 3476,
            },
            {
                x = 2887,
                z = 3475,
            },
            {
                x = 2888,
                z = 3477,
            },
            {
                x = 2889,
                z = 3476,
            },
            {
                x = 2966,
                z = 3346,
            },
            {
                x = 3019,
                z = 3287,
            },
            {
                x = 3022,
                z = 3284,
            },
            {
                x = 3022,
                z = 3287,
            },
            {
                x = 3023,
                z = 3285,
            },
            {
                x = 3023,
                z = 3289,
            },
            {
                x = 3026,
                z = 3286,
            },
            {
                x = 3029,
                z = 3286,
            },
            {
                x = 3031,
                z = 3286,
            },
            {
                x = 3031,
                z = 3288,
            },
            {
                x = 3196,
                z = 3352,
            },
            {
                x = 3197,
                z = 3352,
            },
            {
                x = 3197,
                z = 3353,
            },
            {
                x = 3198,
                z = 3354,
            },
            {
                x = 3198,
                z = 3355,
            },
            {
                x = 3204,
                z = 3286,
            },
            {
                x = 3205,
                z = 3285,
            },
            {
                x = 3205,
                z = 3286,
            },
            {
                x = 3206,
                z = 3285,
            },
            {
                x = 3208,
                z = 3285,
            },
            {
                x = 3208,
                z = 3286,
            },
            {
                x = 3210,
                z = 3285,
            },
            {
                x = 3210,
                z = 3286,
            },
            {
                x = 3225,
                z = 3300,
            },
            {
                x = 3228,
                z = 3297,
            },
            {
                x = 3228,
                z = 3299,
            },
            {
                x = 3230,
                z = 3298,
            },
            {
                x = 3230,
                z = 3299,
            },
            {
                x = 3231,
                z = 3297,
            },
            {
                x = 3231,
                z = 3300,
            },
            {
                x = 3232,
                z = 3299,
            },
            {
                x = 3235,
                z = 3298,
            },
            {
                x = 3237,
                z = 3323,
            },
            {
                x = 3426,
                z = 3687,
            },
            {
                x = 3429,
                z = 3678,
            },
            {
                x = 3474,
                z = 3678,
            },
        },
    },
    {
        name = "Chinchompa (Hunter)",
        ids = {
            [5079] = true,
        },
        locations = {
            {
                x = 2314,
                z = 3596,
            },
            {
                x = 2315,
                z = 3545,
            },
            {
                x = 2315,
                z = 3549,
            },
            {
                x = 2316,
                z = 3606,
            },
            {
                x = 2317,
                z = 3539,
            },
            {
                x = 2320,
                z = 3599,
            },
            {
                x = 2321,
                z = 3611,
            },
            {
                x = 2322,
                z = 3545,
            },
            {
                x = 2330,
                z = 3622,
            },
            {
                x = 2332,
                z = 3626,
            },
            {
                x = 2334,
                z = 3591,
            },
            {
                x = 2339,
                z = 3593,
            },
            {
                x = 2339,
                z = 3615,
            },
            {
                x = 2341,
                z = 3618,
            },
            {
                x = 2342,
                z = 3590,
            },
            {
                x = 2350,
                z = 3540,
            },
            {
                x = 2351,
                z = 3534,
            },
            {
                x = 2354,
                z = 3536,
            },
            {
                x = 2356,
                z = 3540,
            },
            {
                x = 2360,
                z = 3569,
            },
            {
                x = 2361,
                z = 3561,
            },
            {
                x = 2364,
                z = 3565,
            },
        },
    },
    {
        name = "Choleric imp",
        ids = {
            [24160] = true,
        },
        locations = {
            {
                x = 3309,
                z = 3257,
            },
        },
    },
    {
        name = "City guard",
        ids = {
            [862] = true,
        },
        locations = {
            {
                x = 2541,
                z = 3029,
            },
            {
                x = 2541,
                z = 3034,
            },
            {
                x = 2543,
                z = 3031,
            },
        },
    },
    {
        name = "Cobalt skillchompa (Hunter)",
        ids = {
            [19440] = true,
        },
        locations = {
            {
                x = 2437,
                z = 3541,
            },
            {
                x = 2440,
                z = 3543,
            },
            {
                x = 2441,
                z = 3535,
            },
            {
                x = 2441,
                z = 3539,
            },
            {
                x = 2442,
                z = 3546,
            },
            {
                x = 2446,
                z = 3539,
            },
            {
                x = 2446,
                z = 3544,
            },
            {
                x = 2456,
                z = 3548,
            },
            {
                x = 2458,
                z = 3543,
            },
            {
                x = 2459,
                z = 3539,
            },
            {
                x = 2461,
                z = 3549,
            },
            {
                x = 2463,
                z = 3542,
            },
            {
                x = 2465,
                z = 3546,
            },
            {
                x = 2467,
                z = 3541,
            },
        },
    },
    {
        name = "Cockroach drone",
        ids = {
            [7158] = true,
        },
        locations = {
            {
                x = 3077,
                z = 3461,
            },
            {
                x = 3078,
                z = 3464,
            },
        },
    },
    {
        name = "Colonel Radick",
        ids = {
            [28] = true,
        },
        locations = {
            {
                x = 2535,
                z = 3091,
            },
        },
    },
    {
        name = "Common jadinko",
        ids = {
            [13109] = true,
            [13110] = true,
            [13111] = true,
            [13112] = true,
            [13113] = true,
            [13114] = true,
            [13115] = true,
            [13116] = true,
            [13117] = true,
            [13118] = true,
        },
        locations = {
            {
                x = 2947,
                z = 2924,
            },
            {
                x = 2951,
                z = 2932,
            },
            {
                x = 2953,
                z = 2934,
            },
            {
                x = 2954,
                z = 2931,
            },
            {
                x = 2956,
                z = 2924,
            },
            {
                x = 2957,
                z = 2917,
            },
            {
                x = 2957,
                z = 2921,
            },
            {
                x = 2960,
                z = 2926,
            },
            {
                x = 2967,
                z = 2923,
            },
            {
                x = 2972,
                z = 2925,
            },
        },
    },
    {
        name = "Copper longtail",
        ids = {},
        locations = {
            {
                x = 2305,
                z = 3593,
            },
            {
                x = 2307,
                z = 3596,
            },
            {
                x = 2309,
                z = 3593,
            },
            {
                x = 2310,
                z = 3587,
            },
            {
                x = 2313,
                z = 3584,
            },
            {
                x = 2315,
                z = 3587,
            },
            {
                x = 2341,
                z = 3599,
            },
            {
                x = 2341,
                z = 3604,
            },
            {
                x = 2345,
                z = 3601,
            },
            {
                x = 2352,
                z = 3584,
            },
            {
                x = 2354,
                z = 3587,
            },
            {
                x = 2357,
                z = 3584,
            },
            {
                x = 2360,
                z = 3591,
            },
            {
                x = 2362,
                z = 3588,
            },
            {
                x = 2364,
                z = 3591,
            },
        },
    },
    {
        name = "Cow",
        ids = {
            [81] = true,
            [397] = true,
            [1767] = true,
            [12362] = true,
            [12363] = true,
            [12365] = true,
            [14997] = true,
            [14998] = true,
            [14999] = true,
        },
        locations = {
            {
                x = 2580,
                z = 3117,
            },
            {
                x = 2582,
                z = 3122,
            },
            {
                x = 2588,
                z = 3119,
            },
            {
                x = 2604,
                z = 3114,
            },
            {
                x = 2733,
                z = 3561,
            },
            {
                x = 2882,
                z = 3490,
            },
            {
                x = 2883,
                z = 3482,
            },
            {
                x = 2885,
                z = 3486,
            },
            {
                x = 2885,
                z = 3491,
            },
            {
                x = 2886,
                z = 3483,
            },
            {
                x = 2887,
                z = 3489,
            },
            {
                x = 2888,
                z = 3486,
            },
            {
                x = 2945,
                z = 3270,
            },
            {
                x = 2946,
                z = 3272,
            },
            {
                x = 2946,
                z = 3275,
            },
            {
                x = 3027,
                z = 3307,
            },
            {
                x = 3029,
                z = 3305,
            },
            {
                x = 3029,
                z = 3312,
            },
            {
                x = 3030,
                z = 3300,
            },
            {
                x = 3033,
                z = 3305,
            },
            {
                x = 3037,
                z = 3306,
            },
            {
                x = 3040,
                z = 3311,
            },
            {
                x = 3154,
                z = 3325,
            },
            {
                x = 3155,
                z = 3337,
            },
            {
                x = 3156,
                z = 3332,
            },
            {
                x = 3156,
                z = 3343,
            },
            {
                x = 3160,
                z = 3318,
            },
            {
                x = 3167,
                z = 3333,
            },
            {
                x = 3169,
                z = 3339,
            },
            {
                x = 3173,
                z = 3323,
            },
            {
                x = 3180,
                z = 3338,
            },
            {
                x = 3182,
                z = 3331,
            },
            {
                x = 3197,
                z = 3320,
            },
            {
                x = 3197,
                z = 3331,
            },
            {
                x = 3243,
                z = 3295,
            },
            {
                x = 3244,
                z = 3289,
            },
            {
                x = 3247,
                z = 3284,
            },
            {
                x = 3252,
                z = 3288,
            },
            {
                x = 3254,
                z = 3255,
            },
            {
                x = 3254,
                z = 3258,
            },
            {
                x = 3254,
                z = 3262,
            },
            {
                x = 3255,
                z = 3278,
            },
            {
                x = 3256,
                z = 3292,
            },
            {
                x = 3258,
                z = 3260,
            },
            {
                x = 3258,
                z = 3265,
            },
            {
                x = 3261,
                z = 3259,
            },
            {
                x = 3261,
                z = 3270,
            },
            {
                x = 3261,
                z = 3282,
            },
            {
                x = 3261,
                z = 3292,
            },
        },
    },
    {
        name = "Crawling hand",
        ids = {
            [1648] = true,
            [1649] = true,
            [1650] = true,
            [1651] = true,
            [1652] = true,
            [1653] = true,
            [1654] = true,
            [1655] = true,
            [1656] = true,
            [1657] = true,
        },
        locations = {
            {
                x = 3401,
                z = 3563,
            },
            {
                x = 3401,
                z = 3568,
            },
            {
                x = 3402,
                z = 3547,
            },
            {
                x = 3402,
                z = 3553,
            },
            {
                x = 3402,
                z = 3570,
            },
            {
                x = 3403,
                z = 3573,
            },
            {
                x = 3404,
                z = 3561,
            },
            {
                x = 3406,
                z = 3542,
            },
            {
                x = 3406,
                z = 3551,
            },
            {
                x = 3406,
                z = 3573,
            },
            {
                x = 3407,
                z = 3559,
            },
            {
                x = 3407,
                z = 3561,
            },
            {
                x = 3408,
                z = 3572,
            },
            {
                x = 3409,
                z = 3543,
            },
            {
                x = 3410,
                z = 3572,
            },
            {
                x = 3411,
                z = 3567,
            },
            {
                x = 3412,
                z = 3564,
            },
        },
    },
    {
        name = "Crimson skillchompa (Hunter)",
        ids = {
            [19443] = true,
        },
        locations = {
            {
                x = 3147,
                z = 2866,
            },
            {
                x = 3149,
                z = 2861,
            },
            {
                x = 3149,
                z = 2870,
            },
            {
                x = 3154,
                z = 2865,
            },
            {
                x = 3156,
                z = 2860,
            },
            {
                x = 3157,
                z = 2869,
            },
            {
                x = 3160,
                z = 2866,
            },
            {
                x = 3177,
                z = 2860,
            },
            {
                x = 3179,
                z = 2857,
            },
            {
                x = 3180,
                z = 2863,
            },
            {
                x = 3183,
                z = 2859,
            },
            {
                x = 3184,
                z = 2862,
            },
            {
                x = 3184,
                z = 2867,
            },
            {
                x = 3188,
                z = 2863,
            },
        },
    },
    {
        name = "Crimson swift",
        ids = {},
        locations = {
            {
                x = 2585,
                z = 2884,
            },
            {
                x = 2588,
                z = 2886,
            },
            {
                x = 2591,
                z = 2881,
            },
            {
                x = 2604,
                z = 2916,
            },
            {
                x = 2605,
                z = 2922,
            },
            {
                x = 2606,
                z = 2893,
            },
            {
                x = 2607,
                z = 2929,
            },
            {
                x = 2609,
                z = 2897,
            },
            {
                x = 2609,
                z = 2918,
            },
            {
                x = 2610,
                z = 2934,
            },
            {
                x = 2612,
                z = 2893,
            },
            {
                x = 2612,
                z = 2900,
            },
            {
                x = 2612,
                z = 2925,
            },
            {
                x = 2614,
                z = 2938,
            },
            {
                x = 2615,
                z = 2933,
            },
            {
                x = 2922,
                z = 3504,
            },
            {
                x = 2923,
                z = 3500,
            },
            {
                x = 2923,
                z = 3507,
            },
            {
                x = 2925,
                z = 3513,
            },
            {
                x = 2928,
                z = 3497,
            },
            {
                x = 2931,
                z = 3499,
            },
            {
                x = 2931,
                z = 3514,
            },
            {
                x = 2934,
                z = 3512,
            },
            {
                x = 2935,
                z = 3502,
            },
            {
                x = 2936,
                z = 3507,
            },
        },
    },
    {
        name = "Crocodile",
        ids = {
            [1993] = true,
            [6779] = true,
        },
        locations = {
            {
                x = 3251,
                z = 2837,
            },
            {
                x = 3252,
                z = 2831,
            },
            {
                x = 3253,
                z = 2843,
            },
            {
                x = 3253,
                z = 2885,
            },
            {
                x = 3254,
                z = 2870,
            },
            {
                x = 3255,
                z = 2851,
            },
            {
                x = 3255,
                z = 2859,
            },
            {
                x = 3257,
                z = 2892,
            },
            {
                x = 3276,
                z = 2828,
            },
            {
                x = 3276,
                z = 2835,
            },
            {
                x = 3276,
                z = 2870,
            },
            {
                x = 3276,
                z = 2876,
            },
            {
                x = 3279,
                z = 2839,
            },
            {
                x = 3279,
                z = 2881,
            },
            {
                x = 3280,
                z = 2824,
            },
            {
                x = 3284,
                z = 2837,
            },
            {
                x = 3284,
                z = 2866,
            },
            {
                x = 3284,
                z = 2884,
            },
            {
                x = 3292,
                z = 2845,
            },
            {
                x = 3296,
                z = 2920,
            },
            {
                x = 3300,
                z = 2922,
            },
            {
                x = 3300,
                z = 2930,
            },
            {
                x = 3301,
                z = 2899,
            },
            {
                x = 3305,
                z = 2926,
            },
            {
                x = 3308,
                z = 2898,
            },
            {
                x = 3311,
                z = 2929,
            },
            {
                x = 3322,
                z = 2905,
            },
            {
                x = 3325,
                z = 2904,
            },
            {
                x = 3337,
                z = 2762,
            },
            {
                x = 3340,
                z = 2767,
            },
            {
                x = 3345,
                z = 2763,
            },
            {
                x = 3350,
                z = 2766,
            },
            {
                x = 3352,
                z = 2761,
            },
            {
                x = 3356,
                z = 2769,
            },
            {
                x = 3358,
                z = 2758,
            },
            {
                x = 3359,
                z = 2763,
            },
            {
                x = 3365,
                z = 2769,
            },
            {
                x = 3368,
                z = 2764,
            },
            {
                x = 3375,
                z = 2762,
            },
            {
                x = 3392,
                z = 2759,
            },
            {
                x = 3408,
                z = 2763,
            },
            {
                x = 3410,
                z = 2786,
            },
            {
                x = 3420,
                z = 2778,
            },
            {
                x = 3427,
                z = 2792,
            },
            {
                x = 3429,
                z = 2802,
            },
        },
    },
    {
        name = "Crystal skillchompa (Hunter)",
        ids = {
            [24807] = true,
        },
        locations = {
            {
                x = 2164,
                z = 3190,
            },
            {
                x = 2165,
                z = 3187,
            },
            {
                x = 2165,
                z = 3192,
            },
            {
                x = 2165,
                z = 3195,
            },
            {
                x = 2167,
                z = 3190,
            },
            {
                x = 2168,
                z = 3153,
            },
            {
                x = 2168,
                z = 3160,
            },
            {
                x = 2168,
                z = 3194,
            },
            {
                x = 2169,
                z = 3157,
            },
            {
                x = 2169,
                z = 3188,
            },
            {
                x = 2170,
                z = 3153,
            },
            {
                x = 2171,
                z = 3157,
            },
            {
                x = 2171,
                z = 3162,
            },
            {
                x = 2172,
                z = 3155,
            },
            {
                x = 2174,
                z = 3159,
            },
        },
    },
    {
        name = "Cuffs",
        ids = {
            [3237] = true,
        },
        locations = {
            {
                x = 2986,
                z = 3434,
            },
        },
    },
    {
        name = "Cute creature",
        ids = {
            [6311] = true,
        },
        locations = {
            {
                x = 2542,
                z = 3170,
            },
        },
    },
    {
        name = "Cyclops (Ardougne Zoo)",
        ids = {
            [116] = true,
        },
        locations = {
            {
                x = 2622,
                z = 3277,
            },
        },
    },
    {
        name = "Cyclops labourer",
        ids = {
            [23016] = true,
            [23017] = true,
        },
        locations = {
            {
                x = 4756,
                z = 3472,
            },
            {
                x = 4761,
                z = 3470,
            },
        },
    },
    {
        name = "Dad",
        ids = {
            [1125] = true,
        },
        locations = {
            {
                x = 2920,
                z = 3606,
            },
        },
    },
    {
        name = "Dark beast",
        ids = {
            [29346] = true,
        },
        locations = {
            {
                x = 2948,
                z = 3789,
            },
            {
                x = 2954,
                z = 3783,
            },
            {
                x = 2970,
                z = 3791,
            },
            {
                x = 2971,
                z = 3784,
            },
            {
                x = 2972,
                z = 3812,
            },
            {
                x = 2977,
                z = 3803,
            },
            {
                x = 2978,
                z = 3806,
            },
            {
                x = 2980,
                z = 3786,
            },
            {
                x = 2989,
                z = 3793,
            },
            {
                x = 2990,
                z = 3782,
            },
            {
                x = 2991,
                z = 3809,
            },
            {
                x = 3001,
                z = 3771,
            },
            {
                x = 3012,
                z = 3769,
            },
        },
    },
    {
        name = "Dark warrior",
        ids = {
            [192] = true,
        },
        locations = {
            {
                x = 3022,
                z = 3624,
            },
            {
                x = 3022,
                z = 3639,
            },
            {
                x = 3023,
                z = 3632,
            },
            {
                x = 3028,
                z = 3626,
            },
            {
                x = 3029,
                z = 3637,
            },
            {
                x = 3029,
                z = 3638,
            },
            {
                x = 3030,
                z = 3626,
            },
            {
                x = 3035,
                z = 3631,
            },
            {
                x = 3035,
                z = 3632,
            },
            {
                x = 3036,
                z = 3624,
            },
            {
                x = 3036,
                z = 3639,
            },
        },
    },
    {
        name = "Dark wizard",
        ids = {
            [3242] = true,
            [3243] = true,
            [3244] = true,
            [3245] = true,
            [8871] = true,
            [8872] = true,
            [8873] = true,
            [8874] = true,
        },
        locations = {
            {
                x = 2905,
                z = 3335,
            },
            {
                x = 2906,
                z = 3334,
            },
            {
                x = 2907,
                z = 3337,
            },
            {
                x = 2908,
                z = 3333,
            },
            {
                x = 2909,
                z = 3331,
            },
            {
                x = 2909,
                z = 3334,
            },
            {
                x = 2910,
                z = 3337,
            },
            {
                x = 3223,
                z = 3367,
            },
            {
                x = 3223,
                z = 3372,
            },
            {
                x = 3224,
                z = 3370,
            },
            {
                x = 3225,
                z = 3365,
            },
            {
                x = 3225,
                z = 3374,
            },
            {
                x = 3228,
                z = 3373,
            },
            {
                x = 3230,
                z = 3363,
            },
            {
                x = 3230,
                z = 3365,
            },
            {
                x = 3230,
                z = 3374,
            },
            {
                x = 3232,
                z = 3367,
            },
            {
                x = 3232,
                z = 3372,
            },
        },
    },
    {
        name = "Deadly red spider",
        ids = {
            [63] = true,
        },
        locations = {
            {
                x = 2338,
                z = 3310,
            },
            {
                x = 2341,
                z = 3309,
            },
            {
                x = 2343,
                z = 3309,
            },
            {
                x = 2344,
                z = 3318,
            },
            {
                x = 2345,
                z = 3310,
            },
            {
                x = 2345,
                z = 3312,
            },
            {
                x = 2350,
                z = 3310,
            },
            {
                x = 3211,
                z = 3734,
            },
            {
                x = 3213,
                z = 3728,
            },
            {
                x = 3214,
                z = 3738,
            },
            {
                x = 3215,
                z = 3748,
            },
            {
                x = 3218,
                z = 3746,
            },
            {
                x = 3226,
                z = 3750,
            },
            {
                x = 3239,
                z = 3749,
            },
            {
                x = 3244,
                z = 3743,
            },
            {
                x = 3245,
                z = 3737,
            },
            {
                x = 3247,
                z = 3748,
            },
            {
                x = 3248,
                z = 3746,
            },
        },
    },
    {
        name = "Desert lizard",
        ids = {
            [2804] = true,
            [2805] = true,
            [2806] = true,
        },
        locations = {
            {
                x = 3384,
                z = 3015,
            },
            {
                x = 3386,
                z = 3065,
            },
            {
                x = 3405,
                z = 3059,
            },
            {
                x = 3411,
                z = 3034,
            },
            {
                x = 3414,
                z = 3032,
            },
            {
                x = 3438,
                z = 3060,
            },
            {
                x = 3445,
                z = 3031,
            },
        },
    },
    {
        name = "Desert snake",
        ids = {
            [1874] = true,
        },
        locations = {
            {
                x = 3266,
                z = 2955,
            },
            {
                x = 3271,
                z = 2967,
            },
            {
                x = 3279,
                z = 2957,
            },
            {
                x = 3280,
                z = 2965,
            },
            {
                x = 3280,
                z = 2975,
            },
            {
                x = 3284,
                z = 2959,
            },
            {
                x = 3288,
                z = 2972,
            },
            {
                x = 3294,
                z = 2964,
            },
            {
                x = 3295,
                z = 2955,
            },
            {
                x = 3295,
                z = 2978,
            },
            {
                x = 3328,
                z = 2952,
            },
            {
                x = 3328,
                z = 2957,
            },
            {
                x = 3331,
                z = 2955,
            },
            {
                x = 3331,
                z = 2961,
            },
            {
                x = 3396,
                z = 3029,
            },
            {
                x = 3397,
                z = 3044,
            },
            {
                x = 3398,
                z = 3038,
            },
            {
                x = 3403,
                z = 2963,
            },
            {
                x = 3429,
                z = 2976,
            },
        },
    },
    {
        name = "Desert strykewyrm",
        ids = {
            [9464] = true,
        },
        locations = {
            {
                x = 3363,
                z = 3155,
            },
            {
                x = 3364,
                z = 3147,
            },
            {
                x = 3366,
                z = 3161,
            },
            {
                x = 3371,
                z = 3154,
            },
            {
                x = 3371,
                z = 3166,
            },
            {
                x = 3373,
                z = 3143,
            },
            {
                x = 3375,
                z = 3158,
            },
            {
                x = 3378,
                z = 3141,
            },
            {
                x = 3378,
                z = 3148,
            },
            {
                x = 3378,
                z = 3161,
            },
            {
                x = 3384,
                z = 3153,
            },
            {
                x = 3384,
                z = 3163,
            },
        },
    },
    {
        name = "Desert wolf",
        ids = {
            [839] = true,
            [6050] = true,
            [6051] = true,
        },
        locations = {
            {
                x = 3150,
                z = 3044,
            },
            {
                x = 3153,
                z = 3047,
            },
            {
                x = 3172,
                z = 3009,
            },
            {
                x = 3174,
                z = 3010,
            },
            {
                x = 3196,
                z = 3063,
            },
            {
                x = 3197,
                z = 3012,
            },
            {
                x = 3198,
                z = 3040,
            },
            {
                x = 3198,
                z = 3061,
            },
            {
                x = 3199,
                z = 3016,
            },
            {
                x = 3199,
                z = 3036,
            },
            {
                x = 3221,
                z = 3092,
            },
            {
                x = 3223,
                z = 3011,
            },
            {
                x = 3223,
                z = 3035,
            },
            {
                x = 3223,
                z = 3092,
            },
            {
                x = 3224,
                z = 3013,
            },
            {
                x = 3225,
                z = 3011,
            },
            {
                x = 3225,
                z = 3034,
            },
            {
                x = 3226,
                z = 3060,
            },
            {
                x = 3228,
                z = 3060,
            },
            {
                x = 3233,
                z = 3075,
            },
            {
                x = 3234,
                z = 3117,
            },
            {
                x = 3235,
                z = 3074,
            },
            {
                x = 3236,
                z = 3118,
            },
            {
                x = 3237,
                z = 2968,
            },
            {
                x = 3250,
                z = 3057,
            },
            {
                x = 3250,
                z = 3126,
            },
            {
                x = 3251,
                z = 3059,
            },
            {
                x = 3252,
                z = 3125,
            },
            {
                x = 3258,
                z = 3078,
            },
            {
                x = 3260,
                z = 3077,
            },
            {
                x = 3264,
                z = 3008,
            },
            {
                x = 3265,
                z = 3066,
            },
            {
                x = 3266,
                z = 3008,
            },
            {
                x = 3266,
                z = 3010,
            },
            {
                x = 3267,
                z = 3066,
            },
            {
                x = 3267,
                z = 3068,
            },
            {
                x = 3283,
                z = 3084,
            },
            {
                x = 3283,
                z = 3108,
            },
            {
                x = 3285,
                z = 3066,
            },
            {
                x = 3287,
                z = 3065,
            },
            {
                x = 3287,
                z = 3067,
            },
            {
                x = 3310,
                z = 3068,
            },
            {
                x = 3310,
                z = 3070,
            },
            {
                x = 3310,
                z = 3076,
            },
            {
                x = 3312,
                z = 3068,
            },
            {
                x = 3320,
                z = 3054,
            },
            {
                x = 3322,
                z = 3011,
            },
            {
                x = 3322,
                z = 3032,
            },
            {
                x = 3322,
                z = 3052,
            },
            {
                x = 3323,
                z = 3055,
            },
            {
                x = 3323,
                z = 3094,
            },
            {
                x = 3324,
                z = 3013,
            },
            {
                x = 3324,
                z = 3030,
            },
            {
                x = 3325,
                z = 3010,
            },
            {
                x = 3325,
                z = 3033,
            },
        },
    },
    {
        name = "Dire Wolf",
        ids = {
            [1198] = true,
        },
        locations = {
            {
                x = 2294,
                z = 3185,
            },
            {
                x = 2296,
                z = 3187,
            },
            {
                x = 2311,
                z = 3271,
            },
            {
                x = 2317,
                z = 3271,
            },
            {
                x = 2320,
                z = 3266,
            },
            {
                x = 2335,
                z = 3276,
            },
            {
                x = 2339,
                z = 3272,
            },
            {
                x = 2339,
                z = 3279,
            },
        },
    },
    {
        name = "Donny the Lad",
        ids = {
            [203] = true,
        },
        locations = {
            {
                x = 3038,
                z = 3695,
            },
        },
    },
    {
        name = "Dr Nabanik",
        ids = {
            [26966] = true,
        },
        locations = {
            {
                x = 3352,
                z = 3195,
            },
        },
    },
    {
        name = "Draconic jadinko",
        ids = {
            [13121] = true,
            [13122] = true,
            [13123] = true,
            [13124] = true,
            [13125] = true,
            [13126] = true,
            [13127] = true,
            [13128] = true,
            [13129] = true,
        },
        locations = {
            {
                x = 2946,
                z = 2936,
            },
            {
                x = 2947,
                z = 2933,
            },
            {
                x = 2950,
                z = 2920,
            },
            {
                x = 2950,
                z = 2928,
            },
            {
                x = 2962,
                z = 2916,
            },
            {
                x = 2964,
                z = 2917,
            },
            {
                x = 2965,
                z = 2912,
            },
            {
                x = 2971,
                z = 2922,
            },
            {
                x = 2971,
                z = 2927,
            },
        },
    },
    {
        name = "Drake",
        ids = {
            [6114] = true,
        },
        locations = {
            {
                x = 2993,
                z = 3386,
            },
            {
                x = 3165,
                z = 3273,
            },
            {
                x = 3178,
                z = 3268,
            },
            {
                x = 3228,
                z = 3282,
            },
        },
    },
    {
        name = "Duck",
        ids = {
            [46] = true,
            [2693] = true,
            [6113] = true,
        },
        locations = {
            {
                x = 2391,
                z = 3413,
            },
            {
                x = 2393,
                z = 3411,
            },
            {
                x = 2395,
                z = 3412,
            },
            {
                x = 2401,
                z = 3409,
            },
            {
                x = 2402,
                z = 3409,
            },
            {
                x = 2404,
                z = 3406,
            },
            {
                x = 2593,
                z = 3445,
            },
            {
                x = 2593,
                z = 3454,
            },
            {
                x = 2594,
                z = 3446,
            },
            {
                x = 2594,
                z = 3452,
            },
            {
                x = 2595,
                z = 3447,
            },
            {
                x = 2595,
                z = 3449,
            },
            {
                x = 2595,
                z = 3454,
            },
            {
                x = 2596,
                z = 3439,
            },
            {
                x = 2596,
                z = 3453,
            },
            {
                x = 2597,
                z = 3443,
            },
            {
                x = 2597,
                z = 3446,
            },
            {
                x = 2598,
                z = 3437,
            },
            {
                x = 2598,
                z = 3440,
            },
            {
                x = 2598,
                z = 3444,
            },
            {
                x = 2598,
                z = 3454,
            },
            {
                x = 2599,
                z = 3434,
            },
            {
                x = 2600,
                z = 3435,
            },
            {
                x = 2600,
                z = 3440,
            },
            {
                x = 2600,
                z = 3445,
            },
            {
                x = 2601,
                z = 3436,
            },
            {
                x = 2602,
                z = 3433,
            },
            {
                x = 2604,
                z = 3430,
            },
            {
                x = 2604,
                z = 3434,
            },
            {
                x = 2605,
                z = 3432,
            },
            {
                x = 2605,
                z = 3433,
            },
            {
                x = 2607,
                z = 3433,
            },
            {
                x = 2613,
                z = 3422,
            },
            {
                x = 2614,
                z = 3424,
            },
            {
                x = 2614,
                z = 3449,
            },
            {
                x = 2615,
                z = 3421,
            },
            {
                x = 2615,
                z = 3423,
            },
            {
                x = 2615,
                z = 3425,
            },
            {
                x = 2615,
                z = 3453,
            },
            {
                x = 2616,
                z = 3420,
            },
            {
                x = 2616,
                z = 3423,
            },
            {
                x = 2616,
                z = 3447,
            },
            {
                x = 2616,
                z = 3450,
            },
            {
                x = 2617,
                z = 3405,
            },
            {
                x = 2617,
                z = 3407,
            },
            {
                x = 2617,
                z = 3410,
            },
            {
                x = 2617,
                z = 3425,
            },
            {
                x = 2617,
                z = 3445,
            },
            {
                x = 2617,
                z = 3448,
            },
            {
                x = 2618,
                z = 3406,
            },
            {
                x = 2618,
                z = 3422,
            },
            {
                x = 2619,
                z = 3409,
            },
            {
                x = 2619,
                z = 3421,
            },
            {
                x = 2619,
                z = 3424,
            },
            {
                x = 2619,
                z = 3445,
            },
            {
                x = 2619,
                z = 3447,
            },
            {
                x = 2619,
                z = 3450,
            },
            {
                x = 2620,
                z = 3403,
            },
            {
                x = 2620,
                z = 3405,
            },
            {
                x = 2620,
                z = 3407,
            },
            {
                x = 2620,
                z = 3449,
            },
            {
                x = 2621,
                z = 3405,
            },
            {
                x = 2621,
                z = 3410,
            },
            {
                x = 2621,
                z = 3444,
            },
            {
                x = 2621,
                z = 3446,
            },
            {
                x = 2974,
                z = 3359,
            },
            {
                x = 2976,
                z = 3359,
            },
            {
                x = 2977,
                z = 3357,
            },
            {
                x = 2979,
                z = 3359,
            },
            {
                x = 2981,
                z = 3358,
            },
            {
                x = 2989,
                z = 3384,
            },
            {
                x = 2990,
                z = 3379,
            },
            {
                x = 2992,
                z = 3383,
            },
            {
                x = 2992,
                z = 3384,
            },
            {
                x = 3019,
                z = 3284,
            },
            {
                x = 3020,
                z = 3284,
            },
            {
                x = 3140,
                z = 3387,
            },
            {
                x = 3142,
                z = 3386,
            },
            {
                x = 3143,
                z = 3384,
            },
            {
                x = 3144,
                z = 3382,
            },
            {
                x = 3146,
                z = 3382,
            },
            {
                x = 3147,
                z = 3380,
            },
            {
                x = 3148,
                z = 3372,
            },
            {
                x = 3148,
                z = 3374,
            },
            {
                x = 3150,
                z = 3368,
            },
            {
                x = 3150,
                z = 3370,
            },
            {
                x = 3150,
                z = 3371,
            },
            {
                x = 3150,
                z = 3373,
            },
            {
                x = 3151,
                z = 3366,
            },
            {
                x = 3151,
                z = 3371,
            },
            {
                x = 3152,
                z = 3356,
            },
            {
                x = 3152,
                z = 3357,
            },
            {
                x = 3152,
                z = 3360,
            },
            {
                x = 3153,
                z = 3354,
            },
            {
                x = 3153,
                z = 3358,
            },
            {
                x = 3155,
                z = 3355,
            },
            {
                x = 3167,
                z = 3346,
            },
            {
                x = 3168,
                z = 3269,
            },
            {
                x = 3168,
                z = 3347,
            },
            {
                x = 3169,
                z = 3346,
            },
            {
                x = 3169,
                z = 3354,
            },
            {
                x = 3170,
                z = 3345,
            },
            {
                x = 3170,
                z = 3347,
            },
            {
                x = 3170,
                z = 3354,
            },
            {
                x = 3171,
                z = 3271,
            },
            {
                x = 3171,
                z = 3346,
            },
            {
                x = 3171,
                z = 3353,
            },
            {
                x = 3171,
                z = 3355,
            },
            {
                x = 3172,
                z = 3354,
            },
            {
                x = 3173,
                z = 3264,
            },
            {
                x = 3173,
                z = 3277,
            },
            {
                x = 3173,
                z = 3351,
            },
            {
                x = 3173,
                z = 3353,
            },
            {
                x = 3174,
                z = 3271,
            },
            {
                x = 3181,
                z = 3348,
            },
            {
                x = 3183,
                z = 3347,
            },
            {
                x = 3183,
                z = 3348,
            },
            {
                x = 3187,
                z = 3344,
            },
            {
                x = 3191,
                z = 3342,
            },
            {
                x = 3194,
                z = 3341,
            },
            {
                x = 3194,
                z = 3343,
            },
            {
                x = 3196,
                z = 3339,
            },
            {
                x = 3211,
                z = 3322,
            },
            {
                x = 3214,
                z = 3313,
            },
            {
                x = 3214,
                z = 3314,
            },
            {
                x = 3214,
                z = 3318,
            },
            {
                x = 3214,
                z = 3320,
            },
            {
                x = 3215,
                z = 3303,
            },
            {
                x = 3216,
                z = 3314,
            },
            {
                x = 3218,
                z = 3287,
            },
            {
                x = 3219,
                z = 3285,
            },
            {
                x = 3219,
                z = 3288,
            },
            {
                x = 3223,
                z = 3281,
            },
            {
                x = 3226,
                z = 3283,
            },
            {
                x = 3229,
                z = 3280,
            },
            {
                x = 3231,
                z = 3271,
            },
            {
                x = 3233,
                z = 3267,
            },
            {
                x = 3233,
                z = 3270,
            },
            {
                x = 3234,
                z = 3267,
            },
            {
                x = 3234,
                z = 3268,
            },
            {
                x = 3235,
                z = 3259,
            },
            {
                x = 3235,
                z = 3265,
            },
            {
                x = 3238,
                z = 3238,
            },
            {
                x = 3238,
                z = 3244,
            },
            {
                x = 3238,
                z = 3246,
            },
            {
                x = 3239,
                z = 3235,
            },
            {
                x = 3241,
                z = 3230,
            },
            {
                x = 3241,
                z = 3234,
            },
            {
                x = 3243,
                z = 3228,
            },
            {
                x = 3247,
                z = 3221,
            },
            {
                x = 3248,
                z = 3220,
            },
            {
                x = 3259,
                z = 3212,
            },
        },
    },
    {
        name = "Duckling",
        ids = {
            [2694] = true,
            [6112] = true,
        },
        locations = {
            {
                x = 2393,
                z = 3412,
            },
            {
                x = 2593,
                z = 3446,
            },
            {
                x = 2601,
                z = 3437,
            },
            {
                x = 2604,
                z = 3431,
            },
            {
                x = 2613,
                z = 3423,
            },
            {
                x = 2616,
                z = 3424,
            },
            {
                x = 2975,
                z = 3359,
            },
            {
                x = 2980,
                z = 3359,
            },
            {
                x = 2982,
                z = 3358,
            },
            {
                x = 3167,
                z = 3269,
            },
            {
                x = 3169,
                z = 3269,
            },
            {
                x = 3171,
                z = 3272,
            },
            {
                x = 3238,
                z = 3239,
            },
            {
                x = 3238,
                z = 3247,
            },
        },
    },
    {
        name = "Dwarf",
        ids = {
            [118] = true,
            [3219] = true,
            [3220] = true,
            [3221] = true,
            [3268] = true,
            [3269] = true,
            [3270] = true,
            [3271] = true,
            [3272] = true,
            [3273] = true,
            [3274] = true,
            [3275] = true,
        },
        locations = {
            {
                x = 2596,
                z = 3056,
            },
            {
                x = 2600,
                z = 3062,
            },
            {
                x = 2605,
                z = 3057,
            },
            {
                x = 2608,
                z = 3061,
            },
            {
                x = 3000,
                z = 3445,
            },
            {
                x = 3008,
                z = 3436,
            },
            {
                x = 3009,
                z = 3458,
            },
            {
                x = 3012,
                z = 3337,
            },
            {
                x = 3015,
                z = 3435,
            },
            {
                x = 3016,
                z = 3450,
            },
            {
                x = 3017,
                z = 3447,
            },
            {
                x = 3018,
                z = 3447,
            },
            {
                x = 3019,
                z = 3333,
            },
            {
                x = 3021,
                z = 3437,
            },
            {
                x = 3021,
                z = 3447,
            },
            {
                x = 3023,
                z = 3458,
            },
            {
                x = 3024,
                z = 3463,
            },
            {
                x = 3025,
                z = 3347,
            },
            {
                x = 3029,
                z = 3445,
            },
            {
                x = 3030,
                z = 3464,
            },
        },
    },
    {
        name = "Earth wizard",
        ids = {
            [2711] = true,
        },
        locations = {
            {
                x = 3003,
                z = 3268,
            },
        },
    },
    {
        name = "Eduard",
        ids = {
            [6031] = true,
        },
        locations = {
            {
                x = 3511,
                z = 3482,
            },
        },
    },
    {
        name = "Einar",
        ids = {
            [1380] = true,
        },
        locations = {
            {
                x = 2501,
                z = 3868,
            },
        },
    },
    {
        name = "Elf warrior",
        ids = {
            [1183] = true,
            [1184] = true,
            [1201] = true,
            [2359] = true,
            [2360] = true,
            [2361] = true,
        },
        locations = {
            {
                x = 2188,
                z = 3242,
            },
            {
                x = 2193,
                z = 3244,
            },
            {
                x = 2193,
                z = 3256,
            },
            {
                x = 2195,
                z = 3250,
            },
            {
                x = 2197,
                z = 3251,
            },
            {
                x = 2201,
                z = 3251,
            },
            {
                x = 2202,
                z = 3254,
            },
            {
                x = 2203,
                z = 3257,
            },
            {
                x = 2204,
                z = 3255,
            },
            {
                x = 2208,
                z = 3254,
            },
            {
                x = 2210,
                z = 3239,
            },
            {
                x = 2210,
                z = 3254,
            },
            {
                x = 2328,
                z = 3172,
            },
            {
                x = 2329,
                z = 3171,
            },
            {
                x = 2345,
                z = 3175,
            },
            {
                x = 2382,
                z = 3334,
            },
            {
                x = 2389,
                z = 3334,
            },
        },
    },
    {
        name = "Elite Black Knight",
        ids = {
            [8324] = true,
            [8329] = true,
            [8330] = true,
        },
        locations = {
            {
                x = 2911,
                z = 3811,
            },
            {
                x = 2911,
                z = 3812,
            },
            {
                x = 2911,
                z = 3813,
            },
            {
                x = 2925,
                z = 3821,
            },
            {
                x = 2925,
                z = 3822,
            },
            {
                x = 2925,
                z = 3823,
            },
            {
                x = 2929,
                z = 3798,
            },
            {
                x = 2933,
                z = 3807,
            },
            {
                x = 2936,
                z = 3790,
            },
            {
                x = 2936,
                z = 3810,
            },
            {
                x = 2939,
                z = 3823,
            },
            {
                x = 2941,
                z = 3823,
            },
        },
    },
    {
        name = "Enclave guard",
        ids = {
            [870] = true,
        },
        locations = {
            {
                x = 2507,
                z = 3036,
            },
            {
                x = 2507,
                z = 3040,
            },
        },
    },
    {
        name = "Entranan firebird",
        ids = {
            [6108] = true,
        },
        locations = {
            {
                x = 2847,
                z = 3386,
            },
        },
    },
    {
        name = "Essyllt",
        ids = {
            [1187] = true,
        },
        locations = {
            {
                x = 2310,
                z = 3214,
            },
        },
    },
    {
        name = "Estate agent",
        ids = {
            [4247] = true,
        },
        locations = {
            {
                x = 2639,
                z = 3291,
            },
            {
                x = 2732,
                z = 3467,
            },
            {
                x = 2737,
                z = 3502,
            },
            {
                x = 2983,
                z = 3369,
            },
            {
                x = 3240,
                z = 3476,
            },
        },
    },
    {
        name = "Evil creature",
        ids = {
            [6312] = true,
        },
        locations = {
            {
                x = 2542,
                z = 3170,
            },
        },
    },
    {
        name = "Farmer",
        ids = {
            [7] = true,
            [1757] = true,
            [1758] = true,
        },
        locations = {
            {
                x = 2617,
                z = 3355,
            },
            {
                x = 2621,
                z = 3355,
            },
            {
                x = 2897,
                z = 3404,
            },
            {
                x = 3193,
                z = 3323,
            },
            {
                x = 3227,
                z = 3292,
            },
            {
                x = 3233,
                z = 3308,
            },
            {
                x = 3262,
                z = 3325,
            },
        },
    },
    {
        name = "Farmer (Varrock)",
        ids = {
            [1759] = true,
        },
        locations = {
            {
                x = 3250,
                z = 3310,
            },
        },
    },
    {
        name = "Fenris wolf",
        ids = {
            [1330] = true,
        },
        locations = {
            {
                x = 2614,
                z = 3643,
            },
            {
                x = 2615,
                z = 3628,
            },
            {
                x = 2615,
                z = 3632,
            },
            {
                x = 2617,
                z = 3646,
            },
            {
                x = 2618,
                z = 3626,
            },
            {
                x = 2619,
                z = 3641,
            },
            {
                x = 2626,
                z = 3633,
            },
            {
                x = 2630,
                z = 3631,
            },
            {
                x = 2630,
                z = 3637,
            },
            {
                x = 2641,
                z = 3626,
            },
            {
                x = 2642,
                z = 3622,
            },
            {
                x = 2644,
                z = 3627,
            },
        },
    },
    {
        name = "Feral vampyre",
        ids = {
            [1223] = true,
        },
        locations = {
            {
                x = 3458,
                z = 3225,
            },
            {
                x = 3459,
                z = 3229,
            },
            {
                x = 3459,
                z = 3234,
            },
            {
                x = 3460,
                z = 3231,
            },
            {
                x = 3461,
                z = 3236,
            },
            {
                x = 3462,
                z = 3240,
            },
            {
                x = 3585,
                z = 3478,
            },
            {
                x = 3586,
                z = 3480,
            },
            {
                x = 3586,
                z = 3496,
            },
            {
                x = 3592,
                z = 3477,
            },
            {
                x = 3593,
                z = 3458,
            },
            {
                x = 3593,
                z = 3508,
            },
            {
                x = 3595,
                z = 3491,
            },
            {
                x = 3597,
                z = 3479,
            },
            {
                x = 3607,
                z = 3466,
            },
            {
                x = 3617,
                z = 3477,
            },
            {
                x = 3618,
                z = 3514,
            },
            {
                x = 3631,
                z = 3471,
            },
            {
                x = 3631,
                z = 3499,
            },
            {
                x = 3632,
                z = 3459,
            },
            {
                x = 3632,
                z = 3475,
            },
            {
                x = 3638,
                z = 3472,
            },
            {
                x = 3646,
                z = 3467,
            },
        },
    },
    {
        name = "Ferret (Hunter)",
        ids = {
            [5081] = true,
        },
        locations = {
            {
                x = 2305,
                z = 3516,
            },
            {
                x = 2309,
                z = 3515,
            },
            {
                x = 2311,
                z = 3506,
            },
            {
                x = 2311,
                z = 3519,
            },
            {
                x = 2313,
                z = 3510,
            },
            {
                x = 2316,
                z = 3500,
            },
            {
                x = 2316,
                z = 3511,
            },
            {
                x = 2317,
                z = 3505,
            },
            {
                x = 2319,
                z = 3518,
            },
            {
                x = 2607,
                z = 3260,
            },
        },
    },
    {
        name = "Fetid zombie",
        ids = {
            [49] = true,
            [30017] = true,
        },
        locations = {
            {
                x = 3264,
                z = 3549,
            },
            {
                x = 3264,
                z = 3555,
            },
            {
                x = 3264,
                z = 3575,
            },
            {
                x = 3265,
                z = 3576,
            },
            {
                x = 3265,
                z = 3582,
            },
            {
                x = 3266,
                z = 3567,
            },
            {
                x = 3267,
                z = 3594,
            },
            {
                x = 3270,
                z = 3589,
            },
            {
                x = 3271,
                z = 3599,
            },
            {
                x = 3272,
                z = 3577,
            },
            {
                x = 3272,
                z = 3597,
            },
            {
                x = 3276,
                z = 3595,
            },
            {
                x = 3277,
                z = 3593,
            },
        },
    },
    {
        name = "Fire wizard",
        ids = {
            [2709] = true,
        },
        locations = {
            {
                x = 3003,
                z = 3266,
            },
        },
    },
    {
        name = "Firefly (The Lost Grove)",
        ids = {
            [24841] = true,
            [24842] = true,
        },
        locations = {
            {
                x = 2214,
                z = 2835,
            },
            {
                x = 2214,
                z = 2836,
            },
            {
                x = 2214,
                z = 2837,
            },
            {
                x = 2215,
                z = 2835,
            },
            {
                x = 2215,
                z = 2836,
            },
            {
                x = 2215,
                z = 2837,
            },
            {
                x = 2216,
                z = 2835,
            },
            {
                x = 2216,
                z = 2836,
            },
            {
                x = 2216,
                z = 2837,
            },
            {
                x = 2222,
                z = 2777,
            },
            {
                x = 2222,
                z = 2778,
            },
            {
                x = 2222,
                z = 2779,
            },
            {
                x = 2223,
                z = 2777,
            },
            {
                x = 2223,
                z = 2778,
            },
            {
                x = 2223,
                z = 2779,
            },
            {
                x = 2224,
                z = 2777,
            },
            {
                x = 2224,
                z = 2778,
            },
            {
                x = 2224,
                z = 2779,
            },
            {
                x = 2230,
                z = 2885,
            },
            {
                x = 2231,
                z = 2884,
            },
            {
                x = 2231,
                z = 2885,
            },
            {
                x = 2231,
                z = 2886,
            },
            {
                x = 2232,
                z = 2884,
            },
            {
                x = 2232,
                z = 2885,
            },
            {
                x = 2253,
                z = 2786,
            },
            {
                x = 2254,
                z = 2786,
            },
            {
                x = 2254,
                z = 2787,
            },
            {
                x = 2254,
                z = 2789,
            },
            {
                x = 2255,
                z = 2787,
            },
            {
                x = 2255,
                z = 2788,
            },
            {
                x = 2255,
                z = 2789,
            },
            {
                x = 2256,
                z = 2786,
            },
            {
                x = 2256,
                z = 2788,
            },
            {
                x = 2265,
                z = 2899,
            },
            {
                x = 2266,
                z = 2899,
            },
            {
                x = 2266,
                z = 2900,
            },
            {
                x = 2266,
                z = 2901,
            },
            {
                x = 2267,
                z = 2899,
            },
            {
                x = 2267,
                z = 2900,
            },
            {
                x = 2292,
                z = 2775,
            },
            {
                x = 2292,
                z = 2776,
            },
            {
                x = 2293,
                z = 2775,
            },
            {
                x = 2293,
                z = 2777,
            },
            {
                x = 2294,
                z = 2776,
            },
            {
                x = 2294,
                z = 2777,
            },
            {
                x = 2295,
                z = 2774,
            },
            {
                x = 2313,
                z = 2897,
            },
            {
                x = 2314,
                z = 2896,
            },
            {
                x = 2314,
                z = 2897,
            },
            {
                x = 2314,
                z = 2898,
            },
            {
                x = 2315,
                z = 2896,
            },
            {
                x = 2315,
                z = 2897,
            },
            {
                x = 2316,
                z = 2796,
            },
            {
                x = 2317,
                z = 2794,
            },
            {
                x = 2318,
                z = 2795,
            },
            {
                x = 2318,
                z = 2796,
            },
            {
                x = 2318,
                z = 2797,
            },
            {
                x = 2319,
                z = 2797,
            },
            {
                x = 2329,
                z = 3593,
            },
            {
                x = 2334,
                z = 2816,
            },
            {
                x = 2335,
                z = 2817,
            },
            {
                x = 2335,
                z = 2849,
            },
            {
                x = 2335,
                z = 2851,
            },
            {
                x = 2336,
                z = 2817,
            },
            {
                x = 2336,
                z = 2818,
            },
            {
                x = 2336,
                z = 2849,
            },
            {
                x = 2336,
                z = 2850,
            },
            {
                x = 2336,
                z = 2852,
            },
            {
                x = 2337,
                z = 2816,
            },
            {
                x = 2337,
                z = 2818,
            },
            {
                x = 2337,
                z = 2851,
            },
        },
    },
    {
        name = "Fisherman (Fish Flingers)",
        ids = {
            [15567] = true,
            [15568] = true,
        },
        locations = {
            {
                x = 2576,
                z = 3529,
            },
            {
                x = 2618,
                z = 3385,
            },
        },
    },
    {
        name = "Flesh-hatcher Mhekarnahz",
        ids = {},
        locations = {
            {
                x = 3354,
                z = 3757,
            },
        },
    },
    {
        name = "Foal (black)",
        ids = {
            [1329] = true,
        },
        locations = {
            {
                x = 2707,
                z = 3670,
            },
            {
                x = 2710,
                z = 3672,
            },
            {
                x = 2728,
                z = 3661,
            },
            {
                x = 2732,
                z = 3659,
            },
            {
                x = 3085,
                z = 3640,
            },
        },
    },
    {
        name = "Foal (white)",
        ids = {
            [1328] = true,
        },
        locations = {
            {
                x = 2716,
                z = 3610,
            },
            {
                x = 2739,
                z = 3605,
            },
            {
                x = 2743,
                z = 3605,
            },
        },
    },
    {
        name = "Foreman",
        ids = {
            [674] = true,
        },
        locations = {
            {
                x = 2999,
                z = 3043,
            },
        },
    },
    {
        name = "Fox",
        ids = {
            [1319] = true,
        },
        locations = {
            {
                x = 2636,
                z = 3609,
            },
            {
                x = 2644,
                z = 3604,
            },
            {
                x = 2671,
                z = 3614,
            },
            {
                x = 2676,
                z = 3606,
            },
            {
                x = 2680,
                z = 3616,
            },
            {
                x = 2682,
                z = 3607,
            },
            {
                x = 2694,
                z = 3604,
            },
            {
                x = 2710,
                z = 3603,
            },
            {
                x = 2725,
                z = 3602,
            },
            {
                x = 2738,
                z = 3597,
            },
        },
    },
    {
        name = "Freidir",
        ids = {
            [1306] = true,
        },
        locations = {
            {
                x = 2674,
                z = 3675,
            },
        },
    },
    {
        name = "Freygerd (Rellekka)",
        ids = {
            [1310] = true,
        },
        locations = {
            {
                x = 2667,
                z = 3702,
            },
        },
    },
    {
        name = "Gadderanks",
        ids = {
            [3516] = true,
        },
        locations = {
            {
                x = 3514,
                z = 3241,
            },
        },
    },
    {
        name = "Gardener",
        ids = {
            [18930] = true,
        },
        locations = {
            {
                x = 3011,
                z = 3386,
            },
        },
    },
    {
        name = "Gargoyle",
        ids = {
            [1610] = true,
        },
        locations = {
            {
                x = 3209,
                z = 3729,
            },
            {
                x = 3211,
                z = 3737,
            },
            {
                x = 3217,
                z = 3727,
            },
            {
                x = 3217,
                z = 3748,
            },
            {
                x = 3223,
                z = 3732,
            },
            {
                x = 3225,
                z = 3738,
            },
            {
                x = 3230,
                z = 3727,
            },
            {
                x = 3238,
                z = 3728,
            },
            {
                x = 3240,
                z = 3736,
            },
            {
                x = 3240,
                z = 3745,
            },
            {
                x = 3245,
                z = 3746,
            },
        },
    },
    {
        name = "General Khazard",
        ids = {
            [5573] = true,
            [7555] = true,
        },
        locations = {
            {
                x = 2606,
                z = 3154,
            },
            {
                x = 2723,
                z = 3622,
            },
        },
    },
    {
        name = "Georgy",
        ids = {
            [6033] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3478,
            },
        },
    },
    {
        name = "Ghast",
        ids = {
            [1052] = true,
        },
        locations = {
            {
                x = 3401,
                z = 3361,
            },
            {
                x = 3404,
                z = 3371,
            },
            {
                x = 3406,
                z = 3354,
            },
            {
                x = 3407,
                z = 3379,
            },
            {
                x = 3408,
                z = 3386,
            },
            {
                x = 3410,
                z = 3398,
            },
            {
                x = 3411,
                z = 3380,
            },
            {
                x = 3412,
                z = 3357,
            },
            {
                x = 3413,
                z = 3423,
            },
            {
                x = 3413,
                z = 3443,
            },
            {
                x = 3414,
                z = 3365,
            },
            {
                x = 3414,
                z = 3418,
            },
            {
                x = 3415,
                z = 3372,
            },
            {
                x = 3415,
                z = 3390,
            },
            {
                x = 3415,
                z = 3407,
            },
            {
                x = 3415,
                z = 3432,
            },
            {
                x = 3416,
                z = 3345,
            },
            {
                x = 3417,
                z = 3337,
            },
            {
                x = 3417,
                z = 3385,
            },
            {
                x = 3418,
                z = 3356,
            },
            {
                x = 3419,
                z = 3361,
            },
            {
                x = 3419,
                z = 3395,
            },
            {
                x = 3419,
                z = 3413,
            },
            {
                x = 3420,
                z = 3333,
            },
            {
                x = 3420,
                z = 3425,
            },
            {
                x = 3420,
                z = 3435,
            },
            {
                x = 3420,
                z = 3440,
            },
            {
                x = 3422,
                z = 3395,
            },
            {
                x = 3423,
                z = 3348,
            },
            {
                x = 3424,
                z = 3337,
            },
            {
                x = 3424,
                z = 3403,
            },
            {
                x = 3425,
                z = 3395,
            },
            {
                x = 3426,
                z = 3366,
            },
            {
                x = 3426,
                z = 3419,
            },
            {
                x = 3427,
                z = 3379,
            },
            {
                x = 3427,
                z = 3389,
            },
            {
                x = 3427,
                z = 3431,
            },
            {
                x = 3428,
                z = 3395,
            },
            {
                x = 3428,
                z = 3445,
            },
            {
                x = 3429,
                z = 3330,
            },
            {
                x = 3429,
                z = 3352,
            },
            {
                x = 3429,
                z = 3436,
            },
            {
                x = 3430,
                z = 3344,
            },
            {
                x = 3431,
                z = 3366,
            },
            {
                x = 3432,
                z = 3419,
            },
            {
                x = 3432,
                z = 3445,
            },
            {
                x = 3436,
                z = 3389,
            },
            {
                x = 3437,
                z = 3401,
            },
            {
                x = 3437,
                z = 3435,
            },
            {
                x = 3441,
                z = 3364,
            },
            {
                x = 3441,
                z = 3415,
            },
            {
                x = 3441,
                z = 3428,
            },
            {
                x = 3442,
                z = 3395,
            },
            {
                x = 3443,
                z = 3383,
            },
            {
                x = 3443,
                z = 3432,
            },
            {
                x = 3444,
                z = 3406,
            },
            {
                x = 3445,
                z = 3394,
            },
            {
                x = 3447,
                z = 3391,
            },
            {
                x = 3448,
                z = 3393,
            },
            {
                x = 3449,
                z = 3345,
            },
            {
                x = 3450,
                z = 3423,
            },
            {
                x = 3450,
                z = 3430,
            },
            {
                x = 3451,
                z = 3396,
            },
            {
                x = 3453,
                z = 3357,
            },
            {
                x = 3453,
                z = 3386,
            },
            {
                x = 3453,
                z = 3395,
            },
            {
                x = 3453,
                z = 3436,
            },
            {
                x = 3454,
                z = 3346,
            },
            {
                x = 3454,
                z = 3369,
            },
            {
                x = 3454,
                z = 3414,
            },
            {
                x = 3456,
                z = 3343,
            },
            {
                x = 3456,
                z = 3366,
            },
            {
                x = 3456,
                z = 3390,
            },
            {
                x = 3457,
                z = 3351,
            },
            {
                x = 3457,
                z = 3356,
            },
            {
                x = 3457,
                z = 3370,
            },
            {
                x = 3457,
                z = 3378,
            },
            {
                x = 3457,
                z = 3411,
            },
            {
                x = 3458,
                z = 3340,
            },
            {
                x = 3458,
                z = 3401,
            },
            {
                x = 3460,
                z = 3375,
            },
            {
                x = 3461,
                z = 3406,
            },
            {
                x = 3462,
                z = 3399,
            },
            {
                x = 3463,
                z = 3336,
            },
            {
                x = 3463,
                z = 3341,
            },
            {
                x = 3463,
                z = 3353,
            },
            {
                x = 3463,
                z = 3416,
            },
            {
                x = 3463,
                z = 3448,
            },
            {
                x = 3464,
                z = 3372,
            },
            {
                x = 3464,
                z = 3380,
            },
            {
                x = 3464,
                z = 3441,
            },
            {
                x = 3465,
                z = 3359,
            },
            {
                x = 3466,
                z = 3332,
            },
            {
                x = 3467,
                z = 3380,
            },
            {
                x = 3467,
                z = 3415,
            },
            {
                x = 3468,
                z = 3348,
            },
            {
                x = 3469,
                z = 3368,
            },
            {
                x = 3469,
                z = 3390,
            },
            {
                x = 3469,
                z = 3397,
            },
            {
                x = 3470,
                z = 3381,
            },
            {
                x = 3472,
                z = 3362,
            },
            {
                x = 3473,
                z = 3352,
            },
            {
                x = 3473,
                z = 3394,
            },
            {
                x = 3473,
                z = 3412,
            },
            {
                x = 3474,
                z = 3380,
            },
            {
                x = 3474,
                z = 3387,
            },
            {
                x = 3475,
                z = 3373,
            },
            {
                x = 3475,
                z = 3401,
            },
            {
                x = 3477,
                z = 3354,
            },
            {
                x = 3478,
                z = 3328,
            },
            {
                x = 3481,
                z = 3406,
            },
            {
                x = 3482,
                z = 3343,
            },
            {
                x = 3482,
                z = 3419,
            },
            {
                x = 3482,
                z = 3431,
            },
            {
                x = 3482,
                z = 3442,
            },
            {
                x = 3485,
                z = 3373,
            },
            {
                x = 3485,
                z = 3436,
            },
            {
                x = 3485,
                z = 3451,
            },
            {
                x = 3486,
                z = 3329,
            },
            {
                x = 3486,
                z = 3380,
            },
            {
                x = 3486,
                z = 3399,
            },
            {
                x = 3486,
                z = 3407,
            },
            {
                x = 3487,
                z = 3368,
            },
            {
                x = 3487,
                z = 3423,
            },
            {
                x = 3488,
                z = 3343,
            },
            {
                x = 3488,
                z = 3350,
            },
            {
                x = 3488,
                z = 3357,
            },
            {
                x = 3490,
                z = 3395,
            },
            {
                x = 3490,
                z = 3446,
            },
            {
                x = 3491,
                z = 3376,
            },
            {
                x = 3491,
                z = 3381,
            },
            {
                x = 3491,
                z = 3388,
            },
            {
                x = 3491,
                z = 3430,
            },
            {
                x = 3492,
                z = 3360,
            },
            {
                x = 3492,
                z = 3371,
            },
            {
                x = 3492,
                z = 3405,
            },
            {
                x = 3494,
                z = 3328,
            },
            {
                x = 3494,
                z = 3341,
            },
            {
                x = 3496,
                z = 3395,
            },
            {
                x = 3497,
                z = 3409,
            },
            {
                x = 3497,
                z = 3417,
            },
            {
                x = 3498,
                z = 3354,
            },
            {
                x = 3498,
                z = 3452,
            },
            {
                x = 3500,
                z = 3385,
            },
            {
                x = 3500,
                z = 3422,
            },
            {
                x = 3501,
                z = 3388,
            },
            {
                x = 3501,
                z = 3403,
            },
            {
                x = 3502,
                z = 3328,
            },
            {
                x = 3502,
                z = 3350,
            },
            {
                x = 3502,
                z = 3363,
            },
            {
                x = 3502,
                z = 3415,
            },
            {
                x = 3503,
                z = 3359,
            },
            {
                x = 3505,
                z = 3379,
            },
            {
                x = 3507,
                z = 3348,
            },
            {
                x = 3508,
                z = 3367,
            },
            {
                x = 3508,
                z = 3393,
            },
            {
                x = 3508,
                z = 3400,
            },
            {
                x = 3509,
                z = 3421,
            },
            {
                x = 3510,
                z = 3341,
            },
            {
                x = 3510,
                z = 3381,
            },
            {
                x = 3511,
                z = 3397,
            },
            {
                x = 3511,
                z = 3408,
            },
            {
                x = 3512,
                z = 3328,
            },
            {
                x = 3513,
                z = 3383,
            },
            {
                x = 3514,
                z = 3418,
            },
            {
                x = 3515,
                z = 3414,
            },
            {
                x = 3516,
                z = 3393,
            },
            {
                x = 3516,
                z = 3404,
            },
            {
                x = 3517,
                z = 3329,
            },
            {
                x = 3517,
                z = 3336,
            },
            {
                x = 3517,
                z = 3452,
            },
            {
                x = 3518,
                z = 3399,
            },
            {
                x = 3518,
                z = 3417,
            },
            {
                x = 3518,
                z = 3428,
            },
            {
                x = 3523,
                z = 3436,
            },
            {
                x = 3526,
                z = 3398,
            },
            {
                x = 3531,
                z = 3425,
            },
            {
                x = 3548,
                z = 3450,
            },
            {
                x = 3563,
                z = 3444,
            },
        },
    },
    {
        name = "Ghost",
        ids = {
            [103] = true,
            [5342] = true,
            [5343] = true,
            [5345] = true,
            [5346] = true,
            [5347] = true,
            [5348] = true,
        },
        locations = {
            {
                x = 2501,
                z = 3289,
            },
            {
                x = 2501,
                z = 3294,
            },
            {
                x = 2962,
                z = 3755,
            },
            {
                x = 2968,
                z = 3749,
            },
            {
                x = 2968,
                z = 3761,
            },
            {
                x = 2985,
                z = 3749,
            },
            {
                x = 2985,
                z = 3761,
            },
            {
                x = 2990,
                z = 3755,
            },
            {
                x = 3272,
                z = 3664,
            },
            {
                x = 3276,
                z = 3659,
            },
            {
                x = 3279,
                z = 3654,
            },
            {
                x = 3282,
                z = 3662,
            },
            {
                x = 3288,
                z = 3650,
            },
            {
                x = 3290,
                z = 3653,
            },
        },
    },
    {
        name = "Ghost (Ourania Runecrafting Altar)",
        ids = {
            [491] = true,
        },
        locations = {
            {
                x = 2460,
                z = 3223,
            },
            {
                x = 2464,
                z = 3223,
            },
            {
                x = 2465,
                z = 3220,
            },
            {
                x = 2468,
                z = 3221,
            },
            {
                x = 2469,
                z = 3226,
            },
            {
                x = 2476,
                z = 3223,
            },
        },
    },
    {
        name = "Ghoul",
        ids = {
            [1218] = true,
            [22531] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3533,
            },
            {
                x = 3484,
                z = 3530,
            },
            {
                x = 3484,
                z = 3537,
            },
            {
                x = 3484,
                z = 3542,
            },
            {
                x = 3484,
                z = 3545,
            },
            {
                x = 3485,
                z = 3528,
            },
            {
                x = 3486,
                z = 3540,
            },
            {
                x = 3487,
                z = 3548,
            },
            {
                x = 3488,
                z = 3531,
            },
            {
                x = 3489,
                z = 3535,
            },
            {
                x = 3490,
                z = 3529,
            },
            {
                x = 3490,
                z = 3540,
            },
            {
                x = 3490,
                z = 3549,
            },
            {
                x = 3492,
                z = 3533,
            },
            {
                x = 3494,
                z = 3528,
            },
            {
                x = 3494,
                z = 3540,
            },
            {
                x = 3494,
                z = 3548,
            },
            {
                x = 3495,
                z = 3537,
            },
            {
                x = 3496,
                z = 3535,
            },
            {
                x = 3496,
                z = 3542,
            },
            {
                x = 3496,
                z = 3546,
            },
            {
                x = 3497,
                z = 3530,
            },
            {
                x = 3497,
                z = 3533,
            },
            {
                x = 3500,
                z = 3527,
            },
        },
    },
    {
        name = "Giant ant soldier",
        ids = {
            [6380] = true,
        },
        locations = {
            {
                x = 2883,
                z = 2994,
            },
            {
                x = 2888,
                z = 2983,
            },
            {
                x = 2889,
                z = 2981,
            },
            {
                x = 2891,
                z = 2983,
            },
            {
                x = 2891,
                z = 2994,
            },
            {
                x = 2902,
                z = 2982,
            },
            {
                x = 2905,
                z = 2982,
            },
            {
                x = 2905,
                z = 2985,
            },
        },
    },
    {
        name = "Giant ant worker",
        ids = {
            [6379] = true,
        },
        locations = {
            {
                x = 2885,
                z = 2991,
            },
            {
                x = 2887,
                z = 2980,
            },
            {
                x = 2893,
                z = 2984,
            },
            {
                x = 2898,
                z = 2991,
            },
            {
                x = 2900,
                z = 2974,
            },
            {
                x = 2903,
                z = 2973,
            },
            {
                x = 2903,
                z = 2978,
            },
            {
                x = 2903,
                z = 2984,
            },
            {
                x = 2906,
                z = 2970,
            },
            {
                x = 2906,
                z = 2976,
            },
            {
                x = 2907,
                z = 2979,
            },
            {
                x = 2909,
                z = 2969,
            },
        },
    },
    {
        name = "Giant bat",
        ids = {
            [78] = true,
        },
        locations = {
            {
                x = 2571,
                z = 3481,
            },
            {
                x = 2572,
                z = 3472,
            },
            {
                x = 2578,
                z = 3476,
            },
            {
                x = 2586,
                z = 3473,
            },
            {
                x = 2591,
                z = 3479,
            },
            {
                x = 2592,
                z = 3484,
            },
            {
                x = 2594,
                z = 3474,
            },
            {
                x = 2752,
                z = 3409,
            },
            {
                x = 2753,
                z = 3396,
            },
            {
                x = 2759,
                z = 3401,
            },
        },
    },
    {
        name = "Giant lobster",
        ids = {
            [4891] = true,
        },
        locations = {
            {
                x = 2768,
                z = 3286,
            },
            {
                x = 2777,
                z = 3278,
            },
            {
                x = 2783,
                z = 3289,
            },
            {
                x = 2784,
                z = 3277,
            },
        },
    },
    {
        name = "Giant mosquito",
        ids = {
            [4347] = true,
        },
        locations = {
            {
                x = 3674,
                z = 3044,
            },
            {
                x = 3675,
                z = 3042,
            },
            {
                x = 3676,
                z = 3045,
            },
            {
                x = 3677,
                z = 3042,
            },
            {
                x = 3683,
                z = 3044,
            },
            {
                x = 3685,
                z = 3044,
            },
            {
                x = 3685,
                z = 3046,
            },
            {
                x = 3687,
                z = 3052,
            },
            {
                x = 3688,
                z = 3051,
            },
            {
                x = 3691,
                z = 3052,
            },
            {
                x = 3693,
                z = 3048,
            },
            {
                x = 3729,
                z = 3045,
            },
            {
                x = 3730,
                z = 3044,
            },
            {
                x = 3730,
                z = 3047,
            },
            {
                x = 3734,
                z = 3045,
            },
            {
                x = 3735,
                z = 3045,
            },
            {
                x = 3736,
                z = 3050,
            },
            {
                x = 3740,
                z = 3033,
            },
            {
                x = 3741,
                z = 3035,
            },
            {
                x = 3741,
                z = 3053,
            },
            {
                x = 3742,
                z = 3019,
            },
            {
                x = 3742,
                z = 3035,
            },
            {
                x = 3742,
                z = 3053,
            },
            {
                x = 3745,
                z = 3026,
            },
            {
                x = 3746,
                z = 3025,
            },
            {
                x = 3747,
                z = 3027,
            },
            {
                x = 3753,
                z = 2972,
            },
            {
                x = 3754,
                z = 2967,
            },
            {
                x = 3755,
                z = 2965,
            },
            {
                x = 3755,
                z = 2970,
            },
            {
                x = 3755,
                z = 2973,
            },
            {
                x = 3755,
                z = 3029,
            },
            {
                x = 3756,
                z = 2976,
            },
            {
                x = 3757,
                z = 2974,
            },
            {
                x = 3759,
                z = 3026,
            },
            {
                x = 3760,
                z = 3027,
            },
            {
                x = 3766,
                z = 3036,
            },
            {
                x = 3766,
                z = 3037,
            },
            {
                x = 3766,
                z = 3045,
            },
        },
    },
    {
        name = "Giant rat",
        ids = {
            [86] = true,
            [87] = true,
            [446] = true,
            [2091] = true,
            [4924] = true,
            [4926] = true,
            [4927] = true,
            [8829] = true,
            [12348] = true,
            [20500] = true,
            [20501] = true,
        },
        locations = {
            {
                x = 2517,
                z = 3184,
            },
            {
                x = 2520,
                z = 3187,
            },
            {
                x = 2994,
                z = 3192,
            },
            {
                x = 2997,
                z = 3192,
            },
            {
                x = 3049,
                z = 3691,
            },
            {
                x = 3049,
                z = 3695,
            },
            {
                x = 3153,
                z = 3189,
            },
            {
                x = 3155,
                z = 3153,
            },
            {
                x = 3163,
                z = 3160,
            },
            {
                x = 3171,
                z = 3156,
            },
            {
                x = 3177,
                z = 3191,
            },
            {
                x = 3181,
                z = 3209,
            },
            {
                x = 3184,
                z = 3210,
            },
            {
                x = 3187,
                z = 3207,
            },
            {
                x = 3191,
                z = 3208,
            },
            {
                x = 3192,
                z = 3204,
            },
            {
                x = 3193,
                z = 3158,
            },
            {
                x = 3201,
                z = 3174,
            },
            {
                x = 3209,
                z = 3162,
            },
            {
                x = 3216,
                z = 3180,
            },
            {
                x = 3217,
                z = 3158,
            },
            {
                x = 3227,
                z = 3193,
            },
            {
                x = 3227,
                z = 3533,
            },
            {
                x = 3227,
                z = 3547,
            },
            {
                x = 3231,
                z = 3184,
            },
            {
                x = 3232,
                z = 3170,
            },
            {
                x = 3234,
                z = 3187,
            },
            {
                x = 3235,
                z = 3172,
            },
            {
                x = 3236,
                z = 3549,
            },
            {
                x = 3237,
                z = 3180,
            },
            {
                x = 3242,
                z = 3530,
            },
            {
                x = 3248,
                z = 3553,
            },
            {
                x = 3251,
                z = 3528,
            },
            {
                x = 3256,
                z = 3541,
            },
            {
                x = 3264,
                z = 3383,
            },
            {
                x = 3265,
                z = 3348,
            },
            {
                x = 3265,
                z = 3353,
            },
            {
                x = 3265,
                z = 3358,
            },
            {
                x = 3266,
                z = 3381,
            },
            {
                x = 3268,
                z = 3347,
            },
            {
                x = 3268,
                z = 3351,
            },
            {
                x = 3268,
                z = 3356,
            },
            {
                x = 3268,
                z = 3359,
            },
            {
                x = 3271,
                z = 3349,
            },
            {
                x = 3271,
                z = 3354,
            },
            {
                x = 3271,
                z = 3358,
            },
            {
                x = 3274,
                z = 3351,
            },
            {
                x = 3276,
                z = 3348,
            },
            {
                x = 3297,
                z = 3379,
            },
        },
    },
    {
        name = "Giant spider",
        ids = {
            [59] = true,
            [60] = true,
            [20499] = true,
        },
        locations = {
            {
                x = 2438,
                z = 2847,
            },
            {
                x = 2447,
                z = 2863,
            },
            {
                x = 2459,
                z = 2864,
            },
            {
                x = 2471,
                z = 2850,
            },
            {
                x = 2474,
                z = 2891,
            },
            {
                x = 2479,
                z = 2866,
            },
            {
                x = 2480,
                z = 2871,
            },
            {
                x = 2483,
                z = 2909,
            },
            {
                x = 2483,
                z = 2912,
            },
            {
                x = 2484,
                z = 2921,
            },
            {
                x = 2485,
                z = 2905,
            },
            {
                x = 2487,
                z = 2899,
            },
            {
                x = 2488,
                z = 2888,
            },
            {
                x = 2490,
                z = 2883,
            },
            {
                x = 2490,
                z = 2895,
            },
            {
                x = 2491,
                z = 2936,
            },
            {
                x = 2492,
                z = 2904,
            },
            {
                x = 2492,
                z = 2930,
            },
            {
                x = 2494,
                z = 2888,
            },
            {
                x = 2517,
                z = 2976,
            },
            {
                x = 2550,
                z = 2981,
            },
            {
                x = 2985,
                z = 3677,
            },
            {
                x = 2986,
                z = 3686,
            },
            {
                x = 2989,
                z = 3684,
            },
            {
                x = 2990,
                z = 3688,
            },
            {
                x = 2992,
                z = 3689,
            },
            {
                x = 3075,
                z = 3366,
            },
            {
                x = 3135,
                z = 3340,
            },
            {
                x = 3155,
                z = 3225,
            },
            {
                x = 3161,
                z = 3213,
            },
            {
                x = 3161,
                z = 3248,
            },
            {
                x = 3164,
                z = 3220,
            },
            {
                x = 3164,
                z = 3245,
            },
            {
                x = 3168,
                z = 3253,
            },
            {
                x = 3170,
                z = 3249,
            },
            {
                x = 3200,
                z = 3185,
            },
            {
                x = 3202,
                z = 3192,
            },
            {
                x = 3205,
                z = 3195,
            },
            {
                x = 3207,
                z = 3191,
            },
            {
                x = 3215,
                z = 3189,
            },
            {
                x = 3244,
                z = 3240,
            },
            {
                x = 3246,
                z = 3236,
            },
        },
    },
    {
        name = "Giant wasp",
        ids = {
            [6383] = true,
        },
        locations = {
            {
                x = 2886,
                z = 2999,
            },
            {
                x = 2887,
                z = 2988,
            },
            {
                x = 2890,
                z = 2991,
            },
            {
                x = 2891,
                z = 2987,
            },
            {
                x = 2891,
                z = 2998,
            },
            {
                x = 2892,
                z = 3001,
            },
            {
                x = 2902,
                z = 2989,
            },
            {
                x = 2902,
                z = 2991,
            },
            {
                x = 2920,
                z = 2973,
            },
            {
                x = 2920,
                z = 2979,
            },
            {
                x = 2921,
                z = 2975,
            },
            {
                x = 2925,
                z = 2975,
            },
            {
                x = 2925,
                z = 2979,
            },
        },
    },
    {
        name = "Glacor",
        ids = {
            [14301] = true,
        },
        locations = {
            {
                x = 2969,
                z = 3850,
            },
            {
                x = 2976,
                z = 3860,
            },
            {
                x = 2989,
                z = 3845,
            },
            {
                x = 2992,
                z = 3852,
            },
            {
                x = 3004,
                z = 3852,
            },
        },
    },
    {
        name = "Gnome",
        ids = {
            [66] = true,
            [67] = true,
            [68] = true,
            [2249] = true,
            [2250] = true,
            [2251] = true,
        },
        locations = {
            {
                x = 2377,
                z = 3442,
            },
            {
                x = 2378,
                z = 3423,
            },
            {
                x = 2380,
                z = 3425,
            },
            {
                x = 2383,
                z = 3433,
            },
            {
                x = 2383,
                z = 3452,
            },
            {
                x = 2393,
                z = 3435,
            },
            {
                x = 2394,
                z = 3425,
            },
            {
                x = 2395,
                z = 3447,
            },
            {
                x = 2399,
                z = 3356,
            },
            {
                x = 2400,
                z = 3356,
            },
            {
                x = 2401,
                z = 3357,
            },
            {
                x = 2401,
                z = 3417,
            },
            {
                x = 2402,
                z = 3422,
            },
            {
                x = 2402,
                z = 3441,
            },
            {
                x = 2403,
                z = 3430,
            },
            {
                x = 2403,
                z = 3433,
            },
            {
                x = 2405,
                z = 3447,
            },
            {
                x = 2406,
                z = 3440,
            },
            {
                x = 2408,
                z = 3441,
            },
            {
                x = 2409,
                z = 3430,
            },
            {
                x = 2420,
                z = 3429,
            },
            {
                x = 2420,
                z = 3438,
            },
            {
                x = 2423,
                z = 3426,
            },
            {
                x = 2427,
                z = 3428,
            },
            {
                x = 2427,
                z = 3440,
            },
            {
                x = 2433,
                z = 3474,
            },
            {
                x = 2433,
                z = 3492,
            },
            {
                x = 2435,
                z = 3460,
            },
            {
                x = 2437,
                z = 3478,
            },
            {
                x = 2441,
                z = 3470,
            },
            {
                x = 2442,
                z = 3465,
            },
            {
                x = 2447,
                z = 3502,
            },
            {
                x = 2456,
                z = 3425,
            },
            {
                x = 2456,
                z = 3467,
            },
            {
                x = 2457,
                z = 3462,
            },
            {
                x = 2459,
                z = 3421,
            },
            {
                x = 2462,
                z = 3431,
            },
            {
                x = 2471,
                z = 3496,
            },
            {
                x = 2474,
                z = 3508,
            },
            {
                x = 2475,
                z = 3471,
            },
            {
                x = 2476,
                z = 3458,
            },
            {
                x = 2478,
                z = 3502,
            },
            {
                x = 2479,
                z = 3468,
            },
            {
                x = 2486,
                z = 3470,
            },
            {
                x = 2492,
                z = 3474,
            },
            {
                x = 2506,
                z = 3229,
            },
            {
                x = 2507,
                z = 3209,
            },
            {
                x = 2510,
                z = 3209,
            },
            {
                x = 2511,
                z = 3210,
            },
            {
                x = 2513,
                z = 3216,
            },
            {
                x = 2515,
                z = 3216,
            },
            {
                x = 2515,
                z = 3230,
            },
            {
                x = 2517,
                z = 3212,
            },
            {
                x = 2518,
                z = 3217,
            },
            {
                x = 2519,
                z = 3210,
            },
            {
                x = 2519,
                z = 3212,
            },
            {
                x = 2520,
                z = 3218,
            },
            {
                x = 2521,
                z = 3169,
            },
            {
                x = 2521,
                z = 3171,
            },
            {
                x = 2521,
                z = 3218,
            },
            {
                x = 2522,
                z = 3172,
            },
            {
                x = 2522,
                z = 3215,
            },
            {
                x = 2524,
                z = 3214,
            },
            {
                x = 2525,
                z = 3204,
            },
            {
                x = 2525,
                z = 3221,
            },
            {
                x = 2526,
                z = 3218,
            },
            {
                x = 2526,
                z = 3226,
            },
            {
                x = 2527,
                z = 3203,
            },
            {
                x = 2529,
                z = 3163,
            },
            {
                x = 2529,
                z = 3218,
            },
            {
                x = 2529,
                z = 3220,
            },
            {
                x = 2530,
                z = 3172,
            },
            {
                x = 2531,
                z = 3209,
            },
            {
                x = 2531,
                z = 3210,
            },
            {
                x = 2532,
                z = 3209,
            },
            {
                x = 2532,
                z = 3210,
            },
            {
                x = 2532,
                z = 3220,
            },
            {
                x = 2533,
                z = 3209,
            },
            {
                x = 2533,
                z = 3210,
            },
            {
                x = 2534,
                z = 3209,
            },
            {
                x = 2534,
                z = 3210,
            },
            {
                x = 2534,
                z = 3220,
            },
            {
                x = 2536,
                z = 3169,
            },
            {
                x = 2536,
                z = 3209,
            },
            {
                x = 2536,
                z = 3210,
            },
            {
                x = 2536,
                z = 3215,
            },
            {
                x = 2536,
                z = 3218,
            },
            {
                x = 2536,
                z = 3234,
            },
            {
                x = 2537,
                z = 3209,
            },
            {
                x = 2537,
                z = 3210,
            },
            {
                x = 2538,
                z = 3209,
            },
            {
                x = 2538,
                z = 3210,
            },
            {
                x = 2539,
                z = 3209,
            },
            {
                x = 2539,
                z = 3210,
            },
            {
                x = 2540,
                z = 3219,
            },
            {
                x = 2540,
                z = 3224,
            },
            {
                x = 2542,
                z = 3222,
            },
            {
                x = 2543,
                z = 3217,
            },
            {
                x = 2544,
                z = 3225,
            },
            {
                x = 2545,
                z = 3228,
            },
            {
                x = 2546,
                z = 3211,
            },
            {
                x = 2547,
                z = 3221,
            },
            {
                x = 2548,
                z = 3227,
            },
            {
                x = 2550,
                z = 3228,
            },
            {
                x = 2551,
                z = 3222,
            },
            {
                x = 2551,
                z = 3230,
            },
            {
                x = 2552,
                z = 3232,
            },
            {
                x = 2553,
                z = 3220,
            },
            {
                x = 2553,
                z = 3224,
            },
            {
                x = 2554,
                z = 3233,
            },
            {
                x = 2555,
                z = 3225,
            },
            {
                x = 2556,
                z = 3226,
            },
        },
    },
    {
        name = "Gnome child",
        ids = {
            [159] = true,
        },
        locations = {
            {
                x = 2392,
                z = 3475,
            },
            {
                x = 2394,
                z = 3506,
            },
            {
                x = 2396,
                z = 3471,
            },
            {
                x = 2405,
                z = 3499,
            },
            {
                x = 2416,
                z = 3487,
            },
        },
    },
    {
        name = "Gnome guard",
        ids = {
            [163] = true,
            [164] = true,
        },
        locations = {
            {
                x = 2392,
                z = 3454,
            },
            {
                x = 2394,
                z = 3436,
            },
            {
                x = 2408,
                z = 3452,
            },
            {
                x = 2410,
                z = 3416,
            },
            {
                x = 2420,
                z = 3435,
            },
            {
                x = 2420,
                z = 3447,
            },
            {
                x = 2421,
                z = 3413,
            },
            {
                x = 2427,
                z = 3410,
            },
            {
                x = 2441,
                z = 3497,
            },
            {
                x = 2443,
                z = 3489,
            },
            {
                x = 2447,
                z = 3510,
            },
            {
                x = 2450,
                z = 3485,
            },
            {
                x = 2451,
                z = 3414,
            },
            {
                x = 2451,
                z = 3507,
            },
            {
                x = 2459,
                z = 3385,
            },
            {
                x = 2459,
                z = 3392,
            },
            {
                x = 2459,
                z = 3395,
            },
            {
                x = 2459,
                z = 3438,
            },
            {
                x = 2460,
                z = 3382,
            },
            {
                x = 2460,
                z = 3487,
            },
            {
                x = 2461,
                z = 3422,
            },
            {
                x = 2461,
                z = 3509,
            },
            {
                x = 2462,
                z = 3382,
            },
            {
                x = 2462,
                z = 3392,
            },
            {
                x = 2462,
                z = 3395,
            },
            {
                x = 2463,
                z = 3385,
            },
            {
                x = 2464,
                z = 3465,
            },
            {
                x = 2464,
                z = 3468,
            },
            {
                x = 2464,
                z = 3472,
            },
            {
                x = 2468,
                z = 3465,
            },
            {
                x = 2468,
                z = 3468,
            },
            {
                x = 2468,
                z = 3472,
            },
            {
                x = 2472,
                z = 3484,
            },
            {
                x = 2475,
                z = 3502,
            },
            {
                x = 2477,
                z = 3489,
            },
            {
                x = 2477,
                z = 3512,
            },
            {
                x = 2478,
                z = 3497,
            },
            {
                x = 2481,
                z = 3485,
            },
            {
                x = 2482,
                z = 3499,
            },
        },
    },
    {
        name = "Gnome troop",
        ids = {
            [479] = true,
            [480] = true,
            [2247] = true,
            [2248] = true,
        },
        locations = {
            {
                x = 2384,
                z = 3481,
            },
            {
                x = 2388,
                z = 3473,
            },
            {
                x = 2409,
                z = 3507,
            },
            {
                x = 2506,
                z = 3210,
            },
            {
                x = 2506,
                z = 3211,
            },
            {
                x = 2529,
                z = 3225,
            },
            {
                x = 2529,
                z = 3227,
            },
            {
                x = 2530,
                z = 3226,
            },
            {
                x = 2530,
                z = 3227,
            },
            {
                x = 2531,
                z = 3212,
            },
            {
                x = 2531,
                z = 3227,
            },
            {
                x = 2532,
                z = 3212,
            },
            {
                x = 2532,
                z = 3225,
            },
            {
                x = 2532,
                z = 3226,
            },
            {
                x = 2532,
                z = 3227,
            },
            {
                x = 2533,
                z = 3212,
            },
            {
                x = 2533,
                z = 3226,
            },
            {
                x = 2534,
                z = 3212,
            },
            {
                x = 2536,
                z = 3212,
            },
            {
                x = 2537,
                z = 3212,
            },
            {
                x = 2538,
                z = 3212,
            },
            {
                x = 2539,
                z = 3212,
            },
        },
    },
    {
        name = "Gnome woman",
        ids = {
            [168] = true,
            [169] = true,
        },
        locations = {
            {
                x = 2378,
                z = 3482,
            },
            {
                x = 2379,
                z = 3482,
            },
            {
                x = 2381,
                z = 3495,
            },
            {
                x = 2383,
                z = 3496,
            },
            {
                x = 2384,
                z = 3497,
            },
            {
                x = 2391,
                z = 3476,
            },
            {
                x = 2402,
                z = 3507,
            },
            {
                x = 2406,
                z = 3476,
            },
            {
                x = 2410,
                z = 3496,
            },
            {
                x = 2421,
                z = 3481,
            },
            {
                x = 2422,
                z = 3485,
            },
            {
                x = 2434,
                z = 3436,
            },
            {
                x = 2437,
                z = 3451,
            },
            {
                x = 2438,
                z = 3427,
            },
            {
                x = 2438,
                z = 3465,
            },
            {
                x = 2439,
                z = 3433,
            },
            {
                x = 2441,
                z = 3411,
            },
            {
                x = 2441,
                z = 3449,
            },
            {
                x = 2442,
                z = 3428,
            },
            {
                x = 2442,
                z = 3505,
            },
            {
                x = 2446,
                z = 3403,
            },
            {
                x = 2448,
                z = 3486,
            },
            {
                x = 2448,
                z = 3489,
            },
            {
                x = 2449,
                z = 3487,
            },
            {
                x = 2450,
                z = 3416,
            },
            {
                x = 2450,
                z = 3488,
            },
            {
                x = 2450,
                z = 3489,
            },
            {
                x = 2450,
                z = 3505,
            },
            {
                x = 2454,
                z = 3465,
            },
            {
                x = 2463,
                z = 3508,
            },
            {
                x = 2466,
                z = 3449,
            },
            {
                x = 2468,
                z = 3441,
            },
            {
                x = 2470,
                z = 3399,
            },
            {
                x = 2470,
                z = 3488,
            },
            {
                x = 2472,
                z = 3400,
            },
            {
                x = 2473,
                z = 3412,
            },
            {
                x = 2474,
                z = 3457,
            },
            {
                x = 2476,
                z = 3454,
            },
            {
                x = 2479,
                z = 3503,
            },
            {
                x = 2480,
                z = 3408,
            },
            {
                x = 2482,
                z = 3396,
            },
            {
                x = 2486,
                z = 3467,
            },
            {
                x = 2489,
                z = 3401,
            },
        },
    },
    {
        name = "Goat",
        ids = {
            [4930] = true,
            [4931] = true,
            [4933] = true,
            [4934] = true,
        },
        locations = {
            {
                x = 3205,
                z = 3109,
            },
            {
                x = 3206,
                z = 3108,
            },
            {
                x = 3206,
                z = 3110,
            },
            {
                x = 3207,
                z = 3107,
            },
            {
                x = 3207,
                z = 3109,
            },
            {
                x = 3208,
                z = 3108,
            },
            {
                x = 3325,
                z = 2843,
            },
            {
                x = 3325,
                z = 2845,
            },
            {
                x = 3326,
                z = 2847,
            },
            {
                x = 3327,
                z = 2844,
            },
            {
                x = 3335,
                z = 3019,
            },
            {
                x = 3337,
                z = 3020,
            },
            {
                x = 3338,
                z = 3021,
            },
            {
                x = 3364,
                z = 3033,
            },
            {
                x = 3395,
                z = 2932,
            },
            {
                x = 3396,
                z = 2934,
            },
            {
                x = 3409,
                z = 2889,
            },
            {
                x = 3411,
                z = 2885,
            },
            {
                x = 3415,
                z = 2885,
            },
        },
    },
    {
        name = "Goblin",
        ids = {
            [3264] = true,
            [3265] = true,
            [3266] = true,
            [3267] = true,
            [4261] = true,
            [4263] = true,
            [4264] = true,
            [4265] = true,
            [4267] = true,
            [4268] = true,
            [4269] = true,
            [4270] = true,
            [4271] = true,
            [4272] = true,
            [4273] = true,
            [4274] = true,
            [4275] = true,
            [4276] = true,
            [8637] = true,
            [8638] = true,
            [11233] = true,
            [11235] = true,
            [11237] = true,
            [11239] = true,
            [11241] = true,
            [12354] = true,
            [12356] = true,
            [13095] = true,
            [13247] = true,
            [13248] = true,
            [13249] = true,
            [13250] = true,
        },
        locations = {
            {
                x = 2385,
                z = 3339,
            },
            {
                x = 2387,
                z = 3345,
            },
            {
                x = 2394,
                z = 3334,
            },
            {
                x = 2505,
                z = 3176,
            },
            {
                x = 2519,
                z = 3145,
            },
            {
                x = 2523,
                z = 3155,
            },
            {
                x = 2542,
                z = 3155,
            },
            {
                x = 2550,
                z = 3166,
            },
            {
                x = 2550,
                z = 3197,
            },
            {
                x = 2552,
                z = 3195,
            },
            {
                x = 2553,
                z = 3198,
            },
            {
                x = 2555,
                z = 3194,
            },
            {
                x = 2557,
                z = 3198,
            },
            {
                x = 2563,
                z = 3398,
            },
            {
                x = 2563,
                z = 3416,
            },
            {
                x = 2563,
                z = 3439,
            },
            {
                x = 2564,
                z = 3407,
            },
            {
                x = 2564,
                z = 3456,
            },
            {
                x = 2566,
                z = 3453,
            },
            {
                x = 2567,
                z = 3428,
            },
            {
                x = 2568,
                z = 3403,
            },
            {
                x = 2568,
                z = 3433,
            },
            {
                x = 2569,
                z = 3410,
            },
            {
                x = 2569,
                z = 3442,
            },
            {
                x = 2571,
                z = 3442,
            },
            {
                x = 2572,
                z = 3396,
            },
            {
                x = 2572,
                z = 3420,
            },
            {
                x = 2574,
                z = 3409,
            },
            {
                x = 2576,
                z = 3436,
            },
            {
                x = 2577,
                z = 3404,
            },
            {
                x = 2578,
                z = 3400,
            },
            {
                x = 2578,
                z = 3413,
            },
            {
                x = 2581,
                z = 3395,
            },
            {
                x = 2583,
                z = 3430,
            },
            {
                x = 2583,
                z = 3435,
            },
            {
                x = 2585,
                z = 3432,
            },
            {
                x = 2628,
                z = 3400,
            },
            {
                x = 2631,
                z = 3392,
            },
            {
                x = 2631,
                z = 3398,
            },
            {
                x = 2636,
                z = 3393,
            },
            {
                x = 2995,
                z = 3209,
            },
            {
                x = 2996,
                z = 3201,
            },
            {
                x = 2997,
                z = 3216,
            },
            {
                x = 2998,
                z = 3205,
            },
            {
                x = 2999,
                z = 3208,
            },
            {
                x = 2999,
                z = 3211,
            },
            {
                x = 3001,
                z = 3202,
            },
            {
                x = 3002,
                z = 3206,
            },
            {
                x = 3002,
                z = 3210,
            },
            {
                x = 3003,
                z = 3205,
            },
            {
                x = 3004,
                z = 3201,
            },
            {
                x = 3004,
                z = 3209,
            },
            {
                x = 3118,
                z = 3432,
            },
            {
                x = 3119,
                z = 3444,
            },
            {
                x = 3121,
                z = 3422,
            },
            {
                x = 3126,
                z = 3431,
            },
            {
                x = 3126,
                z = 3450,
            },
            {
                x = 3312,
                z = 3370,
            },
        },
    },
    {
        name = "Goblin (Goblin Village)",
        ids = {
            [4479] = true,
            [4481] = true,
            [4482] = true,
            [4483] = true,
            [4484] = true,
            [4485] = true,
            [4486] = true,
            [4487] = true,
            [4488] = true,
            [4489] = true,
            [4491] = true,
            [4492] = true,
        },
        locations = {
            {
                x = 2950,
                z = 3496,
            },
            {
                x = 2951,
                z = 3481,
            },
            {
                x = 2951,
                z = 3483,
            },
            {
                x = 2951,
                z = 3496,
            },
            {
                x = 2951,
                z = 3501,
            },
            {
                x = 2951,
                z = 3510,
            },
            {
                x = 2952,
                z = 3508,
            },
            {
                x = 2953,
                z = 3487,
            },
            {
                x = 2954,
                z = 3491,
            },
            {
                x = 2954,
                z = 3499,
            },
            {
                x = 2954,
                z = 3500,
            },
            {
                x = 2954,
                z = 3503,
            },
            {
                x = 2955,
                z = 3495,
            },
            {
                x = 2955,
                z = 3507,
            },
            {
                x = 2956,
                z = 3499,
            },
            {
                x = 2956,
                z = 3500,
            },
            {
                x = 2957,
                z = 3482,
            },
            {
                x = 2957,
                z = 3484,
            },
            {
                x = 2957,
                z = 3492,
            },
            {
                x = 2957,
                z = 3507,
            },
            {
                x = 2957,
                z = 3508,
            },
            {
                x = 2958,
                z = 3496,
            },
            {
                x = 2959,
                z = 3499,
            },
            {
                x = 2959,
                z = 3500,
            },
            {
                x = 2962,
                z = 3502,
            },
            {
                x = 2963,
                z = 3514,
            },
            {
                x = 2964,
                z = 3511,
            },
        },
    },
    {
        name = "Goblin (Lumbridge)",
        ids = {
            [11232] = true,
            [11234] = true,
            [11236] = true,
            [11238] = true,
            [11240] = true,
            [12353] = true,
            [12355] = true,
            [12357] = true,
        },
        locations = {
            {
                x = 3110,
                z = 3281,
            },
            {
                x = 3141,
                z = 3258,
            },
            {
                x = 3141,
                z = 3261,
            },
            {
                x = 3142,
                z = 3260,
            },
            {
                x = 3144,
                z = 3259,
            },
            {
                x = 3145,
                z = 3246,
            },
            {
                x = 3146,
                z = 3260,
            },
            {
                x = 3151,
                z = 3252,
            },
            {
                x = 3157,
                z = 3237,
            },
            {
                x = 3157,
                z = 3254,
            },
            {
                x = 3170,
                z = 3259,
            },
            {
                x = 3173,
                z = 3237,
            },
            {
                x = 3173,
                z = 3253,
            },
            {
                x = 3182,
                z = 3255,
            },
            {
                x = 3183,
                z = 3255,
            },
            {
                x = 3184,
                z = 3255,
            },
            {
                x = 3215,
                z = 3276,
            },
            {
                x = 3217,
                z = 3278,
            },
            {
                x = 3224,
                z = 3261,
            },
            {
                x = 3244,
                z = 3246,
            },
            {
                x = 3246,
                z = 3241,
            },
            {
                x = 3246,
                z = 3245,
            },
            {
                x = 3248,
                z = 3238,
            },
            {
                x = 3249,
                z = 3242,
            },
            {
                x = 3250,
                z = 3241,
            },
            {
                x = 3251,
                z = 3231,
            },
            {
                x = 3251,
                z = 3238,
            },
            {
                x = 3252,
                z = 3240,
            },
            {
                x = 3254,
                z = 3236,
            },
            {
                x = 3254,
                z = 3240,
            },
            {
                x = 3255,
                z = 3238,
            },
            {
                x = 3255,
                z = 3247,
            },
            {
                x = 3255,
                z = 3252,
            },
            {
                x = 3256,
                z = 3224,
            },
            {
                x = 3256,
                z = 3232,
            },
            {
                x = 3257,
                z = 3248,
            },
            {
                x = 3258,
                z = 3223,
            },
            {
                x = 3258,
                z = 3226,
            },
            {
                x = 3258,
                z = 3228,
            },
            {
                x = 3258,
                z = 3245,
            },
            {
                x = 3260,
                z = 3225,
            },
            {
                x = 3260,
                z = 3226,
            },
            {
                x = 3260,
                z = 3233,
            },
            {
                x = 3260,
                z = 3237,
            },
            {
                x = 3260,
                z = 3240,
            },
            {
                x = 3262,
                z = 3219,
            },
        },
    },
    {
        name = "Golden warbler",
        ids = {},
        locations = {
            {
                x = 3402,
                z = 3095,
            },
            {
                x = 3406,
                z = 3097,
            },
            {
                x = 3407,
                z = 3085,
            },
            {
                x = 3410,
                z = 3085,
            },
        },
    },
    {
        name = "Gorad",
        ids = {
            [856] = true,
        },
        locations = {
            {
                x = 2577,
                z = 3021,
            },
        },
    },
    {
        name = "Gorvek",
        ids = {
            [26031] = true,
        },
        locations = {
            {
                x = 3493,
                z = 3659,
            },
        },
    },
    {
        name = "Grave scorpion",
        ids = {
            [493] = true,
        },
        locations = {
            {
                x = 2465,
                z = 3229,
            },
            {
                x = 2467,
                z = 3228,
            },
            {
                x = 2470,
                z = 3230,
            },
            {
                x = 2471,
                z = 3222,
            },
            {
                x = 2472,
                z = 3224,
            },
        },
    },
    {
        name = "Greater demon",
        ids = {
            [83] = true,
            [4698] = true,
            [4699] = true,
            [4700] = true,
            [4701] = true,
        },
        locations = {
            {
                x = 3138,
                z = 3679,
            },
            {
                x = 3149,
                z = 3675,
            },
            {
                x = 3152,
                z = 3682,
            },
            {
                x = 3160,
                z = 3686,
            },
            {
                x = 3161,
                z = 3678,
            },
            {
                x = 3166,
                z = 3697,
            },
            {
                x = 3172,
                z = 3709,
            },
            {
                x = 3174,
                z = 3690,
            },
            {
                x = 3177,
                z = 3697,
            },
            {
                x = 3286,
                z = 3875,
            },
            {
                x = 3286,
                z = 3882,
            },
            {
                x = 3288,
                z = 3888,
            },
            {
                x = 3289,
                z = 3897,
            },
            {
                x = 3299,
                z = 3886,
            },
        },
    },
    {
        name = "Greater demon (elite)",
        ids = {
            [83] = true,
            [4698] = true,
            [4699] = true,
            [4700] = true,
            [4701] = true,
        },
        locations = {
            {
                x = 3138,
                z = 3679,
            },
            {
                x = 3149,
                z = 3675,
            },
            {
                x = 3152,
                z = 3682,
            },
            {
                x = 3160,
                z = 3686,
            },
            {
                x = 3161,
                z = 3678,
            },
            {
                x = 3166,
                z = 3697,
            },
            {
                x = 3172,
                z = 3709,
            },
            {
                x = 3174,
                z = 3690,
            },
            {
                x = 3177,
                z = 3697,
            },
            {
                x = 3286,
                z = 3875,
            },
            {
                x = 3286,
                z = 3882,
            },
            {
                x = 3288,
                z = 3888,
            },
            {
                x = 3289,
                z = 3897,
            },
            {
                x = 3299,
                z = 3886,
            },
        },
    },
    {
        name = "Greater demon ash lord",
        ids = {
            [29360] = true,
        },
        locations = {
            {
                x = 3314,
                z = 3875,
            },
            {
                x = 3331,
                z = 3844,
            },
            {
                x = 3335,
                z = 3815,
            },
            {
                x = 3338,
                z = 3834,
            },
            {
                x = 3340,
                z = 3849,
            },
        },
    },
    {
        name = "Greater demon berserker",
        ids = {
            [29363] = true,
        },
        locations = {
            {
                x = 3307,
                z = 3895,
            },
            {
                x = 3323,
                z = 3869,
            },
            {
                x = 3329,
                z = 3859,
            },
            {
                x = 3330,
                z = 3830,
            },
        },
    },
    {
        name = "Green dragon",
        ids = {
            [941] = true,
            [4677] = true,
            [4678] = true,
            [4679] = true,
            [4680] = true,
        },
        locations = {
            {
                x = 2973,
                z = 3620,
            },
            {
                x = 2977,
                z = 3611,
            },
            {
                x = 2982,
                z = 3618,
            },
            {
                x = 3331,
                z = 3672,
            },
            {
                x = 3332,
                z = 3693,
            },
            {
                x = 3333,
                z = 3685,
            },
            {
                x = 3333,
                z = 3699,
            },
            {
                x = 3337,
                z = 3701,
            },
            {
                x = 3338,
                z = 3676,
            },
            {
                x = 3339,
                z = 3683,
            },
            {
                x = 3339,
                z = 3694,
            },
            {
                x = 3346,
                z = 3707,
            },
            {
                x = 3347,
                z = 3694,
            },
            {
                x = 3348,
                z = 3685,
            },
        },
    },
    {
        name = "Grenwall",
        ids = {
            [7010] = true,
        },
        locations = {
            {
                x = 2191,
                z = 3224,
            },
            {
                x = 2201,
                z = 3230,
            },
            {
                x = 2222,
                z = 3137,
            },
            {
                x = 2227,
                z = 3147,
            },
            {
                x = 2248,
                z = 3252,
            },
            {
                x = 2255,
                z = 3262,
            },
            {
                x = 2265,
                z = 3247,
            },
            {
                x = 2274,
                z = 3236,
            },
        },
    },
    {
        name = "Grip",
        ids = {
            [792] = true,
        },
        locations = {
            {
                x = 2774,
                z = 3192,
            },
        },
    },
    {
        name = "Grizzly bear",
        ids = {
            [105] = true,
            [1195] = true,
        },
        locations = {
            {
                x = 2200,
                z = 3224,
            },
            {
                x = 2215,
                z = 3171,
            },
            {
                x = 2293,
                z = 3156,
            },
            {
                x = 2477,
                z = 3143,
            },
            {
                x = 2484,
                z = 3155,
            },
            {
                x = 2632,
                z = 3280,
            },
            {
                x = 2633,
                z = 3274,
            },
            {
                x = 2690,
                z = 3346,
            },
            {
                x = 2691,
                z = 3341,
            },
            {
                x = 2691,
                z = 3612,
            },
            {
                x = 2694,
                z = 3344,
            },
            {
                x = 2699,
                z = 3340,
            },
            {
                x = 2700,
                z = 3347,
            },
            {
                x = 2706,
                z = 3347,
            },
            {
                x = 2708,
                z = 3336,
            },
            {
                x = 2718,
                z = 3330,
            },
            {
                x = 2718,
                z = 3340,
            },
            {
                x = 2721,
                z = 3643,
            },
            {
                x = 2988,
                z = 3671,
            },
            {
                x = 3001,
                z = 3674,
            },
            {
                x = 3099,
                z = 3602,
            },
            {
                x = 3100,
                z = 3594,
            },
            {
                x = 3107,
                z = 3608,
            },
            {
                x = 3230,
                z = 3500,
            },
        },
    },
    {
        name = "Grizzly bear cub",
        ids = {
            [1196] = true,
            [1197] = true,
        },
        locations = {
            {
                x = 2197,
                z = 3218,
            },
            {
                x = 2199,
                z = 3222,
            },
            {
                x = 2201,
                z = 3218,
            },
            {
                x = 2217,
                z = 3171,
            },
            {
                x = 2291,
                z = 3156,
            },
            {
                x = 2292,
                z = 3153,
            },
        },
    },
    {
        name = "Guard (Ardougne)",
        ids = {
            [32] = true,
        },
        locations = {
            {
                x = 2613,
                z = 3340,
            },
            {
                x = 2617,
                z = 3338,
            },
            {
                x = 2622,
                z = 3338,
            },
            {
                x = 2651,
                z = 3307,
            },
            {
                x = 2659,
                z = 3309,
            },
            {
                x = 2660,
                z = 3309,
            },
            {
                x = 2661,
                z = 3309,
            },
            {
                x = 2661,
                z = 3317,
            },
            {
                x = 2663,
                z = 3301,
            },
            {
                x = 2665,
                z = 3300,
            },
        },
    },
    {
        name = "Guard (Catherby)",
        ids = {
            [14920] = true,
        },
        locations = {
            {
                x = 2794,
                z = 3427,
            },
            {
                x = 2807,
                z = 3438,
            },
        },
    },
    {
        name = "Guard (Desert Mining Camp)",
        ids = {
            [4993] = true,
            [4994] = true,
            [4995] = true,
            [4996] = true,
            [4997] = true,
            [4998] = true,
            [4999] = true,
            [5000] = true,
            [5002] = true,
        },
        locations = {
            {
                x = 3279,
                z = 3026,
            },
            {
                x = 3279,
                z = 3030,
            },
            {
                x = 3287,
                z = 3030,
            },
            {
                x = 3288,
                z = 3018,
            },
            {
                x = 3291,
                z = 3035,
            },
            {
                x = 3296,
                z = 3018,
            },
            {
                x = 3296,
                z = 3026,
            },
            {
                x = 3301,
                z = 3022,
            },
            {
                x = 3302,
                z = 3032,
            },
            {
                x = 3303,
                z = 3035,
            },
        },
    },
    {
        name = "Guard (dwarf)",
        ids = {
            [206] = true,
            [4257] = true,
            [4258] = true,
            [4259] = true,
            [4260] = true,
        },
        locations = {
            {
                x = 2554,
                z = 3472,
            },
            {
                x = 2554,
                z = 3476,
            },
            {
                x = 2560,
                z = 3456,
            },
            {
                x = 2572,
                z = 3456,
            },
            {
                x = 3015,
                z = 3459,
            },
            {
                x = 3018,
                z = 3456,
            },
            {
                x = 3027,
                z = 3457,
            },
        },
    },
    {
        name = "Guard (Edgeville)",
        ids = {
            [296] = true,
            [297] = true,
            [298] = true,
            [299] = true,
            [3407] = true,
        },
        locations = {
            {
                x = 3084,
                z = 3518,
            },
            {
                x = 3093,
                z = 3518,
            },
            {
                x = 3114,
                z = 3510,
            },
            {
                x = 3114,
                z = 3512,
            },
            {
                x = 3114,
                z = 3515,
            },
            {
                x = 3114,
                z = 3517,
            },
        },
    },
    {
        name = "Guard (Falador)",
        ids = {
            [9] = true,
            [3228] = true,
            [3229] = true,
            [3230] = true,
            [3231] = true,
            [3232] = true,
            [3233] = true,
            [3241] = true,
        },
        locations = {
            {
                x = 2944,
                z = 3376,
            },
            {
                x = 2948,
                z = 3353,
            },
            {
                x = 2950,
                z = 3376,
            },
            {
                x = 2956,
                z = 3382,
            },
            {
                x = 2964,
                z = 3391,
            },
            {
                x = 2964,
                z = 3396,
            },
            {
                x = 2965,
                z = 3398,
            },
            {
                x = 2966,
                z = 3377,
            },
            {
                x = 2966,
                z = 3391,
            },
            {
                x = 2967,
                z = 3396,
            },
            {
                x = 2967,
                z = 3452,
            },
            {
                x = 2973,
                z = 3379,
            },
            {
                x = 2988,
                z = 3371,
            },
            {
                x = 3006,
                z = 3321,
            },
            {
                x = 3006,
                z = 3323,
            },
            {
                x = 3007,
                z = 3323,
            },
            {
                x = 3028,
                z = 3329,
            },
            {
                x = 3031,
                z = 3389,
            },
            {
                x = 3036,
                z = 3355,
            },
            {
                x = 3038,
                z = 3329,
            },
            {
                x = 3039,
                z = 3388,
            },
            {
                x = 3041,
                z = 3353,
            },
            {
                x = 3049,
                z = 3389,
            },
            {
                x = 3051,
                z = 3329,
            },
            {
                x = 3056,
                z = 3389,
            },
            {
                x = 3064,
                z = 3384,
            },
        },
    },
    {
        name = "Guard (Varrock)",
        ids = {
            [5919] = true,
            [5920] = true,
            [9234] = true,
        },
        locations = {
            {
                x = 3173,
                z = 3429,
            },
            {
                x = 3175,
                z = 3423,
            },
            {
                x = 3175,
                z = 3428,
            },
            {
                x = 3180,
                z = 3401,
            },
            {
                x = 3202,
                z = 3487,
            },
            {
                x = 3204,
                z = 3496,
            },
            {
                x = 3205,
                z = 3379,
            },
            {
                x = 3205,
                z = 3487,
            },
            {
                x = 3206,
                z = 3462,
            },
            {
                x = 3211,
                z = 3378,
            },
            {
                x = 3211,
                z = 3381,
            },
            {
                x = 3211,
                z = 3463,
            },
            {
                x = 3212,
                z = 3462,
            },
            {
                x = 3213,
                z = 3465,
            },
            {
                x = 3215,
                z = 3464,
            },
            {
                x = 3217,
                z = 3461,
            },
            {
                x = 3240,
                z = 3496,
            },
            {
                x = 3246,
                z = 3501,
            },
            {
                x = 3270,
                z = 3428,
            },
            {
                x = 3276,
                z = 3428,
            },
            {
                x = 3276,
                z = 3430,
            },
            {
                x = 3278,
                z = 3422,
            },
        },
    },
    {
        name = "Guard Bandit",
        ids = {
            [196] = true,
        },
        locations = {
            {
                x = 3020,
                z = 3689,
            },
            {
                x = 3037,
                z = 3669,
            },
            {
                x = 3037,
                z = 3672,
            },
            {
                x = 3038,
                z = 3659,
            },
            {
                x = 3038,
                z = 3662,
            },
            {
                x = 3049,
                z = 3690,
            },
            {
                x = 3050,
                z = 3707,
            },
        },
    },
    {
        name = "Guard dog",
        ids = {
            [99] = true,
        },
        locations = {
            {
                x = 2624,
                z = 3319,
            },
            {
                x = 2624,
                z = 3327,
            },
            {
                x = 2625,
                z = 3502,
            },
            {
                x = 2629,
                z = 3475,
            },
            {
                x = 2631,
                z = 3472,
            },
            {
                x = 2636,
                z = 3503,
            },
            {
                x = 2642,
                z = 3314,
            },
            {
                x = 2645,
                z = 3488,
            },
            {
                x = 2646,
                z = 3325,
            },
            {
                x = 2659,
                z = 3478,
            },
            {
                x = 2665,
                z = 3471,
            },
            {
                x = 2666,
                z = 3506,
            },
            {
                x = 2669,
                z = 3488,
            },
            {
                x = 2674,
                z = 3504,
            },
            {
                x = 2784,
                z = 3191,
            },
            {
                x = 2784,
                z = 3197,
            },
            {
                x = 2787,
                z = 3195,
            },
        },
    },
    {
        name = "Haakon the Champion",
        ids = {
            [3090] = true,
        },
        locations = {
            {
                x = 3081,
                z = 3444,
            },
        },
    },
    {
        name = "Halla",
        ids = {
            [1383] = true,
        },
        locations = {
            {
                x = 2541,
                z = 3896,
            },
        },
    },
    {
        name = "Harold",
        ids = {
            [14180] = true,
        },
        locations = {
            {
                x = 3610,
                z = 3341,
            },
        },
    },
    {
        name = "Harpie Bug Swarm",
        ids = {
            [3153] = true,
        },
        locations = {
            {
                x = 2854,
                z = 3106,
            },
            {
                x = 2859,
                z = 3106,
            },
            {
                x = 2863,
                z = 3109,
            },
            {
                x = 2863,
                z = 3115,
            },
            {
                x = 2867,
                z = 3105,
            },
            {
                x = 2870,
                z = 3112,
            },
            {
                x = 2872,
                z = 3117,
            },
            {
                x = 2873,
                z = 3108,
            },
            {
                x = 2878,
                z = 3114,
            },
            {
                x = 2880,
                z = 3112,
            },
            {
                x = 2882,
                z = 3115,
            },
            {
                x = 2886,
                z = 3116,
            },
            {
                x = 2889,
                z = 3113,
            },
        },
    },
    {
        name = "Hellhound",
        ids = {
            [49] = true,
            [29357] = true,
        },
        locations = {
            {
                x = 3023,
                z = 3849,
            },
            {
                x = 3027,
                z = 3851,
            },
            {
                x = 3032,
                z = 3851,
            },
            {
                x = 3038,
                z = 3854,
            },
            {
                x = 3042,
                z = 3856,
            },
            {
                x = 3050,
                z = 3849,
            },
            {
                x = 3054,
                z = 3852,
            },
            {
                x = 3057,
                z = 3842,
            },
            {
                x = 3058,
                z = 3854,
            },
            {
                x = 3069,
                z = 3836,
            },
            {
                x = 3070,
                z = 3829,
            },
            {
                x = 3075,
                z = 3848,
            },
            {
                x = 3090,
                z = 3841,
            },
            {
                x = 3094,
                z = 3849,
            },
            {
                x = 3103,
                z = 3704,
            },
            {
                x = 3104,
                z = 3678,
            },
            {
                x = 3104,
                z = 3875,
            },
            {
                x = 3110,
                z = 3687,
            },
            {
                x = 3110,
                z = 3854,
            },
            {
                x = 3116,
                z = 3688,
            },
            {
                x = 3116,
                z = 3858,
            },
            {
                x = 3117,
                z = 3674,
            },
            {
                x = 3121,
                z = 3679,
            },
            {
                x = 3127,
                z = 3667,
            },
            {
                x = 3127,
                z = 3677,
            },
            {
                x = 3133,
                z = 3678,
            },
            {
                x = 3178,
                z = 3929,
            },
            {
                x = 3179,
                z = 3914,
            },
            {
                x = 3179,
                z = 3923,
            },
            {
                x = 3182,
                z = 3907,
            },
            {
                x = 3185,
                z = 3932,
            },
            {
                x = 3186,
                z = 3906,
            },
            {
                x = 3186,
                z = 3913,
            },
            {
                x = 3186,
                z = 3925,
            },
            {
                x = 3192,
                z = 3919,
            },
            {
                x = 3193,
                z = 3910,
            },
            {
                x = 3193,
                z = 3926,
            },
            {
                x = 3195,
                z = 3915,
            },
            {
                x = 3270,
                z = 3772,
            },
            {
                x = 3271,
                z = 3756,
            },
            {
                x = 3285,
                z = 3752,
            },
            {
                x = 3286,
                z = 3770,
            },
            {
                x = 3332,
                z = 3771,
            },
            {
                x = 3335,
                z = 3786,
            },
            {
                x = 3341,
                z = 3780,
            },
            {
                x = 3347,
                z = 3796,
            },
        },
    },
    {
        name = "Hero",
        ids = {
            [21] = true,
        },
        locations = {
            {
                x = 2630,
                z = 3288,
            },
            {
                x = 2647,
                z = 3306,
            },
            {
                x = 2667,
                z = 3315,
            },
        },
    },
    {
        name = "Heru",
        ids = {
            [15880] = true,
        },
        locations = {
            {
                x = 3126,
                z = 3196,
            },
        },
    },
    {
        name = "Highwayman",
        ids = {
            [180] = true,
            [7443] = true,
            [22657] = true,
        },
        locations = {
            {
                x = 2735,
                z = 3522,
            },
            {
                x = 2749,
                z = 3521,
            },
            {
                x = 2933,
                z = 3312,
            },
            {
                x = 2961,
                z = 3248,
            },
            {
                x = 2988,
                z = 3419,
            },
            {
                x = 3049,
                z = 3276,
            },
        },
    },
    {
        name = "Hill giant",
        ids = {
            [117] = true,
            [4689] = true,
            [4690] = true,
            [4691] = true,
            [4692] = true,
            [4693] = true,
        },
        locations = {
            {
                x = 2369,
                z = 3394,
            },
            {
                x = 2369,
                z = 3401,
            },
            {
                x = 2369,
                z = 3404,
            },
            {
                x = 2371,
                z = 3398,
            },
            {
                x = 2372,
                z = 3395,
            },
            {
                x = 2372,
                z = 3401,
            },
            {
                x = 2438,
                z = 3208,
            },
            {
                x = 2438,
                z = 3218,
            },
            {
                x = 2439,
                z = 3212,
            },
            {
                x = 2441,
                z = 3217,
            },
            {
                x = 2443,
                z = 3211,
            },
            {
                x = 2445,
                z = 3209,
            },
            {
                x = 2507,
                z = 3149,
            },
            {
                x = 2545,
                z = 3144,
            },
            {
                x = 2548,
                z = 3147,
            },
            {
                x = 3300,
                z = 3649,
            },
            {
                x = 3308,
                z = 3661,
            },
        },
    },
    {
        name = "Hobgoblin",
        ids = {
            [2685] = true,
            [2686] = true,
            [2687] = true,
            [2688] = true,
            [13100] = true,
            [13246] = true,
        },
        locations = {
            {
                x = 2443,
                z = 3359,
            },
            {
                x = 2445,
                z = 3359,
            },
            {
                x = 2445,
                z = 3362,
            },
            {
                x = 2446,
                z = 3357,
            },
            {
                x = 2447,
                z = 3361,
            },
            {
                x = 2448,
                z = 3329,
            },
            {
                x = 2448,
                z = 3331,
            },
            {
                x = 2451,
                z = 3330,
            },
            {
                x = 2503,
                z = 3730,
            },
            {
                x = 2526,
                z = 3739,
            },
            {
                x = 2653,
                z = 3720,
            },
            {
                x = 2654,
                z = 3729,
            },
            {
                x = 2659,
                z = 3733,
            },
            {
                x = 2669,
                z = 3725,
            },
            {
                x = 2675,
                z = 3731,
            },
            {
                x = 2684,
                z = 3730,
            },
            {
                x = 2787,
                z = 3013,
            },
            {
                x = 2791,
                z = 3012,
            },
            {
                x = 2794,
                z = 3012,
            },
            {
                x = 2818,
                z = 3291,
            },
            {
                x = 2822,
                z = 3282,
            },
            {
                x = 2822,
                z = 3288,
            },
            {
                x = 2824,
                z = 3298,
            },
            {
                x = 2834,
                z = 3305,
            },
            {
                x = 2905,
                z = 3295,
            },
            {
                x = 2906,
                z = 3288,
            },
            {
                x = 2908,
                z = 3291,
            },
            {
                x = 2909,
                z = 3282,
            },
            {
                x = 2909,
                z = 3285,
            },
            {
                x = 2909,
                z = 3294,
            },
            {
                x = 2912,
                z = 3279,
            },
            {
                x = 2915,
                z = 3273,
            },
            {
                x = 2917,
                z = 3269,
            },
            {
                x = 2920,
                z = 3266,
            },
        },
    },
    {
        name = "Honour guard",
        ids = {
            [5514] = true,
            [5515] = true,
            [5516] = true,
        },
        locations = {
            {
                x = 2316,
                z = 3815,
            },
            {
                x = 2316,
                z = 3833,
            },
            {
                x = 2318,
                z = 3833,
            },
            {
                x = 2320,
                z = 3834,
            },
            {
                x = 2325,
                z = 3813,
            },
            {
                x = 2330,
                z = 3799,
            },
            {
                x = 2330,
                z = 3803,
            },
            {
                x = 2330,
                z = 3806,
            },
            {
                x = 2335,
                z = 3811,
            },
            {
                x = 2340,
                z = 3819,
            },
            {
                x = 2345,
                z = 3830,
            },
            {
                x = 2353,
                z = 3829,
            },
            {
                x = 2354,
                z = 3836,
            },
        },
    },
    {
        name = "Hydrix dragon",
        ids = {
            [24172] = true,
        },
        locations = {
            {
                x = 3012,
                z = 3896,
            },
            {
                x = 3013,
                z = 3883,
            },
            {
                x = 3025,
                z = 3897,
            },
            {
                x = 3027,
                z = 3875,
            },
            {
                x = 3039,
                z = 3885,
            },
            {
                x = 3045,
                z = 3897,
            },
        },
    },
    {
        name = "Ice strykewyrm",
        ids = {
            [9462] = true,
        },
        locations = {
            {
                x = 2948,
                z = 3860,
            },
            {
                x = 2950,
                z = 3843,
            },
            {
                x = 2953,
                z = 3835,
            },
            {
                x = 2960,
                z = 3867,
            },
            {
                x = 2962,
                z = 3836,
            },
            {
                x = 2963,
                z = 3841,
            },
            {
                x = 2968,
                z = 3847,
            },
            {
                x = 2969,
                z = 3860,
            },
            {
                x = 2972,
                z = 3851,
            },
            {
                x = 3054,
                z = 3798,
            },
            {
                x = 3062,
                z = 3801,
            },
            {
                x = 3065,
                z = 3810,
            },
        },
    },
    {
        name = "Ice troll",
        ids = {
            [1936] = true,
            [1937] = true,
            [1938] = true,
            [1939] = true,
            [1940] = true,
            [1941] = true,
            [1942] = true,
        },
        locations = {
            {
                x = 2849,
                z = 3735,
            },
            {
                x = 2850,
                z = 3732,
            },
            {
                x = 2852,
                z = 3735,
            },
            {
                x = 2853,
                z = 3728,
            },
            {
                x = 2853,
                z = 3731,
            },
            {
                x = 2854,
                z = 3725,
            },
            {
                x = 2855,
                z = 3729,
            },
            {
                x = 2855,
                z = 3735,
            },
            {
                x = 2856,
                z = 3728,
            },
            {
                x = 2856,
                z = 3732,
            },
            {
                x = 2857,
                z = 3726,
            },
            {
                x = 2858,
                z = 3730,
            },
            {
                x = 2859,
                z = 3728,
            },
            {
                x = 2861,
                z = 3725,
            },
            {
                x = 2862,
                z = 3722,
            },
            {
                x = 2862,
                z = 3728,
            },
            {
                x = 2862,
                z = 3731,
            },
            {
                x = 2863,
                z = 3720,
            },
            {
                x = 2864,
                z = 3723,
            },
            {
                x = 2865,
                z = 3726,
            },
            {
                x = 2865,
                z = 3729,
            },
        },
    },
    {
        name = "Ice troll female",
        ids = {
            [5523] = true,
            [5527] = true,
        },
        locations = {
            {
                x = 2318,
                z = 3891,
            },
            {
                x = 2321,
                z = 3894,
            },
            {
                x = 2327,
                z = 3858,
            },
            {
                x = 2336,
                z = 3834,
            },
            {
                x = 2342,
                z = 3894,
            },
            {
                x = 2343,
                z = 3890,
            },
            {
                x = 2346,
                z = 3863,
            },
            {
                x = 2355,
                z = 3865,
            },
            {
                x = 2361,
                z = 3894,
            },
            {
                x = 2362,
                z = 3890,
            },
            {
                x = 2372,
                z = 3833,
            },
            {
                x = 2374,
                z = 3895,
            },
            {
                x = 2377,
                z = 3890,
            },
            {
                x = 2403,
                z = 3856,
            },
            {
                x = 2408,
                z = 3859,
            },
        },
    },
    {
        name = "Ice troll grunt",
        ids = {
            [5528] = true,
        },
        locations = {
            {
                x = 2323,
                z = 3892,
            },
            {
                x = 2341,
                z = 3890,
            },
            {
                x = 2364,
                z = 3891,
            },
            {
                x = 2379,
                z = 3893,
            },
        },
    },
    {
        name = "Ice troll male",
        ids = {
            [5522] = true,
            [5526] = true,
        },
        locations = {
            {
                x = 2320,
                z = 3889,
            },
            {
                x = 2324,
                z = 3860,
            },
            {
                x = 2343,
                z = 3861,
            },
            {
                x = 2344,
                z = 3893,
            },
            {
                x = 2351,
                z = 3865,
            },
            {
                x = 2355,
                z = 3830,
            },
            {
                x = 2359,
                z = 3892,
            },
            {
                x = 2376,
                z = 3892,
            },
            {
                x = 2394,
                z = 3866,
            },
            {
                x = 2398,
                z = 3853,
            },
            {
                x = 2400,
                z = 3856,
            },
            {
                x = 2408,
                z = 3863,
            },
            {
                x = 2418,
                z = 3866,
            },
        },
    },
    {
        name = "Ice troll runt",
        ids = {
            [5521] = true,
            [5525] = true,
        },
        locations = {
            {
                x = 2321,
                z = 3891,
            },
            {
                x = 2325,
                z = 3862,
            },
            {
                x = 2329,
                z = 3828,
            },
            {
                x = 2329,
                z = 3832,
            },
            {
                x = 2340,
                z = 3892,
            },
            {
                x = 2341,
                z = 3862,
            },
            {
                x = 2354,
                z = 3863,
            },
            {
                x = 2358,
                z = 3835,
            },
            {
                x = 2362,
                z = 3834,
            },
            {
                x = 2362,
                z = 3892,
            },
            {
                x = 2370,
                z = 3833,
            },
            {
                x = 2374,
                z = 3888,
            },
            {
                x = 2377,
                z = 3894,
            },
            {
                x = 2387,
                z = 3869,
            },
            {
                x = 2394,
                z = 3862,
            },
            {
                x = 2396,
                z = 3856,
            },
            {
                x = 2406,
                z = 3865,
            },
        },
    },
    {
        name = "Ice wolf",
        ids = {
            [1558] = true,
            [1951] = true,
            [1952] = true,
            [1953] = true,
            [1954] = true,
            [1955] = true,
            [1956] = true,
            [6052] = true,
        },
        locations = {
            {
                x = 2761,
                z = 3863,
            },
            {
                x = 2764,
                z = 3858,
            },
            {
                x = 2769,
                z = 3854,
            },
            {
                x = 2769,
                z = 3861,
            },
            {
                x = 2790,
                z = 3852,
            },
            {
                x = 2793,
                z = 3847,
            },
            {
                x = 2801,
                z = 3848,
            },
            {
                x = 2886,
                z = 3723,
            },
            {
                x = 2886,
                z = 3758,
            },
            {
                x = 2886,
                z = 3762,
            },
            {
                x = 2887,
                z = 3720,
            },
            {
                x = 2890,
                z = 3721,
            },
            {
                x = 2890,
                z = 3724,
            },
            {
                x = 2890,
                z = 3756,
            },
            {
                x = 2890,
                z = 3762,
            },
            {
                x = 2892,
                z = 3726,
            },
            {
                x = 2894,
                z = 3726,
            },
            {
                x = 2895,
                z = 3728,
            },
            {
                x = 2895,
                z = 3730,
            },
            {
                x = 2895,
                z = 3740,
            },
            {
                x = 2895,
                z = 3744,
            },
            {
                x = 2895,
                z = 3751,
            },
            {
                x = 2895,
                z = 3755,
            },
            {
                x = 2897,
                z = 3733,
            },
            {
                x = 2897,
                z = 3737,
            },
            {
                x = 2898,
                z = 3740,
            },
            {
                x = 2898,
                z = 3744,
            },
            {
                x = 2898,
                z = 3751,
            },
            {
                x = 2898,
                z = 3755,
            },
            {
                x = 2906,
                z = 3719,
            },
            {
                x = 2910,
                z = 3721,
            },
            {
                x = 2911,
                z = 3724,
            },
            {
                x = 2926,
                z = 3754,
            },
            {
                x = 2928,
                z = 3763,
            },
            {
                x = 2929,
                z = 3752,
            },
            {
                x = 2930,
                z = 3765,
            },
        },
    },
    {
        name = "Icefiend",
        ids = {
            [7716] = true,
        },
        locations = {
            {
                x = 2995,
                z = 3468,
            },
            {
                x = 2999,
                z = 3473,
            },
            {
                x = 3001,
                z = 3470,
            },
            {
                x = 3003,
                z = 3483,
            },
            {
                x = 3003,
                z = 3502,
            },
            {
                x = 3004,
                z = 3496,
            },
            {
                x = 3005,
                z = 3473,
            },
            {
                x = 3005,
                z = 3480,
            },
            {
                x = 3005,
                z = 3485,
            },
            {
                x = 3006,
                z = 3468,
            },
            {
                x = 3006,
                z = 3490,
            },
        },
    },
    {
        name = "Idria",
        ids = {
            [1599] = true,
        },
        locations = {
            {
                x = 2990,
                z = 3340,
            },
        },
    },
    {
        name = "Igneous jadinko",
        ids = {
            [13133] = true,
            [13134] = true,
            [13135] = true,
            [13136] = true,
            [13137] = true,
            [13138] = true,
            [13139] = true,
            [13140] = true,
            [13141] = true,
        },
        locations = {
            {
                x = 2948,
                z = 2884,
            },
            {
                x = 2948,
                z = 2893,
            },
            {
                x = 2948,
                z = 2897,
            },
            {
                x = 2955,
                z = 2891,
            },
            {
                x = 2956,
                z = 2895,
            },
            {
                x = 2964,
                z = 2901,
            },
            {
                x = 2967,
                z = 2898,
            },
            {
                x = 2968,
                z = 2900,
            },
            {
                x = 2969,
                z = 2897,
            },
        },
    },
    {
        name = "Imp",
        ids = {
            [708] = true,
        },
        locations = {
            {
                x = 2595,
                z = 3131,
            },
            {
                x = 2597,
                z = 3120,
            },
            {
                x = 2606,
                z = 3126,
            },
            {
                x = 2608,
                z = 3134,
            },
            {
                x = 2614,
                z = 3116,
            },
            {
                x = 2616,
                z = 3126,
            },
            {
                x = 2621,
                z = 3133,
            },
            {
                x = 2622,
                z = 3118,
            },
            {
                x = 2625,
                z = 3203,
            },
            {
                x = 2625,
                z = 3217,
            },
            {
                x = 2629,
                z = 3233,
            },
            {
                x = 2630,
                z = 3210,
            },
            {
                x = 2632,
                z = 3203,
            },
            {
                x = 2633,
                z = 3222,
            },
            {
                x = 2633,
                z = 3243,
            },
            {
                x = 2639,
                z = 3206,
            },
            {
                x = 2639,
                z = 3230,
            },
            {
                x = 2829,
                z = 3176,
            },
            {
                x = 2831,
                z = 3170,
            },
            {
                x = 2832,
                z = 3185,
            },
            {
                x = 2842,
                z = 3162,
            },
            {
                x = 2849,
                z = 3162,
            },
            {
                x = 2849,
                z = 3189,
            },
            {
                x = 2857,
                z = 3181,
            },
            {
                x = 2861,
                z = 3171,
            },
            {
                x = 2941,
                z = 3236,
            },
            {
                x = 2947,
                z = 3329,
            },
            {
                x = 2951,
                z = 3360,
            },
            {
                x = 3035,
                z = 3327,
            },
            {
                x = 3037,
                z = 3322,
            },
            {
                x = 3044,
                z = 3324,
            },
            {
                x = 3073,
                z = 3250,
            },
            {
                x = 3073,
                z = 3498,
            },
            {
                x = 3078,
                z = 3499,
            },
            {
                x = 3177,
                z = 3405,
            },
            {
                x = 3205,
                z = 3355,
            },
            {
                x = 3213,
                z = 3502,
            },
            {
                x = 3214,
                z = 3281,
            },
            {
                x = 3223,
                z = 3223,
            },
            {
                x = 3234,
                z = 3506,
            },
            {
                x = 3238,
                z = 3390,
            },
            {
                x = 3240,
                z = 3307,
            },
            {
                x = 3246,
                z = 3458,
            },
            {
                x = 3261,
                z = 3514,
            },
            {
                x = 3299,
                z = 3273,
            },
        },
    },
    {
        name = "Imre",
        ids = {
            [6027] = true,
        },
        locations = {
            {
                x = 3490,
                z = 3474,
            },
        },
    },
    {
        name = "Invrigar the Necromancer",
        ids = {
            [173] = true,
        },
        locations = {
            {
                x = 2667,
                z = 3241,
            },
        },
    },
    {
        name = "Irina",
        ids = {
            [6035] = true,
        },
        locations = {
            {
                x = 3485,
                z = 3489,
            },
        },
    },
    {
        name = "Iron dragon",
        ids = {
            [1591] = true,
        },
        locations = {
            {
                x = 2891,
                z = 3919,
            },
            {
                x = 2901,
                z = 3914,
            },
            {
                x = 2910,
                z = 3921,
            },
            {
                x = 2920,
                z = 3919,
            },
            {
                x = 2929,
                z = 3919,
            },
            {
                x = 2929,
                z = 3935,
            },
            {
                x = 2929,
                z = 3944,
            },
        },
    },
    {
        name = "Iwazaru",
        ids = {
            [13202] = true,
            [131790] = true,
        },
        locations = {
            {
                x = 2789,
                z = 2795,
            },
            {
                x = 3225,
                z = 2983,
            },
        },
    },
    {
        name = "Jackal",
        ids = {
            [1994] = true,
        },
        locations = {
            {
                x = 3212,
                z = 2863,
            },
            {
                x = 3213,
                z = 2866,
            },
            {
                x = 3215,
                z = 2863,
            },
            {
                x = 3216,
                z = 2865,
            },
            {
                x = 3216,
                z = 2868,
            },
            {
                x = 3218,
                z = 2831,
            },
            {
                x = 3220,
                z = 2830,
            },
            {
                x = 3220,
                z = 2833,
            },
            {
                x = 3221,
                z = 2831,
            },
            {
                x = 3238,
                z = 2845,
            },
            {
                x = 3240,
                z = 2845,
            },
            {
                x = 3241,
                z = 2843,
            },
            {
                x = 3241,
                z = 2847,
            },
            {
                x = 3265,
                z = 2931,
            },
            {
                x = 3265,
                z = 2935,
            },
            {
                x = 3268,
                z = 2932,
            },
            {
                x = 3268,
                z = 2935,
            },
            {
                x = 3314,
                z = 2861,
            },
            {
                x = 3316,
                z = 2900,
            },
            {
                x = 3318,
                z = 2818,
            },
            {
                x = 3319,
                z = 2821,
            },
            {
                x = 3319,
                z = 2873,
            },
            {
                x = 3319,
                z = 2897,
            },
            {
                x = 3320,
                z = 2901,
            },
            {
                x = 3321,
                z = 2819,
            },
            {
                x = 3321,
                z = 2871,
            },
            {
                x = 3321,
                z = 2899,
            },
            {
                x = 3323,
                z = 2821,
            },
            {
                x = 3324,
                z = 2870,
            },
            {
                x = 3327,
                z = 2858,
            },
            {
                x = 3331,
                z = 2940,
            },
            {
                x = 3332,
                z = 2938,
            },
            {
                x = 3333,
                z = 2940,
            },
            {
                x = 3343,
                z = 2895,
            },
            {
                x = 3345,
                z = 2896,
            },
            {
                x = 3346,
                z = 2894,
            },
            {
                x = 3348,
                z = 2894,
            },
            {
                x = 3376,
                z = 2907,
            },
            {
                x = 3376,
                z = 2934,
            },
            {
                x = 3378,
                z = 2905,
            },
            {
                x = 3378,
                z = 2906,
            },
            {
                x = 3378,
                z = 2908,
            },
            {
                x = 3378,
                z = 2933,
            },
            {
                x = 3378,
                z = 2935,
            },
            {
                x = 3400,
                z = 2997,
            },
            {
                x = 3402,
                z = 2999,
            },
            {
                x = 3403,
                z = 2997,
            },
            {
                x = 3406,
                z = 3014,
            },
            {
                x = 3408,
                z = 3013,
            },
            {
                x = 3408,
                z = 3016,
            },
            {
                x = 3410,
                z = 3015,
            },
            {
                x = 3445,
                z = 2993,
            },
            {
                x = 3446,
                z = 2992,
            },
            {
                x = 3448,
                z = 2991,
            },
            {
                x = 3448,
                z = 2994,
            },
        },
    },
    {
        name = "Jail guard",
        ids = {
            [15834] = true,
            [15835] = true,
            [15836] = true,
            [15837] = true,
        },
        locations = {
            {
                x = 3109,
                z = 3237,
            },
            {
                x = 3120,
                z = 3238,
            },
            {
                x = 3121,
                z = 3249,
            },
            {
                x = 3125,
                z = 3246,
            },
            {
                x = 3127,
                z = 3248,
            },
        },
    },
    {
        name = "Jake",
        ids = {
            [4546] = true,
        },
        locations = {
            {
                x = 2205,
                z = 3807,
            },
        },
    },
    {
        name = "Jeff",
        ids = {
            [3240] = true,
        },
        locations = {
            {
                x = 2978,
                z = 3443,
            },
        },
    },
    {
        name = "Jennella",
        ids = {
            [1312] = true,
        },
        locations = {
            {
                x = 2640,
                z = 3651,
            },
        },
    },
    {
        name = "Jeroen",
        ids = {
            [21130] = true,
        },
        locations = {
            {
                x = 3506,
                z = 3508,
            },
        },
    },
    {
        name = "Jogre",
        ids = {
            [113] = true,
            [3449] = true,
            [3450] = true,
        },
        locations = {
            {
                x = 2896,
                z = 2945,
            },
            {
                x = 2903,
                z = 2945,
            },
            {
                x = 2916,
                z = 3055,
            },
            {
                x = 2916,
                z = 3062,
            },
            {
                x = 2918,
                z = 2963,
            },
            {
                x = 2919,
                z = 3052,
            },
            {
                x = 2921,
                z = 2959,
            },
            {
                x = 2923,
                z = 2985,
            },
            {
                x = 2924,
                z = 3060,
            },
            {
                x = 2925,
                z = 2956,
            },
            {
                x = 2927,
                z = 3056,
            },
            {
                x = 2928,
                z = 3058,
            },
            {
                x = 2931,
                z = 2987,
            },
            {
                x = 2932,
                z = 3043,
            },
            {
                x = 2935,
                z = 3046,
            },
        },
    },
    {
        name = "Jonny the beard",
        ids = {
            [645] = true,
        },
        locations = {
            {
                x = 3223,
                z = 3395,
            },
        },
    },
    {
        name = "Joseph",
        ids = {
            [6029] = true,
        },
        locations = {
            {
                x = 3474,
                z = 3474,
            },
        },
    },
    {
        name = "Jungle dweller",
        ids = {
            [26836] = true,
        },
        locations = {
            {
                x = 2776,
                z = 2905,
            },
            {
                x = 2783,
                z = 2920,
            },
            {
                x = 2784,
                z = 2908,
            },
            {
                x = 2802,
                z = 2903,
            },
            {
                x = 2802,
                z = 2913,
            },
            {
                x = 2809,
                z = 2912,
            },
            {
                x = 2821,
                z = 2927,
            },
            {
                x = 2824,
                z = 2907,
            },
            {
                x = 2837,
                z = 2918,
            },
            {
                x = 2840,
                z = 2899,
            },
            {
                x = 2845,
                z = 2928,
            },
            {
                x = 2859,
                z = 2923,
            },
            {
                x = 2862,
                z = 2904,
            },
            {
                x = 2887,
                z = 2914,
            },
            {
                x = 2901,
                z = 2907,
            },
            {
                x = 2916,
                z = 2914,
            },
            {
                x = 2925,
                z = 2923,
            },
            {
                x = 2930,
                z = 2903,
            },
            {
                x = 2939,
                z = 2914,
            },
        },
    },
    {
        name = "Jungle horror",
        ids = {
            [4352] = true,
        },
        locations = {
            {
                x = 3670,
                z = 3021,
            },
            {
                x = 3670,
                z = 3026,
            },
            {
                x = 3673,
                z = 3018,
            },
            {
                x = 3674,
                z = 3027,
            },
            {
                x = 3675,
                z = 3021,
            },
            {
                x = 3677,
                z = 3025,
            },
            {
                x = 3686,
                z = 3030,
            },
            {
                x = 3687,
                z = 3020,
            },
            {
                x = 3694,
                z = 3040,
            },
            {
                x = 3696,
                z = 3043,
            },
            {
                x = 3697,
                z = 3011,
            },
            {
                x = 3698,
                z = 3008,
            },
            {
                x = 3700,
                z = 3042,
            },
            {
                x = 3701,
                z = 3021,
            },
            {
                x = 3701,
                z = 3033,
            },
            {
                x = 3702,
                z = 3008,
            },
            {
                x = 3702,
                z = 3035,
            },
            {
                x = 3703,
                z = 3011,
            },
            {
                x = 3706,
                z = 3035,
            },
            {
                x = 3707,
                z = 3016,
            },
            {
                x = 3707,
                z = 3019,
            },
            {
                x = 3708,
                z = 3030,
            },
            {
                x = 3710,
                z = 3029,
            },
            {
                x = 3710,
                z = 3035,
            },
            {
                x = 3711,
                z = 3022,
            },
            {
                x = 3713,
                z = 3024,
            },
            {
                x = 3714,
                z = 3037,
            },
            {
                x = 3717,
                z = 3036,
            },
            {
                x = 3718,
                z = 3029,
            },
            {
                x = 3721,
                z = 3005,
            },
            {
                x = 3722,
                z = 3040,
            },
            {
                x = 3723,
                z = 2986,
            },
            {
                x = 3726,
                z = 3011,
            },
            {
                x = 3728,
                z = 3021,
            },
            {
                x = 3729,
                z = 3032,
            },
            {
                x = 3730,
                z = 3015,
            },
            {
                x = 3730,
                z = 3028,
            },
            {
                x = 3731,
                z = 3023,
            },
            {
                x = 3732,
                z = 3017,
            },
            {
                x = 3732,
                z = 3037,
            },
            {
                x = 3733,
                z = 2957,
            },
            {
                x = 3736,
                z = 3019,
            },
            {
                x = 3736,
                z = 3042,
            },
            {
                x = 3739,
                z = 3035,
            },
            {
                x = 3741,
                z = 3037,
            },
            {
                x = 3741,
                z = 3042,
            },
            {
                x = 3744,
                z = 2947,
            },
            {
                x = 3744,
                z = 3002,
            },
            {
                x = 3749,
                z = 3050,
            },
            {
                x = 3751,
                z = 3024,
            },
            {
                x = 3751,
                z = 3029,
            },
            {
                x = 3751,
                z = 3035,
            },
            {
                x = 3755,
                z = 3018,
            },
            {
                x = 3755,
                z = 3031,
            },
            {
                x = 3760,
                z = 3009,
            },
            {
                x = 3760,
                z = 3031,
            },
            {
                x = 3764,
                z = 3046,
            },
            {
                x = 3765,
                z = 3044,
            },
            {
                x = 3766,
                z = 3050,
            },
            {
                x = 3767,
                z = 3049,
            },
            {
                x = 3769,
                z = 3023,
            },
            {
                x = 3769,
                z = 3053,
            },
            {
                x = 3771,
                z = 3052,
            },
            {
                x = 3773,
                z = 3042,
            },
            {
                x = 3774,
                z = 3006,
            },
            {
                x = 3774,
                z = 3016,
            },
            {
                x = 3775,
                z = 3053,
            },
            {
                x = 3778,
                z = 3009,
            },
            {
                x = 3778,
                z = 3024,
            },
            {
                x = 3780,
                z = 3021,
            },
            {
                x = 3782,
                z = 3010,
            },
            {
                x = 3784,
                z = 3022,
            },
            {
                x = 3786,
                z = 3037,
            },
            {
                x = 3789,
                z = 3019,
            },
            {
                x = 3789,
                z = 3028,
            },
        },
    },
    {
        name = "Jungle spider",
        ids = {
            [62] = true,
            [1478] = true,
            [6376] = true,
            [6377] = true,
            [16883] = true,
        },
        locations = {
            {
                x = 2665,
                z = 3089,
            },
            {
                x = 2670,
                z = 3088,
            },
            {
                x = 2670,
                z = 3089,
            },
            {
                x = 2670,
                z = 3092,
            },
            {
                x = 2672,
                z = 3085,
            },
            {
                x = 2672,
                z = 3088,
            },
            {
                x = 2673,
                z = 3091,
            },
            {
                x = 2673,
                z = 3111,
            },
            {
                x = 2675,
                z = 3081,
            },
            {
                x = 2678,
                z = 3092,
            },
            {
                x = 2678,
                z = 3094,
            },
            {
                x = 2678,
                z = 3097,
            },
            {
                x = 2680,
                z = 3081,
            },
            {
                x = 2680,
                z = 3110,
            },
            {
                x = 2682,
                z = 3092,
            },
            {
                x = 2682,
                z = 3113,
            },
            {
                x = 2683,
                z = 3089,
            },
            {
                x = 2684,
                z = 3083,
            },
            {
                x = 2685,
                z = 3088,
            },
            {
                x = 2700,
                z = 2776,
            },
            {
                x = 2704,
                z = 2769,
            },
            {
                x = 2705,
                z = 2785,
            },
            {
                x = 2714,
                z = 2781,
            },
            {
                x = 2716,
                z = 2722,
            },
            {
                x = 2721,
                z = 2729,
            },
            {
                x = 2722,
                z = 2790,
            },
            {
                x = 2732,
                z = 2714,
            },
            {
                x = 2738,
                z = 2722,
            },
            {
                x = 2742,
                z = 2704,
            },
            {
                x = 2742,
                z = 2711,
            },
            {
                x = 2749,
                z = 2710,
            },
            {
                x = 2755,
                z = 2705,
            },
            {
                x = 2756,
                z = 2716,
            },
            {
                x = 2767,
                z = 3204,
            },
            {
                x = 2768,
                z = 2703,
            },
            {
                x = 2768,
                z = 3210,
            },
            {
                x = 2770,
                z = 2709,
            },
            {
                x = 2777,
                z = 3116,
            },
            {
                x = 2779,
                z = 2707,
            },
            {
                x = 2780,
                z = 3029,
            },
            {
                x = 2780,
                z = 3031,
            },
            {
                x = 2788,
                z = 2713,
            },
            {
                x = 2796,
                z = 3104,
            },
            {
                x = 2796,
                z = 3116,
            },
            {
                x = 2797,
                z = 3112,
            },
            {
                x = 2798,
                z = 3107,
            },
            {
                x = 2799,
                z = 3115,
            },
            {
                x = 2810,
                z = 2981,
            },
            {
                x = 2810,
                z = 2987,
            },
            {
                x = 2812,
                z = 2999,
            },
            {
                x = 2814,
                z = 2996,
            },
            {
                x = 2844,
                z = 3061,
            },
            {
                x = 2850,
                z = 3063,
            },
            {
                x = 2853,
                z = 3054,
            },
            {
                x = 2855,
                z = 3085,
            },
            {
                x = 2855,
                z = 3089,
            },
            {
                x = 2857,
                z = 3085,
            },
            {
                x = 2858,
                z = 3083,
            },
            {
                x = 2858,
                z = 3092,
            },
            {
                x = 2861,
                z = 3082,
            },
            {
                x = 2861,
                z = 3088,
            },
            {
                x = 2862,
                z = 3081,
            },
            {
                x = 2864,
                z = 3084,
            },
            {
                x = 2864,
                z = 3088,
            },
            {
                x = 2866,
                z = 3081,
            },
            {
                x = 2867,
                z = 3086,
            },
            {
                x = 2868,
                z = 3084,
            },
            {
                x = 2881,
                z = 3150,
            },
            {
                x = 2886,
                z = 3163,
            },
            {
                x = 2887,
                z = 3145,
            },
            {
                x = 2888,
                z = 2946,
            },
            {
                x = 2888,
                z = 3165,
            },
            {
                x = 2889,
                z = 3153,
            },
            {
                x = 2892,
                z = 2946,
            },
            {
                x = 2892,
                z = 3148,
            },
            {
                x = 2893,
                z = 2948,
            },
            {
                x = 2896,
                z = 2983,
            },
            {
                x = 2896,
                z = 2989,
            },
            {
                x = 2896,
                z = 3169,
            },
            {
                x = 2905,
                z = 2988,
            },
            {
                x = 2909,
                z = 2980,
            },
            {
                x = 2910,
                z = 2978,
            },
            {
                x = 2914,
                z = 3046,
            },
            {
                x = 2915,
                z = 3048,
            },
            {
                x = 2916,
                z = 3043,
            },
            {
                x = 2920,
                z = 2976,
            },
            {
                x = 2920,
                z = 3046,
            },
            {
                x = 2921,
                z = 3040,
            },
            {
                x = 2923,
                z = 3046,
            },
            {
                x = 2924,
                z = 2976,
            },
            {
                x = 2925,
                z = 2973,
            },
            {
                x = 2927,
                z = 3043,
            },
            {
                x = 2929,
                z = 3047,
            },
            {
                x = 2930,
                z = 3044,
            },
            {
                x = 2931,
                z = 3032,
            },
            {
                x = 2932,
                z = 3032,
            },
            {
                x = 2932,
                z = 3054,
            },
            {
                x = 2932,
                z = 3057,
            },
            {
                x = 2933,
                z = 3048,
            },
        },
    },
    {
        name = "Jungle strykewyrm",
        ids = {
            [9466] = true,
        },
        locations = {
            {
                x = 2445,
                z = 2896,
            },
            {
                x = 2450,
                z = 2902,
            },
            {
                x = 2451,
                z = 2894,
            },
            {
                x = 2451,
                z = 2915,
            },
            {
                x = 2453,
                z = 2908,
            },
            {
                x = 2457,
                z = 2913,
            },
            {
                x = 2458,
                z = 2919,
            },
            {
                x = 2459,
                z = 2902,
            },
            {
                x = 2460,
                z = 2906,
            },
            {
                x = 2465,
                z = 2911,
            },
            {
                x = 2466,
                z = 2921,
            },
        },
    },
    {
        name = "Jungle Wolf",
        ids = {
            [143] = true,
        },
        locations = {
            {
                x = 2775,
                z = 2913,
            },
            {
                x = 2789,
                z = 2932,
            },
            {
                x = 2801,
                z = 2899,
            },
            {
                x = 2813,
                z = 2917,
            },
            {
                x = 2824,
                z = 2896,
            },
            {
                x = 2827,
                z = 2924,
            },
            {
                x = 2842,
                z = 2899,
            },
            {
                x = 2861,
                z = 2907,
            },
            {
                x = 2862,
                z = 2899,
            },
            {
                x = 2887,
                z = 2929,
            },
            {
                x = 2893,
                z = 2893,
            },
            {
                x = 2911,
                z = 2894,
            },
            {
                x = 2915,
                z = 2906,
            },
            {
                x = 2918,
                z = 2927,
            },
            {
                x = 2919,
                z = 2907,
            },
            {
                x = 2941,
                z = 2887,
            },
        },
    },
    {
        name = "Kal'gerion demon",
        ids = {
            [14973] = true,
            [14974] = true,
            [14975] = true,
            [14976] = true,
            [14977] = true,
        },
        locations = {
            {
                x = 3266,
                z = 3877,
            },
            {
                x = 3268,
                z = 3895,
            },
            {
                x = 3270,
                z = 3883,
            },
            {
                x = 3277,
                z = 3875,
            },
            {
                x = 3281,
                z = 3891,
            },
            {
                x = 3294,
                z = 3879,
            },
            {
                x = 3297,
                z = 3891,
            },
            {
                x = 3301,
                z = 3874,
            },
            {
                x = 3305,
                z = 3896,
            },
            {
                x = 3311,
                z = 3884,
            },
        },
    },
    {
        name = "KGP Agent",
        ids = {},
        locations = {
            {
                x = 2640,
                z = 4009,
            },
        },
    },
    {
        name = "Khazard commander",
        ids = {
            [478] = true,
        },
        locations = {
            {
                x = 2509,
                z = 3254,
            },
        },
    },
    {
        name = "Khazard Guard",
        ids = {
            [255] = true,
            [256] = true,
        },
        locations = {
            {
                x = 2577,
                z = 3162,
            },
            {
                x = 2579,
                z = 3171,
            },
            {
                x = 2580,
                z = 3166,
            },
            {
                x = 2583,
                z = 3149,
            },
            {
                x = 2589,
                z = 3193,
            },
            {
                x = 2592,
                z = 3182,
            },
            {
                x = 2592,
                z = 3185,
            },
            {
                x = 2593,
                z = 3179,
            },
            {
                x = 2594,
                z = 3176,
            },
            {
                x = 2596,
                z = 3184,
            },
            {
                x = 2598,
                z = 3182,
            },
            {
                x = 2599,
                z = 3193,
            },
            {
                x = 2606,
                z = 3171,
            },
            {
                x = 2607,
                z = 3183,
            },
            {
                x = 2607,
                z = 3185,
            },
            {
                x = 2608,
                z = 3186,
            },
            {
                x = 2609,
                z = 3149,
            },
            {
                x = 2610,
                z = 3149,
            },
            {
                x = 2614,
                z = 3186,
            },
        },
    },
    {
        name = "Khazard Guard (prison)",
        ids = {
            [7528] = true,
        },
        locations = {
            {
                x = 2591,
                z = 3139,
            },
            {
                x = 2595,
                z = 3139,
            },
            {
                x = 2614,
                z = 3150,
            },
            {
                x = 2618,
                z = 3159,
            },
            {
                x = 2618,
                z = 3166,
            },
        },
    },
    {
        name = "Khazard trooper",
        ids = {
            [475] = true,
            [2245] = true,
            [2246] = true,
        },
        locations = {
            {
                x = 2454,
                z = 3301,
            },
            {
                x = 2458,
                z = 3298,
            },
            {
                x = 2502,
                z = 3242,
            },
            {
                x = 2509,
                z = 3241,
            },
            {
                x = 2511,
                z = 3240,
            },
            {
                x = 2512,
                z = 3233,
            },
            {
                x = 2512,
                z = 3246,
            },
            {
                x = 2514,
                z = 3235,
            },
            {
                x = 2516,
                z = 3236,
            },
            {
                x = 2516,
                z = 3246,
            },
            {
                x = 2517,
                z = 3242,
            },
            {
                x = 2518,
                z = 3248,
            },
            {
                x = 2518,
                z = 3255,
            },
            {
                x = 2519,
                z = 3244,
            },
            {
                x = 2519,
                z = 3248,
            },
            {
                x = 2520,
                z = 3232,
            },
            {
                x = 2520,
                z = 3242,
            },
            {
                x = 2522,
                z = 3234,
            },
            {
                x = 2522,
                z = 3238,
            },
            {
                x = 2527,
                z = 3239,
            },
            {
                x = 2528,
                z = 3237,
            },
            {
                x = 2528,
                z = 3239,
            },
            {
                x = 2528,
                z = 3248,
            },
            {
                x = 2529,
                z = 3235,
            },
            {
                x = 2529,
                z = 3236,
            },
            {
                x = 2529,
                z = 3237,
            },
            {
                x = 2529,
                z = 3239,
            },
            {
                x = 2529,
                z = 3252,
            },
            {
                x = 2530,
                z = 3235,
            },
            {
                x = 2530,
                z = 3243,
            },
            {
                x = 2531,
                z = 3235,
            },
            {
                x = 2532,
                z = 3244,
            },
            {
                x = 2534,
                z = 3238,
            },
            {
                x = 2536,
                z = 3248,
            },
            {
                x = 2537,
                z = 3241,
            },
            {
                x = 2537,
                z = 3249,
            },
            {
                x = 2538,
                z = 3241,
            },
            {
                x = 2539,
                z = 3243,
            },
            {
                x = 2541,
                z = 3243,
            },
            {
                x = 2543,
                z = 3246,
            },
            {
                x = 2544,
                z = 3247,
            },
        },
    },
    {
        name = "Kikazaru",
        ids = {
            [13178] = true,
            [13201] = true,
        },
        locations = {
            {
                x = 2788,
                z = 2795,
            },
            {
                x = 3224,
                z = 2983,
            },
        },
    },
    {
        name = "King Scorpion",
        ids = {
            [144] = true,
        },
        locations = {
            {
                x = 2842,
                z = 3298,
            },
            {
                x = 2844,
                z = 3291,
            },
            {
                x = 2851,
                z = 3298,
            },
            {
                x = 2855,
                z = 3303,
            },
            {
                x = 2859,
                z = 3283,
            },
            {
                x = 2861,
                z = 3295,
            },
        },
    },
    {
        name = "Knight of Ardougne",
        ids = {
            [23] = true,
        },
        locations = {
            {
                x = 2582,
                z = 3297,
            },
            {
                x = 2652,
                z = 3318,
            },
            {
                x = 2653,
                z = 3300,
            },
            {
                x = 2669,
                z = 3298,
            },
            {
                x = 2671,
                z = 3313,
            },
        },
    },
    {
        name = "Knight of Ardougne (West Ardougne)",
        ids = {
            [347] = true,
            [348] = true,
            [357] = true,
            [369] = true,
            [371] = true,
        },
        locations = {
            {
                x = 2501,
                z = 3315,
            },
            {
                x = 2513,
                z = 3325,
            },
            {
                x = 2518,
                z = 3309,
            },
            {
                x = 2523,
                z = 3292,
            },
            {
                x = 2526,
                z = 3279,
            },
            {
                x = 2526,
                z = 3303,
            },
            {
                x = 2528,
                z = 3297,
            },
            {
                x = 2535,
                z = 3288,
            },
            {
                x = 2536,
                z = 3294,
            },
            {
                x = 2538,
                z = 3321,
            },
            {
                x = 2542,
                z = 3326,
            },
            {
                x = 2543,
                z = 3309,
            },
            {
                x = 2543,
                z = 3329,
            },
            {
                x = 2545,
                z = 3324,
            },
            {
                x = 2545,
                z = 3327,
            },
            {
                x = 2547,
                z = 3326,
            },
            {
                x = 2548,
                z = 3287,
            },
            {
                x = 2549,
                z = 3322,
            },
            {
                x = 2550,
                z = 3319,
            },
            {
                x = 2550,
                z = 3326,
            },
            {
                x = 2550,
                z = 3332,
            },
            {
                x = 2552,
                z = 3319,
            },
            {
                x = 2552,
                z = 3323,
            },
            {
                x = 2552,
                z = 3326,
            },
            {
                x = 2553,
                z = 3322,
            },
            {
                x = 2553,
                z = 3324,
            },
            {
                x = 2553,
                z = 3328,
            },
            {
                x = 2554,
                z = 3331,
            },
        },
    },
    {
        name = "Kraka",
        ids = {
            [1098] = true,
        },
        locations = {
            {
                x = 2869,
                z = 3598,
            },
        },
    },
    {
        name = "Lanzig",
        ids = {
            [1308] = true,
        },
        locations = {
            {
                x = 2676,
                z = 3665,
            },
        },
    },
    {
        name = "Lava strykewyrm",
        ids = {
            [2417] = true,
        },
        locations = {
            {
                x = 3022,
                z = 3822,
            },
            {
                x = 3022,
                z = 3832,
            },
            {
                x = 3031,
                z = 3825,
            },
            {
                x = 3034,
                z = 3832,
            },
            {
                x = 3039,
                z = 3812,
            },
            {
                x = 3039,
                z = 3818,
            },
            {
                x = 3042,
                z = 3804,
            },
            {
                x = 3047,
                z = 3812,
            },
            {
                x = 3051,
                z = 3806,
            },
            {
                x = 3068,
                z = 3796,
            },
            {
                x = 3071,
                z = 3815,
            },
            {
                x = 3075,
                z = 3811,
            },
            {
                x = 3076,
                z = 3795,
            },
            {
                x = 3080,
                z = 3808,
            },
        },
    },
    {
        name = "Leech",
        ids = {
            [1219] = true,
        },
        locations = {
            {
                x = 3537,
                z = 3496,
            },
            {
                x = 3545,
                z = 3502,
            },
            {
                x = 3546,
                z = 3462,
            },
            {
                x = 3548,
                z = 3480,
            },
            {
                x = 3551,
                z = 3489,
            },
            {
                x = 3553,
                z = 3512,
            },
            {
                x = 3560,
                z = 3462,
            },
            {
                x = 3566,
                z = 3483,
            },
            {
                x = 3567,
                z = 3474,
            },
            {
                x = 3572,
                z = 3492,
            },
            {
                x = 3574,
                z = 3507,
            },
            {
                x = 3588,
                z = 3461,
            },
            {
                x = 3589,
                z = 3493,
            },
            {
                x = 3590,
                z = 3509,
            },
            {
                x = 3596,
                z = 3476,
            },
            {
                x = 3599,
                z = 3483,
            },
            {
                x = 3607,
                z = 3460,
            },
            {
                x = 3613,
                z = 3499,
            },
            {
                x = 3614,
                z = 3515,
            },
            {
                x = 3620,
                z = 3472,
            },
            {
                x = 3623,
                z = 3504,
            },
            {
                x = 3626,
                z = 3475,
            },
            {
                x = 3626,
                z = 3491,
            },
            {
                x = 3629,
                z = 3511,
            },
            {
                x = 3633,
                z = 3463,
            },
            {
                x = 3644,
                z = 3498,
            },
            {
                x = 3683,
                z = 3451,
            },
            {
                x = 3692,
                z = 3422,
            },
            {
                x = 3694,
                z = 3407,
            },
        },
    },
    {
        name = "Lensa (Rellekka)",
        ids = {
            [1311] = true,
        },
        locations = {
            {
                x = 2655,
                z = 3652,
            },
        },
    },
    {
        name = "Lesser demon",
        ids = {
            [82] = true,
            [4694] = true,
            [4695] = true,
            [4696] = true,
            [4697] = true,
        },
        locations = {
            {
                x = 2832,
                z = 3278,
            },
            {
                x = 2837,
                z = 3280,
            },
            {
                x = 3096,
                z = 3691,
            },
            {
                x = 3096,
                z = 3703,
            },
            {
                x = 3098,
                z = 3699,
            },
            {
                x = 3103,
                z = 3709,
            },
            {
                x = 3105,
                z = 3695,
            },
            {
                x = 3324,
                z = 3856,
            },
        },
    },
    {
        name = "Lev",
        ids = {
            [6032] = true,
        },
        locations = {
            {
                x = 3502,
                z = 3487,
            },
        },
    },
    {
        name = "Li'l lamb",
        ids = {},
        locations = {
            {
                x = 2927,
                z = 3320,
            },
            {
                x = 3188,
                z = 3293,
            },
        },
    },
    {
        name = "Lizard",
        ids = {
            [2803] = true,
        },
        locations = {
            {
                x = 3338,
                z = 2804,
            },
            {
                x = 3339,
                z = 2815,
            },
            {
                x = 3342,
                z = 2809,
            },
            {
                x = 3344,
                z = 2800,
            },
            {
                x = 3348,
                z = 2809,
            },
            {
                x = 3349,
                z = 2814,
            },
            {
                x = 3357,
                z = 2806,
            },
            {
                x = 3357,
                z = 2813,
            },
            {
                x = 3365,
                z = 2815,
            },
            {
                x = 3387,
                z = 3017,
            },
            {
                x = 3387,
                z = 3068,
            },
            {
                x = 3404,
                z = 3062,
            },
            {
                x = 3441,
                z = 3061,
            },
            {
                x = 3445,
                z = 3034,
            },
        },
    },
    {
        name = "Loar Shade",
        ids = {
            [1240] = true,
        },
        locations = {
            {
                x = 3474,
                z = 3280,
            },
            {
                x = 3478,
                z = 3307,
            },
            {
                x = 3479,
                z = 3283,
            },
            {
                x = 3480,
                z = 3271,
            },
            {
                x = 3482,
                z = 3302,
            },
            {
                x = 3483,
                z = 3283,
            },
            {
                x = 3483,
                z = 3295,
            },
            {
                x = 3487,
                z = 3272,
            },
            {
                x = 3488,
                z = 3282,
            },
            {
                x = 3488,
                z = 3288,
            },
            {
                x = 3489,
                z = 3267,
            },
            {
                x = 3489,
                z = 3302,
            },
            {
                x = 3492,
                z = 3285,
            },
            {
                x = 3493,
                z = 3293,
            },
            {
                x = 3496,
                z = 3277,
            },
            {
                x = 3496,
                z = 3296,
            },
            {
                x = 3500,
                z = 3286,
            },
            {
                x = 3501,
                z = 3294,
            },
            {
                x = 3501,
                z = 3297,
            },
            {
                x = 3501,
                z = 3313,
            },
            {
                x = 3501,
                z = 3321,
            },
            {
                x = 3504,
                z = 3299,
            },
            {
                x = 3507,
                z = 3301,
            },
            {
                x = 3513,
                z = 3321,
            },
            {
                x = 3516,
                z = 3315,
            },
        },
    },
    {
        name = "Locust",
        ids = {
            [1995] = true,
        },
        locations = {
            {
                x = 3310,
                z = 2807,
            },
            {
                x = 3314,
                z = 2806,
            },
            {
                x = 3316,
                z = 2807,
            },
            {
                x = 3319,
                z = 2800,
            },
            {
                x = 3320,
                z = 2753,
            },
            {
                x = 3320,
                z = 2765,
            },
            {
                x = 3320,
                z = 2772,
            },
            {
                x = 3320,
                z = 2778,
            },
            {
                x = 3320,
                z = 2782,
            },
            {
                x = 3320,
                z = 2786,
            },
            {
                x = 3320,
                z = 2794,
            },
            {
                x = 3320,
                z = 2802,
            },
            {
                x = 3321,
                z = 2768,
            },
            {
                x = 3321,
                z = 2790,
            },
            {
                x = 3321,
                z = 2798,
            },
            {
                x = 3321,
                z = 2807,
            },
            {
                x = 3322,
                z = 2775,
            },
            {
                x = 3322,
                z = 2783,
            },
        },
    },
    {
        name = "Locust lancer",
        ids = {
            [6777] = true,
        },
        locations = {
            {
                x = 3432,
                z = 2810,
            },
        },
    },
    {
        name = "Locust ranger",
        ids = {
            [6778] = true,
        },
        locations = {
            {
                x = 3440,
                z = 2806,
            },
        },
    },
    {
        name = "Lord Yudura",
        ids = {
            [30220] = true,
        },
        locations = {
            {
                x = 3450,
                z = 3698,
            },
        },
    },
    {
        name = "Lucien",
        ids = {},
        locations = {
            {
                x = 3127,
                z = 3483,
            },
        },
    },
    {
        name = "Lumbridge guardsman (Lumbridge Market)",
        ids = {
            [9213] = true,
        },
        locations = {
            {
                x = 3203,
                z = 3256,
            },
            {
                x = 3205,
                z = 3258,
            },
        },
    },
    {
        name = "Magic axe",
        ids = {
            [127] = true,
        },
        locations = {
            {
                x = 3187,
                z = 3959,
            },
            {
                x = 3188,
                z = 3961,
            },
            {
                x = 3189,
                z = 3960,
            },
            {
                x = 3190,
                z = 3959,
            },
            {
                x = 3191,
                z = 3959,
            },
            {
                x = 3191,
                z = 3961,
            },
            {
                x = 3192,
                z = 3960,
            },
            {
                x = 3193,
                z = 3958,
            },
            {
                x = 3194,
                z = 3960,
            },
        },
    },
    {
        name = "Man",
        ids = {
            [1] = true,
            [2] = true,
            [3] = true,
            [16] = true,
            [170] = true,
            [3223] = true,
        },
        locations = {
            {
                x = 2596,
                z = 3104,
            },
            {
                x = 2596,
                z = 3106,
            },
            {
                x = 2603,
                z = 3421,
            },
            {
                x = 2693,
                z = 3489,
            },
            {
                x = 2694,
                z = 3497,
            },
            {
                x = 2698,
                z = 3491,
            },
            {
                x = 2713,
                z = 3480,
            },
            {
                x = 2803,
                z = 3431,
            },
            {
                x = 2805,
                z = 3428,
            },
            {
                x = 2889,
                z = 3173,
            },
            {
                x = 2990,
                z = 3365,
            },
            {
                x = 3006,
                z = 3458,
            },
            {
                x = 3017,
                z = 3238,
            },
            {
                x = 3092,
                z = 3510,
            },
            {
                x = 3093,
                z = 3512,
            },
            {
                x = 3097,
                z = 3508,
            },
            {
                x = 3097,
                z = 3512,
            },
            {
                x = 3100,
                z = 3509,
            },
            {
                x = 3100,
                z = 3511,
            },
            {
                x = 3101,
                z = 3509,
            },
            {
                x = 3275,
                z = 3189,
            },
            {
                x = 3283,
                z = 3501,
            },
            {
                x = 3284,
                z = 3199,
            },
            {
                x = 3293,
                z = 3205,
            },
            {
                x = 3294,
                z = 3196,
            },
            {
                x = 3298,
                z = 3206,
            },
            {
                x = 3302,
                z = 3199,
            },
        },
    },
    {
        name = "Man (East Ardougne)",
        ids = {
            [24] = true,
        },
        locations = {
            {
                x = 2614,
                z = 3318,
            },
            {
                x = 2621,
                z = 3293,
            },
        },
    },
    {
        name = "Man (West Ardougne, attackable)",
        ids = {
            [351] = true,
        },
        locations = {
            {
                x = 2465,
                z = 3307,
            },
            {
                x = 2481,
                z = 3293,
            },
            {
                x = 2507,
                z = 3325,
            },
        },
    },
    {
        name = "Market Guard",
        ids = {
            [2236] = true,
        },
        locations = {
            {
                x = 3080,
                z = 3314,
            },
            {
                x = 3083,
                z = 3247,
            },
            {
                x = 3083,
                z = 3253,
            },
            {
                x = 3083,
                z = 3312,
            },
        },
    },
    {
        name = "Market Guard (Fremennik)",
        ids = {
            [1317] = true,
        },
        locations = {
            {
                x = 2635,
                z = 3676,
            },
            {
                x = 2644,
                z = 3670,
            },
            {
                x = 2644,
                z = 3677,
            },
            {
                x = 2644,
                z = 3683,
            },
            {
                x = 2650,
                z = 3676,
            },
        },
    },
    {
        name = "Men",
        ids = {
            [728] = true,
            [729] = true,
        },
        locations = {
            {
                x = 2536,
                z = 3308,
            },
            {
                x = 2540,
                z = 3308,
            },
        },
    },
    {
        name = "Menaphite marketeer",
        ids = {
            [24476] = true,
            [24477] = true,
            [24478] = true,
            [24480] = true,
            [24481] = true,
            [24482] = true,
            [24483] = true,
            [24484] = true,
            [24485] = true,
        },
        locations = {
            {
                x = 3210,
                z = 2787,
            },
            {
                x = 3213,
                z = 2784,
            },
            {
                x = 3214,
                z = 2779,
            },
            {
                x = 3217,
                z = 2781,
            },
            {
                x = 3221,
                z = 2780,
            },
            {
                x = 3226,
                z = 2788,
            },
            {
                x = 3229,
                z = 2770,
            },
            {
                x = 3233,
                z = 2783,
            },
            {
                x = 3233,
                z = 2787,
            },
        },
    },
    {
        name = "Menaphite Thug",
        ids = {
            [1903] = true,
        },
        locations = {
            {
                x = 3333,
                z = 2952,
            },
            {
                x = 3338,
                z = 2946,
            },
            {
                x = 3338,
                z = 2950,
            },
            {
                x = 3342,
                z = 2958,
            },
            {
                x = 3344,
                z = 2950,
            },
            {
                x = 3346,
                z = 2945,
            },
            {
                x = 3346,
                z = 2954,
            },
            {
                x = 3347,
                z = 2961,
            },
            {
                x = 3351,
                z = 2961,
            },
            {
                x = 3352,
                z = 2951,
            },
        },
    },
    {
        name = "Mercenary",
        ids = {
            [4989] = true,
            [4990] = true,
            [4991] = true,
            [4992] = true,
        },
        locations = {
            {
                x = 3265,
                z = 3031,
            },
            {
                x = 3266,
                z = 3027,
            },
            {
                x = 3268,
                z = 3030,
            },
            {
                x = 3269,
                z = 3027,
            },
            {
                x = 3272,
                z = 3028,
            },
        },
    },
    {
        name = "Mercenary Joe",
        ids = {
            [15882] = true,
        },
        locations = {
            {
                x = 3128,
                z = 3201,
            },
        },
    },
    {
        name = "Milla",
        ids = {
            [6037] = true,
        },
        locations = {
            {
                x = 3497,
                z = 3475,
            },
        },
    },
    {
        name = "Mizaru",
        ids = {
            [13176] = true,
            [13200] = true,
        },
        locations = {
            {
                x = 2787,
                z = 2795,
            },
            {
                x = 3223,
                z = 2983,
            },
        },
    },
    {
        name = "Mogre",
        ids = {},
        locations = {
            {
                x = 2982,
                z = 3113,
            },
            {
                x = 2996,
                z = 3106,
            },
            {
                x = 3005,
                z = 3117,
            },
        },
    },
    {
        name = "Monk (Ardougne)",
        ids = {
            [281] = true,
        },
        locations = {
            {
                x = 2606,
                z = 3217,
            },
            {
                x = 2608,
                z = 3209,
            },
            {
                x = 2618,
                z = 3209,
            },
        },
    },
    {
        name = "Monk (Edgeville Monastery)",
        ids = {
            [7727] = true,
        },
        locations = {
            {
                x = 3045,
                z = 3484,
            },
            {
                x = 3045,
                z = 3497,
            },
            {
                x = 3050,
                z = 3491,
            },
            {
                x = 3054,
                z = 3491,
            },
        },
    },
    {
        name = "Monk (Entrana church)",
        ids = {
            [7727] = true,
        },
        locations = {
            {
                x = 3045,
                z = 3484,
            },
            {
                x = 3045,
                z = 3497,
            },
            {
                x = 3050,
                z = 3491,
            },
            {
                x = 3054,
                z = 3491,
            },
        },
    },
    {
        name = "Monk of Zamorak",
        ids = {
            [188] = true,
            [189] = true,
        },
        locations = {
            {
                x = 2454,
                z = 3247,
            },
            {
                x = 2455,
                z = 3240,
            },
            {
                x = 2465,
                z = 3248,
            },
            {
                x = 2468,
                z = 3243,
            },
            {
                x = 2470,
                z = 3243,
            },
            {
                x = 2473,
                z = 3241,
            },
            {
                x = 2474,
                z = 3248,
            },
            {
                x = 2477,
                z = 3238,
            },
            {
                x = 2477,
                z = 3244,
            },
            {
                x = 2949,
                z = 3476,
            },
            {
                x = 2950,
                z = 3475,
            },
            {
                x = 2950,
                z = 3476,
            },
            {
                x = 2951,
                z = 3475,
            },
            {
                x = 2951,
                z = 3476,
            },
            {
                x = 2952,
                z = 3476,
            },
            {
                x = 3213,
                z = 3476,
            },
        },
    },
    {
        name = "Monk of Zamorak (Paterdomus)",
        ids = {
            [1044] = true,
            [1045] = true,
            [1046] = true,
        },
        locations = {
            {
                x = 3407,
                z = 3482,
            },
            {
                x = 3407,
                z = 3489,
            },
            {
                x = 3408,
                z = 3486,
            },
            {
                x = 3412,
                z = 3482,
            },
            {
                x = 3412,
                z = 3486,
            },
        },
    },
    {
        name = "Monkey",
        ids = {
            [132] = true,
        },
        locations = {
            {
                x = 2600,
                z = 3275,
            },
            {
                x = 2600,
                z = 3279,
            },
            {
                x = 2603,
                z = 3279,
            },
            {
                x = 2603,
                z = 3281,
            },
            {
                x = 2604,
                z = 3277,
            },
            {
                x = 2732,
                z = 3176,
            },
            {
                x = 2742,
                z = 3159,
            },
            {
                x = 2755,
                z = 3170,
            },
            {
                x = 2758,
                z = 3178,
            },
            {
                x = 2783,
                z = 3175,
            },
            {
                x = 2787,
                z = 3002,
            },
            {
                x = 2790,
                z = 2997,
            },
            {
                x = 2792,
                z = 2994,
            },
            {
                x = 2794,
                z = 3000,
            },
            {
                x = 2796,
                z = 2993,
            },
            {
                x = 2799,
                z = 2996,
            },
            {
                x = 2812,
                z = 3182,
            },
            {
                x = 2820,
                z = 3193,
            },
            {
                x = 2829,
                z = 3029,
            },
            {
                x = 2832,
                z = 3029,
            },
            {
                x = 2833,
                z = 3027,
            },
            {
                x = 2834,
                z = 3035,
            },
            {
                x = 2837,
                z = 3029,
            },
            {
                x = 2837,
                z = 3034,
            },
            {
                x = 2868,
                z = 3017,
            },
            {
                x = 2868,
                z = 3021,
            },
            {
                x = 2869,
                z = 3015,
            },
            {
                x = 2871,
                z = 3018,
            },
            {
                x = 2871,
                z = 3023,
            },
            {
                x = 2873,
                z = 3021,
            },
            {
                x = 2873,
                z = 3148,
            },
            {
                x = 2877,
                z = 3154,
            },
            {
                x = 2879,
                z = 3161,
            },
            {
                x = 2880,
                z = 2934,
            },
            {
                x = 2893,
                z = 3078,
            },
            {
                x = 2897,
                z = 3081,
            },
            {
                x = 2900,
                z = 3080,
            },
            {
                x = 2902,
                z = 3073,
            },
            {
                x = 2906,
                z = 3084,
            },
            {
                x = 2908,
                z = 3080,
            },
            {
                x = 2909,
                z = 2900,
            },
            {
                x = 2909,
                z = 3023,
            },
            {
                x = 2909,
                z = 3077,
            },
            {
                x = 2912,
                z = 3019,
            },
            {
                x = 2920,
                z = 3027,
            },
            {
                x = 2921,
                z = 3024,
            },
            {
                x = 2922,
                z = 3018,
            },
            {
                x = 2923,
                z = 3027,
            },
            {
                x = 2924,
                z = 3018,
            },
            {
                x = 2924,
                z = 3022,
            },
            {
                x = 2928,
                z = 3018,
            },
            {
                x = 2928,
                z = 3022,
            },
            {
                x = 2934,
                z = 2915,
            },
            {
                x = 2937,
                z = 2898,
            },
            {
                x = 2937,
                z = 2911,
            },
            {
                x = 2939,
                z = 2907,
            },
            {
                x = 2948,
                z = 2970,
            },
            {
                x = 2948,
                z = 3001,
            },
            {
                x = 2950,
                z = 2997,
            },
            {
                x = 2952,
                z = 2973,
            },
            {
                x = 2953,
                z = 2965,
            },
        },
    },
    {
        name = "Monkey (Ardougne Zoo, unattackable)",
        ids = {
            [1463] = true,
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
        },
    },
    {
        name = "Monkey (Mos Le'Harmless)",
        ids = {
            [4344] = true,
        },
        locations = {
            {
                x = 3667,
                z = 3009,
            },
            {
                x = 3668,
                z = 3018,
            },
            {
                x = 3693,
                z = 3036,
            },
            {
                x = 3702,
                z = 3038,
            },
            {
                x = 3712,
                z = 3043,
            },
            {
                x = 3716,
                z = 3005,
            },
            {
                x = 3720,
                z = 3029,
            },
            {
                x = 3724,
                z = 2953,
            },
            {
                x = 3738,
                z = 2953,
            },
            {
                x = 3743,
                z = 3014,
            },
            {
                x = 3748,
                z = 3048,
            },
            {
                x = 3750,
                z = 2975,
            },
            {
                x = 3754,
                z = 3033,
            },
            {
                x = 3758,
                z = 3021,
            },
            {
                x = 3774,
                z = 3039,
            },
            {
                x = 3789,
                z = 3027,
            },
            {
                x = 3832,
                z = 3056,
            },
            {
                x = 3834,
                z = 3021,
            },
        },
    },
    {
        name = "Monkey (Trouble Brewing)",
        ids = {
            [4363] = true,
        },
        locations = {
            {
                x = 3785,
                z = 2974,
            },
            {
                x = 3806,
                z = 2975,
            },
            {
                x = 3810,
                z = 2972,
            },
            {
                x = 3812,
                z = 2976,
            },
            {
                x = 3832,
                z = 2974,
            },
        },
    },
    {
        name = "Monkey Archer",
        ids = {
            [1457] = true,
            [1458] = true,
        },
        locations = {
            {
                x = 2713,
                z = 2753,
            },
            {
                x = 2713,
                z = 2755,
            },
            {
                x = 2713,
                z = 2757,
            },
            {
                x = 2713,
                z = 2759,
            },
            {
                x = 2713,
                z = 2761,
            },
            {
                x = 2715,
                z = 2763,
            },
            {
                x = 2727,
                z = 2763,
            },
            {
                x = 2729,
                z = 2753,
            },
            {
                x = 2729,
                z = 2755,
            },
            {
                x = 2729,
                z = 2757,
            },
            {
                x = 2729,
                z = 2759,
            },
            {
                x = 2729,
                z = 2761,
            },
            {
                x = 2752,
                z = 2782,
            },
            {
                x = 2754,
                z = 2778,
            },
            {
                x = 2755,
                z = 2774,
            },
            {
                x = 2756,
                z = 2789,
            },
            {
                x = 2759,
                z = 2756,
            },
            {
                x = 2761,
                z = 2778,
            },
            {
                x = 2762,
                z = 2793,
            },
            {
                x = 2765,
                z = 2779,
            },
            {
                x = 2767,
                z = 2784,
            },
            {
                x = 2769,
                z = 2754,
            },
            {
                x = 2770,
                z = 2774,
            },
            {
                x = 2772,
                z = 2781,
            },
            {
                x = 2774,
                z = 2787,
            },
            {
                x = 2775,
                z = 2756,
            },
            {
                x = 2777,
                z = 2790,
            },
            {
                x = 2780,
                z = 2773,
            },
            {
                x = 2785,
                z = 2768,
            },
            {
                x = 2789,
                z = 2754,
            },
            {
                x = 2791,
                z = 2763,
            },
        },
    },
    {
        name = "Monkey Guard",
        ids = {
            [1459] = true,
            [1460] = true,
        },
        locations = {
            {
                x = 2788,
                z = 2778,
            },
            {
                x = 2793,
                z = 2782,
            },
            {
                x = 2793,
                z = 2789,
            },
            {
                x = 2795,
                z = 2775,
            },
            {
                x = 2801,
                z = 2782,
            },
            {
                x = 2801,
                z = 2789,
            },
            {
                x = 2803,
                z = 2785,
            },
            {
                x = 2805,
                z = 2783,
            },
            {
                x = 2805,
                z = 2786,
            },
        },
    },
    {
        name = "Moss giant",
        ids = {
            [112] = true,
            [1587] = true,
            [1588] = true,
            [4688] = true,
            [4706] = true,
        },
        locations = {
            {
                x = 2195,
                z = 3808,
            },
            {
                x = 2196,
                z = 3822,
            },
            {
                x = 2197,
                z = 3805,
            },
            {
                x = 2197,
                z = 3813,
            },
            {
                x = 2201,
                z = 3812,
            },
            {
                x = 2202,
                z = 3824,
            },
            {
                x = 2203,
                z = 3804,
            },
            {
                x = 2207,
                z = 3813,
            },
            {
                x = 2211,
                z = 3818,
            },
            {
                x = 2214,
                z = 3819,
            },
            {
                x = 2549,
                z = 3408,
            },
            {
                x = 2554,
                z = 3401,
            },
            {
                x = 2554,
                z = 3409,
            },
            {
                x = 2556,
                z = 3406,
            },
            {
                x = 2691,
                z = 3215,
            },
            {
                x = 2692,
                z = 3204,
            },
            {
                x = 2695,
                z = 3216,
            },
            {
                x = 2698,
                z = 3206,
            },
            {
                x = 2699,
                z = 3212,
            },
            {
                x = 2827,
                z = 3246,
            },
            {
                x = 2831,
                z = 3243,
            },
            {
                x = 2834,
                z = 3242,
            },
        },
    },
    {
        name = "Moss golem",
        ids = {
            [24832] = true,
        },
        locations = {
            {
                x = 2313,
                z = 2786,
            },
            {
                x = 2315,
                z = 2781,
            },
            {
                x = 2320,
                z = 2787,
            },
            {
                x = 2321,
                z = 2777,
            },
            {
                x = 2324,
                z = 2784,
            },
            {
                x = 2325,
                z = 2790,
            },
            {
                x = 2327,
                z = 2780,
            },
            {
                x = 2327,
                z = 2793,
            },
            {
                x = 2328,
                z = 2796,
            },
            {
                x = 2332,
                z = 2783,
            },
            {
                x = 2332,
                z = 2791,
            },
            {
                x = 2334,
                z = 2777,
            },
        },
    },
    {
        name = "Mountain troll",
        ids = {
            [1106] = true,
            [1107] = true,
            [1108] = true,
            [1109] = true,
            [1110] = true,
            [1111] = true,
            [1112] = true,
            [1138] = true,
        },
        locations = {
            {
                x = 2827,
                z = 3675,
            },
            {
                x = 2829,
                z = 3678,
            },
            {
                x = 2831,
                z = 3673,
            },
            {
                x = 2833,
                z = 3670,
            },
            {
                x = 2833,
                z = 3685,
            },
            {
                x = 2834,
                z = 3683,
            },
            {
                x = 2835,
                z = 3667,
            },
            {
                x = 2837,
                z = 3676,
            },
            {
                x = 2846,
                z = 3591,
            },
            {
                x = 2852,
                z = 3586,
            },
            {
                x = 2857,
                z = 3595,
            },
            {
                x = 2858,
                z = 3595,
            },
            {
                x = 2859,
                z = 3595,
            },
            {
                x = 2860,
                z = 3595,
            },
            {
                x = 2861,
                z = 3595,
            },
            {
                x = 2862,
                z = 3595,
            },
            {
                x = 2863,
                z = 3595,
            },
            {
                x = 2865,
                z = 3584,
            },
            {
                x = 2865,
                z = 3587,
            },
            {
                x = 2866,
                z = 3584,
            },
            {
                x = 2867,
                z = 3590,
            },
            {
                x = 2870,
                z = 3589,
            },
            {
                x = 2871,
                z = 3586,
            },
            {
                x = 2911,
                z = 3634,
            },
            {
                x = 2919,
                z = 3631,
            },
            {
                x = 2925,
                z = 3622,
            },
            {
                x = 2929,
                z = 3628,
            },
        },
    },
    {
        name = "Mounted terrorbird gnome",
        ids = {
            [1752] = true,
            [6109] = true,
            [6110] = true,
            [6111] = true,
        },
        locations = {
            {
                x = 2381,
                z = 3428,
            },
            {
                x = 2392,
                z = 3405,
            },
            {
                x = 2413,
                z = 3397,
            },
            {
                x = 2415,
                z = 3408,
            },
            {
                x = 2432,
                z = 3387,
            },
            {
                x = 2437,
                z = 3442,
            },
            {
                x = 2442,
                z = 3388,
            },
            {
                x = 2449,
                z = 3421,
            },
            {
                x = 2453,
                z = 3363,
            },
            {
                x = 2457,
                z = 3394,
            },
            {
                x = 2463,
                z = 3375,
            },
            {
                x = 2463,
                z = 3456,
            },
            {
                x = 2464,
                z = 3394,
            },
            {
                x = 2468,
                z = 3456,
            },
            {
                x = 2480,
                z = 3406,
            },
            {
                x = 2500,
                z = 3226,
            },
            {
                x = 2524,
                z = 3234,
            },
            {
                x = 2530,
                z = 3217,
            },
            {
                x = 2532,
                z = 3217,
            },
            {
                x = 2534,
                z = 3217,
            },
            {
                x = 2537,
                z = 3236,
            },
        },
    },
    {
        name = "Mugger",
        ids = {
            [175] = true,
            [23131] = true,
        },
        locations = {
            {
                x = 3011,
                z = 3255,
            },
            {
                x = 3018,
                z = 3189,
            },
            {
                x = 3072,
                z = 3501,
            },
            {
                x = 3181,
                z = 3216,
            },
        },
    },
    {
        name = "Myre Blamish Snail",
        ids = {
            [1227] = true,
            [1232] = true,
        },
        locations = {
            {
                x = 3411,
                z = 3361,
            },
            {
                x = 3411,
                z = 3391,
            },
            {
                x = 3413,
                z = 3410,
            },
            {
                x = 3414,
                z = 3357,
            },
            {
                x = 3416,
                z = 3362,
            },
            {
                x = 3416,
                z = 3363,
            },
            {
                x = 3416,
                z = 3371,
            },
            {
                x = 3417,
                z = 3368,
            },
            {
                x = 3419,
                z = 3370,
            },
            {
                x = 3421,
                z = 3291,
            },
            {
                x = 3421,
                z = 3408,
            },
            {
                x = 3423,
                z = 3299,
            },
            {
                x = 3423,
                z = 3408,
            },
            {
                x = 3425,
                z = 3317,
            },
            {
                x = 3425,
                z = 3424,
            },
            {
                x = 3426,
                z = 3308,
            },
            {
                x = 3427,
                z = 3319,
            },
            {
                x = 3427,
                z = 3377,
            },
            {
                x = 3429,
                z = 3299,
            },
            {
                x = 3430,
                z = 3291,
            },
            {
                x = 3430,
                z = 3380,
            },
            {
                x = 3432,
                z = 3287,
            },
            {
                x = 3434,
                z = 3286,
            },
            {
                x = 3437,
                z = 3302,
            },
            {
                x = 3438,
                z = 3290,
            },
            {
                x = 3438,
                z = 3294,
            },
            {
                x = 3438,
                z = 3311,
            },
            {
                x = 3441,
                z = 3355,
            },
            {
                x = 3442,
                z = 3405,
            },
            {
                x = 3443,
                z = 3306,
            },
            {
                x = 3445,
                z = 3286,
            },
            {
                x = 3447,
                z = 3284,
            },
            {
                x = 3447,
                z = 3286,
            },
            {
                x = 3448,
                z = 3300,
            },
            {
                x = 3451,
                z = 3291,
            },
            {
                x = 3451,
                z = 3309,
            },
            {
                x = 3454,
                z = 3309,
            },
            {
                x = 3456,
                z = 3417,
            },
            {
                x = 3458,
                z = 3347,
            },
            {
                x = 3460,
                z = 3418,
            },
            {
                x = 3460,
                z = 3424,
            },
            {
                x = 3462,
                z = 3432,
            },
            {
                x = 3463,
                z = 3346,
            },
            {
                x = 3463,
                z = 3404,
            },
            {
                x = 3466,
                z = 3364,
            },
            {
                x = 3467,
                z = 3345,
            },
            {
                x = 3469,
                z = 3432,
            },
            {
                x = 3471,
                z = 3399,
            },
            {
                x = 3472,
                z = 3415,
            },
            {
                x = 3472,
                z = 3418,
            },
            {
                x = 3477,
                z = 3419,
            },
            {
                x = 3478,
                z = 3371,
            },
            {
                x = 3481,
                z = 3439,
            },
            {
                x = 3481,
                z = 3441,
            },
            {
                x = 3481,
                z = 3442,
            },
            {
                x = 3482,
                z = 3444,
            },
            {
                x = 3483,
                z = 3445,
            },
            {
                x = 3487,
                z = 3378,
            },
            {
                x = 3493,
                z = 3393,
            },
            {
                x = 3494,
                z = 3380,
            },
            {
                x = 3498,
                z = 3382,
            },
            {
                x = 3499,
                z = 3394,
            },
            {
                x = 3500,
                z = 3425,
            },
            {
                x = 3501,
                z = 3382,
            },
            {
                x = 3502,
                z = 3425,
            },
            {
                x = 3503,
                z = 3380,
            },
            {
                x = 3504,
                z = 3404,
            },
            {
                x = 3504,
                z = 3422,
            },
            {
                x = 3506,
                z = 3382,
            },
            {
                x = 3506,
                z = 3420,
            },
            {
                x = 3511,
                z = 3393,
            },
            {
                x = 3514,
                z = 3405,
            },
            {
                x = 3516,
                z = 3409,
            },
            {
                x = 3518,
                z = 3397,
            },
            {
                x = 3524,
                z = 3413,
            },
            {
                x = 3530,
                z = 3441,
            },
            {
                x = 3541,
                z = 3410,
            },
            {
                x = 3544,
                z = 3430,
            },
            {
                x = 3563,
                z = 3438,
            },
        },
    },
    {
        name = "Narf",
        ids = {
            [3238] = true,
        },
        locations = {
            {
                x = 2986,
                z = 3438,
            },
        },
    },
    {
        name = "Necromancer (monster)",
        ids = {
            [194] = true,
        },
        locations = {
            {
                x = 2671,
                z = 3240,
            },
        },
    },
    {
        name = "Nikita",
        ids = {
            [6042] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3498,
            },
        },
    },
    {
        name = "Nikolai",
        ids = {
            [6030] = true,
        },
        locations = {
            {
                x = 3496,
                z = 3476,
            },
        },
    },
    {
        name = "Ochre Blamish Snail",
        ids = {
            [1229] = true,
            [1234] = true,
        },
        locations = {
            {
                x = 3411,
                z = 3387,
            },
            {
                x = 3422,
                z = 3377,
            },
            {
                x = 3422,
                z = 3406,
            },
            {
                x = 3424,
                z = 3427,
            },
            {
                x = 3425,
                z = 3278,
            },
            {
                x = 3426,
                z = 3275,
            },
            {
                x = 3426,
                z = 3277,
            },
            {
                x = 3428,
                z = 3400,
            },
            {
                x = 3430,
                z = 3375,
            },
            {
                x = 3431,
                z = 3309,
            },
            {
                x = 3438,
                z = 3312,
            },
            {
                x = 3439,
                z = 3398,
            },
            {
                x = 3441,
                z = 3353,
            },
            {
                x = 3445,
                z = 3284,
            },
            {
                x = 3446,
                z = 3405,
            },
            {
                x = 3447,
                z = 3267,
            },
            {
                x = 3447,
                z = 3269,
            },
            {
                x = 3452,
                z = 3307,
            },
            {
                x = 3452,
                z = 3308,
            },
            {
                x = 3456,
                z = 3418,
            },
            {
                x = 3463,
                z = 3357,
            },
            {
                x = 3467,
                z = 3404,
            },
            {
                x = 3467,
                z = 3409,
            },
            {
                x = 3467,
                z = 3410,
            },
            {
                x = 3471,
                z = 3402,
            },
            {
                x = 3473,
                z = 3348,
            },
            {
                x = 3477,
                z = 3367,
            },
            {
                x = 3477,
                z = 3368,
            },
            {
                x = 3480,
                z = 3363,
            },
            {
                x = 3480,
                z = 3424,
            },
            {
                x = 3483,
                z = 3440,
            },
            {
                x = 3484,
                z = 3442,
            },
            {
                x = 3485,
                z = 3443,
            },
            {
                x = 3494,
                z = 3389,
            },
            {
                x = 3496,
                z = 3386,
            },
            {
                x = 3496,
                z = 3421,
            },
            {
                x = 3504,
                z = 3424,
            },
            {
                x = 3505,
                z = 3418,
            },
            {
                x = 3540,
                z = 3430,
            },
            {
                x = 3545,
                z = 3440,
            },
        },
    },
    {
        name = "Ogre",
        ids = {
            [115] = true,
            [2801] = true,
            [3419] = true,
            [3451] = true,
            [8658] = true,
        },
        locations = {
            {
                x = 2496,
                z = 3092,
            },
            {
                x = 2497,
                z = 3089,
            },
            {
                x = 2500,
                z = 3092,
            },
            {
                x = 2500,
                z = 3097,
            },
            {
                x = 2502,
                z = 3114,
            },
            {
                x = 2503,
                z = 3095,
            },
            {
                x = 2504,
                z = 2965,
            },
            {
                x = 2504,
                z = 2984,
            },
            {
                x = 2504,
                z = 3133,
            },
            {
                x = 2505,
                z = 3111,
            },
            {
                x = 2507,
                z = 3108,
            },
            {
                x = 2508,
                z = 3119,
            },
            {
                x = 2509,
                z = 3087,
            },
            {
                x = 2510,
                z = 3044,
            },
            {
                x = 2510,
                z = 3084,
            },
            {
                x = 2513,
                z = 3026,
            },
            {
                x = 2513,
                z = 3087,
            },
            {
                x = 2514,
                z = 3081,
            },
            {
                x = 2520,
                z = 2973,
            },
            {
                x = 2520,
                z = 3046,
            },
            {
                x = 2523,
                z = 3373,
            },
            {
                x = 2523,
                z = 3376,
            },
            {
                x = 2525,
                z = 2986,
            },
            {
                x = 2526,
                z = 3039,
            },
            {
                x = 2526,
                z = 3373,
            },
            {
                x = 2526,
                z = 3376,
            },
            {
                x = 2529,
                z = 3032,
            },
            {
                x = 2529,
                z = 3373,
            },
            {
                x = 2529,
                z = 3376,
            },
            {
                x = 2532,
                z = 3373,
            },
            {
                x = 2532,
                z = 3376,
            },
            {
                x = 2533,
                z = 2977,
            },
            {
                x = 2536,
                z = 2975,
            },
            {
                x = 2538,
                z = 2985,
            },
            {
                x = 2539,
                z = 3018,
            },
            {
                x = 2541,
                z = 3016,
            },
            {
                x = 2549,
                z = 2979,
            },
            {
                x = 2550,
                z = 3043,
            },
            {
                x = 2550,
                z = 3046,
            },
            {
                x = 2551,
                z = 2955,
            },
            {
                x = 2552,
                z = 2961,
            },
            {
                x = 2553,
                z = 3047,
            },
            {
                x = 2554,
                z = 3192,
            },
            {
                x = 2561,
                z = 3020,
            },
            {
                x = 2567,
                z = 3046,
            },
            {
                x = 2568,
                z = 2991,
            },
            {
                x = 2571,
                z = 3027,
            },
            {
                x = 2572,
                z = 3031,
            },
            {
                x = 2574,
                z = 2988,
            },
            {
                x = 2575,
                z = 3024,
            },
            {
                x = 2578,
                z = 3031,
            },
            {
                x = 2585,
                z = 2977,
            },
            {
                x = 2592,
                z = 2965,
            },
            {
                x = 2608,
                z = 2980,
            },
            {
                x = 2609,
                z = 2990,
            },
            {
                x = 2614,
                z = 2998,
            },
        },
    },
    {
        name = "Ogre chieftain",
        ids = {
            [852] = true,
        },
        locations = {
            {
                x = 2505,
                z = 3032,
            },
            {
                x = 2512,
                z = 3022,
            },
            {
                x = 2518,
                z = 3041,
            },
            {
                x = 2528,
                z = 3044,
            },
            {
                x = 2615,
                z = 2987,
            },
        },
    },
    {
        name = "Ogress",
        ids = {
            [7081] = true,
            [7082] = true,
        },
        locations = {
            {
                x = 2440,
                z = 2858,
            },
            {
                x = 2446,
                z = 2869,
            },
            {
                x = 2451,
                z = 2828,
            },
            {
                x = 2459,
                z = 2859,
            },
            {
                x = 2467,
                z = 2860,
            },
            {
                x = 2471,
                z = 2839,
            },
            {
                x = 2480,
                z = 2892,
            },
            {
                x = 2482,
                z = 2863,
            },
            {
                x = 2483,
                z = 2883,
            },
            {
                x = 2484,
                z = 2917,
            },
            {
                x = 2487,
                z = 2844,
            },
            {
                x = 2491,
                z = 2901,
            },
            {
                x = 2499,
                z = 2860,
            },
            {
                x = 2516,
                z = 2858,
            },
        },
    },
    {
        name = "Ogress champion",
        ids = {
            [7078] = true,
        },
        locations = {
            {
                x = 2451,
                z = 2857,
            },
            {
                x = 2453,
                z = 2874,
            },
            {
                x = 2475,
                z = 2868,
            },
            {
                x = 2475,
                z = 2896,
            },
            {
                x = 2476,
                z = 2883,
            },
            {
                x = 2477,
                z = 2832,
            },
            {
                x = 2502,
                z = 2838,
            },
        },
    },
    {
        name = "Ogress warrior",
        ids = {
            [7079] = true,
            [7080] = true,
        },
        locations = {
            {
                x = 2451,
                z = 2849,
            },
            {
                x = 2456,
                z = 2867,
            },
            {
                x = 2457,
                z = 2836,
            },
            {
                x = 2463,
                z = 2872,
            },
            {
                x = 2470,
                z = 2853,
            },
            {
                x = 2477,
                z = 2903,
            },
            {
                x = 2478,
                z = 2907,
            },
            {
                x = 2480,
                z = 2916,
            },
            {
                x = 2484,
                z = 2873,
            },
            {
                x = 2487,
                z = 2837,
            },
            {
                x = 2487,
                z = 2856,
            },
            {
                x = 2492,
                z = 2888,
            },
            {
                x = 2501,
                z = 2851,
            },
            {
                x = 2508,
                z = 2853,
            },
        },
    },
    {
        name = "Onyx dragon",
        ids = {
            [24171] = true,
        },
        locations = {
            {
                x = 3219,
                z = 3806,
            },
            {
                x = 3236,
                z = 3780,
            },
            {
                x = 3253,
                z = 3824,
            },
            {
                x = 3257,
                z = 3778,
            },
            {
                x = 3260,
                z = 3816,
            },
            {
                x = 3261,
                z = 3835,
            },
            {
                x = 3264,
                z = 3785,
            },
            {
                x = 3264,
                z = 3803,
            },
        },
    },
    {
        name = "Oomlie bird",
        ids = {
            [48] = true,
        },
        locations = {
            {
                x = 2768,
                z = 2912,
            },
            {
                x = 2771,
                z = 2907,
            },
            {
                x = 2773,
                z = 2928,
            },
            {
                x = 2776,
                z = 2934,
            },
            {
                x = 2778,
                z = 2900,
            },
            {
                x = 2785,
                z = 2925,
            },
            {
                x = 2785,
                z = 2935,
            },
            {
                x = 2789,
                z = 2915,
            },
            {
                x = 2791,
                z = 2931,
            },
            {
                x = 2794,
                z = 2906,
            },
            {
                x = 2798,
                z = 2901,
            },
            {
                x = 2799,
                z = 2933,
            },
            {
                x = 2802,
                z = 2921,
            },
            {
                x = 2807,
                z = 2908,
            },
            {
                x = 2815,
                z = 2908,
            },
            {
                x = 2819,
                z = 2900,
            },
            {
                x = 2821,
                z = 2910,
            },
            {
                x = 2827,
                z = 2927,
            },
            {
                x = 2834,
                z = 2911,
            },
            {
                x = 2837,
                z = 2897,
            },
            {
                x = 2859,
                z = 2904,
            },
            {
                x = 2863,
                z = 2916,
            },
            {
                x = 2885,
                z = 2926,
            },
            {
                x = 2888,
                z = 2896,
            },
            {
                x = 2890,
                z = 2907,
            },
            {
                x = 2898,
                z = 2926,
            },
            {
                x = 2904,
                z = 2892,
            },
            {
                x = 2910,
                z = 2906,
            },
            {
                x = 2918,
                z = 2896,
            },
            {
                x = 2921,
                z = 2924,
            },
            {
                x = 2936,
                z = 2910,
            },
            {
                x = 2937,
                z = 2893,
            },
        },
    },
    {
        name = "Outlaw",
        ids = {
            [5842] = true,
            [5843] = true,
            [5844] = true,
            [5845] = true,
            [5846] = true,
            [5847] = true,
            [5848] = true,
            [5849] = true,
            [5850] = true,
            [5851] = true,
        },
        locations = {
            {
                x = 3111,
                z = 3471,
            },
            {
                x = 3111,
                z = 3477,
            },
            {
                x = 3113,
                z = 3468,
            },
            {
                x = 3114,
                z = 3472,
            },
            {
                x = 3115,
                z = 3474,
            },
            {
                x = 3115,
                z = 3476,
            },
            {
                x = 3118,
                z = 3474,
            },
            {
                x = 3118,
                z = 3476,
            },
            {
                x = 3119,
                z = 3473,
            },
            {
                x = 3122,
                z = 3475,
            },
        },
    },
    {
        name = "Padulah",
        ids = {
            [1447] = true,
        },
        locations = {
            {
                x = 2757,
                z = 2788,
            },
        },
    },
    {
        name = "Paladin",
        ids = {
            [20] = true,
            [2256] = true,
        },
        locations = {
            {
                x = 2571,
                z = 3306,
            },
            {
                x = 2572,
                z = 3299,
            },
            {
                x = 2572,
                z = 3303,
            },
            {
                x = 2577,
                z = 3308,
            },
            {
                x = 2581,
                z = 3286,
            },
            {
                x = 2581,
                z = 3299,
            },
            {
                x = 2583,
                z = 3292,
            },
            {
                x = 2653,
                z = 3315,
            },
            {
                x = 2657,
                z = 3307,
            },
        },
    },
    {
        name = "Pale wisp",
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
        name = "Palmer",
        ids = {
            [4552] = true,
        },
        locations = {
            {
                x = 2211,
                z = 3815,
            },
        },
    },
    {
        name = "Party Pumpkin",
        ids = {},
        locations = {
            {
                x = 3074,
                z = 3250,
            },
            {
                x = 3074,
                z = 3260,
            },
            {
                x = 3080,
                z = 3245,
            },
            {
                x = 3081,
                z = 3255,
            },
            {
                x = 3085,
                z = 3244,
            },
            {
                x = 3087,
                z = 3251,
            },
            {
                x = 3087,
                z = 3260,
            },
            {
                x = 3087,
                z = 3264,
            },
            {
                x = 3087,
                z = 3269,
            },
            {
                x = 3088,
                z = 3256,
            },
            {
                x = 3088,
                z = 3265,
            },
            {
                x = 3089,
                z = 3283,
            },
            {
                x = 3090,
                z = 3278,
            },
            {
                x = 3091,
                z = 3264,
            },
            {
                x = 3092,
                z = 3255,
            },
            {
                x = 3093,
                z = 3279,
            },
            {
                x = 3095,
                z = 3237,
            },
            {
                x = 3095,
                z = 3253,
            },
            {
                x = 3097,
                z = 3240,
            },
            {
                x = 3097,
                z = 3258,
            },
            {
                x = 3097,
                z = 3292,
            },
            {
                x = 3100,
                z = 3243,
            },
            {
                x = 3102,
                z = 3266,
            },
            {
                x = 3102,
                z = 3280,
            },
            {
                x = 3103,
                z = 3279,
            },
            {
                x = 3111,
                z = 3258,
            },
            {
                x = 3113,
                z = 3273,
            },
            {
                x = 3119,
                z = 3236,
            },
            {
                x = 3123,
                z = 3272,
            },
            {
                x = 3127,
                z = 3269,
            },
            {
                x = 3130,
                z = 3246,
            },
            {
                x = 3276,
                z = 3544,
            },
            {
                x = 3276,
                z = 3547,
            },
            {
                x = 3276,
                z = 3563,
            },
            {
                x = 3277,
                z = 3551,
            },
            {
                x = 3278,
                z = 3571,
            },
            {
                x = 3281,
                z = 3560,
            },
            {
                x = 3284,
                z = 3536,
            },
            {
                x = 3287,
                z = 3548,
            },
            {
                x = 3289,
                z = 3534,
            },
            {
                x = 3291,
                z = 3574,
            },
            {
                x = 3292,
                z = 3534,
            },
            {
                x = 3292,
                z = 3565,
            },
            {
                x = 3296,
                z = 3540,
            },
            {
                x = 3298,
                z = 3564,
            },
            {
                x = 3298,
                z = 3574,
            },
            {
                x = 3299,
                z = 3533,
            },
            {
                x = 3300,
                z = 3561,
            },
            {
                x = 3301,
                z = 3550,
            },
            {
                x = 3303,
                z = 3571,
            },
            {
                x = 3306,
                z = 3574,
            },
            {
                x = 3309,
                z = 3564,
            },
            {
                x = 3310,
                z = 3542,
            },
            {
                x = 3312,
                z = 3536,
            },
            {
                x = 3313,
                z = 3570,
            },
            {
                x = 3315,
                z = 3545,
            },
            {
                x = 3317,
                z = 3533,
            },
            {
                x = 3320,
                z = 3570,
            },
            {
                x = 3322,
                z = 3539,
            },
            {
                x = 3322,
                z = 3556,
            },
            {
                x = 3322,
                z = 3564,
            },
            {
                x = 3324,
                z = 3538,
            },
            {
                x = 3332,
                z = 3543,
            },
            {
                x = 3332,
                z = 3559,
            },
            {
                x = 3332,
                z = 3563,
            },
            {
                x = 3332,
                z = 3566,
            },
            {
                x = 3333,
                z = 3553,
            },
        },
    },
    {
        name = "Pee Hat",
        ids = {
            [1097] = true,
        },
        locations = {
            {
                x = 2866,
                z = 3598,
            },
        },
    },
    {
        name = "Penguin (monster)",
        ids = {
            [131] = true,
        },
        locations = {
            {
                x = 2499,
                z = 3893,
            },
            {
                x = 2499,
                z = 3896,
            },
            {
                x = 2500,
                z = 3895,
            },
            {
                x = 2501,
                z = 3896,
            },
            {
                x = 2501,
                z = 3897,
            },
            {
                x = 2503,
                z = 3898,
            },
            {
                x = 2505,
                z = 3897,
            },
            {
                x = 2505,
                z = 3899,
            },
            {
                x = 2579,
                z = 3908,
            },
            {
                x = 2580,
                z = 3910,
            },
            {
                x = 2581,
                z = 3912,
            },
            {
                x = 2581,
                z = 3915,
            },
            {
                x = 2581,
                z = 3916,
            },
            {
                x = 2582,
                z = 3908,
            },
            {
                x = 2583,
                z = 3916,
            },
            {
                x = 2584,
                z = 3907,
            },
            {
                x = 2584,
                z = 3910,
            },
            {
                x = 2584,
                z = 3913,
            },
            {
                x = 2584,
                z = 3914,
            },
            {
                x = 2585,
                z = 3918,
            },
            {
                x = 2586,
                z = 3908,
            },
            {
                x = 2586,
                z = 3911,
            },
            {
                x = 2586,
                z = 3916,
            },
            {
                x = 2587,
                z = 3913,
            },
            {
                x = 2587,
                z = 3917,
            },
            {
                x = 2588,
                z = 3907,
            },
            {
                x = 2588,
                z = 3910,
            },
            {
                x = 2588,
                z = 3915,
            },
            {
                x = 2590,
                z = 3911,
            },
            {
                x = 2590,
                z = 3914,
            },
            {
                x = 2590,
                z = 3917,
            },
            {
                x = 2591,
                z = 3908,
            },
            {
                x = 2592,
                z = 3269,
            },
            {
                x = 2593,
                z = 3909,
            },
            {
                x = 2593,
                z = 3911,
            },
            {
                x = 2594,
                z = 3271,
            },
            {
                x = 2596,
                z = 3269,
            },
        },
    },
    {
        name = "Pernicious parrot",
        ids = {
            [6382] = true,
        },
        locations = {
            {
                x = 2882,
                z = 2984,
            },
            {
                x = 2883,
                z = 2980,
            },
            {
                x = 2891,
                z = 2998,
            },
            {
                x = 2892,
                z = 3000,
            },
            {
                x = 2895,
                z = 2978,
            },
            {
                x = 2895,
                z = 2990,
            },
            {
                x = 2896,
                z = 2982,
            },
            {
                x = 2898,
                z = 2976,
            },
            {
                x = 2901,
                z = 2989,
            },
            {
                x = 2922,
                z = 2970,
            },
        },
    },
    {
        name = "Pheasant",
        ids = {
            [16858] = true,
            [16859] = true,
            [16860] = true,
            [16861] = true,
        },
        locations = {
            {
                x = 2627,
                z = 3489,
            },
            {
                x = 2628,
                z = 3488,
            },
            {
                x = 2628,
                z = 3490,
            },
            {
                x = 2629,
                z = 3489,
            },
        },
    },
    {
        name = "Pirate",
        ids = {
            [182] = true,
            [183] = true,
            [184] = true,
            [2695] = true,
            [6346] = true,
            [6347] = true,
            [6348] = true,
            [6349] = true,
            [6350] = true,
            [6351] = true,
            [6352] = true,
            [6353] = true,
            [6354] = true,
            [6355] = true,
            [6356] = true,
        },
        locations = {
            {
                x = 2194,
                z = 3806,
            },
            {
                x = 2205,
                z = 3814,
            },
            {
                x = 2789,
                z = 3183,
            },
            {
                x = 2791,
                z = 3187,
            },
            {
                x = 2792,
                z = 3161,
            },
            {
                x = 2793,
                z = 3157,
            },
            {
                x = 2793,
                z = 3167,
            },
            {
                x = 2794,
                z = 3183,
            },
            {
                x = 2795,
                z = 3157,
            },
            {
                x = 2795,
                z = 3162,
            },
            {
                x = 2796,
                z = 3168,
            },
            {
                x = 2796,
                z = 3188,
            },
            {
                x = 2797,
                z = 3160,
            },
            {
                x = 2797,
                z = 3165,
            },
            {
                x = 2798,
                z = 3186,
            },
            {
                x = 2799,
                z = 3182,
            },
            {
                x = 2802,
                z = 3164,
            },
            {
                x = 2806,
                z = 3185,
            },
            {
                x = 2811,
                z = 3198,
            },
            {
                x = 3013,
                z = 3192,
            },
            {
                x = 3039,
                z = 3950,
            },
            {
                x = 3039,
                z = 3955,
            },
            {
                x = 3039,
                z = 3958,
            },
            {
                x = 3040,
                z = 3955,
            },
            {
                x = 3041,
                z = 3950,
            },
            {
                x = 3041,
                z = 3951,
            },
            {
                x = 3041,
                z = 3953,
            },
            {
                x = 3041,
                z = 3956,
            },
            {
                x = 3043,
                z = 3950,
            },
            {
                x = 3043,
                z = 3951,
            },
            {
                x = 3043,
                z = 3956,
            },
            {
                x = 3043,
                z = 3958,
            },
        },
    },
    {
        name = "Pirate Guard",
        ids = {
            [799] = true,
        },
        locations = {
            {
                x = 2761,
                z = 3191,
            },
            {
                x = 2770,
                z = 3194,
            },
            {
                x = 2776,
                z = 3190,
            },
            {
                x = 2776,
                z = 3198,
            },
            {
                x = 2778,
                z = 3194,
            },
            {
                x = 2778,
                z = 3198,
            },
            {
                x = 2802,
                z = 3195,
            },
        },
    },
    {
        name = "Pit Scorpion",
        ids = {
            [109] = true,
        },
        locations = {
            {
                x = 2601,
                z = 3269,
            },
            {
                x = 2604,
                z = 3272,
            },
            {
                x = 2605,
                z = 3268,
            },
            {
                x = 2606,
                z = 3271,
            },
        },
    },
    {
        name = "Plague frog",
        ids = {
            [1997] = true,
        },
        locations = {
            {
                x = 3276,
                z = 2760,
            },
            {
                x = 3276,
                z = 2764,
            },
            {
                x = 3276,
                z = 2766,
            },
            {
                x = 3276,
                z = 2769,
            },
            {
                x = 3276,
                z = 2796,
            },
            {
                x = 3276,
                z = 2798,
            },
            {
                x = 3276,
                z = 2803,
            },
            {
                x = 3276,
                z = 2806,
            },
            {
                x = 3278,
                z = 2754,
            },
            {
                x = 3278,
                z = 2757,
            },
            {
                x = 3278,
                z = 2762,
            },
            {
                x = 3278,
                z = 2766,
            },
            {
                x = 3278,
                z = 2788,
            },
            {
                x = 3278,
                z = 2792,
            },
            {
                x = 3278,
                z = 2794,
            },
            {
                x = 3278,
                z = 2801,
            },
            {
                x = 3278,
                z = 2804,
            },
        },
    },
    {
        name = "Poison Scorpion",
        ids = {
            [108] = true,
        },
        locations = {
            {
                x = 2715,
                z = 3218,
            },
            {
                x = 2719,
                z = 3223,
            },
            {
                x = 2720,
                z = 3212,
            },
            {
                x = 2722,
                z = 3220,
            },
            {
                x = 2724,
                z = 3215,
            },
            {
                x = 2728,
                z = 3223,
            },
            {
                x = 2734,
                z = 3220,
            },
        },
    },
    {
        name = "Poltenip",
        ids = {
            [3042] = true,
        },
        locations = {
            {
                x = 3438,
                z = 2914,
            },
        },
    },
    {
        name = "Rabbit",
        ids = {
            [1192] = true,
            [1193] = true,
            [1194] = true,
            [1404] = true,
            [5829] = true,
            [26841] = true,
        },
        locations = {
            {
                x = 2187,
                z = 3223,
            },
            {
                x = 2187,
                z = 3225,
            },
            {
                x = 2189,
                z = 3220,
            },
            {
                x = 2189,
                z = 3225,
            },
            {
                x = 2206,
                z = 3196,
            },
            {
                x = 2206,
                z = 3198,
            },
            {
                x = 2208,
                z = 3195,
            },
            {
                x = 2228,
                z = 3237,
            },
            {
                x = 2229,
                z = 3239,
            },
            {
                x = 2230,
                z = 3237,
            },
            {
                x = 2230,
                z = 3238,
            },
            {
                x = 2231,
                z = 3237,
            },
            {
                x = 2231,
                z = 3238,
            },
            {
                x = 2234,
                z = 3169,
            },
            {
                x = 2234,
                z = 3237,
            },
            {
                x = 2236,
                z = 3165,
            },
            {
                x = 2240,
                z = 3164,
            },
            {
                x = 2241,
                z = 3163,
            },
            {
                x = 2242,
                z = 3162,
            },
            {
                x = 2242,
                z = 3164,
            },
            {
                x = 2243,
                z = 3161,
            },
            {
                x = 2264,
                z = 3140,
            },
            {
                x = 2265,
                z = 3141,
            },
            {
                x = 2273,
                z = 3182,
            },
            {
                x = 2274,
                z = 3164,
            },
            {
                x = 2279,
                z = 3219,
            },
            {
                x = 2293,
                z = 3175,
            },
            {
                x = 2295,
                z = 3177,
            },
            {
                x = 2295,
                z = 3250,
            },
            {
                x = 2296,
                z = 3176,
            },
            {
                x = 2296,
                z = 3249,
            },
            {
                x = 2296,
                z = 3250,
            },
            {
                x = 2297,
                z = 3175,
            },
            {
                x = 2297,
                z = 3176,
            },
            {
                x = 2545,
                z = 3869,
            },
            {
                x = 2549,
                z = 3869,
            },
            {
                x = 2552,
                z = 3866,
            },
            {
                x = 2554,
                z = 3871,
            },
            {
                x = 2560,
                z = 3869,
            },
            {
                x = 2588,
                z = 3874,
            },
            {
                x = 2592,
                z = 3867,
            },
            {
                x = 3149,
                z = 3230,
            },
            {
                x = 3154,
                z = 3240,
            },
            {
                x = 3170,
                z = 3217,
            },
            {
                x = 3187,
                z = 3226,
            },
            {
                x = 3381,
                z = 3540,
            },
            {
                x = 3383,
                z = 3552,
            },
        },
    },
    {
        name = "Rabbit (Burthorpe)",
        ids = {
            [26662] = true,
        },
        locations = {
            {
                x = 2885,
                z = 3512,
            },
            {
                x = 2885,
                z = 3513,
            },
            {
                x = 2886,
                z = 3512,
            },
            {
                x = 2886,
                z = 3513,
            },
            {
                x = 2886,
                z = 3514,
            },
            {
                x = 2887,
                z = 3512,
            },
            {
                x = 2887,
                z = 3513,
            },
            {
                x = 2899,
                z = 3500,
            },
            {
                x = 2901,
                z = 3504,
            },
            {
                x = 2902,
                z = 3501,
            },
            {
                x = 2905,
                z = 3482,
            },
            {
                x = 2906,
                z = 3494,
            },
            {
                x = 2908,
                z = 3539,
            },
            {
                x = 2909,
                z = 3488,
            },
            {
                x = 2909,
                z = 3538,
            },
            {
                x = 2909,
                z = 3539,
            },
            {
                x = 2909,
                z = 3540,
            },
            {
                x = 2910,
                z = 3502,
            },
            {
                x = 2910,
                z = 3538,
            },
            {
                x = 2910,
                z = 3539,
            },
            {
                x = 2910,
                z = 3540,
            },
            {
                x = 2912,
                z = 3476,
            },
            {
                x = 2912,
                z = 3496,
            },
            {
                x = 2913,
                z = 3505,
            },
            {
                x = 2915,
                z = 3474,
            },
            {
                x = 2915,
                z = 3477,
            },
            {
                x = 2917,
                z = 3501,
            },
            {
                x = 2917,
                z = 3503,
            },
            {
                x = 2919,
                z = 3492,
            },
            {
                x = 2923,
                z = 3471,
            },
            {
                x = 2928,
                z = 3466,
            },
            {
                x = 2929,
                z = 3476,
            },
            {
                x = 2929,
                z = 3479,
            },
            {
                x = 2929,
                z = 3495,
            },
            {
                x = 2930,
                z = 3491,
            },
            {
                x = 2933,
                z = 3472,
            },
            {
                x = 2934,
                z = 3465,
            },
            {
                x = 2935,
                z = 3483,
            },
            {
                x = 2935,
                z = 3497,
            },
            {
                x = 2937,
                z = 3493,
            },
            {
                x = 3313,
                z = 3347,
            },
            {
                x = 3314,
                z = 3342,
            },
            {
                x = 3314,
                z = 3352,
            },
            {
                x = 3321,
                z = 3352,
            },
            {
                x = 3322,
                z = 3342,
            },
            {
                x = 3323,
                z = 3347,
            },
        },
    },
    {
        name = "Radat",
        ids = {
            [3043] = true,
        },
        locations = {
            {
                x = 3442,
                z = 2920,
            },
        },
    },
    {
        name = "Ragnvald",
        ids = {},
        locations = {
            {
                x = 2518,
                z = 3867,
            },
        },
    },
    {
        name = "Ram",
        ids = {
            [3673] = true,
            [5170] = true,
            [12369] = true,
            [12370] = true,
            [12371] = true,
        },
        locations = {
            {
                x = 2322,
                z = 3189,
            },
            {
                x = 2924,
                z = 3318,
            },
            {
                x = 2924,
                z = 3325,
            },
            {
                x = 3052,
                z = 3516,
            },
            {
                x = 3196,
                z = 3293,
            },
            {
                x = 3197,
                z = 3290,
            },
            {
                x = 3199,
                z = 3288,
            },
        },
    },
    {
        name = "Rannveig",
        ids = {},
        locations = {
            {
                x = 2513,
                z = 3865,
            },
        },
    },
    {
        name = "Rat",
        ids = {
            [47] = true,
            [2682] = true,
        },
        locations = {
            {
                x = 2117,
                z = 3887,
            },
            {
                x = 2130,
                z = 3899,
            },
            {
                x = 2223,
                z = 3793,
            },
            {
                x = 2226,
                z = 3800,
            },
            {
                x = 2461,
                z = 3293,
            },
            {
                x = 2462,
                z = 3300,
            },
            {
                x = 2463,
                z = 3285,
            },
            {
                x = 2464,
                z = 3310,
            },
            {
                x = 2465,
                z = 3295,
            },
            {
                x = 2466,
                z = 3294,
            },
            {
                x = 2466,
                z = 3299,
            },
            {
                x = 2467,
                z = 3322,
            },
            {
                x = 2468,
                z = 3326,
            },
            {
                x = 2470,
                z = 3314,
            },
            {
                x = 2470,
                z = 3318,
            },
            {
                x = 2470,
                z = 3321,
            },
            {
                x = 2471,
                z = 3298,
            },
            {
                x = 2471,
                z = 3316,
            },
            {
                x = 2472,
                z = 3314,
            },
            {
                x = 2472,
                z = 3324,
            },
            {
                x = 2473,
                z = 3326,
            },
            {
                x = 2474,
                z = 3301,
            },
            {
                x = 2475,
                z = 3303,
            },
            {
                x = 2476,
                z = 3293,
            },
            {
                x = 2476,
                z = 3322,
            },
            {
                x = 2477,
                z = 3286,
            },
            {
                x = 2477,
                z = 3298,
            },
            {
                x = 2477,
                z = 3301,
            },
            {
                x = 2477,
                z = 3324,
            },
            {
                x = 2478,
                z = 3285,
            },
            {
                x = 2478,
                z = 3304,
            },
            {
                x = 2479,
                z = 3313,
            },
            {
                x = 2480,
                z = 3294,
            },
            {
                x = 2480,
                z = 3306,
            },
            {
                x = 2480,
                z = 3315,
            },
            {
                x = 2481,
                z = 3300,
            },
            {
                x = 2482,
                z = 3306,
            },
            {
                x = 2484,
                z = 3294,
            },
            {
                x = 2484,
                z = 3300,
            },
            {
                x = 2484,
                z = 3304,
            },
            {
                x = 2484,
                z = 3307,
            },
            {
                x = 2486,
                z = 3281,
            },
            {
                x = 2486,
                z = 3292,
            },
            {
                x = 2486,
                z = 3296,
            },
            {
                x = 2486,
                z = 3300,
            },
            {
                x = 2486,
                z = 3313,
            },
            {
                x = 2487,
                z = 3286,
            },
            {
                x = 2487,
                z = 3303,
            },
            {
                x = 2488,
                z = 3305,
            },
            {
                x = 2488,
                z = 3319,
            },
            {
                x = 2489,
                z = 3284,
            },
            {
                x = 2489,
                z = 3302,
            },
            {
                x = 2490,
                z = 3321,
            },
            {
                x = 2490,
                z = 3323,
            },
            {
                x = 2492,
                z = 3303,
            },
            {
                x = 2499,
                z = 3330,
            },
            {
                x = 2500,
                z = 3331,
            },
            {
                x = 2502,
                z = 3184,
            },
            {
                x = 2503,
                z = 3330,
            },
            {
                x = 2506,
                z = 3190,
            },
            {
                x = 2506,
                z = 3331,
            },
            {
                x = 2508,
                z = 3187,
            },
            {
                x = 2508,
                z = 3330,
            },
            {
                x = 2509,
                z = 3191,
            },
            {
                x = 2511,
                z = 3188,
            },
            {
                x = 2512,
                z = 3190,
            },
            {
                x = 2513,
                z = 3187,
            },
            {
                x = 2514,
                z = 3330,
            },
            {
                x = 2514,
                z = 3334,
            },
            {
                x = 2516,
                z = 3190,
            },
            {
                x = 2516,
                z = 3191,
            },
            {
                x = 2517,
                z = 3332,
            },
            {
                x = 2518,
                z = 3329,
            },
            {
                x = 2521,
                z = 3329,
            },
            {
                x = 2525,
                z = 3334,
            },
            {
                x = 2527,
                z = 2986,
            },
            {
                x = 2529,
                z = 3328,
            },
            {
                x = 2530,
                z = 3332,
            },
            {
                x = 2531,
                z = 2976,
            },
            {
                x = 2532,
                z = 3330,
            },
            {
                x = 2535,
                z = 3332,
            },
            {
                x = 2547,
                z = 2990,
            },
            {
                x = 2592,
                z = 3416,
            },
            {
                x = 2610,
                z = 3479,
            },
            {
                x = 2611,
                z = 3475,
            },
            {
                x = 2614,
                z = 3478,
            },
            {
                x = 2720,
                z = 3583,
            },
            {
                x = 2725,
                z = 3576,
            },
            {
                x = 2728,
                z = 3580,
            },
            {
                x = 2730,
                z = 3571,
            },
            {
                x = 2730,
                z = 3574,
            },
            {
                x = 2807,
                z = 3167,
            },
            {
                x = 2810,
                z = 3170,
            },
            {
                x = 2923,
                z = 3245,
            },
            {
                x = 2923,
                z = 3251,
            },
            {
                x = 2924,
                z = 3240,
            },
            {
                x = 2932,
                z = 3242,
            },
            {
                x = 2934,
                z = 3240,
            },
            {
                x = 2939,
                z = 3242,
            },
            {
                x = 2955,
                z = 3193,
            },
            {
                x = 2956,
                z = 3191,
            },
            {
                x = 2959,
                z = 3191,
            },
            {
                x = 2960,
                z = 3193,
            },
            {
                x = 2996,
                z = 3700,
            },
            {
                x = 2997,
                z = 3702,
            },
            {
                x = 2999,
                z = 3700,
            },
            {
                x = 3000,
                z = 3703,
            },
            {
                x = 3011,
                z = 3189,
            },
            {
                x = 3013,
                z = 3183,
            },
            {
                x = 3013,
                z = 3190,
            },
            {
                x = 3013,
                z = 3194,
            },
            {
                x = 3015,
                z = 3182,
            },
            {
                x = 3019,
                z = 3289,
            },
            {
                x = 3023,
                z = 3291,
            },
            {
                x = 3099,
                z = 3366,
            },
            {
                x = 3100,
                z = 3273,
            },
            {
                x = 3101,
                z = 3355,
            },
            {
                x = 3126,
                z = 3486,
            },
            {
                x = 3127,
                z = 3488,
            },
            {
                x = 3130,
                z = 3487,
            },
            {
                x = 3151,
                z = 3414,
            },
            {
                x = 3156,
                z = 3634,
            },
            {
                x = 3159,
                z = 3635,
            },
            {
                x = 3160,
                z = 3639,
            },
            {
                x = 3205,
                z = 3203,
            },
            {
                x = 3205,
                z = 3204,
            },
            {
                x = 3205,
                z = 3209,
            },
            {
                x = 3206,
                z = 3202,
            },
            {
                x = 3206,
                z = 3203,
            },
            {
                x = 3206,
                z = 3204,
            },
            {
                x = 3206,
                z = 3209,
            },
            {
                x = 3207,
                z = 3203,
            },
            {
                x = 3247,
                z = 3730,
            },
            {
                x = 3248,
                z = 3728,
            },
            {
                x = 3250,
                z = 3729,
            },
            {
                x = 3251,
                z = 3677,
            },
            {
                x = 3252,
                z = 3673,
            },
            {
                x = 3252,
                z = 3676,
            },
            {
                x = 3257,
                z = 3668,
            },
            {
                x = 3260,
                z = 3670,
            },
            {
                x = 3261,
                z = 3673,
            },
            {
                x = 3324,
                z = 3250,
            },
            {
                x = 3483,
                z = 3210,
            },
            {
                x = 3489,
                z = 3211,
            },
            {
                x = 3490,
                z = 3243,
            },
            {
                x = 3492,
                z = 3228,
            },
            {
                x = 3496,
                z = 3230,
            },
            {
                x = 3496,
                z = 3242,
            },
            {
                x = 3498,
                z = 3212,
            },
            {
                x = 3500,
                z = 3224,
            },
            {
                x = 3505,
                z = 3230,
            },
            {
                x = 3506,
                z = 3243,
            },
            {
                x = 3508,
                z = 3225,
            },
            {
                x = 3512,
                z = 3228,
            },
            {
                x = 3516,
                z = 3222,
            },
            {
                x = 3679,
                z = 2949,
            },
            {
                x = 3682,
                z = 2948,
            },
            {
                x = 3688,
                z = 2947,
            },
            {
                x = 3713,
                z = 3492,
            },
            {
                x = 3714,
                z = 3498,
            },
            {
                x = 3715,
                z = 3502,
            },
        },
    },
    {
        name = "Red dragon",
        ids = {
            [53] = true,
            [4670] = true,
            [4672] = true,
        },
        locations = {
            {
                x = 3181,
                z = 3850,
            },
            {
                x = 3190,
                z = 3834,
            },
            {
                x = 3212,
                z = 3820,
            },
            {
                x = 3222,
                z = 3829,
            },
        },
    },
    {
        name = "Relomia",
        ids = {
            [27445] = true,
            [27771] = true,
        },
        locations = {
            {
                x = 3220,
                z = 3402,
            },
            {
                x = 3266,
                z = 3388,
            },
            {
                x = 3275,
                z = 3490,
            },
        },
    },
    {
        name = "Relomia, Emissary of Sliske",
        ids = {
            [17134] = true,
        },
        locations = {
            {
                x = 3093,
                z = 3263,
            },
        },
    },
    {
        name = "Renegade Knight",
        ids = {},
        locations = {
            {
                x = 2766,
                z = 3397,
            },
            {
                x = 2767,
                z = 3399,
            },
            {
                x = 2773,
                z = 3399,
            },
        },
    },
    {
        name = "Ripper Demon",
        ids = {
            [21994] = true,
        },
        locations = {
            {
                x = 3075,
                z = 3864,
            },
            {
                x = 3082,
                z = 3860,
            },
            {
                x = 3092,
                z = 3865,
            },
            {
                x = 3106,
                z = 3906,
            },
            {
                x = 3223,
                z = 3867,
            },
            {
                x = 3225,
                z = 3859,
            },
            {
                x = 3232,
                z = 3898,
            },
            {
                x = 3233,
                z = 3871,
            },
            {
                x = 3235,
                z = 3862,
            },
            {
                x = 3237,
                z = 3888,
            },
            {
                x = 3239,
                z = 3863,
            },
            {
                x = 3243,
                z = 3899,
            },
            {
                x = 3245,
                z = 3873,
            },
            {
                x = 3247,
                z = 3893,
            },
            {
                x = 3248,
                z = 3869,
            },
            {
                x = 3248,
                z = 3884,
            },
            {
                x = 3249,
                z = 3857,
            },
            {
                x = 3253,
                z = 3868,
            },
            {
                x = 3257,
                z = 3860,
            },
        },
    },
    {
        name = "Rock (monster)",
        ids = {
            [1095] = true,
        },
        locations = {
            {
                x = 2849,
                z = 3591,
            },
        },
    },
    {
        name = "Rock crab",
        ids = {
            [1266] = true,
            [1268] = true,
        },
        locations = {
            {
                x = 2501,
                z = 3755,
            },
            {
                x = 2502,
                z = 3754,
            },
            {
                x = 2512,
                z = 3765,
            },
            {
                x = 2512,
                z = 3766,
            },
            {
                x = 2514,
                z = 3766,
            },
            {
                x = 2521,
                z = 3756,
            },
            {
                x = 2522,
                z = 3716,
            },
            {
                x = 2523,
                z = 3723,
            },
            {
                x = 2524,
                z = 3724,
            },
            {
                x = 2529,
                z = 3740,
            },
            {
                x = 2530,
                z = 3762,
            },
            {
                x = 2531,
                z = 3721,
            },
            {
                x = 2532,
                z = 3760,
            },
            {
                x = 2534,
                z = 3719,
            },
            {
                x = 2537,
                z = 3765,
            },
            {
                x = 2541,
                z = 3757,
            },
            {
                x = 2543,
                z = 3754,
            },
            {
                x = 2548,
                z = 3734,
            },
            {
                x = 2553,
                z = 3746,
            },
            {
                x = 2663,
                z = 3716,
            },
            {
                x = 2666,
                z = 3715,
            },
            {
                x = 2667,
                z = 3727,
            },
            {
                x = 2669,
                z = 3718,
            },
            {
                x = 2670,
                z = 3727,
            },
            {
                x = 2671,
                z = 3724,
            },
            {
                x = 2672,
                z = 3732,
            },
            {
                x = 2673,
                z = 3716,
            },
            {
                x = 2675,
                z = 3729,
            },
            {
                x = 2676,
                z = 3713,
            },
            {
                x = 2677,
                z = 3717,
            },
            {
                x = 2677,
                z = 3721,
            },
            {
                x = 2677,
                z = 3733,
            },
            {
                x = 2678,
                z = 3729,
            },
            {
                x = 2681,
                z = 3727,
            },
            {
                x = 2681,
                z = 3733,
            },
            {
                x = 2683,
                z = 3716,
            },
            {
                x = 2684,
                z = 3720,
            },
            {
                x = 2686,
                z = 3713,
            },
            {
                x = 2687,
                z = 3724,
            },
            {
                x = 2694,
                z = 3724,
            },
            {
                x = 2695,
                z = 3727,
            },
            {
                x = 2703,
                z = 3716,
            },
            {
                x = 2708,
                z = 3719,
            },
            {
                x = 2711,
                z = 3715,
            },
            {
                x = 2712,
                z = 3719,
            },
            {
                x = 2712,
                z = 3725,
            },
            {
                x = 2715,
                z = 3727,
            },
            {
                x = 2715,
                z = 3729,
            },
            {
                x = 2716,
                z = 3721,
            },
            {
                x = 2716,
                z = 3732,
            },
            {
                x = 2718,
                z = 3730,
            },
            {
                x = 2719,
                z = 3719,
            },
            {
                x = 2720,
                z = 3727,
            },
        },
    },
    {
        name = "Rogue",
        ids = {
            [23145] = true,
        },
        locations = {
            {
                x = 3276,
                z = 3930,
            },
            {
                x = 3276,
                z = 3933,
            },
            {
                x = 3278,
                z = 3927,
            },
            {
                x = 3281,
                z = 3934,
            },
            {
                x = 3284,
                z = 3929,
            },
            {
                x = 3285,
                z = 3933,
            },
            {
                x = 3287,
                z = 3930,
            },
            {
                x = 3291,
                z = 3932,
            },
            {
                x = 3292,
                z = 3924,
            },
        },
    },
    {
        name = "Rogue Enforcer",
        ids = {
            [23145] = true,
        },
        locations = {
            {
                x = 3292,
                z = 3924,
            },
        },
    },
    {
        name = "Rooster",
        ids = {
            [1018] = true,
            [1403] = true,
        },
        locations = {
            {
                x = 2518,
                z = 3865,
            },
            {
                x = 2606,
                z = 3877,
            },
            {
                x = 2680,
                z = 3662,
            },
            {
                x = 2816,
                z = 3560,
            },
        },
    },
    {
        name = "Rusty",
        ids = {
            [3239] = true,
        },
        locations = {
            {
                x = 2979,
                z = 3436,
            },
        },
    },
    {
        name = "Sakadagami",
        ids = {
            [23071] = true,
        },
        locations = {
            {
                x = 4793,
                z = 3451,
            },
            {
                x = 4796,
                z = 3439,
            },
            {
                x = 4797,
                z = 3451,
            },
            {
                x = 4800,
                z = 3447,
            },
            {
                x = 4802,
                z = 3436,
            },
            {
                x = 4802,
                z = 3453,
            },
            {
                x = 4806,
                z = 3440,
            },
            {
                x = 4807,
                z = 3450,
            },
            {
                x = 4810,
                z = 3441,
            },
            {
                x = 4810,
                z = 3454,
            },
            {
                x = 4811,
                z = 3437,
            },
            {
                x = 4814,
                z = 3444,
            },
            {
                x = 4814,
                z = 3448,
            },
            {
                x = 4815,
                z = 3452,
            },
            {
                x = 4817,
                z = 3441,
            },
        },
    },
    {
        name = "Sapphire glacialis",
        ids = {},
        locations = {
            {
                x = 2698,
                z = 3795,
            },
            {
                x = 2699,
                z = 3787,
            },
            {
                x = 2700,
                z = 3782,
            },
            {
                x = 2700,
                z = 3801,
            },
            {
                x = 2703,
                z = 3822,
            },
            {
                x = 2704,
                z = 3797,
            },
            {
                x = 2708,
                z = 3822,
            },
            {
                x = 2709,
                z = 3790,
            },
            {
                x = 2713,
                z = 3783,
            },
            {
                x = 2714,
                z = 3794,
            },
            {
                x = 2715,
                z = 3808,
            },
            {
                x = 2720,
                z = 3805,
            },
            {
                x = 2720,
                z = 3834,
            },
            {
                x = 2734,
                z = 3823,
            },
            {
                x = 2735,
                z = 3788,
            },
            {
                x = 2741,
                z = 3783,
            },
        },
    },
    {
        name = "Scabaras lancer",
        ids = {
            [6774] = true,
        },
        locations = {
            {
                x = 3435,
                z = 2808,
            },
        },
    },
    {
        name = "Scabaras locust",
        ids = {
            [6776] = true,
        },
        locations = {
            {
                x = 3441,
                z = 2810,
            },
            {
                x = 3445,
                z = 2813,
            },
        },
    },
    {
        name = "Scabaras ranger",
        ids = {
            [6773] = true,
        },
        locations = {
            {
                x = 3439,
                z = 2808,
            },
        },
    },
    {
        name = "Scorpion",
        ids = {
            [107] = true,
        },
        locations = {
            {
                x = 2602,
                z = 3267,
            },
            {
                x = 2603,
                z = 3270,
            },
            {
                x = 2607,
                z = 3268,
            },
            {
                x = 2765,
                z = 2978,
            },
            {
                x = 2768,
                z = 2980,
            },
            {
                x = 2785,
                z = 2955,
            },
            {
                x = 2786,
                z = 2947,
            },
            {
                x = 2788,
                z = 2948,
            },
            {
                x = 2843,
                z = 3156,
            },
            {
                x = 2853,
                z = 3159,
            },
            {
                x = 2861,
                z = 3165,
            },
            {
                x = 2862,
                z = 3180,
            },
            {
                x = 2863,
                z = 3169,
            },
            {
                x = 2865,
                z = 3156,
            },
            {
                x = 2870,
                z = 3159,
            },
            {
                x = 3044,
                z = 3571,
            },
            {
                x = 3044,
                z = 3581,
            },
            {
                x = 3047,
                z = 3567,
            },
            {
                x = 3055,
                z = 3574,
            },
            {
                x = 3056,
                z = 3566,
            },
            {
                x = 3062,
                z = 3555,
            },
            {
                x = 3062,
                z = 3570,
            },
            {
                x = 3225,
                z = 3943,
            },
            {
                x = 3231,
                z = 3940,
            },
            {
                x = 3235,
                z = 3946,
            },
            {
                x = 3239,
                z = 3942,
            },
            {
                x = 3246,
                z = 3945,
            },
            {
                x = 3249,
                z = 3949,
            },
            {
                x = 3256,
                z = 3954,
            },
            {
                x = 3292,
                z = 3297,
            },
            {
                x = 3297,
                z = 3298,
            },
            {
                x = 3298,
                z = 3304,
            },
            {
                x = 3298,
                z = 3311,
            },
            {
                x = 3299,
                z = 3288,
            },
            {
                x = 3300,
                z = 3315,
            },
            {
                x = 3301,
                z = 3278,
            },
            {
                x = 3301,
                z = 3291,
            },
            {
                x = 3302,
                z = 3306,
            },
        },
    },
    {
        name = "Scorpion (Ape Atoll)",
        ids = {
            [1477] = true,
        },
        locations = {
            {
                x = 2752,
                z = 2762,
            },
            {
                x = 2761,
                z = 2803,
            },
            {
                x = 2762,
                z = 2749,
            },
            {
                x = 2766,
                z = 2761,
            },
            {
                x = 2768,
                z = 2739,
            },
            {
                x = 2769,
                z = 2734,
            },
            {
                x = 2769,
                z = 2806,
            },
            {
                x = 2776,
                z = 2764,
            },
            {
                x = 2781,
                z = 2743,
            },
            {
                x = 2792,
                z = 2796,
            },
            {
                x = 2793,
                z = 2778,
            },
            {
                x = 2804,
                z = 2797,
            },
            {
                x = 2894,
                z = 2715,
            },
            {
                x = 2899,
                z = 2734,
            },
            {
                x = 2901,
                z = 2721,
            },
            {
                x = 2902,
                z = 2727,
            },
        },
    },
    {
        name = "Seagull",
        ids = {
            [6115] = true,
            [6116] = true,
            [21768] = true,
        },
        locations = {
            {
                x = 3027,
                z = 3204,
            },
            {
                x = 3028,
                z = 3202,
            },
            {
                x = 3028,
                z = 3232,
            },
            {
                x = 3028,
                z = 3235,
            },
            {
                x = 3029,
                z = 3203,
            },
            {
                x = 3029,
                z = 3236,
            },
            {
                x = 3030,
                z = 3236,
            },
            {
                x = 3031,
                z = 3203,
            },
            {
                x = 3049,
                z = 3202,
            },
            {
                x = 3675,
                z = 3167,
            },
        },
    },
    {
        name = "Shady stranger",
        ids = {
            [8339] = true,
            [8342] = true,
        },
        locations = {
            {
                x = 2989,
                z = 3344,
            },
            {
                x = 3080,
                z = 3240,
            },
            {
                x = 3099,
                z = 3263,
            },
        },
    },
    {
        name = "Shantay guard",
        ids = {
            [837] = true,
        },
        locations = {
            {
                x = 3305,
                z = 3129,
            },
            {
                x = 3307,
                z = 3123,
            },
        },
    },
    {
        name = "Sharathteerk",
        ids = {
            [14350] = true,
        },
        locations = {
            {
                x = 2823,
                z = 3849,
            },
        },
    },
    {
        name = "Sheep",
        ids = {
            [43] = true,
            [1765] = true,
            [5157] = true,
            [5158] = true,
            [5160] = true,
            [5161] = true,
            [5162] = true,
            [5163] = true,
            [22655] = true,
            [26655] = true,
        },
        locations = {
            {
                x = 2319,
                z = 3191,
            },
            {
                x = 2322,
                z = 3192,
            },
            {
                x = 2325,
                z = 3190,
            },
            {
                x = 2898,
                z = 3490,
            },
            {
                x = 2899,
                z = 3489,
            },
            {
                x = 2900,
                z = 3487,
            },
            {
                x = 2900,
                z = 3490,
            },
            {
                x = 2902,
                z = 3487,
            },
            {
                x = 2902,
                z = 3489,
            },
            {
                x = 2920,
                z = 3318,
            },
            {
                x = 2920,
                z = 3320,
            },
            {
                x = 2921,
                z = 3319,
            },
            {
                x = 2922,
                z = 3320,
            },
            {
                x = 2923,
                z = 3325,
            },
            {
                x = 2925,
                z = 3324,
            },
            {
                x = 2926,
                z = 3322,
            },
            {
                x = 3050,
                z = 3518,
            },
            {
                x = 3052,
                z = 3519,
            },
            {
                x = 3054,
                z = 3517,
            },
            {
                x = 3188,
                z = 3291,
            },
            {
                x = 3191,
                z = 3292,
            },
            {
                x = 3191,
                z = 3294,
            },
            {
                x = 3194,
                z = 3295,
            },
            {
                x = 3200,
                z = 3291,
            },
            {
                x = 3201,
                z = 3296,
            },
        },
    },
    {
        name = "Shipyard worker",
        ids = {
            [38] = true,
            [39] = true,
            [675] = true,
        },
        locations = {
            {
                x = 2953,
                z = 3056,
            },
            {
                x = 2953,
                z = 3061,
            },
            {
                x = 2955,
                z = 3029,
            },
            {
                x = 2957,
                z = 3032,
            },
            {
                x = 2957,
                z = 3055,
            },
            {
                x = 2962,
                z = 3037,
            },
            {
                x = 2969,
                z = 3034,
            },
            {
                x = 2969,
                z = 3042,
            },
            {
                x = 2976,
                z = 3064,
            },
            {
                x = 2983,
                z = 3049,
            },
            {
                x = 2983,
                z = 3061,
            },
            {
                x = 2987,
                z = 3049,
            },
            {
                x = 2988,
                z = 3058,
            },
            {
                x = 2995,
                z = 3061,
            },
            {
                x = 3001,
                z = 3049,
            },
        },
    },
    {
        name = "Sir Gawain",
        ids = {
            [240] = true,
        },
        locations = {
            {
                x = 2763,
                z = 3506,
            },
        },
    },
    {
        name = "Sir Kay",
        ids = {
            [241] = true,
        },
        locations = {
            {
                x = 2761,
                z = 3497,
            },
        },
    },
    {
        name = "Sir Lucan",
        ids = {
            [245] = true,
        },
        locations = {
            {
                x = 2754,
                z = 3515,
            },
        },
    },
    {
        name = "Sir Owen",
        ids = {
            [7409] = true,
            [7893] = true,
            [9698] = true,
            [18024] = true,
            [18025] = true,
            [18026] = true,
            [18027] = true,
        },
        locations = {
            {
                x = 2907,
                z = 3516,
            },
            {
                x = 2979,
                z = 3420,
            },
            {
                x = 3021,
                z = 3541,
            },
            {
                x = 3022,
                z = 3536,
            },
            {
                x = 3031,
                z = 3580,
            },
            {
                x = 3051,
                z = 3502,
            },
            {
                x = 3191,
                z = 3358,
            },
        },
    },
    {
        name = "Sir Palomedes",
        ids = {
            [3787] = true,
        },
        locations = {
            {
                x = 2754,
                z = 3509,
            },
        },
    },
    {
        name = "Sir Tiffy Cashien",
        ids = {
            [30889] = true,
        },
        locations = {
            {
                x = 2997,
                z = 3373,
            },
        },
    },
    {
        name = "Skeletal horror",
        ids = {},
        locations = {
            {
                x = 3388,
                z = 3517,
            },
        },
    },
    {
        name = "Skeleton",
        ids = {
            [90] = true,
            [92] = true,
            [4386] = true,
            [5332] = true,
            [5333] = true,
            [5334] = true,
            [5337] = true,
            [5338] = true,
            [5339] = true,
            [5340] = true,
            [5367] = true,
            [5368] = true,
        },
        locations = {
            {
                x = 2820,
                z = 3259,
            },
            {
                x = 2824,
                z = 3237,
            },
            {
                x = 2832,
                z = 3234,
            },
            {
                x = 2840,
                z = 3238,
            },
            {
                x = 2846,
                z = 3249,
            },
            {
                x = 2850,
                z = 3247,
            },
            {
                x = 2850,
                z = 3256,
            },
            {
                x = 2852,
                z = 3260,
            },
            {
                x = 2854,
                z = 3249,
            },
            {
                x = 2977,
                z = 3753,
            },
            {
                x = 2980,
                z = 3763,
            },
            {
                x = 3008,
                z = 3595,
            },
            {
                x = 3010,
                z = 3597,
            },
            {
                x = 3011,
                z = 3590,
            },
            {
                x = 3012,
                z = 3592,
            },
            {
                x = 3012,
                z = 3597,
            },
            {
                x = 3013,
                z = 3602,
            },
            {
                x = 3016,
                z = 3589,
            },
            {
                x = 3016,
                z = 3596,
            },
            {
                x = 3018,
                z = 3592,
            },
            {
                x = 3018,
                z = 3599,
            },
            {
                x = 3019,
                z = 3590,
            },
            {
                x = 3021,
                z = 3593,
            },
            {
                x = 3072,
                z = 3531,
            },
            {
                x = 3074,
                z = 3532,
            },
            {
                x = 3081,
                z = 3551,
            },
            {
                x = 3092,
                z = 3717,
            },
            {
                x = 3096,
                z = 3559,
            },
            {
                x = 3096,
                z = 3738,
            },
            {
                x = 3097,
                z = 3728,
            },
            {
                x = 3102,
                z = 3569,
            },
            {
                x = 3102,
                z = 3716,
            },
            {
                x = 3103,
                z = 3567,
            },
            {
                x = 3104,
                z = 3566,
            },
            {
                x = 3105,
                z = 3721,
            },
            {
                x = 3106,
                z = 3548,
            },
            {
                x = 3106,
                z = 3567,
            },
            {
                x = 3106,
                z = 3570,
            },
            {
                x = 3107,
                z = 3528,
            },
            {
                x = 3112,
                z = 3538,
            },
            {
                x = 3113,
                z = 3740,
            },
            {
                x = 3116,
                z = 3524,
            },
            {
                x = 3117,
                z = 3532,
            },
            {
                x = 3118,
                z = 3733,
            },
            {
                x = 3128,
                z = 3719,
            },
            {
                x = 3128,
                z = 3741,
            },
            {
                x = 3130,
                z = 3754,
            },
            {
                x = 3268,
                z = 3688,
            },
            {
                x = 3269,
                z = 3672,
            },
            {
                x = 3270,
                z = 3681,
            },
            {
                x = 3275,
                z = 3676,
            },
            {
                x = 3275,
                z = 3686,
            },
        },
    },
    {
        name = "Skeleton (Draynor Manor)",
        ids = {
            [3291] = true,
        },
        locations = {
            {
                x = 3110,
                z = 3367,
            },
        },
    },
    {
        name = "Skeleton Mage (Piscatoris Fishing Colony)",
        ids = {
            [3851] = true,
        },
        locations = {
            {
                x = 2316,
                z = 3685,
            },
            {
                x = 2316,
                z = 3687,
            },
            {
                x = 2317,
                z = 3689,
            },
            {
                x = 2320,
                z = 3689,
            },
            {
                x = 2321,
                z = 3679,
            },
            {
                x = 2321,
                z = 3685,
            },
            {
                x = 2321,
                z = 3687,
            },
            {
                x = 2325,
                z = 3671,
            },
            {
                x = 2331,
                z = 3666,
            },
            {
                x = 2331,
                z = 3671,
            },
            {
                x = 2333,
                z = 3671,
            },
        },
    },
    {
        name = "Skogre",
        ids = {
            [2050] = true,
            [2056] = true,
            [2057] = true,
        },
        locations = {
            {
                x = 2461,
                z = 3047,
            },
            {
                x = 2466,
                z = 3052,
            },
            {
                x = 2469,
                z = 3039,
            },
            {
                x = 2480,
                z = 3046,
            },
        },
    },
    {
        name = "Skraeling",
        ids = {
            [1367] = true,
            [1368] = true,
            [1389] = true,
            [1391] = true,
        },
        locations = {
            {
                x = 2513,
                z = 3866,
            },
            {
                x = 2515,
                z = 3863,
            },
            {
                x = 2603,
                z = 3877,
            },
            {
                x = 2605,
                z = 3877,
            },
        },
    },
    {
        name = "Skulls mercenary",
        ids = {
            [15887] = true,
            [15890] = true,
        },
        locations = {
            {
                x = 3127,
                z = 3200,
            },
            {
                x = 3129,
                z = 3200,
            },
        },
    },
    {
        name = "Slasher Demon",
        ids = {
            [21994] = true,
        },
        locations = {
            {
                x = 3075,
                z = 3864,
            },
            {
                x = 3082,
                z = 3860,
            },
            {
                x = 3092,
                z = 3865,
            },
            {
                x = 3106,
                z = 3906,
            },
            {
                x = 3223,
                z = 3867,
            },
            {
                x = 3225,
                z = 3859,
            },
            {
                x = 3232,
                z = 3898,
            },
            {
                x = 3233,
                z = 3871,
            },
            {
                x = 3235,
                z = 3862,
            },
            {
                x = 3237,
                z = 3888,
            },
            {
                x = 3239,
                z = 3863,
            },
            {
                x = 3243,
                z = 3899,
            },
            {
                x = 3245,
                z = 3873,
            },
            {
                x = 3247,
                z = 3893,
            },
            {
                x = 3248,
                z = 3869,
            },
            {
                x = 3248,
                z = 3884,
            },
            {
                x = 3249,
                z = 3857,
            },
            {
                x = 3253,
                z = 3868,
            },
            {
                x = 3257,
                z = 3860,
            },
        },
    },
    {
        name = "Small lizard",
        ids = {
            [2807] = true,
            [2808] = true,
        },
        locations = {
            {
                x = 3384,
                z = 3013,
            },
            {
                x = 3385,
                z = 3067,
            },
            {
                x = 3387,
                z = 3014,
            },
            {
                x = 3389,
                z = 3065,
            },
            {
                x = 3400,
                z = 3032,
            },
            {
                x = 3402,
                z = 3061,
            },
            {
                x = 3404,
                z = 3060,
            },
            {
                x = 3407,
                z = 3067,
            },
            {
                x = 3408,
                z = 3060,
            },
            {
                x = 3411,
                z = 3065,
            },
            {
                x = 3412,
                z = 3032,
            },
            {
                x = 3412,
                z = 3049,
            },
            {
                x = 3414,
                z = 3029,
            },
            {
                x = 3417,
                z = 3036,
            },
            {
                x = 3418,
                z = 3032,
            },
            {
                x = 3419,
                z = 3034,
            },
            {
                x = 3422,
                z = 3058,
            },
            {
                x = 3424,
                z = 3059,
            },
            {
                x = 3435,
                z = 3057,
            },
            {
                x = 3435,
                z = 3062,
            },
            {
                x = 3439,
                z = 3013,
            },
            {
                x = 3439,
                z = 3065,
            },
            {
                x = 3440,
                z = 3016,
            },
            {
                x = 3441,
                z = 3059,
            },
            {
                x = 3443,
                z = 3012,
            },
            {
                x = 3443,
                z = 3017,
            },
            {
                x = 3443,
                z = 3033,
            },
            {
                x = 3443,
                z = 3034,
            },
            {
                x = 3443,
                z = 3047,
            },
            {
                x = 3443,
                z = 3059,
            },
            {
                x = 3446,
                z = 3014,
            },
        },
    },
    {
        name = "Snake",
        ids = {
            [128] = true,
        },
        locations = {
            {
                x = 2610,
                z = 3274,
            },
            {
                x = 2610,
                z = 3275,
            },
            {
                x = 2615,
                z = 3276,
            },
            {
                x = 2616,
                z = 3275,
            },
            {
                x = 2616,
                z = 3276,
            },
            {
                x = 2733,
                z = 3165,
            },
            {
                x = 2734,
                z = 3147,
            },
            {
                x = 2739,
                z = 3169,
            },
            {
                x = 2749,
                z = 3151,
            },
            {
                x = 2751,
                z = 3166,
            },
            {
                x = 2754,
                z = 3171,
            },
            {
                x = 2763,
                z = 3180,
            },
            {
                x = 2772,
                z = 3093,
            },
            {
                x = 2772,
                z = 3209,
            },
            {
                x = 2775,
                z = 3089,
            },
            {
                x = 2784,
                z = 3104,
            },
            {
                x = 2785,
                z = 3101,
            },
            {
                x = 2786,
                z = 3174,
            },
            {
                x = 2804,
                z = 3116,
            },
            {
                x = 2811,
                z = 3112,
            },
            {
                x = 2819,
                z = 3194,
            },
            {
                x = 2820,
                z = 3082,
            },
            {
                x = 2824,
                z = 3077,
            },
            {
                x = 2825,
                z = 3030,
            },
            {
                x = 2826,
                z = 3081,
            },
            {
                x = 2827,
                z = 3013,
            },
            {
                x = 2832,
                z = 3017,
            },
            {
                x = 2832,
                z = 3019,
            },
            {
                x = 2835,
                z = 3074,
            },
            {
                x = 2836,
                z = 3043,
            },
            {
                x = 2838,
                z = 3026,
            },
            {
                x = 2838,
                z = 3047,
            },
            {
                x = 2860,
                z = 3026,
            },
            {
                x = 2875,
                z = 3164,
            },
            {
                x = 2879,
                z = 3151,
            },
            {
                x = 2880,
                z = 2922,
            },
            {
                x = 2881,
                z = 2919,
            },
            {
                x = 2881,
                z = 3157,
            },
            {
                x = 2884,
                z = 2921,
            },
            {
                x = 2889,
                z = 3146,
            },
            {
                x = 2910,
                z = 2919,
            },
            {
                x = 2912,
                z = 2916,
            },
            {
                x = 2913,
                z = 2913,
            },
            {
                x = 2923,
                z = 2970,
            },
            {
                x = 2928,
                z = 2973,
            },
            {
                x = 2929,
                z = 2989,
            },
            {
                x = 2933,
                z = 2981,
            },
            {
                x = 2935,
                z = 2973,
            },
            {
                x = 2936,
                z = 2986,
            },
            {
                x = 2937,
                z = 2978,
            },
            {
                x = 2939,
                z = 2985,
            },
        },
    },
    {
        name = "Snake (Ape Atoll)",
        ids = {
            [1479] = true,
        },
        locations = {
            {
                x = 2701,
                z = 2762,
            },
            {
                x = 2702,
                z = 2780,
            },
            {
                x = 2703,
                z = 2769,
            },
            {
                x = 2715,
                z = 2782,
            },
            {
                x = 2716,
                z = 2719,
            },
            {
                x = 2724,
                z = 2787,
            },
            {
                x = 2726,
                z = 2712,
            },
            {
                x = 2727,
                z = 2791,
            },
            {
                x = 2731,
                z = 2724,
            },
            {
                x = 2740,
                z = 2721,
            },
            {
                x = 2742,
                z = 2707,
            },
            {
                x = 2755,
                z = 2708,
            },
            {
                x = 2766,
                z = 2715,
            },
            {
                x = 2774,
                z = 2702,
            },
            {
                x = 2784,
                z = 2714,
            },
            {
                x = 2789,
                z = 2758,
            },
            {
                x = 2809,
                z = 2754,
            },
            {
                x = 2911,
                z = 2718,
            },
            {
                x = 2913,
                z = 2726,
            },
            {
                x = 2921,
                z = 2713,
            },
            {
                x = 2921,
                z = 2727,
            },
            {
                x = 2927,
                z = 2719,
            },
        },
    },
    {
        name = "Snake (Mos Le'Harmless)",
        ids = {
            [4343] = true,
        },
        locations = {
            {
                x = 3722,
                z = 3014,
            },
            {
                x = 3722,
                z = 3048,
            },
            {
                x = 3725,
                z = 3005,
            },
            {
                x = 3730,
                z = 2954,
            },
            {
                x = 3734,
                z = 2959,
            },
            {
                x = 3735,
                z = 2989,
            },
            {
                x = 3744,
                z = 3004,
            },
            {
                x = 3744,
                z = 3048,
            },
            {
                x = 3746,
                z = 2950,
            },
            {
                x = 3752,
                z = 2946,
            },
            {
                x = 3753,
                z = 3038,
            },
            {
                x = 3755,
                z = 3016,
            },
            {
                x = 3756,
                z = 2999,
            },
            {
                x = 3779,
                z = 3011,
            },
            {
                x = 3781,
                z = 3030,
            },
            {
                x = 3792,
                z = 3033,
            },
            {
                x = 3805,
                z = 3028,
            },
            {
                x = 3821,
                z = 3033,
            },
            {
                x = 3828,
                z = 3058,
            },
            {
                x = 3836,
                z = 3014,
            },
        },
    },
    {
        name = "Snowy knight",
        ids = {},
        locations = {
            {
                x = 2700,
                z = 3791,
            },
            {
                x = 2707,
                z = 3793,
            },
            {
                x = 2717,
                z = 3792,
            },
            {
                x = 2725,
                z = 3786,
            },
            {
                x = 2729,
                z = 3779,
            },
            {
                x = 2729,
                z = 3793,
            },
            {
                x = 2732,
                z = 3786,
            },
            {
                x = 2737,
                z = 3778,
            },
            {
                x = 2737,
                z = 3792,
            },
        },
    },
    {
        name = "Sofiya",
        ids = {
            [6039] = true,
        },
        locations = {
            {
                x = 3483,
                z = 3495,
            },
        },
    },
    {
        name = "Soldier (Yanille)",
        ids = {
            [35] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3102,
            },
            {
                x = 2542,
                z = 3094,
            },
            {
                x = 2543,
                z = 3088,
            },
            {
                x = 2545,
                z = 3094,
            },
            {
                x = 2546,
                z = 3085,
            },
            {
                x = 2547,
                z = 3091,
            },
        },
    },
    {
        name = "Sorebones",
        ids = {
            [5627] = true,
            [5628] = true,
            [26748] = true,
        },
        locations = {
            {
                x = 2649,
                z = 3350,
            },
            {
                x = 3808,
                z = 2845,
            },
            {
                x = 3810,
                z = 2843,
            },
            {
                x = 3812,
                z = 2846,
            },
            {
                x = 3813,
                z = 2844,
            },
            {
                x = 3815,
                z = 2844,
            },
            {
                x = 3819,
                z = 2839,
            },
            {
                x = 3819,
                z = 2851,
            },
            {
                x = 3821,
                z = 2837,
            },
        },
    },
    {
        name = "Sotapanna",
        ids = {
            [23069] = true,
            [23070] = true,
        },
        locations = {
            {
                x = 4762,
                z = 3437,
            },
            {
                x = 4763,
                z = 3430,
            },
            {
                x = 4765,
                z = 3424,
            },
            {
                x = 4766,
                z = 3434,
            },
            {
                x = 4770,
                z = 3441,
            },
            {
                x = 4772,
                z = 3437,
            },
            {
                x = 4777,
                z = 3437,
            },
            {
                x = 4779,
                z = 3441,
            },
            {
                x = 4783,
                z = 3435,
            },
            {
                x = 4788,
                z = 3434,
            },
            {
                x = 4788,
                z = 3439,
            },
        },
    },
    {
        name = "Soulgazer",
        ids = {
            [25125] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3743,
            },
            {
                x = 3309,
                z = 3745,
            },
            {
                x = 3312,
                z = 3718,
            },
            {
                x = 3317,
                z = 3715,
            },
            {
                x = 3323,
                z = 3713,
            },
            {
                x = 3323,
                z = 3733,
            },
            {
                x = 3327,
                z = 3717,
            },
            {
                x = 3327,
                z = 3731,
            },
            {
                x = 3332,
                z = 3722,
            },
            {
                x = 3332,
                z = 3750,
            },
        },
    },
    {
        name = "Soulgazer (elite)",
        ids = {
            [25125] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3743,
            },
            {
                x = 3309,
                z = 3745,
            },
            {
                x = 3312,
                z = 3718,
            },
            {
                x = 3317,
                z = 3715,
            },
            {
                x = 3323,
                z = 3713,
            },
            {
                x = 3323,
                z = 3733,
            },
            {
                x = 3327,
                z = 3717,
            },
            {
                x = 3327,
                z = 3731,
            },
            {
                x = 3332,
                z = 3722,
            },
            {
                x = 3332,
                z = 3750,
            },
        },
    },
    {
        name = "Speedy Keith",
        ids = {
            [204] = true,
        },
        locations = {
            {
                x = 3035,
                z = 3696,
            },
        },
    },
    {
        name = "Spellwisp",
        ids = {
            [16208] = true,
        },
        locations = {
            {
                x = 3072,
                z = 3174,
            },
            {
                x = 3072,
                z = 3177,
            },
            {
                x = 3073,
                z = 3180,
            },
            {
                x = 3074,
                z = 3173,
            },
            {
                x = 3076,
                z = 3174,
            },
            {
                x = 3076,
                z = 3179,
            },
        },
    },
    {
        name = "Spider",
        ids = {
            [61] = true,
            [1473] = true,
        },
        locations = {
            {
                x = 2535,
                z = 3181,
            },
            {
                x = 2535,
                z = 3183,
            },
            {
                x = 2536,
                z = 3180,
            },
            {
                x = 2537,
                z = 3183,
            },
            {
                x = 2541,
                z = 3182,
            },
            {
                x = 2541,
                z = 3188,
            },
            {
                x = 2542,
                z = 3186,
            },
            {
                x = 2544,
                z = 3191,
            },
            {
                x = 2548,
                z = 3190,
            },
            {
                x = 2671,
                z = 3107,
            },
            {
                x = 2672,
                z = 3109,
            },
            {
                x = 2734,
                z = 2792,
            },
            {
                x = 2749,
                z = 2768,
            },
            {
                x = 2752,
                z = 2798,
            },
            {
                x = 2753,
                z = 2799,
            },
            {
                x = 2761,
                z = 2770,
            },
            {
                x = 2767,
                z = 2765,
            },
            {
                x = 2767,
                z = 2794,
            },
            {
                x = 2769,
                z = 2798,
            },
            {
                x = 2770,
                z = 2766,
            },
            {
                x = 2775,
                z = 2777,
            },
            {
                x = 2778,
                z = 2768,
            },
            {
                x = 2780,
                z = 2791,
            },
            {
                x = 2791,
                z = 2780,
            },
            {
                x = 2793,
                z = 2789,
            },
            {
                x = 2794,
                z = 2780,
            },
            {
                x = 2796,
                z = 2763,
            },
            {
                x = 2798,
                z = 2792,
            },
            {
                x = 2801,
                z = 2780,
            },
            {
                x = 2806,
                z = 2787,
            },
            {
                x = 2982,
                z = 3683,
            },
            {
                x = 2987,
                z = 3683,
            },
            {
                x = 2988,
                z = 3679,
            },
            {
                x = 2989,
                z = 3686,
            },
            {
                x = 2991,
                z = 3692,
            },
            {
                x = 2993,
                z = 3684,
            },
            {
                x = 3149,
                z = 3216,
            },
            {
                x = 3157,
                z = 3217,
            },
            {
                x = 3159,
                z = 3222,
            },
            {
                x = 3161,
                z = 3885,
            },
            {
                x = 3163,
                z = 3879,
            },
            {
                x = 3164,
                z = 3881,
            },
            {
                x = 3164,
                z = 3887,
            },
            {
                x = 3165,
                z = 3247,
            },
            {
                x = 3166,
                z = 3886,
            },
            {
                x = 3167,
                z = 3889,
            },
            {
                x = 3168,
                z = 3245,
            },
            {
                x = 3168,
                z = 3251,
            },
            {
                x = 3168,
                z = 3886,
            },
            {
                x = 3168,
                z = 3893,
            },
            {
                x = 3169,
                z = 3247,
            },
            {
                x = 3169,
                z = 3883,
            },
            {
                x = 3171,
                z = 3881,
            },
            {
                x = 3171,
                z = 3889,
            },
            {
                x = 3173,
                z = 3882,
            },
            {
                x = 3173,
                z = 3885,
            },
            {
                x = 3174,
                z = 3878,
            },
            {
                x = 3176,
                z = 3887,
            },
            {
                x = 3177,
                z = 3883,
            },
            {
                x = 3178,
                z = 3885,
            },
            {
                x = 3201,
                z = 3187,
            },
            {
                x = 3211,
                z = 3186,
            },
            {
                x = 3212,
                z = 3193,
            },
            {
                x = 3319,
                z = 3139,
            },
            {
                x = 3322,
                z = 3141,
            },
            {
                x = 3324,
                z = 3138,
            },
        },
    },
    {
        name = "Squiggles",
        ids = {
            [27566] = true,
        },
        locations = {
            {
                x = 3187,
                z = 3238,
            },
        },
    },
    {
        name = "Steel dragon",
        ids = {
            [1592] = true,
        },
        locations = {
            {
                x = 2893,
                z = 3929,
            },
            {
                x = 2893,
                z = 3942,
            },
            {
                x = 2897,
                z = 3951,
            },
            {
                x = 2903,
                z = 3954,
            },
            {
                x = 2910,
                z = 3954,
            },
            {
                x = 2920,
                z = 3952,
            },
            {
                x = 2929,
                z = 3952,
            },
        },
    },
    {
        name = "Stick",
        ids = {
            [1096] = true,
        },
        locations = {
            {
                x = 2851,
                z = 3591,
            },
        },
    },
    {
        name = "Super Cow",
        ids = {
            [81] = true,
            [397] = true,
            [1767] = true,
            [12362] = true,
            [12363] = true,
            [12365] = true,
            [14997] = true,
            [14998] = true,
            [14999] = true,
        },
        locations = {
            {
                x = 2580,
                z = 3117,
            },
            {
                x = 2582,
                z = 3122,
            },
            {
                x = 2588,
                z = 3119,
            },
            {
                x = 2604,
                z = 3114,
            },
            {
                x = 2733,
                z = 3561,
            },
            {
                x = 2882,
                z = 3490,
            },
            {
                x = 2883,
                z = 3482,
            },
            {
                x = 2885,
                z = 3486,
            },
            {
                x = 2885,
                z = 3491,
            },
            {
                x = 2886,
                z = 3483,
            },
            {
                x = 2887,
                z = 3489,
            },
            {
                x = 2888,
                z = 3486,
            },
            {
                x = 2945,
                z = 3270,
            },
            {
                x = 2946,
                z = 3272,
            },
            {
                x = 2946,
                z = 3275,
            },
            {
                x = 3027,
                z = 3307,
            },
            {
                x = 3029,
                z = 3305,
            },
            {
                x = 3029,
                z = 3312,
            },
            {
                x = 3030,
                z = 3300,
            },
            {
                x = 3033,
                z = 3305,
            },
            {
                x = 3037,
                z = 3306,
            },
            {
                x = 3040,
                z = 3311,
            },
            {
                x = 3154,
                z = 3325,
            },
            {
                x = 3155,
                z = 3337,
            },
            {
                x = 3156,
                z = 3332,
            },
            {
                x = 3156,
                z = 3343,
            },
            {
                x = 3160,
                z = 3318,
            },
            {
                x = 3167,
                z = 3333,
            },
            {
                x = 3169,
                z = 3339,
            },
            {
                x = 3173,
                z = 3323,
            },
            {
                x = 3180,
                z = 3338,
            },
            {
                x = 3182,
                z = 3331,
            },
            {
                x = 3197,
                z = 3320,
            },
            {
                x = 3197,
                z = 3331,
            },
            {
                x = 3243,
                z = 3295,
            },
            {
                x = 3244,
                z = 3289,
            },
            {
                x = 3247,
                z = 3284,
            },
            {
                x = 3252,
                z = 3288,
            },
            {
                x = 3254,
                z = 3255,
            },
            {
                x = 3254,
                z = 3258,
            },
            {
                x = 3254,
                z = 3262,
            },
            {
                x = 3255,
                z = 3278,
            },
            {
                x = 3256,
                z = 3292,
            },
            {
                x = 3258,
                z = 3260,
            },
            {
                x = 3258,
                z = 3265,
            },
            {
                x = 3261,
                z = 3259,
            },
            {
                x = 3261,
                z = 3270,
            },
            {
                x = 3261,
                z = 3282,
            },
            {
                x = 3261,
                z = 3292,
            },
        },
    },
    {
        name = "Suqah",
        ids = {
            [4527] = true,
            [4528] = true,
            [4529] = true,
            [4530] = true,
            [4531] = true,
            [4532] = true,
            [4533] = true,
        },
        locations = {
            {
                x = 2064,
                z = 3880,
            },
            {
                x = 2070,
                z = 3878,
            },
            {
                x = 2075,
                z = 3886,
            },
            {
                x = 2079,
                z = 3882,
            },
            {
                x = 2093,
                z = 3942,
            },
            {
                x = 2101,
                z = 3871,
            },
            {
                x = 2106,
                z = 3866,
            },
            {
                x = 2120,
                z = 3856,
            },
            {
                x = 2122,
                z = 3949,
            },
            {
                x = 2122,
                z = 3953,
            },
            {
                x = 2125,
                z = 3950,
            },
            {
                x = 2132,
                z = 3871,
            },
            {
                x = 2133,
                z = 3949,
            },
            {
                x = 2135,
                z = 3930,
            },
            {
                x = 2136,
                z = 3853,
            },
            {
                x = 2137,
                z = 3946,
            },
            {
                x = 2141,
                z = 3856,
            },
            {
                x = 2141,
                z = 3933,
            },
            {
                x = 2142,
                z = 3900,
            },
            {
                x = 2142,
                z = 3939,
            },
            {
                x = 2143,
                z = 3948,
            },
            {
                x = 2147,
                z = 3944,
            },
            {
                x = 2148,
                z = 3935,
            },
            {
                x = 2149,
                z = 3940,
            },
            {
                x = 2155,
                z = 3943,
            },
            {
                x = 2160,
                z = 3937,
            },
        },
    },
    {
        name = "Suspicious outsider",
        ids = {
            [8436] = true,
        },
        locations = {
            {
                x = 3097,
                z = 3253,
            },
        },
    },
    {
        name = "Svetlana",
        ids = {
            [6034] = true,
        },
        locations = {
            {
                x = 3501,
                z = 3493,
            },
        },
    },
    {
        name = "Swamp frog",
        ids = {
            [27733] = true,
        },
        locations = {
            {
                x = 3155,
                z = 3173,
            },
            {
                x = 3156,
                z = 3186,
            },
            {
                x = 3161,
                z = 3191,
            },
            {
                x = 3175,
                z = 3174,
            },
            {
                x = 3178,
                z = 3167,
            },
            {
                x = 3185,
                z = 3184,
            },
            {
                x = 3192,
                z = 3168,
            },
            {
                x = 3192,
                z = 3197,
            },
            {
                x = 3197,
                z = 3194,
            },
            {
                x = 3200,
                z = 3177,
            },
            {
                x = 3207,
                z = 3176,
            },
            {
                x = 3213,
                z = 3184,
            },
            {
                x = 3215,
                z = 3166,
            },
            {
                x = 3224,
                z = 3186,
            },
            {
                x = 3231,
                z = 3174,
            },
        },
    },
    {
        name = "Tarik",
        ids = {
            [3041] = true,
        },
        locations = {
            {
                x = 3438,
                z = 2917,
            },
        },
    },
    {
        name = "Tenacious toucan",
        ids = {
            [6378] = true,
        },
        locations = {
            {
                x = 2895,
                z = 2980,
            },
            {
                x = 2906,
                z = 2989,
            },
            {
                x = 2916,
                z = 2982,
            },
            {
                x = 2924,
                z = 2975,
            },
        },
    },
    {
        name = "Terrorbird",
        ids = {
            [138] = true,
            [139] = true,
            [1751] = true,
        },
        locations = {
            {
                x = 2375,
                z = 3432,
            },
            {
                x = 2375,
                z = 3435,
            },
            {
                x = 2375,
                z = 3440,
            },
            {
                x = 2378,
                z = 3429,
            },
            {
                x = 2378,
                z = 3431,
            },
            {
                x = 2378,
                z = 3436,
            },
            {
                x = 2379,
                z = 3439,
            },
            {
                x = 2380,
                z = 3436,
            },
            {
                x = 2382,
                z = 3430,
            },
            {
                x = 2436,
                z = 3434,
            },
            {
                x = 2498,
                z = 3141,
            },
            {
                x = 2504,
                z = 3140,
            },
        },
    },
    {
        name = "The Shaikahan",
        ids = {
            [1172] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3095,
            },
        },
    },
    {
        name = "Thief",
        ids = {
            [8] = true,
            [2674] = true,
            [5926] = true,
            [5928] = true,
            [5929] = true,
        },
        locations = {
            {
                x = 2785,
                z = 3179,
            },
            {
                x = 2796,
                z = 3177,
            },
            {
                x = 2803,
                z = 3179,
            },
            {
                x = 2813,
                z = 3159,
            },
            {
                x = 3014,
                z = 3232,
            },
            {
                x = 3016,
                z = 3232,
            },
            {
                x = 3184,
                z = 3385,
            },
            {
                x = 3184,
                z = 3389,
            },
            {
                x = 3185,
                z = 3390,
            },
            {
                x = 3230,
                z = 3391,
            },
            {
                x = 3285,
                z = 3501,
            },
        },
    },
    {
        name = "Thora (Miscellania Castle)",
        ids = {
            [1387] = true,
        },
        locations = {
            {
                x = 2511,
                z = 3871,
            },
        },
    },
    {
        name = "Thrower Troll",
        ids = {
            [1101] = true,
            [1102] = true,
            [1103] = true,
            [1104] = true,
            [1105] = true,
            [1130] = true,
            [1131] = true,
            [1132] = true,
            [1133] = true,
            [1134] = true,
        },
        locations = {
            {
                x = 2845,
                z = 3598,
            },
            {
                x = 2848,
                z = 3600,
            },
            {
                x = 2853,
                z = 3600,
            },
            {
                x = 2857,
                z = 3600,
            },
            {
                x = 2861,
                z = 3600,
            },
            {
                x = 2863,
                z = 3599,
            },
            {
                x = 2890,
                z = 3697,
            },
            {
                x = 2895,
                z = 3698,
            },
            {
                x = 2900,
                z = 3697,
            },
            {
                x = 2907,
                z = 3697,
            },
            {
                x = 2911,
                z = 3697,
            },
        },
    },
    {
        name = "Thug",
        ids = {
            [186] = true,
        },
        locations = {
            {
                x = 3160,
                z = 3568,
            },
            {
                x = 3167,
                z = 3576,
            },
            {
                x = 3171,
                z = 3579,
            },
            {
                x = 3172,
                z = 3561,
            },
            {
                x = 3175,
                z = 3572,
            },
            {
                x = 3179,
                z = 3564,
            },
            {
                x = 3184,
                z = 3580,
            },
            {
                x = 3189,
                z = 3563,
            },
            {
                x = 3190,
                z = 3570,
            },
        },
    },
    {
        name = "Tolna",
        ids = {
            [1732] = true,
        },
        locations = {
            {
                x = 3308,
                z = 3452,
            },
        },
    },
    {
        name = "Tortoise",
        ids = {
            [3808] = true,
            [3819] = true,
        },
        locations = {
            {
                x = 2410,
                z = 3528,
            },
            {
                x = 2416,
                z = 3527,
            },
            {
                x = 2424,
                z = 3529,
            },
            {
                x = 2510,
                z = 3203,
            },
            {
                x = 2519,
                z = 3204,
            },
        },
    },
    {
        name = "Tortured soul (Port Phasmatys)",
        ids = {
            [1698] = true,
        },
        locations = {
            {
                x = 3648,
                z = 3472,
            },
            {
                x = 3649,
                z = 3503,
            },
            {
                x = 3654,
                z = 3536,
            },
            {
                x = 3657,
                z = 3534,
            },
            {
                x = 3666,
                z = 3529,
            },
            {
                x = 3668,
                z = 3537,
            },
            {
                x = 3672,
                z = 3520,
            },
            {
                x = 3673,
                z = 3528,
            },
        },
    },
    {
        name = "Tower guard",
        ids = {
            [877] = true,
        },
        locations = {
            {
                x = 2540,
                z = 3090,
            },
            {
                x = 2545,
                z = 3113,
            },
            {
                x = 2546,
                z = 3116,
            },
            {
                x = 2549,
                z = 3112,
            },
            {
                x = 2554,
                z = 3117,
            },
        },
    },
    {
        name = "Trainee archaeologist",
        ids = {},
        locations = {
            {
                x = 3364,
                z = 3186,
            },
            {
                x = 3380,
                z = 3379,
            },
            {
                x = 3429,
                z = 3698,
            },
            {
                x = 3738,
                z = 3212,
            },
        },
    },
    {
        name = "Training dummy",
        ids = {
            [16027] = true,
        },
        locations = {
            {
                x = 2909,
                z = 3567,
            },
            {
                x = 2912,
                z = 3567,
            },
            {
                x = 2915,
                z = 3567,
            },
        },
    },
    {
        name = "Troll spectator",
        ids = {
            [1118] = true,
            [1119] = true,
            [1120] = true,
            [1121] = true,
            [1122] = true,
            [1123] = true,
            [1124] = true,
        },
        locations = {
            {
                x = 2913,
                z = 3602,
            },
            {
                x = 2917,
                z = 3603,
            },
            {
                x = 2919,
                z = 3612,
            },
            {
                x = 2924,
                z = 3599,
            },
            {
                x = 2926,
                z = 3607,
            },
            {
                x = 2929,
                z = 3599,
            },
            {
                x = 2929,
                z = 3613,
            },
        },
    },
    {
        name = "Tropical wagtail",
        ids = {
            [5072] = true,
        },
        locations = {
            {
                x = 2497,
                z = 2903,
            },
            {
                x = 2498,
                z = 2902,
            },
            {
                x = 2499,
                z = 2901,
            },
            {
                x = 2510,
                z = 2876,
            },
            {
                x = 2511,
                z = 2914,
            },
            {
                x = 2513,
                z = 2911,
            },
            {
                x = 2515,
                z = 2914,
            },
            {
                x = 2517,
                z = 2878,
            },
            {
                x = 2523,
                z = 2939,
            },
            {
                x = 2525,
                z = 2933,
            },
            {
                x = 2526,
                z = 2939,
            },
            {
                x = 2527,
                z = 2877,
            },
            {
                x = 2538,
                z = 2884,
            },
            {
                x = 2543,
                z = 2887,
            },
            {
                x = 2545,
                z = 2882,
            },
        },
    },
    {
        name = "Tyras guard",
        ids = {
            [1203] = true,
            [1204] = true,
        },
        locations = {
            {
                x = 2182,
                z = 3147,
            },
            {
                x = 2187,
                z = 3155,
            },
            {
                x = 2188,
                z = 3171,
            },
            {
                x = 2189,
                z = 3152,
            },
            {
                x = 2192,
                z = 3150,
            },
        },
    },
    {
        name = "Ugthanki",
        ids = {
            [840] = true,
        },
        locations = {
            {
                x = 3190,
                z = 3054,
            },
            {
                x = 3192,
                z = 3016,
            },
            {
                x = 3208,
                z = 3032,
            },
            {
                x = 3217,
                z = 3064,
            },
            {
                x = 3222,
                z = 3105,
            },
            {
                x = 3226,
                z = 3083,
            },
            {
                x = 3237,
                z = 3000,
            },
            {
                x = 3238,
                z = 3015,
            },
            {
                x = 3238,
                z = 3101,
            },
            {
                x = 3244,
                z = 3080,
            },
            {
                x = 3245,
                z = 2960,
            },
            {
                x = 3253,
                z = 3116,
            },
            {
                x = 3255,
                z = 3095,
            },
            {
                x = 3258,
                z = 3063,
            },
            {
                x = 3267,
                z = 3077,
            },
            {
                x = 3268,
                z = 3052,
            },
            {
                x = 3269,
                z = 3110,
            },
            {
                x = 3275,
                z = 3094,
            },
            {
                x = 3281,
                z = 3056,
            },
            {
                x = 3291,
                z = 3078,
            },
            {
                x = 3291,
                z = 3100,
            },
            {
                x = 3305,
                z = 3089,
            },
            {
                x = 3307,
                z = 3055,
            },
            {
                x = 3318,
                z = 3020,
            },
            {
                x = 3318,
                z = 3040,
            },
            {
                x = 3318,
                z = 3078,
            },
            {
                x = 3321,
                z = 3104,
            },
        },
    },
    {
        name = "Undead chicken",
        ids = {
            [1692] = true,
        },
        locations = {
            {
                x = 3627,
                z = 3531,
            },
            {
                x = 3629,
                z = 3530,
            },
            {
                x = 3631,
                z = 3529,
            },
            {
                x = 3631,
                z = 3531,
            },
            {
                x = 3632,
                z = 3526,
            },
            {
                x = 3633,
                z = 3525,
            },
        },
    },
    {
        name = "Undead cow",
        ids = {
            [1691] = true,
        },
        locations = {
            {
                x = 3611,
                z = 3527,
            },
            {
                x = 3616,
                z = 3525,
            },
            {
                x = 3620,
                z = 3524,
            },
            {
                x = 3622,
                z = 3527,
            },
        },
    },
    {
        name = "Undead one",
        ids = {
            [504] = true,
            [505] = true,
            [5355] = true,
            [5356] = true,
            [5357] = true,
            [5358] = true,
        },
        locations = {
            {
                x = 2870,
                z = 2954,
            },
            {
                x = 2871,
                z = 2951,
            },
            {
                x = 2872,
                z = 2954,
            },
            {
                x = 2873,
                z = 2951,
            },
            {
                x = 2876,
                z = 2947,
            },
            {
                x = 2876,
                z = 2951,
            },
            {
                x = 2876,
                z = 2955,
            },
            {
                x = 2876,
                z = 2957,
            },
            {
                x = 2877,
                z = 2959,
            },
        },
    },
    {
        name = "Undead troll",
        ids = {
            [8377] = true,
            [8378] = true,
            [8379] = true,
            [8380] = true,
            [8381] = true,
            [8382] = true,
            [8383] = true,
            [8384] = true,
            [8385] = true,
            [8386] = true,
            [8387] = true,
            [8388] = true,
            [8389] = true,
            [8390] = true,
            [8391] = true,
            [8392] = true,
        },
        locations = {
            {
                x = 2906,
                z = 3808,
            },
            {
                x = 2907,
                z = 3806,
            },
            {
                x = 2908,
                z = 3809,
            },
            {
                x = 2910,
                z = 3805,
            },
            {
                x = 2910,
                z = 3808,
            },
            {
                x = 2910,
                z = 3810,
            },
            {
                x = 2912,
                z = 3812,
            },
            {
                x = 2919,
                z = 3823,
            },
            {
                x = 2921,
                z = 3824,
            },
            {
                x = 2922,
                z = 3827,
            },
            {
                x = 2923,
                z = 3823,
            },
            {
                x = 2924,
                z = 3825,
            },
            {
                x = 2934,
                z = 3786,
            },
            {
                x = 2935,
                z = 3781,
            },
            {
                x = 2935,
                z = 3784,
            },
            {
                x = 2937,
                z = 3780,
            },
            {
                x = 2937,
                z = 3785,
            },
            {
                x = 2938,
                z = 3782,
            },
            {
                x = 2938,
                z = 3831,
            },
            {
                x = 2939,
                z = 3829,
            },
            {
                x = 2940,
                z = 3827,
            },
            {
                x = 2940,
                z = 3833,
            },
        },
    },
    {
        name = "Unicorn",
        ids = {
            [89] = true,
        },
        locations = {
            {
                x = 2570,
                z = 3058,
            },
            {
                x = 2579,
                z = 3066,
            },
            {
                x = 2629,
                z = 3266,
            },
            {
                x = 2634,
                z = 3265,
            },
            {
                x = 2700,
                z = 3423,
            },
            {
                x = 2700,
                z = 3442,
            },
            {
                x = 2718,
                z = 3610,
            },
            {
                x = 2741,
                z = 3605,
            },
            {
                x = 2785,
                z = 3461,
            },
            {
                x = 2838,
                z = 3370,
            },
            {
                x = 2850,
                z = 3378,
            },
            {
                x = 2860,
                z = 3375,
            },
            {
                x = 2863,
                z = 3378,
            },
            {
                x = 3090,
                z = 3450,
            },
            {
                x = 3148,
                z = 3224,
            },
            {
                x = 3283,
                z = 3355,
            },
            {
                x = 3286,
                z = 3349,
            },
        },
    },
    {
        name = "Valgerd",
        ids = {
            [1388] = true,
        },
        locations = {
            {
                x = 2511,
                z = 3854,
            },
        },
    },
    {
        name = "Vampyre Juvenile",
        ids = {
            [3531] = true,
            [3532] = true,
            [3533] = true,
            [4774] = true,
            [4775] = true,
            [22665] = true,
            [22667] = true,
            [22669] = true,
            [22671] = true,
        },
        locations = {
            {
                x = 3527,
                z = 3351,
            },
            {
                x = 3536,
                z = 3349,
            },
            {
                x = 3546,
                z = 3249,
            },
            {
                x = 3550,
                z = 3200,
            },
            {
                x = 3556,
                z = 3216,
            },
            {
                x = 3559,
                z = 3200,
            },
            {
                x = 3561,
                z = 3246,
            },
            {
                x = 3562,
                z = 3229,
            },
            {
                x = 3564,
                z = 3201,
            },
            {
                x = 3564,
                z = 3206,
            },
            {
                x = 3564,
                z = 3218,
            },
            {
                x = 3564,
                z = 3253,
            },
            {
                x = 3565,
                z = 3241,
            },
            {
                x = 3567,
                z = 3236,
            },
            {
                x = 3582,
                z = 3216,
            },
            {
                x = 3583,
                z = 3200,
            },
            {
                x = 3603,
                z = 3189,
            },
            {
                x = 3618,
                z = 3187,
            },
            {
                x = 3630,
                z = 3213,
            },
            {
                x = 3630,
                z = 3216,
            },
            {
                x = 3630,
                z = 3219,
            },
            {
                x = 3630,
                z = 3223,
            },
            {
                x = 3630,
                z = 3225,
            },
            {
                x = 3631,
                z = 3212,
            },
            {
                x = 3631,
                z = 3218,
            },
            {
                x = 3631,
                z = 3220,
            },
            {
                x = 3631,
                z = 3226,
            },
            {
                x = 3633,
                z = 3212,
            },
            {
                x = 3634,
                z = 3228,
            },
            {
                x = 3635,
                z = 3230,
            },
            {
                x = 3638,
                z = 3196,
            },
            {
                x = 3639,
                z = 3193,
            },
        },
    },
    {
        name = "Vampyre Juvinate",
        ids = {
            [3512] = true,
            [3513] = true,
            [3522] = true,
            [3523] = true,
            [3524] = true,
            [3525] = true,
            [7613] = true,
            [7622] = true,
            [7623] = true,
            [7624] = true,
            [7625] = true,
            [14072] = true,
        },
        locations = {
            {
                x = 3513,
                z = 3241,
            },
            {
                x = 3513,
                z = 3242,
            },
            {
                x = 3540,
                z = 3206,
            },
            {
                x = 3546,
                z = 3206,
            },
            {
                x = 3546,
                z = 3218,
            },
            {
                x = 3550,
                z = 3213,
            },
            {
                x = 3564,
                z = 3232,
            },
            {
                x = 3567,
                z = 3214,
            },
            {
                x = 3572,
                z = 3216,
            },
            {
                x = 3575,
                z = 3240,
            },
            {
                x = 3577,
                z = 3216,
            },
            {
                x = 3578,
                z = 3221,
            },
            {
                x = 3578,
                z = 3231,
            },
            {
                x = 3579,
                z = 3207,
            },
            {
                x = 3579,
                z = 3250,
            },
            {
                x = 3581,
                z = 3210,
            },
            {
                x = 3582,
                z = 3242,
            },
            {
                x = 3634,
                z = 3344,
            },
            {
                x = 3636,
                z = 3349,
            },
            {
                x = 3646,
                z = 3351,
            },
            {
                x = 3648,
                z = 3338,
            },
            {
                x = 3649,
                z = 3345,
            },
            {
                x = 3654,
                z = 3337,
            },
            {
                x = 3654,
                z = 3370,
            },
            {
                x = 3655,
                z = 3364,
            },
            {
                x = 3656,
                z = 3350,
            },
            {
                x = 3661,
                z = 3370,
            },
            {
                x = 3661,
                z = 3371,
            },
            {
                x = 3662,
                z = 3370,
            },
            {
                x = 3662,
                z = 3371,
            },
            {
                x = 3663,
                z = 3354,
            },
            {
                x = 3664,
                z = 3343,
            },
            {
                x = 3664,
                z = 3362,
            },
            {
                x = 3665,
                z = 3345,
            },
            {
                x = 3666,
                z = 3364,
            },
            {
                x = 3670,
                z = 3352,
            },
        },
    },
    {
        name = "Vanstrom Klause",
        ids = {
            [1577] = true,
            [14174] = true,
        },
        locations = {
            {
                x = 3503,
                z = 3477,
            },
            {
                x = 3624,
                z = 3341,
            },
        },
    },
    {
        name = "Veil-ripper Ozharakha",
        ids = {
            [25125] = true,
        },
        locations = {
            {
                x = 3303,
                z = 3743,
            },
            {
                x = 3309,
                z = 3745,
            },
            {
                x = 3312,
                z = 3718,
            },
            {
                x = 3317,
                z = 3715,
            },
            {
                x = 3323,
                z = 3713,
            },
            {
                x = 3323,
                z = 3733,
            },
            {
                x = 3327,
                z = 3717,
            },
            {
                x = 3327,
                z = 3731,
            },
            {
                x = 3332,
                z = 3722,
            },
            {
                x = 3332,
                z = 3750,
            },
        },
    },
    {
        name = "Vera",
        ids = {
            [6043] = true,
        },
        locations = {
            {
                x = 3490,
                z = 3473,
            },
        },
    },
    {
        name = "Vindicta",
        ids = {
            [26027] = true,
        },
        locations = {
            {
                x = 3503,
                z = 3697,
            },
        },
    },
    {
        name = "Vinecrawler",
        ids = {
            [24830] = true,
        },
        locations = {
            {
                x = 2196,
                z = 2804,
            },
            {
                x = 2198,
                z = 2808,
            },
            {
                x = 2203,
                z = 2802,
            },
            {
                x = 2204,
                z = 2810,
            },
            {
                x = 2206,
                z = 2795,
            },
            {
                x = 2206,
                z = 2818,
            },
            {
                x = 2208,
                z = 2823,
            },
            {
                x = 2209,
                z = 2800,
            },
            {
                x = 2211,
                z = 2809,
            },
            {
                x = 2212,
                z = 2816,
            },
            {
                x = 2214,
                z = 2795,
            },
            {
                x = 2216,
                z = 2789,
            },
            {
                x = 2223,
                z = 2789,
            },
        },
    },
    {
        name = "Viridian skillchompa (Hunter)",
        ids = {
            [19441] = true,
        },
        locations = {
            {
                x = 3662,
                z = 3418,
            },
            {
                x = 3662,
                z = 3430,
            },
            {
                x = 3663,
                z = 3425,
            },
            {
                x = 3666,
                z = 3414,
            },
            {
                x = 3667,
                z = 3423,
            },
            {
                x = 3667,
                z = 3432,
            },
            {
                x = 3668,
                z = 3411,
            },
            {
                x = 3668,
                z = 3427,
            },
            {
                x = 3672,
                z = 3415,
            },
            {
                x = 3672,
                z = 3429,
            },
            {
                x = 3673,
                z = 3418,
            },
            {
                x = 3673,
                z = 3424,
            },
            {
                x = 3674,
                z = 3412,
            },
            {
                x = 3678,
                z = 3416,
            },
        },
    },
    {
        name = "Vulture",
        ids = {
            [3675] = true,
        },
        locations = {
            {
                x = 3215,
                z = 2841,
            },
            {
                x = 3217,
                z = 2845,
            },
            {
                x = 3220,
                z = 2841,
            },
            {
                x = 3295,
                z = 2866,
            },
            {
                x = 3297,
                z = 2863,
            },
            {
                x = 3301,
                z = 2864,
            },
            {
                x = 3333,
                z = 2864,
            },
            {
                x = 3335,
                z = 2860,
            },
            {
                x = 3336,
                z = 2778,
            },
            {
                x = 3338,
                z = 2864,
            },
            {
                x = 3343,
                z = 2793,
            },
            {
                x = 3367,
                z = 2791,
            },
        },
    },
    {
        name = "Vyrelady",
        ids = {
            [14120] = true,
            [14122] = true,
            [14124] = true,
            [14126] = true,
            [14137] = true,
            [14139] = true,
        },
        locations = {
            {
                x = 3596,
                z = 3347,
            },
            {
                x = 3599,
                z = 3370,
            },
            {
                x = 3600,
                z = 3335,
            },
            {
                x = 3600,
                z = 3366,
            },
            {
                x = 3603,
                z = 3332,
            },
            {
                x = 3604,
                z = 3359,
            },
            {
                x = 3607,
                z = 3354,
            },
            {
                x = 3614,
                z = 3356,
            },
        },
    },
    {
        name = "Vyrelord",
        ids = {
            [14128] = true,
            [14130] = true,
            [14132] = true,
            [14134] = true,
            [14136] = true,
            [14138] = true,
        },
        locations = {
            {
                x = 3595,
                z = 3358,
            },
            {
                x = 3597,
                z = 3348,
            },
            {
                x = 3598,
                z = 3370,
            },
            {
                x = 3601,
                z = 3350,
            },
            {
                x = 3603,
                z = 3325,
            },
            {
                x = 3603,
                z = 3333,
            },
            {
                x = 3606,
                z = 3355,
            },
            {
                x = 3607,
                z = 3356,
            },
            {
                x = 3611,
                z = 3317,
            },
            {
                x = 3611,
                z = 3364,
            },
            {
                x = 3612,
                z = 3356,
            },
        },
    },
    {
        name = "Vyrewatch",
        ids = {
            [7691] = true,
            [7692] = true,
            [7693] = true,
            [7694] = true,
            [7699] = true,
            [7700] = true,
            [7701] = true,
            [7702] = true,
            [22553] = true,
            [22555] = true,
            [22557] = true,
            [22558] = true,
            [22559] = true,
            [22563] = true,
            [22565] = true,
            [22566] = true,
            [22567] = true,
            [22568] = true,
        },
        locations = {
            {
                x = 3526,
                z = 3351,
            },
            {
                x = 3533,
                z = 3339,
            },
            {
                x = 3535,
                z = 3349,
            },
            {
                x = 3546,
                z = 3252,
            },
            {
                x = 3548,
                z = 3223,
            },
            {
                x = 3548,
                z = 3226,
            },
            {
                x = 3550,
                z = 3230,
            },
            {
                x = 3550,
                z = 3252,
            },
            {
                x = 3551,
                z = 3219,
            },
            {
                x = 3551,
                z = 3248,
            },
            {
                x = 3553,
                z = 3193,
            },
            {
                x = 3553,
                z = 3244,
            },
            {
                x = 3554,
                z = 3219,
            },
            {
                x = 3554,
                z = 3230,
            },
            {
                x = 3555,
                z = 3187,
            },
            {
                x = 3557,
                z = 3227,
            },
            {
                x = 3557,
                z = 3230,
            },
            {
                x = 3557,
                z = 3246,
            },
            {
                x = 3558,
                z = 3242,
            },
            {
                x = 3559,
                z = 3237,
            },
            {
                x = 3559,
                z = 3250,
            },
            {
                x = 3560,
                z = 3202,
            },
            {
                x = 3560,
                z = 3207,
            },
            {
                x = 3562,
                z = 3178,
            },
            {
                x = 3564,
                z = 3196,
            },
            {
                x = 3565,
                z = 3190,
            },
            {
                x = 3565,
                z = 3238,
            },
            {
                x = 3568,
                z = 3339,
            },
            {
                x = 3570,
                z = 3180,
            },
            {
                x = 3570,
                z = 3338,
            },
            {
                x = 3577,
                z = 3183,
            },
            {
                x = 3581,
                z = 3187,
            },
            {
                x = 3593,
                z = 3208,
            },
            {
                x = 3597,
                z = 3193,
            },
            {
                x = 3600,
                z = 3245,
            },
            {
                x = 3601,
                z = 3183,
            },
            {
                x = 3606,
                z = 3217,
            },
            {
                x = 3607,
                z = 3225,
            },
            {
                x = 3611,
                z = 3205,
            },
            {
                x = 3614,
                z = 3189,
            },
            {
                x = 3615,
                z = 3248,
            },
            {
                x = 3621,
                z = 3182,
            },
            {
                x = 3626,
                z = 3224,
            },
            {
                x = 3626,
                z = 3245,
            },
            {
                x = 3629,
                z = 3190,
            },
            {
                x = 3629,
                z = 3252,
            },
            {
                x = 3630,
                z = 3279,
            },
            {
                x = 3631,
                z = 3305,
            },
            {
                x = 3634,
                z = 3200,
            },
            {
                x = 3636,
                z = 3270,
            },
            {
                x = 3642,
                z = 3190,
            },
        },
    },
    {
        name = "Vyrewatch (Darkmeyer)",
        ids = {
            [7610] = true,
            [7611] = true,
            [7612] = true,
            [14084] = true,
            [14086] = true,
            [14088] = true,
            [14090] = true,
            [14092] = true,
            [14094] = true,
            [14096] = true,
            [14098] = true,
        },
        locations = {
            {
                x = 3611,
                z = 3389,
            },
            {
                x = 3613,
                z = 3385,
            },
            {
                x = 3615,
                z = 3395,
            },
            {
                x = 3617,
                z = 3379,
            },
            {
                x = 3618,
                z = 3381,
            },
            {
                x = 3621,
                z = 3390,
            },
            {
                x = 3621,
                z = 3394,
            },
            {
                x = 3623,
                z = 3380,
            },
            {
                x = 3625,
                z = 3385,
            },
            {
                x = 3629,
                z = 3381,
            },
            {
                x = 3630,
                z = 3401,
            },
            {
                x = 3631,
                z = 3394,
            },
            {
                x = 3631,
                z = 3402,
            },
            {
                x = 3636,
                z = 3396,
            },
            {
                x = 3640,
                z = 3394,
            },
            {
                x = 3641,
                z = 3344,
            },
            {
                x = 3643,
                z = 3390,
            },
            {
                x = 3645,
                z = 3380,
            },
            {
                x = 3645,
                z = 3389,
            },
            {
                x = 3645,
                z = 3398,
            },
            {
                x = 3650,
                z = 3385,
            },
            {
                x = 3651,
                z = 3399,
            },
            {
                x = 3652,
                z = 3394,
            },
            {
                x = 3654,
                z = 3399,
            },
            {
                x = 3655,
                z = 3342,
            },
            {
                x = 3657,
                z = 3389,
            },
            {
                x = 3658,
                z = 3384,
            },
            {
                x = 3659,
                z = 3394,
            },
            {
                x = 3662,
                z = 3350,
            },
            {
                x = 3669,
                z = 3394,
            },
            {
                x = 3672,
                z = 3385,
            },
            {
                x = 3673,
                z = 3391,
            },
            {
                x = 3676,
                z = 3379,
            },
            {
                x = 3676,
                z = 3390,
            },
        },
    },
    {
        name = "Vyrewatch guard",
        ids = {
            [14100] = true,
            [14115] = true,
            [14116] = true,
        },
        locations = {
            {
                x = 3601,
                z = 3322,
            },
            {
                x = 3603,
                z = 3322,
            },
            {
                x = 3672,
                z = 3398,
            },
        },
    },
    {
        name = "Wandering warrior",
        ids = {
            [191] = true,
        },
        locations = {
            {
                x = 2723,
                z = 3159,
            },
            {
                x = 2724,
                z = 3158,
            },
            {
                x = 2724,
                z = 3161,
            },
            {
                x = 2725,
                z = 3163,
            },
            {
                x = 2728,
                z = 3158,
            },
            {
                x = 2729,
                z = 3158,
            },
            {
                x = 2729,
                z = 3164,
            },
            {
                x = 2730,
                z = 3162,
            },
            {
                x = 2731,
                z = 3161,
            },
            {
                x = 2771,
                z = 3014,
            },
            {
                x = 2773,
                z = 3017,
            },
            {
                x = 2777,
                z = 3068,
            },
            {
                x = 2801,
                z = 3067,
            },
            {
                x = 2842,
                z = 3017,
            },
            {
                x = 2850,
                z = 3057,
            },
            {
                x = 2852,
                z = 3053,
            },
            {
                x = 2918,
                z = 2987,
            },
            {
                x = 2937,
                z = 2993,
            },
            {
                x = 2938,
                z = 2995,
            },
            {
                x = 2940,
                z = 2991,
            },
            {
                x = 2942,
                z = 2995,
            },
        },
    },
    {
        name = "Warrior (Rellekka)",
        ids = {
            [1318] = true,
        },
        locations = {
            {
                x = 2619,
                z = 3671,
            },
            {
                x = 2622,
                z = 3654,
            },
            {
                x = 2625,
                z = 3664,
            },
            {
                x = 2630,
                z = 3676,
            },
            {
                x = 2634,
                z = 3651,
            },
            {
                x = 2643,
                z = 3674,
            },
            {
                x = 2650,
                z = 3652,
            },
            {
                x = 2655,
                z = 3691,
            },
            {
                x = 2666,
                z = 3678,
            },
            {
                x = 2668,
                z = 3658,
            },
            {
                x = 2668,
                z = 3670,
            },
            {
                x = 2668,
                z = 3710,
            },
            {
                x = 2673,
                z = 3695,
            },
            {
                x = 2685,
                z = 3653,
            },
        },
    },
    {
        name = "Warrior woman",
        ids = {
            [15] = true,
        },
        locations = {
            {
                x = 2569,
                z = 3387,
            },
            {
                x = 2572,
                z = 3383,
            },
            {
                x = 2572,
                z = 3388,
            },
            {
                x = 2575,
                z = 3384,
            },
            {
                x = 2584,
                z = 3305,
            },
            {
                x = 2585,
                z = 3289,
            },
            {
                x = 2587,
                z = 3291,
            },
            {
                x = 2629,
                z = 3295,
            },
            {
                x = 2632,
                z = 3299,
            },
        },
    },
    {
        name = "Watchman",
        ids = {
            [34] = true,
        },
        locations = {
            {
                x = 2544,
                z = 3112,
            },
            {
                x = 2545,
                z = 3116,
            },
            {
                x = 2549,
                z = 3112,
            },
            {
                x = 2549,
                z = 3116,
            },
        },
    },
    {
        name = "Water wizard",
        ids = {
            [2710] = true,
        },
        locations = {
            {
                x = 3000,
                z = 3266,
            },
        },
    },
    {
        name = "Waterfiend",
        ids = {
            [5361] = true,
        },
        locations = {
            {
                x = 3362,
                z = 3642,
            },
            {
                x = 3363,
                z = 3647,
            },
            {
                x = 3365,
                z = 3639,
            },
            {
                x = 3365,
                z = 3643,
            },
            {
                x = 3366,
                z = 3649,
            },
            {
                x = 3368,
                z = 3639,
            },
            {
                x = 3368,
                z = 3645,
            },
            {
                x = 3372,
                z = 3649,
            },
            {
                x = 3375,
                z = 3642,
            },
            {
                x = 3376,
                z = 3646,
            },
            {
                x = 3380,
                z = 3651,
            },
            {
                x = 3382,
                z = 3649,
            },
            {
                x = 3383,
                z = 3645,
            },
        },
    },
    {
        name = "Waterfiend (elite)",
        ids = {
            [5361] = true,
        },
        locations = {
            {
                x = 3362,
                z = 3642,
            },
            {
                x = 3363,
                z = 3647,
            },
            {
                x = 3365,
                z = 3639,
            },
            {
                x = 3365,
                z = 3643,
            },
            {
                x = 3366,
                z = 3649,
            },
            {
                x = 3368,
                z = 3639,
            },
            {
                x = 3368,
                z = 3645,
            },
            {
                x = 3372,
                z = 3649,
            },
            {
                x = 3375,
                z = 3642,
            },
            {
                x = 3376,
                z = 3646,
            },
            {
                x = 3380,
                z = 3651,
            },
            {
                x = 3382,
                z = 3649,
            },
            {
                x = 3383,
                z = 3645,
            },
        },
    },
    {
        name = "White Knight",
        ids = {
            [21982] = true,
            [23800] = true,
            [23802] = true,
            [23805] = true,
        },
        locations = {
            {
                x = 2956,
                z = 3337,
            },
            {
                x = 2962,
                z = 3338,
            },
            {
                x = 2968,
                z = 3341,
            },
            {
                x = 2972,
                z = 3345,
            },
            {
                x = 2973,
                z = 3347,
            },
            {
                x = 2976,
                z = 3339,
            },
            {
                x = 2978,
                z = 3348,
            },
            {
                x = 2983,
                z = 3330,
            },
            {
                x = 2983,
                z = 3334,
            },
            {
                x = 2983,
                z = 3343,
            },
            {
                x = 2984,
                z = 3329,
            },
            {
                x = 2996,
                z = 3342,
            },
        },
    },
    {
        name = "White Knight (Burthorpe)",
        ids = {},
        locations = {
            {
                x = 2921,
                z = 3514,
            },
        },
    },
    {
        name = "White wolf",
        ids = {
            [97] = true,
        },
        locations = {
            {
                x = 2831,
                z = 3472,
            },
            {
                x = 2831,
                z = 3494,
            },
            {
                x = 2833,
                z = 3498,
            },
            {
                x = 2834,
                z = 3470,
            },
            {
                x = 2837,
                z = 3463,
            },
            {
                x = 2837,
                z = 3494,
            },
            {
                x = 2840,
                z = 3458,
            },
            {
                x = 2849,
                z = 3477,
            },
            {
                x = 2850,
                z = 3472,
            },
        },
    },
    {
        name = "Will o' the wisp",
        ids = {
            [681] = true,
            [1211] = true,
            [1212] = true,
            [2266] = true,
            [15233] = true,
        },
        locations = {
            {
                x = 2178,
                z = 3238,
            },
            {
                x = 2180,
                z = 3236,
            },
            {
                x = 2192,
                z = 3188,
            },
            {
                x = 2192,
                z = 3191,
            },
            {
                x = 2194,
                z = 3189,
            },
            {
                x = 2194,
                z = 3190,
            },
            {
                x = 2196,
                z = 3187,
            },
            {
                x = 2196,
                z = 3189,
            },
            {
                x = 2206,
                z = 3164,
            },
            {
                x = 2208,
                z = 3163,
            },
            {
                x = 2208,
                z = 3225,
            },
            {
                x = 2208,
                z = 3227,
            },
            {
                x = 2209,
                z = 3163,
            },
            {
                x = 2209,
                z = 3164,
            },
            {
                x = 2210,
                z = 3215,
            },
            {
                x = 2210,
                z = 3217,
            },
            {
                x = 2210,
                z = 3224,
            },
            {
                x = 2213,
                z = 3243,
            },
            {
                x = 2214,
                z = 3244,
            },
            {
                x = 2215,
                z = 3245,
            },
            {
                x = 2216,
                z = 3136,
            },
            {
                x = 2216,
                z = 3140,
            },
            {
                x = 2216,
                z = 3142,
            },
            {
                x = 2218,
                z = 3139,
            },
            {
                x = 2218,
                z = 3245,
            },
            {
                x = 2219,
                z = 3244,
            },
            {
                x = 2220,
                z = 3243,
            },
            {
                x = 2221,
                z = 3243,
            },
            {
                x = 2247,
                z = 3226,
            },
            {
                x = 2248,
                z = 3225,
            },
            {
                x = 2248,
                z = 3227,
            },
            {
                x = 2249,
                z = 3227,
            },
            {
                x = 2249,
                z = 3258,
            },
            {
                x = 2251,
                z = 3257,
            },
            {
                x = 2251,
                z = 3260,
            },
            {
                x = 2253,
                z = 3259,
            },
            {
                x = 2259,
                z = 3211,
            },
            {
                x = 2263,
                z = 2861,
            },
            {
                x = 2266,
                z = 2849,
            },
            {
                x = 2267,
                z = 3223,
            },
            {
                x = 2267,
                z = 3225,
            },
            {
                x = 2268,
                z = 3224,
            },
            {
                x = 2273,
                z = 2865,
            },
            {
                x = 2277,
                z = 2858,
            },
            {
                x = 2278,
                z = 2847,
            },
            {
                x = 2281,
                z = 3142,
            },
            {
                x = 2282,
                z = 3140,
            },
            {
                x = 2283,
                z = 3136,
            },
            {
                x = 2283,
                z = 3145,
            },
            {
                x = 2291,
                z = 3262,
            },
            {
                x = 2296,
                z = 3195,
            },
            {
                x = 2298,
                z = 3262,
            },
            {
                x = 2459,
                z = 3449,
            },
            {
                x = 2460,
                z = 3445,
            },
            {
                x = 2464,
                z = 3448,
            },
            {
                x = 3055,
                z = 3628,
            },
            {
                x = 3055,
                z = 3701,
            },
            {
                x = 3059,
                z = 3641,
            },
            {
                x = 3059,
                z = 3704,
            },
            {
                x = 3060,
                z = 3622,
            },
            {
                x = 3063,
                z = 3627,
            },
            {
                x = 3126,
                z = 3709,
            },
            {
                x = 3129,
                z = 3714,
            },
            {
                x = 3130,
                z = 3704,
            },
            {
                x = 3130,
                z = 3708,
            },
            {
                x = 3134,
                z = 3718,
            },
            {
                x = 3135,
                z = 3705,
            },
            {
                x = 3210,
                z = 3704,
            },
            {
                x = 3214,
                z = 3707,
            },
            {
                x = 3252,
                z = 3652,
            },
            {
                x = 3255,
                z = 3650,
            },
            {
                x = 3294,
                z = 3612,
            },
            {
                x = 3298,
                z = 3607,
            },
            {
                x = 3300,
                z = 3617,
            },
            {
                x = 3305,
                z = 3627,
            },
            {
                x = 3308,
                z = 3588,
            },
            {
                x = 3311,
                z = 3633,
            },
            {
                x = 3312,
                z = 3621,
            },
            {
                x = 3313,
                z = 3607,
            },
            {
                x = 3314,
                z = 3630,
            },
            {
                x = 3318,
                z = 3614,
            },
            {
                x = 3409,
                z = 3369,
            },
            {
                x = 3418,
                z = 3420,
            },
            {
                x = 3420,
                z = 3349,
            },
            {
                x = 3424,
                z = 3452,
            },
            {
                x = 3425,
                z = 3292,
            },
            {
                x = 3428,
                z = 3409,
            },
            {
                x = 3430,
                z = 3340,
            },
            {
                x = 3433,
                z = 3416,
            },
            {
                x = 3434,
                z = 3394,
            },
            {
                x = 3435,
                z = 3314,
            },
            {
                x = 3435,
                z = 3330,
            },
            {
                x = 3435,
                z = 3359,
            },
            {
                x = 3436,
                z = 3407,
            },
            {
                x = 3437,
                z = 3339,
            },
            {
                x = 3437,
                z = 3374,
            },
            {
                x = 3438,
                z = 3414,
            },
            {
                x = 3439,
                z = 3449,
            },
            {
                x = 3442,
                z = 3277,
            },
            {
                x = 3446,
                z = 3385,
            },
            {
                x = 3446,
                z = 3439,
            },
            {
                x = 3447,
                z = 3388,
            },
            {
                x = 3450,
                z = 3370,
            },
            {
                x = 3450,
                z = 3387,
            },
            {
                x = 3451,
                z = 3336,
            },
            {
                x = 3452,
                z = 3355,
            },
            {
                x = 3454,
                z = 3410,
            },
            {
                x = 3454,
                z = 3423,
            },
            {
                x = 3459,
                z = 3457,
            },
            {
                x = 3460,
                z = 3313,
            },
            {
                x = 3460,
                z = 3462,
            },
            {
                x = 3462,
                z = 3459,
            },
            {
                x = 3463,
                z = 3490,
            },
            {
                x = 3464,
                z = 3511,
            },
            {
                x = 3465,
                z = 3466,
            },
            {
                x = 3466,
                z = 3495,
            },
            {
                x = 3466,
                z = 3497,
            },
            {
                x = 3467,
                z = 3441,
            },
            {
                x = 3467,
                z = 3485,
            },
            {
                x = 3467,
                z = 3497,
            },
            {
                x = 3467,
                z = 3509,
            },
            {
                x = 3469,
                z = 3470,
            },
            {
                x = 3470,
                z = 3469,
            },
            {
                x = 3471,
                z = 3424,
            },
            {
                x = 3471,
                z = 3477,
            },
            {
                x = 3474,
                z = 3317,
            },
            {
                x = 3474,
                z = 3505,
            },
            {
                x = 3476,
                z = 3507,
            },
            {
                x = 3479,
                z = 3511,
            },
            {
                x = 3480,
                z = 3468,
            },
            {
                x = 3480,
                z = 3470,
            },
            {
                x = 3481,
                z = 3341,
            },
            {
                x = 3482,
                z = 3469,
            },
            {
                x = 3483,
                z = 3267,
            },
            {
                x = 3483,
                z = 3511,
            },
            {
                x = 3484,
                z = 3326,
            },
            {
                x = 3484,
                z = 3386,
            },
            {
                x = 3484,
                z = 3398,
            },
            {
                x = 3484,
                z = 3464,
            },
            {
                x = 3485,
                z = 3509,
            },
            {
                x = 3486,
                z = 3265,
            },
            {
                x = 3487,
                z = 3310,
            },
            {
                x = 3490,
                z = 3313,
            },
            {
                x = 3490,
                z = 3401,
            },
            {
                x = 3490,
                z = 3461,
            },
            {
                x = 3491,
                z = 3350,
            },
            {
                x = 3491,
                z = 3368,
            },
            {
                x = 3491,
                z = 3460,
            },
            {
                x = 3492,
                z = 3322,
            },
            {
                x = 3494,
                z = 3461,
            },
            {
                x = 3494,
                z = 3512,
            },
            {
                x = 3498,
                z = 3461,
            },
            {
                x = 3499,
                z = 3513,
            },
            {
                x = 3501,
                z = 3513,
            },
            {
                x = 3502,
                z = 3464,
            },
            {
                x = 3504,
                z = 3412,
            },
            {
                x = 3504,
                z = 3463,
            },
            {
                x = 3506,
                z = 3512,
            },
            {
                x = 3506,
                z = 3515,
            },
            {
                x = 3507,
                z = 3442,
            },
            {
                x = 3507,
                z = 3515,
            },
            {
                x = 3508,
                z = 3353,
            },
            {
                x = 3508,
                z = 3438,
            },
            {
                x = 3509,
                z = 3512,
            },
            {
                x = 3510,
                z = 3325,
            },
            {
                x = 3511,
                z = 3267,
            },
            {
                x = 3511,
                z = 3442,
            },
            {
                x = 3511,
                z = 3488,
            },
            {
                x = 3513,
                z = 3340,
            },
            {
                x = 3513,
                z = 3441,
            },
            {
                x = 3513,
                z = 3467,
            },
            {
                x = 3513,
                z = 3487,
            },
            {
                x = 3513,
                z = 3489,
            },
            {
                x = 3513,
                z = 3503,
            },
            {
                x = 3514,
                z = 3295,
            },
            {
                x = 3514,
                z = 3309,
            },
            {
                x = 3514,
                z = 3372,
            },
            {
                x = 3514,
                z = 3490,
            },
            {
                x = 3515,
                z = 3278,
            },
            {
                x = 3515,
                z = 3495,
            },
            {
                x = 3515,
                z = 3499,
            },
            {
                x = 3516,
                z = 3469,
            },
            {
                x = 3517,
                z = 3267,
            },
            {
                x = 3584,
                z = 3455,
            },
            {
                x = 3600,
                z = 3452,
            },
        },
    },
    {
        name = "Wilson",
        ids = {
            [4548] = true,
        },
        locations = {
            {
                x = 2199,
                z = 3808,
            },
        },
    },
    {
        name = "Wimpy bird",
        ids = {
            [7031] = true,
        },
        locations = {
            {
                x = 2499,
                z = 2820,
            },
            {
                x = 2511,
                z = 2819,
            },
            {
                x = 2525,
                z = 2820,
            },
            {
                x = 2527,
                z = 2818,
            },
            {
                x = 2542,
                z = 2819,
            },
            {
                x = 2551,
                z = 2817,
            },
            {
                x = 2554,
                z = 2819,
            },
            {
                x = 2559,
                z = 2819,
            },
            {
                x = 2566,
                z = 2820,
            },
            {
                x = 2575,
                z = 2818,
            },
            {
                x = 2578,
                z = 2819,
            },
            {
                x = 2587,
                z = 2819,
            },
            {
                x = 2595,
                z = 2821,
            },
            {
                x = 2595,
                z = 2826,
            },
        },
    },
    {
        name = "Wizard",
        ids = {
            [13] = true,
        },
        locations = {
            {
                x = 2586,
                z = 3088,
            },
            {
                x = 2586,
                z = 3089,
            },
            {
                x = 2588,
                z = 3090,
            },
            {
                x = 2589,
                z = 3084,
            },
            {
                x = 2589,
                z = 3085,
            },
            {
                x = 2593,
                z = 3084,
            },
            {
                x = 2593,
                z = 3090,
            },
            {
                x = 2595,
                z = 3090,
            },
        },
    },
    {
        name = "Wolf",
        ids = {
            [95] = true,
            [6047] = true,
        },
        locations = {
            {
                x = 2398,
                z = 3330,
            },
            {
                x = 2406,
                z = 3329,
            },
            {
                x = 2440,
                z = 2834,
            },
            {
                x = 2443,
                z = 2874,
            },
            {
                x = 2447,
                z = 3287,
            },
            {
                x = 2449,
                z = 2844,
            },
            {
                x = 2450,
                z = 3284,
            },
            {
                x = 2454,
                z = 2880,
            },
            {
                x = 2454,
                z = 3280,
            },
            {
                x = 2458,
                z = 3274,
            },
            {
                x = 2459,
                z = 2848,
            },
            {
                x = 2460,
                z = 2870,
            },
            {
                x = 2462,
                z = 3274,
            },
            {
                x = 2465,
                z = 3273,
            },
            {
                x = 2465,
                z = 3275,
            },
            {
                x = 2466,
                z = 2837,
            },
            {
                x = 2467,
                z = 2882,
            },
            {
                x = 2470,
                z = 2865,
            },
            {
                x = 2470,
                z = 3272,
            },
            {
                x = 2472,
                z = 3274,
            },
            {
                x = 2477,
                z = 2857,
            },
            {
                x = 2477,
                z = 3275,
            },
            {
                x = 2478,
                z = 3272,
            },
            {
                x = 2480,
                z = 2924,
            },
            {
                x = 2480,
                z = 3274,
            },
            {
                x = 2483,
                z = 2887,
            },
            {
                x = 2483,
                z = 3273,
            },
            {
                x = 2485,
                z = 3269,
            },
            {
                x = 2489,
                z = 3269,
            },
            {
                x = 2492,
                z = 2847,
            },
            {
                x = 2492,
                z = 2858,
            },
            {
                x = 2492,
                z = 2908,
            },
            {
                x = 2496,
                z = 2959,
            },
            {
                x = 2498,
                z = 2968,
            },
            {
                x = 2500,
                z = 2959,
            },
            {
                x = 2502,
                z = 2969,
            },
            {
                x = 2509,
                z = 2964,
            },
            {
                x = 2516,
                z = 3197,
            },
            {
                x = 2548,
                z = 3179,
            },
            {
                x = 2602,
                z = 2955,
            },
            {
                x = 2605,
                z = 2963,
            },
            {
                x = 2607,
                z = 2967,
            },
            {
                x = 2610,
                z = 2958,
            },
            {
                x = 2610,
                z = 2961,
            },
            {
                x = 2610,
                z = 2965,
            },
            {
                x = 2616,
                z = 3283,
            },
            {
                x = 2620,
                z = 3283,
            },
            {
                x = 2647,
                z = 3584,
            },
            {
                x = 2680,
                z = 3585,
            },
            {
                x = 2682,
                z = 3592,
            },
            {
                x = 2706,
                z = 3580,
            },
            {
                x = 2717,
                z = 3569,
            },
            {
                x = 2835,
                z = 3502,
            },
            {
                x = 2838,
                z = 3505,
            },
            {
                x = 2840,
                z = 3491,
            },
            {
                x = 2845,
                z = 3494,
            },
            {
                x = 2846,
                z = 3490,
            },
            {
                x = 2858,
                z = 3504,
            },
            {
                x = 2858,
                z = 3508,
            },
            {
                x = 2860,
                z = 3506,
            },
            {
                x = 2862,
                z = 3504,
            },
        },
    },
    {
        name = "Woman",
        ids = {
            [4] = true,
            [5] = true,
            [3226] = true,
            [5924] = true,
        },
        locations = {
            {
                x = 2690,
                z = 3489,
            },
            {
                x = 2691,
                z = 3496,
            },
            {
                x = 2696,
                z = 3497,
            },
            {
                x = 2697,
                z = 3497,
            },
            {
                x = 2699,
                z = 3494,
            },
            {
                x = 2990,
                z = 3384,
            },
            {
                x = 3011,
                z = 3236,
            },
            {
                x = 3218,
                z = 3395,
            },
            {
                x = 3278,
                z = 3502,
            },
            {
                x = 3279,
                z = 3496,
            },
        },
    },
    {
        name = "Woman (East Ardougne)",
        ids = {
            [25] = true,
        },
        locations = {
            {
                x = 2612,
                z = 3316,
            },
        },
    },
    {
        name = "Woman (West Ardougne)",
        ids = {
            [352] = true,
            [353] = true,
            [354] = true,
            [360] = true,
            [361] = true,
            [362] = true,
            [363] = true,
        },
        locations = {
            {
                x = 2453,
                z = 3307,
            },
            {
                x = 2463,
                z = 3317,
            },
            {
                x = 2468,
                z = 3290,
            },
            {
                x = 2470,
                z = 3290,
            },
            {
                x = 2472,
                z = 3296,
            },
            {
                x = 2472,
                z = 3307,
            },
            {
                x = 2473,
                z = 3288,
            },
            {
                x = 2474,
                z = 3323,
            },
            {
                x = 2479,
                z = 3311,
            },
            {
                x = 2480,
                z = 3300,
            },
            {
                x = 2481,
                z = 3294,
            },
            {
                x = 2482,
                z = 3286,
            },
            {
                x = 2483,
                z = 3318,
            },
            {
                x = 2483,
                z = 3324,
            },
            {
                x = 2485,
                z = 3315,
            },
            {
                x = 2488,
                z = 3296,
            },
            {
                x = 2489,
                z = 3295,
            },
            {
                x = 2492,
                z = 3314,
            },
            {
                x = 2504,
                z = 3326,
            },
            {
                x = 2509,
                z = 3314,
            },
            {
                x = 2510,
                z = 3318,
            },
            {
                x = 2511,
                z = 3322,
            },
            {
                x = 2513,
                z = 3315,
            },
            {
                x = 2519,
                z = 3277,
            },
            {
                x = 2524,
                z = 3271,
            },
            {
                x = 2537,
                z = 3324,
            },
            {
                x = 2540,
                z = 3279,
            },
            {
                x = 2545,
                z = 3278,
            },
            {
                x = 2550,
                z = 3272,
            },
        },
    },
    {
        name = "Wormbrain",
        ids = {
            [745] = true,
        },
        locations = {
            {
                x = 3014,
                z = 3189,
            },
        },
    },
    {
        name = "Wyvern",
        ids = {
            [21812] = true,
        },
        locations = {
            {
                x = 2948,
                z = 3901,
            },
            {
                x = 2951,
                z = 3893,
            },
            {
                x = 2958,
                z = 3900,
            },
            {
                x = 2960,
                z = 3889,
            },
            {
                x = 2968,
                z = 3900,
            },
        },
    },
    {
        name = "Yadviga",
        ids = {
            [6041] = true,
        },
        locations = {
            {
                x = 3479,
                z = 3492,
            },
        },
    },
    {
        name = "Yak",
        ids = {
            [5529] = true,
        },
        locations = {
            {
                x = 2318,
                z = 3794,
            },
            {
                x = 2321,
                z = 3793,
            },
            {
                x = 2321,
                z = 3797,
            },
            {
                x = 2322,
                z = 3789,
            },
            {
                x = 2325,
                z = 3791,
            },
            {
                x = 2325,
                z = 3796,
            },
        },
    },
    {
        name = "Yuri",
        ids = {
            [6028] = true,
        },
        locations = {
            {
                x = 3497,
                z = 3497,
            },
        },
    },
    {
        name = "Zanik",
        ids = {
            [26290] = true,
            [26997] = true,
        },
        locations = {
            {
                x = 2418,
                z = 2833,
            },
            {
                x = 2896,
                z = 3570,
            },
        },
    },
    {
        name = "Zemouregal",
        ids = {
            [14338] = true,
            [20686] = true,
        },
        locations = {
            {
                x = 2823,
                z = 3859,
            },
            {
                x = 2842,
                z = 3858,
            },
        },
    },
    {
        name = "Zenevivia",
        ids = {
            [11570] = true,
            [11629] = true,
        },
        locations = {
            {
                x = 3089,
                z = 3255,
            },
            {
                x = 3143,
                z = 3302,
            },
        },
    },
    {
        name = "Zogre",
        ids = {
            [2044] = true,
            [2045] = true,
            [2051] = true,
            [2052] = true,
            [2053] = true,
            [2054] = true,
            [2055] = true,
        },
        locations = {
            {
                x = 2464,
                z = 3045,
            },
            {
                x = 2464,
                z = 3049,
            },
            {
                x = 2467,
                z = 3049,
            },
            {
                x = 2468,
                z = 3046,
            },
            {
                x = 2470,
                z = 3055,
            },
            {
                x = 2482,
                z = 3046,
            },
            {
                x = 2486,
                z = 3048,
            },
        },
    },
    {
        name = "Zoja",
        ids = {
            [6044] = true,
        },
        locations = {
            {
                x = 3505,
                z = 3491,
            },
        },
    },
    {
        name = "Zombie",
        ids = {
            [5298] = true,
            [5300] = true,
            [5303] = true,
            [5316] = true,
            [5318] = true,
        },
        locations = {
            {
                x = 2497,
                z = 3292,
            },
            {
                x = 2499,
                z = 3286,
            },
            {
                x = 2500,
                z = 3283,
            },
            {
                x = 2506,
                z = 3284,
            },
            {
                x = 2511,
                z = 3287,
            },
        },
    },
    {
        name = "Zombie (Wilderness)",
        ids = {
            [5310] = true,
            [5311] = true,
            [5312] = true,
            [5313] = true,
            [5323] = true,
            [5324] = true,
            [5325] = true,
            [5326] = true,
            [5327] = true,
        },
        locations = {
            {
                x = 3213,
                z = 3684,
            },
            {
                x = 3214,
                z = 3668,
            },
            {
                x = 3214,
                z = 3686,
            },
            {
                x = 3218,
                z = 3691,
            },
            {
                x = 3219,
                z = 3686,
            },
            {
                x = 3223,
                z = 3675,
            },
            {
                x = 3224,
                z = 3695,
            },
            {
                x = 3226,
                z = 3688,
            },
            {
                x = 3227,
                z = 3673,
            },
            {
                x = 3229,
                z = 3678,
            },
            {
                x = 3232,
                z = 3685,
            },
            {
                x = 3233,
                z = 3679,
            },
            {
                x = 3234,
                z = 3695,
            },
            {
                x = 3236,
                z = 3690,
            },
            {
                x = 3237,
                z = 3687,
            },
            {
                x = 3237,
                z = 3692,
            },
            {
                x = 3238,
                z = 3696,
            },
            {
                x = 3240,
                z = 3690,
            },
            {
                x = 3241,
                z = 3694,
            },
            {
                x = 3242,
                z = 3685,
            },
            {
                x = 3243,
                z = 3692,
            },
        },
    },
    {
        name = "Zombie pirate (Harmony Island)",
        ids = {
            [5629] = true,
            [5631] = true,
            [5633] = true,
            [5634] = true,
            [5635] = true,
            [5637] = true,
            [5638] = true,
            [5639] = true,
            [5640] = true,
            [5641] = true,
            [5642] = true,
            [5644] = true,
            [5646] = true,
            [5650] = true,
            [5656] = true,
            [5658] = true,
            [5665] = true,
        },
        locations = {
            {
                x = 3784,
                z = 2843,
            },
            {
                x = 3792,
                z = 2830,
            },
            {
                x = 3793,
                z = 2851,
            },
            {
                x = 3794,
                z = 2873,
            },
            {
                x = 3795,
                z = 2845,
            },
            {
                x = 3796,
                z = 2858,
            },
            {
                x = 3799,
                z = 2855,
            },
            {
                x = 3800,
                z = 2835,
            },
            {
                x = 3803,
                z = 2843,
            },
            {
                x = 3803,
                z = 2848,
            },
            {
                x = 3804,
                z = 2873,
            },
            {
                x = 3810,
                z = 2833,
            },
            {
                x = 3811,
                z = 2826,
            },
            {
                x = 3815,
                z = 2859,
            },
            {
                x = 3817,
                z = 2824,
            },
            {
                x = 3824,
                z = 2857,
            },
            {
                x = 3827,
                z = 2833,
            },
        },
    },
    {
        name = "Zombie rat",
        ids = {
            [6088] = true,
            [6089] = true,
            [6090] = true,
        },
        locations = {
            {
                x = 2925,
                z = 3256,
            },
            {
                x = 2928,
                z = 3244,
            },
            {
                x = 2930,
                z = 3252,
            },
            {
                x = 2931,
                z = 3249,
            },
            {
                x = 2934,
                z = 3254,
            },
        },
    },
}

-- Keep existing surface records and merge sub-map references by exact monster name.
-- bestiary.lua chooses a map before measuring distances; main.lua draws only that map.
local byName = {}
for _, entry in ipairs(data) do
    byName[entry.name] = entry
end
for _, extra in ipairs(require("bestiary_submaps")) do
    local entry = byName[extra.name]
    if not entry then
        entry = { name = extra.name, ids = {}, locations = {} }
        data[#data + 1] = entry
        byName[extra.name] = entry
    end
    for id in pairs(extra.ids) do
        entry.ids[id] = true
    end
    for _, point in ipairs(extra.locations) do
        entry.locations[#entry.locations + 1] = point
    end
end
table.sort(data, function(a, b)
    return a.name:lower() < b.name:lower()
end)
return data
