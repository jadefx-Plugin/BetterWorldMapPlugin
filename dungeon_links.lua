-- dungeon_links.lua contains bundled reference data. See its schema below and CODE_GUIDE.md.
-- Used by: dungeon_navigation.lua, pin_tooltip.lua, world_map_icons.lua.
--[=[
BEGINNER WALKTHROUGH: dungeon_links.lua

Each [surface pin INDEX] = destination AREA ID links TWO other tables.
The key addresses world_map_data.lua, not a sprite/category; the value addresses
map_areas_data via map_areas.lua. Destination 0 is valid and truthy in Lua.

Example reuse:
  local target = require('dungeon_links')[1312] -- Scabarite pin -> area 753
  if target ~= nil then print(require('map_areas').Get(target).name) end
world_map_icons.lua.DungeonAt returns this target; main.lua.selectArea changes the displayed
map. pin_tooltip.lua uses link presence for a click hint. A missing key means no mapped
destination, even if dungeon_details.lua has a name for that entrance.

Cross-file connections:
  No require dependencies inside this file.
  Required directly by: pin_tooltip.lua, world_map_icons.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Clickable surface entrance destinations: [world_map_data index] = map-area ID.
Most links are resolved from native entrance targets; confirmed named links supplement
those targets (Kalphite Hive and restored Scabarite Cavern). The pin index is a stable
foreign key, not a category ID. Destination 0 is valid (Ardougne Underground) in Lua.
No route is followed: selecting an entrance changes the displayed plugin map only.
]]

-- Native entrance targets and confirmed named destinations to usable local map-area IDs.
return {
    [2] = 735,
    [33] = 762,
    [582] = 36,
    [588] = 12,
    [589] = 43,
    [590] = 718,
    [591] = 718,
    [594] = 0,
    [595] = 0,
    [596] = 0,
    [597] = 0,
    [598] = 0,
    [599] = 0,
    [600] = 0,
    [601] = 31,
    [602] = 31,
    [603] = 31,
    [604] = 31,
    [605] = 31,
    [606] = 31,
    [607] = 31,
    [608] = 31,
    [609] = 31,
    [610] = 31,
    [611] = 31,
    [612] = 17,
    [613] = 17,
    [614] = 18,
    [615] = 18,
    [616] = 18,
    [617] = 18,
    [618] = 118,
    [619] = 21,
    [620] = 23,
    [621] = 23,
    [622] = 23,
    [623] = 23,
    [624] = 23,
    [625] = 13,
    [626] = 13,
    [627] = 13,
    [628] = 13,
    [629] = 13,
    [630] = 19,
    [631] = 5,
    [632] = 4,
    [633] = 20,
    [634] = 27,
    [635] = 22,
    [636] = 9,
    [637] = 24,
    [638] = 25,
    [639] = 15,
    [640] = 16,
    [641] = 16,
    [642] = 3,
    [643] = 3,
    [644] = 719,
    [645] = 8,
    [646] = 8,
    [647] = 8,
    [648] = 14,
    [649] = 14,
    [650] = 14,
    [651] = 14,
    [652] = 29,
    [653] = 2,
    [654] = 2,
    [655] = 2,
    [656] = 6,
    [657] = 6,
    [658] = 6,
    [659] = 6,
    [660] = 6,
    [661] = 31,
    [662] = 27,
    [663] = 21,
    [664] = 25,
    [665] = 6,
    [666] = 6,
    [667] = 40,
    [668] = 40,
    [669] = 41,
    [671] = 41,
    [672] = 41,
    [673] = 41,
    [674] = 41,
    [675] = 719,
    [676] = 719,
    [677] = 719,
    [678] = 45,
    [679] = 42,
    [680] = 693,
    [681] = 707,
    [685] = 6,
    [695] = 758,
    [743] = 20,
    [1312] = 753,
    [1388] = 164,
    [1] = 734, -- Orthen Oubliette
    [24] = 764, -- Highweald Ruins
    [25] = 765, -- Hermit Cave
    [26] = 766, -- Blighted Cave
    [27] = 767, -- Hollow Hill
    [31] = 751, -- Fort Forinthry Prison
    [32] = 759, -- Fort Forinthry Grove Cave
    [682] = 709, -- Empty Throne Room
    [684] = 673, -- Zamorakian Crypt
    [761] = 761, -- Crafting Guild Mine
    [694] = 681, -- V's Island (interior)
    [758] = 728, -- Dig Site: Stormguard Citadel
    [749] = 768, -- Dig Site: Moonrise
    [746] = 723, -- Dig Site: Everlight
    [745] = 538, -- Ramarno's forge
    [744] = 748, -- Ungael Ritual Site
    [592] = 717, -- Slayer Tower Resource Dungeon
    [593] = 667, -- Kal'gerion Resource Dungeon
    [760] = 757, -- Porcelain Clay Mine
    [30] = 741, -- Crypt
    [683] = 672, -- Silverlight Crypt
    [759] = 729, -- Dig Site: Warforge
    [752] = 731, -- Dig Site: Orthen
    [751] = 731, -- Dig Site: Orthen
    [750] = 731, -- Dig Site: Orthen
    [748] = 720, -- Dig Site: Kharid-et
    [747] = 724, -- Dig Site: Infernal Source
    [753] = 731, -- Dig Site: Orthen
}
