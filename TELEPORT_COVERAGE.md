# Teleport reference coverage

Reviewed against https://runescape.wiki/w/Teleportation on 25 October 2026,
with linked item/outfit articles and local native item, ability, NPC and map exports.

## Finding the filters

The Map key has a separate **Teleports** heading after Navigation. Its ten filters
are Jewelry, Spells, Tablets, Skillcapes, Skilling outfits, Equipment, Items,
Scrolls, Summoning and Slayer masks. The heading and each filter have independent
checkboxes. Existing saved category IDs retain their meanings. Only one key
heading allocates its child controls at a time.

## Coordinates and meaning

These are reference markers, not executable teleports or claims about a player's
unlocks. Most new markers identify the destination area, not an exact landing tile.
Read the hover note: an **access/entrance** reference marks a way into the destination
when its interior or destination floor is unavailable. Requirements, charge limits,
quest stages, equipped sets and unlocks still apply. These data do not inspect the
bank, inventory or equipment, or activate a teleport.

Laniakea's cape marker now uses the native Orthen Oubliette entrance reference in
south-east Anachronia (display 4095,4047), near Raksha. The old unrelated surface
location is removed. Morvran uses the separate Prifddinas map. Keldagrim and
Dorgesh-Kaan coordinates are projected into their native local map spaces.

## Shared destinations

Charged/compacted jewellery and Passage of the Abyss use the same destination
families as their underlying jewellery. Attuned crystal seeds share the crystal
seed family. Normal/master/trimmed skillcapes share their respective destinations.
Completionist/max capes can inherit configured perks; their Max Guild destination
is represented by the Max cape marker. Outfit variants share the combined outfit
family's fixed destinations. Portable fairy rings and spirit-tree devices use the
existing native network markers. Tele-other/group variants share their corresponding
spell destination and are not duplicated as another icon.

## Destinations without a reliable fixed marker

The following are intentionally not represented as a single fixed landing point:

- Player-owned house interiors, active construction contracts, active clue scrolls
  (Globetrotter jacket), active evil/crystal trees, circus location, random resource
  locators, personal Max Guild portals / Grace of the elves attunements and the
  selected Totem of the Abyss. Their destinations depend on current/player state.
- Ring of life and amulet of nature: automatic/conditional arrival depends on the
  chosen respawn or bound farming patch. Ring of respawn's five options are shown
  separately and labelled as requiring their unlocks.
- Jennica's ring spirit realms, Meeting History's past, enchanted-key journeys,
  quest cutscenes and one-off forced NPC/quest teleports: the necessary destination
  maps/states are not bundled. The same applies to Worldbearer ring's private area,
  Ungael, Runespan floors/Yellow wizard and Dungeoneering gatestones/start rooms.
- Seasonal village/event teleports and Raffle/Lucky Dip tickets are not added as
  permanent destinations. Their availability changes and some ticket artwork is not
  present in this local item export.
- Quest-specific spell sheets, directions and temporary portal destinations still
  need their destination maps and independently verified placement. They are not
  counted as completed fixed-pin coverage.

This is a broad fixed-destination reference catalogue, not a claim that every
possible teleport or every optional arrival tile on the wiki is implemented.
Some multi-floor Slayer-mask options share a surface access marker. Further exact
landing positions require independently verified coordinates for that floor/map.

## Files and extension points

- `teleport_data.lua` merges the original references, cape list and extra catalogue.
  It assigns all custom categories to key group 6. `travel_groups.lua` combines
  enabled methods at identical map coordinates and builds their shared tooltip.
  Distinct nearby destinations stay separate; no zoom-dependent clustering is used.
- `teleport_extra_data.lua` contains the new documented data blocks. Each record's
  `areaID` selects its native map; `x/z` are already display coordinates. Do not run
  those through a world-to-map transform again.
- `skillcape_data.lua` contains the original Slayer/Dungeoneering cape references.
- `world_map_icons.lua` preserves native marker indices, draws native/spell icons
  on Canvas and creates item sprites only for currently visible references.

## Validation

Lua 5.4 syntax checked for every module. Mock renderer checks cover map selection,
independent filters, all 2,439 existing native indices, stable redraws, 80 pan/zoom
transitions and destruction of outgoing item sprites. Every reference is inside
its selected map's bounds. The key controls and saved filter normalization pass.
The existing 2,000-update movement-opacity regression check passes. Native in-game
appearance, exact landing positions and actual teleport availability need in-game
verification; mocks do not establish those facts.

## Added families

| Family | Reference destinations | Filter ID |
|---|---:|---:|
| Traveller's necklace | 3 | 100001 |
| Enlightened amulet | 3 | 100001 |
| Dig Site pendant | 1 | 100001 |
| Ring of Fortune | 2 | 100001 |
| Luck of the Dwarves | 3 | 100001 |
| Hazelmere's signet ring | 4 | 100001 |
| Ring of slaying | 4 | 100001 |
| Ferocious ring | 2 | 100001 |
| Delver's anklet | 3 | 100001 |
| Kethsi ring | 2 | 100001 |
| Passing bracelet | 3 | 100001 |
| Explorer's ring 3 / 4 | 1 | 100006 |
| Karamja gloves 3 / 4 | 1 | 100006 |
| Fremennik sea boots 4 | 1 | 100006 |
| Desert amulet 2 / 3 / 4 | 2 | 100006 |
| Ardougne cloak | 2 | 100006 |
| Wilderness sword | 4 | 100006 |
| Morytania legs | 2 | 100006 |
| Varrock armour 4 | 1 | 100006 |
| Tirannwn quiver | 8 | 100006 |
| Drakan's medallion | 5 | 100006 |
| Enchanted lyre | 4 | 100006 |
| Camulet | 1 | 100006 |
| Broomstick | 1 | 100006 |
| Skull sceptre | 1 | 100006 |
| Pharaoh's sceptre | 3 | 100006 |
| Sceptre of the gods | 4 | 100006 |
| Sixth-Age circuit | 3 | 100006 |
| Skull of Remembrance | 1 | 100006 |
| Dominion medallion | 1 | 100006 |
| Clan vexillum | 1 | 100006 |
| Ring of kinship | 1 | 100006 |
| Witchdoctor mask | 1 | 100006 |
| Cape of legends | 1 | 100006 |
| Max cape | 1 | 100006 |
| Ectophial | 1 | 100007 |
| Crystal teleport seed | 10 | 100007 |
| Captain's log | 1 | 100007 |
| Grand seed pod | 1 | 100007 |
| Juju teleport spiritbag | 1 | 100007 |
| Archaeology journal | 1 | 100007 |
| Memory strand | 1 | 100007 |
| Ancient seed | 1 | 100007 |
| Anachronia Dinosaur Farm teleport | 1 | 100007 |
| Waterfall fishing teleport | 1 | 100007 |
| Arc journal | 1 | 100007 |
| Menaphos journal | 1 | 100007 |
| Shattered Worlds teleport scroll | 1 | 100007 |
| Remora's necklace | 2 | 100007 |
| Goblin village sphere | 1 | 100007 |
| Dorgesh-kaan sphere | 1 | 100007 |
| Plain of mud sphere | 1 | 100007 |
| Bandos throne room sphere | 1 | 100007 |
| Miscellania Teleport | 1 | 100008 |
| Fort Forinthry Teleport | 1 | 100008 |
| Bandit Camp Teleport | 1 | 100008 |
| Pollnivneach Teleport | 1 | 100008 |
| Phoenix Lair Teleport | 1 | 100008 |
| Tai Bwo Wannai Teleport | 1 | 100008 |
| Lighthouse Teleport | 1 | 100008 |
| Clocktower Teleport | 1 | 100008 |
| Gu'Tanoth Teleport | 1 | 100008 |
| Grand Exchange Teleport | 1 | 100008 |
| Void shifter | 1 | 100009 |
| Spirit graahk | 1 | 100009 |
| Spirit kyatt | 1 | 100009 |
| Spirit larupia | 1 | 100009 |
| Arctic bear | 1 | 100009 |
| Lava titan | 1 | 100009 |
| Master archaeologist's outfit | 22 | 100005 |
| Archaeology teleport | 22 | 100007 |
| Master constructor's outfit | 14 | 100005 |
| Master farmer outfit | 4 | 100005 |
| Master camouflage outfit | 13 | 100005 |
| Elder divination outfit | 13 | 100005 |
| Wicked hood | 14 | 100006 |
| Infinity ethereal outfit | 14 | 100005 |
| Modified farmer's hat | 1 | 100005 |
| Modified botanist's mask | 1 | 100005 |
| Modified artisan's bandana | 1 | 100005 |
| Modified blacksmith's helmet | 1 | 100005 |
| Modified shaman's headdress | 1 | 100005 |
| Modified sous chef's toque | 1 | 100005 |
| Modified diviner's headwear | 1 | 100005 |
| Nature's sentinel outfit | 46 | 100005 |
| Volcanic trapper outfit | 18 | 100005 |
| Bonesack / ram skull helm (enchanted) | 1 | 100006 |
| Radiant alchemist's amulet | 1 | 100006 |
| Engrams | 1 | 100007 |
| Rum (Trouble Brewing) | 2 | 100007 |
| TokKul-Zo | 1 | 100006 |
| TokKul-Zo | 1 | 100006 |
| TokKul-Zo | 1 | 100006 |
| TokKul-Zo | 1 | 100006 |
| TokKul-Zo | 1 | 100006 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Obelisk shard / portable obelisk | 1 | 100007 |
| Mask of Broken Fingers | 1 | 100010 |
| Mask of Stone | 1 | 100010 |
| Mask of Reflection | 1 | 100010 |
| Mask of the Kura | 1 | 100010 |
| Mask of the Abyss | 1 | 100010 |
| Mask of Mourning | 1 | 100010 |
| Mask of Gelatin | 1 | 100010 |
| Mask of Dust | 2 | 100010 |
| Mask of Granite | 1 | 100010 |
| Mask of Vines | 1 | 100010 |
| Mask of Crimson | 2 | 100010 |
| Mask of Stench | 1 | 100010 |
| Mask of the Green Wyrm | 1 | 100010 |
| Mask of the Yellow Wyrm | 1 | 100010 |
| Mask of the White Wyrm | 1 | 100010 |
| Mask of Gloom | 1 | 100010 |
| Mask of the Dagannoth | 1 | 100010 |
| Mask of the Troll | 1 | 100010 |
| Mask of the Ganodermic | 1 | 100010 |
| Mask of the Automatons | 1 | 100010 |
| Mask of the Airut | 1 | 100010 |
| Mask of the Black Demon | 1 | 100010 |
| Mask of the Aquanites | 1 | 100010 |
| Ring of respawn | 5 | 100001 |
| Dragon trinkets | 7 | 100007 |
| Metallic dragon trinkets | 4 | 100007 |
| Divination outfits: chronicle teleport | 2 | 100005 |
| Modified diviner's headwear: May Stormbrewer | 1 | 100005 |
| Quest / master quest cape | 8 | 100004 |
| Hoardstalker ring | 21 | 100001 |
| Rimmington tablet | 1 | 100003 |
| Taverley tablet | 1 | 100003 |
| Pollnivneach tablet | 1 | 100003 |
| Rellekka tablet | 1 | 100003 |
| Brimhaven tablet | 1 | 100003 |
| Yanille tablet | 1 | 100003 |
| Menaphos tablet | 1 | 100003 |
| Otot tablet | 1 | 100003 |
| Prifddinas tablet | 1 | 100003 |
| Air altar teleport | 1 | 100003 |
| Mind altar teleport | 1 | 100003 |
| Water altar teleport | 1 | 100003 |
| Earth altar teleport | 1 | 100003 |
| Fire altar teleport | 1 | 100003 |
| Body altar teleport | 1 | 100003 |
| Cosmic altar teleport | 1 | 100003 |
| Chaos altar teleport | 1 | 100003 |
| Nature altar teleport | 1 | 100003 |
| Law altar teleport | 1 | 100003 |
| Death altar teleport | 1 | 100003 |
| Blood altar teleport | 1 | 100003 |
| Runecrafting guild teleport | 1 | 100003 |
| Astral altar teleport | 1 | 100003 |
| Magister teleport tablet | 1 | 100003 |
| 'Chipped' Varrock teleport | 1 | 100003 |
| 'Chipped' Lumbridge teleport | 1 | 100003 |
| 'Chipped' Falador teleport | 1 | 100003 |
| 'Chipped' Camelot teleport | 1 | 100003 |
| 'Chipped' Ardougne teleport | 1 | 100003 |
| 'Chipped' Watchtower teleport | 1 | 100003 |
| Max guild Teleport | 1 | 100002 |
| Skeletal horror Teleport | 1 | 100002 |
| Kandarin monastery Teleport | 1 | 100002 |
| Manor farm Teleport | 1 | 100002 |
| Paddewwa Teleport | 1 | 100002 |
| Mazcab Teleport | 1 | 100002 |
| Watchtower Teleport | 1 | 100002 |
| City of Um Teleport | 1 | 100002 |


## Local runtime and current UI

The sources above were consulted during catalogue preparation; gameplay never searches them. Bundled records are the runtime source. Requirements filtering is under Filters > Teleports, while category visibility remains in Map key > Teleports. Same-location methods are grouped before display, with at most four visible tooltip entries and mouse-wheel scrolling. Shattered Worlds uses the updated Void Knights Outpost courtyard area anchor. Appearance and opacity are configured in Settings and saved locally. See [README.md](README.md) and [SUBMISSION_REVIEW.md](SUBMISSION_REVIEW.md).
