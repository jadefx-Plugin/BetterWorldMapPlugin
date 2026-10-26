# Beginner's guide to the code

Read [README.md](README.md) first to learn the controls. This guide explains how those controls connect to the Lua files. You do not need to understand the whole project before changing a small feature.

## A useful reading order

1. **bestiary_data.lua:** inspect one monster record. It contains a name, native NPC IDs and reference locations.
2. **bestiary.lua:** follow search(query) and nearest(entry, x, z, areaID). They return ordinary data and create no UI.
3. **main.lua:** find makeCatalog, refreshResults and selectMonster. These connect a search field to the selected result.
4. **virtual_results.lua:** see how the complete result list stays in Lua while only visible rows become native UI controls.
5. **reference_pins.lua:** follow Draw into pin_mask.Build. Locations become pixels on one Canvas. Hit supplies the hovered monster's name/level.
6. **map_preferences_ui.lua:** follow Open to see how the settings pages are built. The callback in main updates appearance and calls saveSettings.
7. **map_settings.lua:** follow normalize, Save and the reload constructor. This is the boundary between mutable UI choices and local storage.

The first comments in each file describe its responsibility. Notes such as "This part chooses normal or walking transparency" introduce behavior; comments around a require explain a connection only where it is useful. Data files explain their record schema before the large tables.

## Lua building blocks

| Code | Meaning |
| --- | --- |
| `local x = ...` | A name visible only inside its enclosing scope. |
| `local M = {}; return M` | A module exports a table of functions/data. |
| `require("map_math")` | Loads map_math.lua and normally reuses the cached result afterwards. It does not fetch a website. |
| `M.search(query)` | A dot call: arguments are exactly those written. |
| `controller:Draw(...)` | A colon call: Lua also passes controller as the first argument, named self. |
| `{name = "Goblin"}` | A table with a field; read it with entry.name. |
| `{{x = 1, z = 2}}` | A list containing one coordinate record. Lists usually start at 1. |
| `{[28781] = true}` | A set keyed by an ID, not a list with 28,781 entries. |
| `ipairs(list)` | Visits consecutive list entries in order. |
| `pairs(table)` | Visits existing keys; their order is not guaranteed. |
| `nil` | Missing/unavailable; different from false and from the valid map ID 0. |
| `pcall(function() ... end)` | Returns a success flag and result/error. Used when a native entity may disappear. |
| `0xRRGGBBAA` | Packed red, green, blue and alpha colour bytes. |
| `dirty = true` | Requests a later map update rather than drawing inside every input callback. |

## Data records are not executable actions

A monster entry looks like this shortened example:

```lua
{
    name = "Abyssal beast",
    ids = { [28781] = true },
    locations = {
        { x = 3008, z = 3755 },
        { x = 3014, z = 3749 },
    },
}
```

This describes one monster type. ids is a membership set: entry.ids[28781] tells you whether that native config belongs to the entry. locations is an ordered list of possible reference positions, not a list of currently loaded monsters. Adding a record does not spawn, detect or move anything.

To reuse it:

```lua
local catalogue = require("bestiary_data")
local search = require("bestiary")
local matches = search.search("abyssal", catalogue)

for _, entry in ipairs(matches) do
    for _, point in ipairs(entry.locations) do
        local mapID = point.areaID or 28
        -- Use mapID together with x/z; different maps have different layouts.
    end
end
```

Missing areaID means surface map 28. Underground records carry an explicit map ID. bestiary_submaps merges additional IDs/positions into the catalogue by exact name; changing an alias can affect that merge.

Other data families:

| Files | One chunk means |
| --- | --- |
| world_map_data, map_areas_data | One native marker, or one area's bounds/segments/markers/labels. |
| surface_chunks, tiles | Sets of resource keys: existence, not image bytes. Surface chunks are the runtime terrain set; tiles retains original source-tile metadata. |
| area_tiles_data | One area ID maps to its tiled terrain pieces and resource keys. |
| monster_drops, monster_drop_additions | A monster-name lookup with level, drop rows and provenance. Rates are reference text, not predictions. |
| drop_item_ids | Item-name to native object-ID lookup for drop artwork. |
| npc_data | NPC names/config IDs/reference locations; the schema resembles Bestiary. |
| teleport_data, teleport_extra_data, skillcape_data | A destination/method record with category, artwork and reference requirements. |
| pin_details, navigation_details, dungeon_details | Typed hover-card records associated with native surface marker indices. |
| quest_card_data | Quest descriptions and requirement references keyed by native quest ID. |
| dungeon_links, dungeon_exits_data, dungeon_routes_data | Verified map destinations, return positions and internal endpoint pairs. |
| boss_drop_names | Explicit lower-case names/aliases used only by the boss drop-menu preference. |
| pin_mask | Grayscale/alpha samples of the bundled pin, not geography or NPC state. |

Read the individual header before editing: native marker indices, map IDs, config IDs and object IDs are different namespaces. Do not exchange them just because they are numbers.

## How a frame becomes a map update

main.create builds the window, sidebar, controls and renderer owners. Input callbacks change view state and set dirty. Event.Logic checks the configured shortcut and exposed local state, then calls draw only when needed and when the map is visible.

There are separate caches:

- The terrain/label key contains area, center, zoom, dimensions and label visibility. A player-only update reuses the terrain layout.
- world_map_icons caches eligible static/travel markers independently of player motion. Zoom changes projection, not which arbitrary marker wins a grid cell.
- reference_pins caches the selection, viewport and appearance. Exact duplicate world tiles are merged; there is no 200-pin cap or screen-cell winner scheme.
- pin_mask.Build runs when colour, opacity or size changes. Its non-overlapping pixel runs preserve the original pin outline without per-pin native components.
- nearby_npcs keeps the most recently enumerated loaded-NPC list. Map panning updates only projection; list enumeration has its own slower logic cadence. Event.Draw samples live positions for smooth movement, but its Canvas is rebuilt only when rounded positions/appearance change. Dot records and deterministic ordering are reused; membership changes alone trigger sorting.
- visual_updates avoids duplicate absolute SetPos and hidden writes on supported plugin-owned visuals.
- Tooltip layouts are rebuilt when content, page or available space changes; stationary cards reuse their layout.

Local polling is still necessary: the plugin needs current movement, loaded entities and exposed quest/skill changes. A poll that finds no change must not cause an unnecessary visual write. This audit does not claim zero CPU work while the window is open or measured FPS improvements in the real client.

When all quest states are visible, quest filtering skips its native checks. When teleport requirement hiding is off, that filter skips its native checks. When enabled, requirement snapshots refresh periodically and unknown values remain visible. Only displayed/eligible data is rendered.

## Transparency: one owner per visual

movement_opacity samples only the local player's exposed movement. Normal and walking preferences choose an absolute opacity factor. Main defers the generic alpha reconciliation until after UI changes, avoiding two full traversals per logic tick.

Containers organize layout; fading every parent would multiply nested alpha. The controller visits drawable descendants and preserves each original alpha. Native 8-bit readback tolerance prevents repeated fading from compounding.

Marker renderers own their final alpha and are excluded from generic traversal:

- world_map_icons applies command tint to its Canvas and explicit component alpha to associated-object inventory icons.
- reference_pins combines map opacity and the selected monster/NPC transparency once.
- nearby_npcs combines map opacity and monster transparency for live dots.

The cog is a child of the map title bar and is excluded from map fading. The separate settings window stays opaque. Do not remove those exclusions or a fully transparent map could become difficult to configure.

## Settings and persistence

map_preferences_ui builds Pins, Transparency, Drop menu and Controls once. Left-side buttons show the appropriate page. The two colour controls use wheel_picker and colour_math; accepted changes update the shared appearance table.

main.saveSettings copies current appearance/filter values plus window geometry. If the native geometry is unavailable at shutdown, it uses the last saved geometry and still writes current preferences. Edits save immediately; periodic/shutdown snapshots are fallbacks.

map_settings validates numeric limits and known booleans. Colours are numeric RGBA in memory but persisted as exact #RRGGBBAA strings. Older numeric colours are accepted on load. A stable fingerprint avoids identical database writes. A thrown error or a result other than true does not advance the successful fingerprint, allowing a retry.

Storage key: better_world_map_settings_v1. It is scoped to this plugin by PersistentDB. Only preferences are retained; loaded-NPC caches, hit targets and map-view history are session-only. No HTTP, arbitrary filesystem, telemetry or remote database path exists in the runtime.

## Coordinates and dungeon navigation

Three units appear in the code:

1. World tiles: x east/west, z north/south, plus level/floor.
2. Map-display tiles: underground maps arrange pieces using source/destination segment offsets.
3. UI pixels/units: the Canvas positions returned by map_math.project.

map_areas.Project converts exposed source coordinates only when the position belongs to the selected area's configured segment/floor. map_areas.Find detects a supported map using those bounds. Unsupported or instanced positions can be unavailable; do not guess a destination.

Map switches replace terrain and marker data together. selectArea stores the previous view only for a real forward change. Return clicks pop that view; an empty stack falls back to surface. Dropdown visibility is separate from whether a hidden map can be detected or opened by a named link.

Some return pins are explicit map-view shortcuts, not native exits. Unverified internal ladders do not become clickable merely because another room looks nearby. See DUNGEON_ROUTE_AUDIT.md for the limits of the bundled route work.

## Local reference information versus game actions

The plugin reads exposed client state and manipulates its own UI. A travel pin does not teleport; a map click does not walk; View drops opens reference UI. The optional minimap click override covers the existing visible button bounds and opens this map.

The custom shortcut respects typing and key capture. The API does not provide cancellation of the native map key event, so the UI explains manual key rebinding instead of promising an unsupported override.

Static Wiki URL strings provide attribution. They are never passed to HTTP or a browser launcher. PrettyUI is a declared installed dependency, not downloaded by plugin Lua.

## Changing a feature safely

For a new setting, add its default/validation/fingerprint field in map_settings, its control in map_preferences_ui, and its snapshot field in main.saveSettings. Connect onChange to the renderer that owns the affected visual. Test a fresh settings instance after saving; seeing an in-memory change is not a persistence test.

For a new monster, keep exact names consistent across bestiary_data/submaps and monster_drops. Add an explicit areaID for underground references. Unknown drop or level information should stay labelled unavailable, not guessed from another variant.

For a new dungeon link, verify the source marker namespace, target map and endpoints. Register any hidden map data/resources, retain dropdown policy, and provide a local return route. Do not turn an unverified ladder into a guessed connection.

For artwork changes, keep PNG dimensions at or below 1024 by 1024. Active map terrain already uses valid tiles and overview images. Oversized legacy full-map backups were archived outside the plugin during the audit. If changing mob_pin.png, also regenerate pin_mask's samples; otherwise the search pins and source artwork diverge.

Use the same readable formatting as the surrounding code. The included .stylua.toml selects Lua 5.4, four spaces, a 100-column target and Windows line endings. A short comment should explain responsibility, a coordinate assumption or why a workaround exists. Avoid comments that merely repeat an obvious assignment. The submitting developer must understand any AI-assisted changes.

## Verification and live checks

Automated checks cover module syntax, local-only source scanning, literal require/resource resolution, resource dimensions, idle visual-write counters, inactive-filter polling, settings reload/failure handling, pin masks/opacity, hover cards, native key capture, map following and dungeon returns. Test scripts run outside the distributed plugin; they do not add runtime networking or dependencies.

They do not replace client testing. Before submitting, reload and verify dragging/resizing, cog clicks, both visibility toggles, panning/zooming at extremes, hidden-map transitions/returns, search tooltips/drop windows, normal/walking opacity, accepted colours across reload, all filter sections and shutdown/re-enable cleanup. Check the developer console for allocation errors. Test crowded maps as well as an empty/unsupported player position.

See SUBMISSION_REVIEW.md for the exact audit scope, publisher checklist and Jagex references. Moderation approval and performance measurements cannot be established by mock tests.

## File-by-file map

The following index lists every runtime Lua file. Open the linked file to read its data schema or function notes.

| File | Role |
| --- | --- |
| [area_terrain.lua](area_terrain.lua) | Draws the visible pieces of a bundled underground map and releases offscreen pieces. |
| [area_tiles_data.lua](area_tiles_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [bestiary.lua](bestiary.lua) | Searches the bundled monster/NPC catalogues and chooses a nearby reference position. |
| [bestiary_data.lua](bestiary_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [bestiary_submaps.lua](bestiary_submaps.lua) | RuneScape Wiki contributors, CC BY-NC-SA 3.0; see WIKI-NPCS.md. |
| [boss_drop_names.lua](boss_drop_names.lua) | Lists explicit boss names/aliases used by the optional View drops menu filter. |
| [colour_math.lua](colour_math.lua) | Converts colour-wheel positions and HSV values to packed RGBA colours. |
| [drop_item_ids.lua](drop_item_ids.lua) | Bundled reference data; see the schema at the top of this file. |
| [drop_menu.lua](drop_menu.lua) | Adds local View drops menu entries while preserving the native default action. |
| [dungeon_details.lua](dungeon_details.lua) | Bundled reference data; see the schema at the top of this file. |
| [dungeon_exits.lua](dungeon_exits.lua) | Joins bundled underground exits to their local map markers. |
| [dungeon_exits_data.lua](dungeon_exits_data.lua) | Native underground-to-surface exit positions, projected into display tiles. |
| [dungeon_links.lua](dungeon_links.lua) | Bundled reference data; see the schema at the top of this file. |
| [dungeon_navigation.lua](dungeon_navigation.lua) | Decides which dungeon markers may open another map. |
| [dungeon_return.lua](dungeon_return.lua) | Keeps the previous-map stack and prepares return markers for underground maps. |
| [dungeon_routes.lua](dungeon_routes.lua) | Builds local ladder/obstacle links and hover connection lines. |
| [dungeon_routes_data.lua](dungeon_routes_data.lua) | Dungeon navigation additions, consumed by dungeon_routes.Apply in map_areas_data.lua. |
| [live_npc_filter.lua](live_npc_filter.lua) | Keeps only valid, attackable loaded monsters with a bundled drop record. |
| [main.lua](main.lua) | Coordinates plugin startup, map state, controls, local client polling and shutdown. |
| [map_areas.lua](map_areas.lua) | Finds supported maps and converts exposed world coordinates into each map layout. |
| [map_areas_data.lua](map_areas_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [map_click_override.lua](map_click_override.lua) | Optionally captures the visible minimap World Map button to open this plugin. |
| [map_filters.lua](map_filters.lua) | Builds the expandable Quests, Teleports and Extras filter controls. |
| [map_hover.lua](map_hover.lua) | Opens local drop-reference windows and handles clicks on searched monster pins. |
| [map_key.lua](map_key.lua) | Builds category checkboxes and expandable map-key groups. |
| [map_key_data.lua](map_key_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [map_key_subgroups.lua](map_key_subgroups.lua) | Native Activities submenus: enum 8353 names and category struct param 4031. |
| [map_math.lua](map_math.lua) | Converts map tile coordinates into screen pixels and calculates visible bounds. |
| [map_pin.lua](map_pin.lua) | Creates and scales the player-position marker from bundled artwork. |
| [map_preferences_ui.lua](map_preferences_ui.lua) | Opens categorized settings and keeps the cog attached to the title bar. |
| [map_resize.lua](map_resize.lua) | Captures window edge/corner dragging and updates plugin-owned layout. |
| [map_settings.lua](map_settings.lua) | Validates, saves and reloads plugin preferences through local PersistentDB storage. |
| [map_shortcut.lua](map_shortcut.lua) | Matches configurable keyboard shortcuts without interfering with typing or key capture. |
| [monster_drop_additions.lua](monster_drop_additions.lua) | Cached RuneScape Wiki direct drop rows; same license as monster_drops.lua. |
| [monster_drops.lua](monster_drops.lua) | Bundled reference data; see the schema at the top of this file. |
| [movement_opacity.lua](movement_opacity.lua) | Detects local player movement and applies the selected window transparency. |
| [named_dungeon_maps.lua](named_dungeon_maps.lua) | Registers named dungeon destinations with local terrain and link information. |
| [named_dungeon_tiles.lua](named_dungeon_tiles.lua) | Texture-sized pieces for restored hidden maps; merged by area_tiles_data.lua. |
| [native_map_list.lua](native_map_list.lua) | Provides the native map-selector names and IDs used by dropdown construction. |
| [navigation_details.lua](navigation_details.lua) | Bundled reference data; see the schema at the top of this file. |
| [navigation_requirements.lua](navigation_requirements.lua) | Formats the bundled access requirements shown on navigation cards. |
| [nearby_npcs.lua](nearby_npcs.lua) | Projects eligible loaded monsters onto the map using one cached Canvas. |
| [npc_data.lua](npc_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [pin_details.lua](pin_details.lua) | Bundled reference data; see the schema at the top of this file. |
| [pin_mask.lua](pin_mask.lua) | Preserves the original pin shading and smooth outline as cached horizontal pixel runs. |
| [pin_tooltip.lua](pin_tooltip.lua) | Lays out bounded map hover cards and scrolls long reference lists. |
| [quest_card.lua](quest_card.lua) | Draws quest reference cards and exposed requirement/completion checks. |
| [quest_card_data.lua](quest_card_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [quest_hover_assets.lua](quest_hover_assets.lua) | Chooses cached quest badges and skill artwork for reference cards. |
| [quest_pin_filter.lua](quest_pin_filter.lua) | Caches the quest marker visibility selected in Filters. |
| [quest_requirements.lua](quest_requirements.lua) | Formats exposed quest checks without treating unknown state as completed. |
| [reference_pins.lua](reference_pins.lua) | Draws selected monster/NPC reference pins with cached pixel runs and hover targets. |
| [resource_dungeon_maps.lua](resource_dungeon_maps.lua) | Registers hidden resource-dungeon maps and their bundled terrain metadata. |
| [selectable_map_list.lua](selectable_map_list.lua) | Builds the dropdown while keeping hidden dungeon maps reachable through links. |
| [skillcape_data.lua](skillcape_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [sub_dungeon_maps.lua](sub_dungeon_maps.lua) | Registers additional hidden dungeon floors and their local map metadata. |
| [surface_chunks.lua](surface_chunks.lua) | Bundled reference data; see the schema at the top of this file. |
| [surface_config.lua](surface_config.lua) | Bundled reference data; see the schema at the top of this file. |
| [teleport_data.lua](teleport_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [teleport_extra_data.lua](teleport_extra_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [teleport_filter.lua](teleport_filter.lua) | Caches teleport visibility using exposed skills and quest completion only when filtering is enabled. |
| [tiles.lua](tiles.lua) | Bundled reference data; see the schema at the top of this file. |
| [tooltip_metrics.lua](tooltip_metrics.lua) | Measures text with native font metrics and supplies a conservative fallback. |
| [travel_groups.lua](travel_groups.lua) | Combines enabled teleport methods sharing the same destination into one map marker. |
| [travel_requirements.lua](travel_requirements.lua) | Looks up bundled teleport requirements and formats readable reference descriptions. |
| [virtual_results.lua](virtual_results.lua) | Keeps complete search results in Lua while allocating only visible native list rows. |
| [visual_updates.lua](visual_updates.lua) | Avoids native position and visibility writes when plugin-owned visuals have not changed. |
| [wheel_picker.lua](wheel_picker.lua) | Adapts the PrettyUI colour popup into a hue/saturation wheel and brightness strip. |
| [world_map_data.lua](world_map_data.lua) | Bundled reference data; see the schema at the top of this file. |
| [world_map_icons.lua](world_map_icons.lua) | Draws static/travel markers, caches visibility and owns local hover/click hit testing. |


## Following a file connection

Each Lua file now starts with its direct runtime readers (Used by). This list is derived from actual literal require calls with comments excluded, so tutorial snippets do not create fake connections. main.lua is loaded by the client; tiles.lua retains original source metadata and has no active runtime importer. Follow a require to inspect a dependency, or its Used by note to find the caller.
