# Resource dungeon and sub-map resources

Resource-dungeon entrances use the native dungeon pin. Hover cards show the Dungeoneering entry level, access/achievement requirements, resources and creatures inside, then teleport items. Travel that lands nearby is labelled separately. The cape/ring marker is no longer drawn over the entrance.

All 22 dungeons in the current published list are covered, including Edimmu's currently published 92 Dungeoneering entry requirement. The entry level is distinct from the level or unlock needed to use a teleport item. These are bundled reference facts, not live checks of the player's inventory or entry eligibility.

Nineteen interiors have bundled native images and clickable links; their exit markers retain previous-map navigation. Daemonheim Peninsula is on the main surface. Dragontooth Island and Flesh-hatcher Mhekarnahz have entrance cards but no bundled interior image, so those markers do not open an unrelated or invented map. The map selector now exposes the named resource interiors and needed parent maps.

The offline cache scan covered all 100 supported/restored sub-maps and 497 source regions, projecting scenery placements through each map's native source/display segments. The resulting overlay contains 450 harvestable-resource/utility points across 29 maps, plus 17 interior exits. These are static reference locations, not live availability indicators. Mining and woodcutting pins use existing resource toggles; entrances have an Activities > Resource dungeons toggle.

Dwarven Mines has 43 rock placements. The Dwarven Mine resource dungeon has seven gold, four mithril and four phasmatite rock placements, one deposit box, and a native exit. Phasmatite access is explicitly labelled as requiring hard Daemonheim achievements. Tooltips reuse bundled native resource/item/level records where a named resource matches; unsupported requirements are not guessed.

## Sources

- [Resource dungeons](https://runescape.wiki/w/Resource_dungeons): full list, entry requirements, resources and creatures.
- [Dwarven Mine resource dungeon](https://runescape.wiki/w/Dwarven_Mine_resource_dungeon): rock counts, deposit box and achievement-gated extension.
- [Dungeoneering cape teleport table](https://runescape.wiki/w/Template:Dungeoneering_cape_teleports) and [Hoardstalker ring](https://runescape.wiki/w/Hoardstalker_ring): travel coverage.
- Individual linked dungeon pages: additional access notes and nearby travel.
- Local game-cache scenery placements, map segments and bundled resource records: sub-map positions, names and tooltips. No third-party map-renderer code or rendered tiles were imported for this update.

Per-dungeon catalogue and extraction counts are in dev/audits/resource_dungeon_audit.json. Original offline data assembly is in dev/tools/build_resource_data.py; run it from the workspace root with the cached exports under work/ and Python/Lupa available. It is not run by the game plugin.

## Visual contents and teleport rows (0.12.10)

Contents now reuse standard resource rows with tool artwork, native bundled skill requirements, and output-item images. Dwarven Mine gold/mithril/phasmatite rows retain their individual Mining levels and ore images; the phasmatite row includes its hard-achievement access requirement. Teleport items have individual inventory images: Dungeoneering cape 18508, master cape 19709, and fully charged Hoardstalker ring 28581. Ring text distinguishes its previous-visit requirement and inside arrival. Creature summaries remain text rather than being represented by unrelated inventory art. Long cards use the existing mouse-wheel paging. Original offline assembly: dev/tools/build_resource_visuals.py.
