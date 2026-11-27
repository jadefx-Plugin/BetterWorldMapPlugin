Feel free to do what you want with the code associated with this release, feed it to AI, mess around with it. use code. its all free to everyone, if you want to credit me in your projects for used code go ahead, if not i could care less.


# Better World Map

A separate movable map window using terrain images rendered from the local RS3
beta cache. The normal world map can stay closed while this window is open.
This is an initial terrain prototype, not a complete replacement for every native
world-map feature. No native interfaces are modified.

## Project organization

See [the project layout](docs/PROJECT_LAYOUT.md) to find each feature,
[the code guide](docs/CODE_GUIDE.md) for the runtime flow,
and [CHANGELOG.md](CHANGELOG.md) for version history. Runtime code is grouped
under `src/`, reference tables under `data/`, and active artwork under `resources/`.
Offline tools, tests, audits and archived originals are in `dev/` and are not
included in release ZIPs.

Build an upload with `python dev/tools/package_release.py`; do not ZIP the entire
working tree.

## Load in the beta client

The folder is installed at
`C:\ProgramData\Jagex\RuneScape-BETA\dev_plugins\BetterWorldMap`.
PrettyUI 1.3.3 or newer (dependency 6398181) is required. See [PrettyUI integration](docs/PRETTYUI.md) for the current migration and validation notes.

Run in the developer console:

```
prf
pon BetterWorldMap
```

Disable the older experiment if it is still running:

```
poff WorldMapProbe
```

Close the console to use the map. Drag its title bar to move the window.

## Controls

PrettyUI supplies window resizing and resize cursors. The map remains movable
with RuneScape’s interface locked. Settings > Transparency offers an optional
**Match game background transparency** toggle; it defaults off.

- Compact Bestiary header beneath the left overview: expand/collapse the search,
  styled with PrettyUI's collapse control like the world map's section headers.
  Type a name to filter a scrollable single-selection list. Selecting a monster
  jumps to its nearest recorded supported surface location and draws orange pins.
  leaves the section open. Clear markers removes the selected monster's pins.
  The list currently contains
  440 monster names and 6,140 distinct reference positions from the existing local
  Wiki dataset; these are reference locations, not live monster detections.
- NPCs header below Bestiary: the same searchable list for 1,876 non-monster NPC
  names and 4,287 recorded surface locations, including shopkeepers and Wise Old
  Man. Opening one catalogue collapses the other so both headers remain accessible.
- Left overview: click anywhere to centre the main map there. The red frame shows
  the main viewport and the gold square marks your character.
- Left sidebar: overview and expandable Bestiary. Label and Size controls are in
  the top toolbar to leave room for the larger overview.
- Drag the terrain to pan. Panning turns off player follow.
- Mouse wheel or upper-right minus/percentage/plus controls: zoom
  (0.25â€“8 interface units per world tile).
- Follow me: centre and follow the player on the supported surface.
- Size: switch between 820Ã—600 and 1080Ã—760 windows.
- Drag a window edge or corner using PrettyUI's built-in resize handles. Minimum size
  is 820Ã—600; the map expands with the window and Bestiary gains more list space.
- Close button: hide the map. M: show/hide it again.
- `poff BetterWorldMap`: disable and remove the plugin's window.

The gold square is your position; town names are a small bundled set of labels.
This interface does not move the character when clicked.

## Monster drop popup

Right-click a monster and choose **View drops** to open its drop window directly.
This option appears for monsters with bundled drop data and preserves the normal
left-click action.

Select a monster in Bestiary, then click one of its red map pins. A separate
PrettyUI window opens to the right of the map (clamped to the screen when space
is limited), with the monster's name as its title, combat level and a seven-column
item-icon grid. It has no monster list. Scroll the popup to see additional drops;
hover an icon for the item name, drop rate and quantity. Close it with its X.
Map wheel zoom and panning continue to work while the popup stays open.
Selecting another entry or clearing markers closes it.

Icons use native item IDs matched by name from the local game cache. Wiki entries
without an inventory icon use a question mark with the same tooltip information.
Rates are bundled offline reference data, updated on 26 November 2026, including
Jagex's November 23 rebalance. Item tooltips retain mode, enrage, task, quantity
and other available conditions. Source URLs, Wiki revisions and retrieval dates
are in `data/catalogues/drops/`. See [drop data details](docs/DROP_DATA.md) and
[Wiki attribution](docs/WIKI-NPCS.md).

The Ghrazi Blood Knights share one drop table across map and context-menu
actions. Their Bestiary reference pin marks the Crimson Gate entrance in
Shuruk-Ba; the repeatable combat variants receive the boss drop action.

## In-game entity highlights

Selecting a Bestiary or NPC result also highlights matching loaded NPC entities
with an orange 3D wire box and their live display name overhead. Boxes use the
entity's current AABB, with a grid-sized fallback if bounds are unavailable.
Scraped config IDs match variants; exact case-insensitive names are the fallback
when the catalogue has no IDs. Labels follow rendered entities and are removed
when they disappear, the selection changes, markers are cleared, or the plugin
is disabled. Box depth testing is enabled. Only the selected type is highlighted.
Highlights continue while the map window is hidden. The new highlighting logic
was tested against simulated API events; in-client placement still needs checking.

## Terrain and limits

1,231 PNG tiles (256Ã—256 each, 64Ã—64 world tiles, four pixels per tile) were
rendered using RSMV's 2D SVG renderer and the 34 source/destination rectangles in
native world-map area 28. This adds Anachronia, Havenhythe and southern islands in
their world-map positions and excludes unrelated off-map/test terrain. Player and
Bestiary reference positions use the same mapping. Of 1,275 defined map-square
slots, 44 had no renderable local data and remain ocean background; complete
coverage is not guaranteed. The beta cache supplied most files, with 45 more
supplied by the installed normal-game cache. Map geometry is north-up.

Only plane 0 is exported. Player following/marking is suppressed on other planes
and in instances. Underground areas using different coordinates are not supplied.
Native location search, full icon catalogues, quest markers, navigation and dungeons
are not included. Rendering from the cache may differ from the
native map's exact styling and dynamic state. The exporter emitted some opcode
end-of-file warnings; sample terrain was visually inspected, not every region.

The plugin loads supplied PNG resources and reads the player's coordinates through
the official API. It does not read the cache at runtime, capture the screen, use
HTTP, inject inputs, or access account/settings files. Image resources are loaded
by the client on demand. The native API and PrettyUI integration still require
an in-client check by the user; this build was validated with simulated UI/API
objects and map projection checks, without desktop automation.

## Provenance

Terrain assets originate from the user's local RuneScape beta and normal caches; underlying
RuneScape artwork belongs to Jagex. This is a local development prototype, not a
published plugin. A real creator contact must be added before a submission.

Decoder/renderer: https://github.com/skillbert/rsmv

Source revision: `a92b8920b9b9842adde78822646ecad1a6f4fc15`.
The decoder ran outside the game with the cache opened read-only and build 951
selected to match the observed beta client. No RSMV code is bundled into the
runtime Lua plugin; the map-build folder contains the export driver for use with
that external tool's source checkout and its dependencies.



Map markers use simple outlined red pins for selected mobs and a white pin for the player. The pointed tip marks the exact map position.

## World-map icons

The Map icons button toggles 2,439 cached surface-map markers using native game
sprites. Locations combine standalone world-map markers with scenery map labels,
projected into the same area-28 surface layout as the terrain. Unsupported or
uncached regions are excluded. Icons are reference locations: quest progress and
other conditional availability are not evaluated. This does not enable transport
or other game actions when clicking a marker.

## Map key and hover details

Open Map key below the overview/Bestiary/NPCs headers. Toggle a whole group,
expand it with + to select individual marker types, or use Select / deselect all.
The key uses 130 native marker types grouped into Quick Links, Events, Navigation,
Activities, Shops / Trading, Facilities and Resources. It scrolls within the sidebar.
Hover a visible map icon for its type and cached location label, including mine
names and fairy-ring codes where supplied by the cache. These reference tooltips
do not reproduce the original client's full item/requirement panels or quest state.

## Rendering limits and Havenhythe repair

Map icons are precomposed PNG sprites (one component per marker). The renderer
keeps at most 550 visible, merges markers within a 16-pixel cell and prioritizes
banks/navigation. Zoom in or filter types to inspect dense areas. Mob pins are
limited to 200 visible cells. Key rows are allocated only for the expanded group;
opening another group releases them. This prevents the client 4096-component
limit from being exhausted by large maps and expanded key controls.

110 Havenhythe tiles were regenerated from the normal client's fuller local cache
with scenery outlines, and the named settlements now use cached label positions.
The exported terrain palette still differs from the original client's world map.

Unclassified Other activity markers are excluded. Map hover tooltips use the view overlay context to follow the cursor at the map's actual screen position.

Lodestone tooltips name all 28 imported surface destinations, consistently across all 81 icon variants (for example Lumbridge Lodestone and Havenhythe Lodestone).


## Original BWM terrain renderer (0.12.0)

The surface map now uses src/render/terrain_renderer.lua, authored for Better World Map, with
an original local atlas builder in dev/tools/build_terrain.cjs. Neither file imports
implementation code from ClueTrainer, PrettyMap, RuneApps, or rsmv. The existing
PrettyUI dependency remains responsible for native window controls.

The renderer selects 256-, 512-, 1024-, or 2048-world-tile image chunks according
to zoom, using shared pixel edges and releasing off-screen sprites before allocating
incoming ones. It caches unchanged view geometry and falls back to the existing
surface_chunks images when new atlas resources have not yet registered. Underground
maps, marker positions, filters, search, drop popups, navigation and saved preferences
retain their existing paths.

The input art is this project's existing exported RuneScape terrain, not imagery
copied from another plugin. Earlier terrain generation used cache tools; this change
does not replace that historical image-generation step or change ownership of the
game artwork. The new zoom atlas improves tile management and overview sampling,
but does not add missing scenery or make the base imagery match ClueTrainer.

To rebuild the atlas from local resources/surface_chunks images, install the Sharp
image-processing dependency in tools, then run `npm run build` there. The builder
uses standard PNG compositing/resampling and records SHA-256 input hashes and level
counts in dev/audits/terrain_build.json. It makes no network requests. Sharp is an external
image-processing dependency; no map-renderer source or third-party tile server is used.

After installing this update run `poff BetterWorldMap`, `prf`, then
`pon BetterWorldMap` to register the new own_terrain images.


The 0.12.1 coordinate audit corrects eleven elder-tree destinations and verifies
35 native spell-coordinate records. Other custom destination-area markers are
not asserted to be exact landing tiles. Legacy colour seams remain baked into
the underlying 64-tile terrain exports; the new atlas renderer does not alter
their palette or reproduce native neighbour-aware floor blending.
