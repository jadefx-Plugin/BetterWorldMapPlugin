-- surface_config.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: map_math.lua.
--[=[
BEGINNER WALKTHROUGH: surface_config.lua

The returned table has background (packed RGBA reference color) and bounds (an ordered list).
Each bounds block describes an inclusive source rectangle moved into surface-map space:
sx/sz = source minimum, ex/ez = inclusive source maximum, dx/dz = display origin.
After a coverage check, conversion is x+dx-sx,z+dz-sz.

Example reuse:
  local x, z = require('map_math').worldToSurface(3222, 3218)
  if x then print(x, z) end
map_math.lua reads these rectangles. First matching rectangle wins, so preserve their order.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: map_math.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Native surface-map source-to-display rectangle mapping from the local cache.
background is a cached reference color; bounds describe inclusive source sx/sz/ex/ez
rectangles placed at destination dx/dz. Coordinates are world tiles, not pixels.
map_math uses the first matching rectangle to reject unsupported/off-map positions.
Preserve ordering because source rectangles may overlap.
]]

return {
    background = 0x88909DFF,
    bounds = {
        {
            sx = 1600,
            sz = 11008,
            ex = 2815,
            ez = 12223,
            dx = 3584,
            dz = 1344,
        },
        {
            sx = 3328,
            sz = 1280,
            ex = 4159,
            ez = 1855,
            dx = 4032,
            dz = 3072,
        },
        {
            sx = 5056,
            sz = 2240,
            ex = 5247,
            ez = 2495,
            dx = 3520,
            dz = 4160,
        },
        {
            sx = 5248,
            sz = 2048,
            ex = 5759,
            ez = 2623,
            dx = 3712,
            dz = 3968,
        },
        {
            sx = 3584,
            sz = 2816,
            ex = 3903,
            ez = 3711,
            dx = 3584,
            dz = 2816,
        },
        {
            sx = 2752,
            sz = 2496,
            ex = 3583,
            ez = 4031,
            dx = 2752,
            dz = 2496,
        },
        {
            sx = 2560,
            sz = 2496,
            ex = 2751,
            ez = 4095,
            dx = 2560,
            dz = 2496,
        },
        {
            sx = 2432,
            sz = 2752,
            ex = 2559,
            ez = 4095,
            dx = 2432,
            dz = 2752,
        },
        {
            sx = 2432,
            sz = 9024,
            ex = 2559,
            ez = 9151,
            dx = 2432,
            dz = 2624,
        },
        {
            sx = 2432,
            sz = 2496,
            ex = 2559,
            ez = 2623,
            dx = 2432,
            dz = 2496,
        },
        {
            sx = 2368,
            sz = 2496,
            ex = 2431,
            ez = 3967,
            dx = 2368,
            dz = 2496,
        },
        {
            sx = 2240,
            sz = 2624,
            ex = 2367,
            ez = 2751,
            dx = 2240,
            dz = 2624,
        },
        {
            sx = 2240,
            sz = 3968,
            ex = 2431,
            ez = 4159,
            dx = 2240,
            dz = 3968,
        },
        {
            sx = 2048,
            sz = 3520,
            ex = 2367,
            ez = 3967,
            dx = 2048,
            dz = 3520,
        },
        {
            sx = 2240,
            sz = 3456,
            ex = 2367,
            ez = 3519,
            dx = 2240,
            dz = 3456,
        },
        {
            sx = 4544,
            sz = 2752,
            ex = 4607,
            ez = 2815,
            dx = 2176,
            dz = 3456,
        },
        {
            sx = 2048,
            sz = 3456,
            ex = 2175,
            ez = 3519,
            dx = 2048,
            dz = 3456,
        },
        {
            sx = 2304,
            sz = 3264,
            ex = 2367,
            ez = 3455,
            dx = 2304,
            dz = 3264,
        },
        {
            sx = 4480,
            sz = 2560,
            ex = 4671,
            ez = 2751,
            dx = 2112,
            dz = 3264,
        },
        {
            sx = 2048,
            sz = 3392,
            ex = 2111,
            ez = 3455,
            dx = 2048,
            dz = 3392,
        },
        {
            sx = 2048,
            sz = 3264,
            ex = 2111,
            ez = 3327,
            dx = 2048,
            dz = 3328,
        },
        {
            sx = 2048,
            sz = 3264,
            ex = 2111,
            ez = 3327,
            dx = 2048,
            dz = 3264,
        },
        {
            sx = 2048,
            sz = 3008,
            ex = 2367,
            ez = 3263,
            dx = 2048,
            dz = 3008,
        },
        {
            sx = 1728,
            sz = 3072,
            ex = 2047,
            ez = 3327,
            dx = 2048,
            dz = 2752,
        },
        {
            sx = 3840,
            sz = 3840,
            ex = 3903,
            ez = 4095,
            dx = 1984,
            dz = 3840,
        },
        {
            sx = 1984,
            sz = 3776,
            ex = 2047,
            ez = 3839,
            dx = 1984,
            dz = 3776,
        },
        {
            sx = 3840,
            sz = 3264,
            ex = 3903,
            ez = 3775,
            dx = 1984,
            dz = 3264,
        },
        {
            sx = 3840,
            sz = 3328,
            ex = 3903,
            ez = 3903,
            dx = 1984,
            dz = 2496,
        },
        {
            sx = 3840,
            sz = 3264,
            ex = 3903,
            ez = 4095,
            dx = 1920,
            dz = 3264,
        },
        {
            sx = 3840,
            sz = 3328,
            ex = 3903,
            ez = 3839,
            dx = 1920,
            dz = 2496,
        },
        {
            sx = 3840,
            sz = 3264,
            ex = 3903,
            ez = 4095,
            dx = 1856,
            dz = 3264,
        },
        {
            sx = 3840,
            sz = 3328,
            ex = 3903,
            ez = 3903,
            dx = 1856,
            dz = 2496,
        },
        {
            sx = 1344,
            sz = 5504,
            ex = 1407,
            ez = 5567,
            dx = 1920,
            dz = 3008,
        },
        {
            sx = 1280,
            sz = 5568,
            ex = 1471,
            ez = 5759,
            dx = 1856,
            dz = 3072,
        },
    },
}
