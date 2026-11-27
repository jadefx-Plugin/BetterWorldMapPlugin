-- surface_chunks.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: main.lua.
--[=[
BEGINNER WALKTHROUGH: surface_chunks.lua

This is a SET of ["c_X_Z"] = true, not a numbered list of images.
X/Z are indices of 256-world-tile chunks; each 1024px PNG assembles 4x4 original tiles.
The lower map-world corner is X*256,Z*256. The table stores existence, not image bytes.

Example reuse:
  local chunks = require('surface_chunks')
  for key in pairs(chunks) do print(key) end
  local exists = chunks['c_12_13'] == true -- inspect actual keys before assuming existence
main.lua joins keys to Plugin.resources.surface_chunks[key] and projects their positions.
tiles.lua separately retains the original 64-world-tile source image names.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: main.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Generated active surface-chunk resource set: [c_<chunk x>_<chunk z>] = true.
Each 1024x1024 PNG assembles a 4x4 grid of source 256px terrain tiles without resampling.
A chunk spans 256x256 world tiles, with image rows running north to south.
Keys resolve Plugin.resources.surface_chunks[key]. main uses this manifest for culling.
Pure-ocean gaps are supplied by the matching filled ocean background.
]]

-- 4x4 source tiles per 1024px image; 256 world tiles per side.
return {
    ["c_7_11"] = true,
    ["c_7_12"] = true,
    ["c_7_14"] = true,
    ["c_8_10"] = true,
    ["c_8_11"] = true,
    ["c_8_12"] = true,
    ["c_8_13"] = true,
    ["c_8_14"] = true,
    ["c_8_15"] = true,
    ["c_8_16"] = true,
    ["c_9_10"] = true,
    ["c_9_11"] = true,
    ["c_9_12"] = true,
    ["c_9_13"] = true,
    ["c_9_14"] = true,
    ["c_9_15"] = true,
    ["c_9_16"] = true,
    ["c_10_9"] = true,
    ["c_10_10"] = true,
    ["c_10_11"] = true,
    ["c_10_12"] = true,
    ["c_10_13"] = true,
    ["c_10_14"] = true,
    ["c_10_15"] = true,
    ["c_11_10"] = true,
    ["c_11_11"] = true,
    ["c_11_12"] = true,
    ["c_11_13"] = true,
    ["c_11_14"] = true,
    ["c_11_15"] = true,
    ["c_12_10"] = true,
    ["c_12_11"] = true,
    ["c_12_12"] = true,
    ["c_12_13"] = true,
    ["c_12_14"] = true,
    ["c_12_15"] = true,
    ["c_13_10"] = true,
    ["c_13_11"] = true,
    ["c_13_12"] = true,
    ["c_13_13"] = true,
    ["c_13_14"] = true,
    ["c_13_15"] = true,
    ["c_14_7"] = true,
    ["c_14_8"] = true,
    ["c_14_9"] = true,
    ["c_14_11"] = true,
    ["c_14_12"] = true,
    ["c_14_13"] = true,
    ["c_14_15"] = true,
    ["c_14_16"] = true,
    ["c_14_17"] = true,
    ["c_15_6"] = true,
    ["c_15_7"] = true,
    ["c_15_8"] = true,
    ["c_15_11"] = true,
    ["c_15_12"] = true,
    ["c_15_13"] = true,
    ["c_15_15"] = true,
    ["c_15_16"] = true,
    ["c_15_17"] = true,
    ["c_16_5"] = true,
    ["c_16_6"] = true,
    ["c_16_7"] = true,
    ["c_16_12"] = true,
    ["c_16_13"] = true,
    ["c_16_14"] = true,
    ["c_16_15"] = true,
    ["c_16_16"] = true,
    ["c_16_17"] = true,
    ["c_17_7"] = true,
    ["c_17_12"] = true,
    ["c_17_13"] = true,
    ["c_17_14"] = true,
    ["c_18_12"] = true,
    ["c_18_13"] = true,
    ["c_18_14"] = true,
}
