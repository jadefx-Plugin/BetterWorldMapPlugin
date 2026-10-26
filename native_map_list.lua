-- native_map_list.lua
-- Used by: map_areas.lua.
-- Provides the native map-selector names and IDs used by dropdown construction.

--[=[
BEGINNER WALKTHROUGH: native_map_list.lua

The returned table is an ordered LIST of allowed map-area IDs, not area definitions.
28 is surface, 0 is a valid Ardougne Underground ID, and 753 is restored Scabarite Cavern.
The array position is NOT the ID.

Example reuse:
  local definitions = require('map_areas_data')
  for _, id in ipairs(require('native_map_list')) do
      if definitions[id] then print(id, definitions[id].name) end
  end
map_areas.lua filters raw definitions through this list and constructs dropdown labels.
Adding an ID does not create terrain; its geometry, tile metadata and images must also exist.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: map_areas.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Allowed map-selector area IDs in native enum-708 order, plus restored area 753.
map_areas uses this list to exclude internal/unrendered variants from the selector.
Scabarite Cavern is an explicit extension backed by a bundled cached image and definition.
A new ID needs matching map_areas_data, area_tiles_data and image resources to be usable.
]]

-- Native map-selector enum 708 plus the explicitly restored cached Scabarite Cavern.
return {
    28,
    31,
    17,
    18,
    12,
    1,
    26,
    21,
    23,
    13,
    19,
    5,
    4,
    20,
    27,
    22,
    9,
    24,
    30,
    25,
    15,
    16,
    3,
    0,
    8,
    719,
    14,
    29,
    2,
    6,
    118,
    35,
    36,
    39,
    40,
    43,
    41,
    45,
    42,
    231,
    682,
    693,
    707,
    718,
    735,
    742,
    758,
    762,
    753,
    164,
    165,
    538,
    667,
    672,
    673,
    681,
    709,
    717,
    720,
    723,
    724,
    728,
    729,
    731,
    734,
    741,
    748,
    751,
    757,
    759,
    761,
    764,
    765,
    766,
    767,
    768,
    680,
    760,
    763,
    736,
    737,
    738,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    383,
    384,
    385,
}
