# Bestiary location attribution

Source: RuneScape Wiki contributors, retrieved 2026-10-20 Licensed under CC BY-NC-SA 3.0: https://creativecommons.org/licenses/by-nc-sa/3.0/

Source site: https://runescape.wiki/ - NPC map, Monster map and LocLine templates,.

This adaptation filters the local wiki_npcs.lua dataset to monsters and non-monster NPCs on plane 0, main-world map ID 28, inside the supplied surface-map coverage, transformed from game coordinates to the native surface-map positions. It groups positions by monster name and removes duplicate coordinates. The derived bestiary_data.lua and npc_data.lua remain under CC BY-NC-SA 3.0. It includes 440 names and 6,140 positions. No new live Wiki requests were made for this adaptation.

These are static reference locations and may include variants or conditional availability. They are not current spawn counts, live detections or guaranteed accessible monsters. Dungeon and instance locations are excluded.


NPC catalogue: 1,876 non-monster NPC names and 4,287 distinct surface reference positions, using the same coordinate transforms and license.

Monster levels/drop tables: fetched from 437 expanded RuneScape Wiki pages on
2026-10-21 and associated with the 440 Bestiary names. The derived
monster_drops.lua is also CC BY-NC-SA 3.0, attributed to RuneScape Wiki contributors.
It contains combat levels for 406 names and drop lists for 373 names. Source URLs,
revision IDs where available, and retrieval date are retained per entry. Drop
items, quantities and rarity are extracted from item-drop tables in drop/loot/
reward sections. Tables can combine variants and conditional/shared drop tables;
page-specific prose/footnotes are not reproduced in the item tooltips. Missing data
is explicitly marked. The plugin makes no live Wiki requests.


## Teleport destination cross-checks

Jewellery destination names/options were checked against the local native item cache and public RuneScape Wiki reference pages (2026-10-25): [Amulet of glory](https://runescape.wiki/w/Amulet_of_glory), [Combat bracelet](https://runescape.wiki/w/Combat_bracelet), [Skills necklace](https://runescape.wiki/w/Skills_necklace), [Games necklace](https://runescape.wiki/w/Games_necklace), [Ring of duelling](https://runescape.wiki/w/Ring_of_duelling), and [Ring of Wealth](https://runescape.wiki/w/Ring_of_Wealth). Destination-area map anchors are approximate reference locations, not copied article text or guaranteed landing tiles. Spell/tablet identities and static destination coordinates use existing local native cache exports, not live Wiki requests by the plugin.

Cape destination cross-checks: [Slayer cape](https://runescape.wiki/w/Slayer_cape) and [Dungeoneering cape](https://runescape.wiki/w/Dungeoneering_cape). Destination names are paraphrased reference data; icons use native item IDs 9786 and 15706.

Teleport catalogue expansion cross-checks: [Teleportation](https://runescape.wiki/w/Teleportation), [Laniakea](https://runescape.wiki/w/Laniakea), [Collectors](https://runescape.wiki/w/Collectors), [Master camouflage outfit](https://runescape.wiki/w/Master_camouflage_outfit), [Nature sentinel outfit](https://runescape.wiki/w/Nature_sentinel%27s_outfit), [Passing bracelet](https://runescape.wiki/w/Passing_bracelet), [TokKul-Zo](https://runescape.wiki/w/TokKul-Zo), [Ring of respawn](https://runescape.wiki/w/Ring_of_respawn), [Teleport scroll](https://runescape.wiki/w/Teleport_scroll), and individual item/outfit pages referenced in data records. Native artwork remains referenced by local item/sprite IDs. See TELEPORT_COVERAGE.md for precision and limitations.


## Underground Bestiary expansion (2026-10-25)

Reparsed the existing cached Wiki revision source files from the 2026-10-20 import, retaining Monster map, eligible NPC map and LocLine records with explicit supported sub-map IDs instead of discarding every map ID except 28. No new Wiki requests were made for this expansion. Added 412 grouped sub-map records, containing 332 names absent from the original catalogue and 5,541 distinct reference positions across 58 supported maps. The merged Bestiary contains 772 unique names. One out-of-bounds Melzar the Mad coordinate was excluded rather than assigned a guessed location. Unsupported map IDs and historical map-version templates remain excluded. Sub-map coordinates use that map's display space; native source projection is used only when coordinates are outside its display bounds.

`bestiary_submaps.lua` is adapted RuneScape Wiki contributor data under the same CC BY-NC-SA 3.0 license. Existing surface locations are retained. Reference records may describe conditional/quest variants and are not live spawn guarantees. Coverage is limited to supported maps with coordinates in the cached source; this is not a claim that every monster in every dungeon has a bundled reference.


All source/retrieval notes above describe preparation of the bundled catalogue. The distributed Lua performs no HTTP requests, Wiki searches or remote updates. Developer contact is jadefx.plugins@gmail.com; feedback/contribution proposals use Mod.io comments.