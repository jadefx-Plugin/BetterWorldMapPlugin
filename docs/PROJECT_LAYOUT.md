# Project layout

Start with [`main.lua`](../main.lua), the plugin entry point. All `require()` paths are relative to the plugin root and use forward slashes. Keep `main.lua`, `plugin.json` and `resources/` at the root for the RuneScape host.

| Folder | Contents |
| --- | --- |
| `src/core/` | Keyboard input, saved settings and window opacity |
| `src/map/` | Map selection and coordinate conversion |
| `src/render/` | Surface and submap terrain renderers |
| `src/ui/` | Controls, layout, resizing and list virtualization |
| `src/catalogues/` | Monster/NPC searches, nearby entities and drops |
| `src/pins/` | Pin drawing, hover cards and visibility filters |
| `src/travel/` | Teleport grouping, requirements and navigation details |
| `src/dungeons/` | Dungeon entrances, interiors, resources and return links |
| `src/quests/` | Quest cards, requirements and artwork |
| `src/integration/` | Native context-menu and map-click integration |
| `data/maps/` | Map geometry and terrain manifests |
| `data/catalogues/` | Monster/NPC records and item/drop reference tables |
| `data/pins/` | Map key, placements and tooltip content |
| `data/travel/` | Teleport and skillcape reference tables |
| `data/dungeons/` | Dungeon and resource reference tables |
| `data/quests/` | Quest reference records |
| `resources/` | Active bundled map images, icons and overview artwork |
| `docs/` | Code guide, resource notes and provenance |
| `dev/` | Offline tools, tests, audit reports and archived originals; excluded from uploads |

## Finding a feature

- Map window, overview and event lifecycle: `main.lua`.
- M key and Enter-to-chat protection: `src/core/map_shortcut.lua`.
- Saved geometry and preferences: `src/core/map_settings.lua`.
- Bestiary/NPC sidebar: `src/catalogues/`, with sidebar construction in `main.lua`.
- Monster drops: `src/catalogues/monster_drops.lua` and `src/integration/drop_menu.lua`.
- Pin tooltips: `src/pins/pin_tooltip.lua`, with reference content in `data/pins/pin_details.lua`.
- Resource dungeons: `src/dungeons/resource_dungeons.lua` and `data/dungeons/`.
- Terrain blending/building: `dev/tools/`; runtime terrain drawing: `src/render/`.

## Module inventory

### src/core

- [input_guard.lua](../src/core/input_guard.lua)
- [map_settings.lua](../src/core/map_settings.lua)
- [map_shortcut.lua](../src/core/map_shortcut.lua)
- [movement_opacity.lua](../src/core/movement_opacity.lua)

### src/map

- [map_areas.lua](../src/map/map_areas.lua)
- [map_math.lua](../src/map/map_math.lua)
- [native_map_list.lua](../src/map/native_map_list.lua)
- [selectable_map_list.lua](../src/map/selectable_map_list.lua)

### src/render

- [area_terrain.lua](../src/render/area_terrain.lua)
- [colour_math.lua](../src/render/colour_math.lua)
- [terrain_renderer.lua](../src/render/terrain_renderer.lua)

### src/ui

- [map_dropdown.lua](../src/ui/map_dropdown.lua)
- [map_filters.lua](../src/ui/map_filters.lua)
- [map_key.lua](../src/ui/map_key.lua)
- [map_key_subgroups.lua](../src/ui/map_key_subgroups.lua)
- [map_preferences_ui.lua](../src/ui/map_preferences_ui.lua)
- [map_resize.lua](../src/ui/map_resize.lua) — native resize adapter and title-control layout
- [native_components.lua](../src/ui/native_components.lua) — shared allocator for custom artwork
- [map_toggle_button.lua](../src/ui/map_toggle_button.lua)
- [virtual_results.lua](../src/ui/virtual_results.lua)
- [visual_updates.lua](../src/ui/visual_updates.lua)
- [wheel_picker.lua](../src/ui/wheel_picker.lua)

### src/catalogues

- [bestiary.lua](../src/catalogues/bestiary.lua)
- [live_npc_filter.lua](../src/catalogues/live_npc_filter.lua)
- [monster_drops.lua](../src/catalogues/monster_drops.lua)
- [nearby_npcs.lua](../src/catalogues/nearby_npcs.lua)

### src/pins

- [fairy_ring_hint.lua](../src/pins/fairy_ring_hint.lua)
- [map_hover.lua](../src/pins/map_hover.lua)
- [map_pin.lua](../src/pins/map_pin.lua)
- [pin_mask.lua](../src/pins/pin_mask.lua)
- [pin_tooltip.lua](../src/pins/pin_tooltip.lua)
- [prif_surface.lua](../src/pins/prif_surface.lua)
- [quest_pin_filter.lua](../src/pins/quest_pin_filter.lua)
- [reference_pins.lua](../src/pins/reference_pins.lua)
- [teleport_filter.lua](../src/pins/teleport_filter.lua)
- [tooltip_metrics.lua](../src/pins/tooltip_metrics.lua)
- [world_map_icons.lua](../src/pins/world_map_icons.lua)

### src/travel

- [navigation_details.lua](../src/travel/navigation_details.lua)
- [navigation_requirements.lua](../src/travel/navigation_requirements.lua)
- [prif_teleports.lua](../src/travel/prif_teleports.lua)
- [travel_groups.lua](../src/travel/travel_groups.lua)
- [travel_requirements.lua](../src/travel/travel_requirements.lua)

### src/dungeons

- [dungeon_details.lua](../src/dungeons/dungeon_details.lua)
- [dungeon_exits.lua](../src/dungeons/dungeon_exits.lua)
- [dungeon_links.lua](../src/dungeons/dungeon_links.lua)
- [dungeon_navigation.lua](../src/dungeons/dungeon_navigation.lua)
- [dungeon_return.lua](../src/dungeons/dungeon_return.lua)
- [dungeon_routes.lua](../src/dungeons/dungeon_routes.lua)
- [resource_dungeon_maps.lua](../src/dungeons/resource_dungeon_maps.lua)
- [resource_dungeons.lua](../src/dungeons/resource_dungeons.lua)
- [submap_resources.lua](../src/dungeons/submap_resources.lua)

### src/quests

- [quest_card.lua](../src/quests/quest_card.lua)
- [quest_hover_assets.lua](../src/quests/quest_hover_assets.lua)
- [quest_requirements.lua](../src/quests/quest_requirements.lua)

### src/integration

- [drop_menu.lua](../src/integration/drop_menu.lua)
- [map_click_override.lua](../src/integration/map_click_override.lua)

### data/maps

- [area_tiles_data.lua](../data/maps/area_tiles_data.lua)
- [map_areas_data.lua](../data/maps/map_areas_data.lua)
- [named_dungeon_maps.lua](../data/maps/named_dungeon_maps.lua)
- [named_dungeon_tiles.lua](../data/maps/named_dungeon_tiles.lua)
- [resource_submaps.lua](../data/maps/resource_submaps.lua)
- [sub_dungeon_maps.lua](../data/maps/sub_dungeon_maps.lua)
- [surface_config.lua](../data/maps/surface_config.lua)
- [terrain_atlas.lua](../data/maps/terrain_atlas.lua)

### data/catalogues

- [bestiary_data.lua](../data/catalogues/bestiary_data.lua)
- [bestiary_submaps.lua](../data/catalogues/bestiary_submaps.lua)
- [boss_drop_names.lua](../data/catalogues/boss_drop_names.lua)
- [drop_item_ids.lua](../data/catalogues/drop_item_ids.lua)
- [drop_aliases.lua](../data/catalogues/drop_aliases.lua)
- Drop reference shards: [A–F](../data/catalogues/drops/a_f.lua), [G–L](../data/catalogues/drops/g_l.lua), [M–R](../data/catalogues/drops/m_r.lua), [S–Z](../data/catalogues/drops/s_z.lua)
- See [DROP_DATA.md](DROP_DATA.md) for snapshot coverage and sources.
- [npc_data.lua](../data/catalogues/npc_data.lua)

### data/pins

- [map_key_data.lua](../data/pins/map_key_data.lua)
- [pin_details.lua](../data/pins/pin_details.lua)
- [prif_city_pins.lua](../data/pins/prif_city_pins.lua)
- [world_map_data.lua](../data/pins/world_map_data.lua)

### data/travel

- [prif_teleport_positions.lua](../data/travel/prif_teleport_positions.lua)
- [skillcape_data.lua](../data/travel/skillcape_data.lua)
- [teleport_data.lua](../data/travel/teleport_data.lua)
- [teleport_extra_data.lua](../data/travel/teleport_extra_data.lua)

### data/dungeons

- [dungeon_exits_data.lua](../data/dungeons/dungeon_exits_data.lua)
- [dungeon_routes_data.lua](../data/dungeons/dungeon_routes_data.lua)
- [resource_dungeon_data.lua](../data/dungeons/resource_dungeon_data.lua)
- [resource_dungeon_visuals_data.lua](../data/dungeons/resource_dungeon_visuals_data.lua)
- [submap_resources_data.lua](../data/dungeons/submap_resources_data.lua)

### data/quests

- [quest_card_data.lua](../data/quests/quest_card_data.lua)

## Upload contents

Use `python dev/tools/package_release.py` rather than zipping the whole working tree. The release contains `main.lua`, `plugin.json`, `README.md`, `CHANGELOG.md`, `src/`, `data/`, active `resources/`, and public documentation. It excludes `dev/`, `.git/` and internal submission drafts.

The former `resources/surface/` and `resources/terrain/` sources are archived under `dev/archive/resources/`; the active renderer uses `surface_chunks`, `own_terrain`, `area_tiles` and fallback `area_maps`. The old `tiles.lua` and `surface_chunks.lua` manifests are archived under `dev/archive/legacy/`.

A pre-organization backup is retained in the workspace at `work/before-project-organization.zip`. No existing Git history was rewritten.

The superseded `monster_drop_additions.lua` is archived in `dev/archive/legacy/`; its rows are included in the refreshed drop shards.

See [PRETTYUI.md](PRETTYUI.md) for automatic IDs, native resize, position saving and transparency behavior.
