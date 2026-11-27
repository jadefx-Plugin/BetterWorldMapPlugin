# Submission review

## Local-only runtime

Better World Map requests no permissions. plugin.json declares PrettyUI as an installed dependency and has no endpoint/URL manifest. Runtime Lua contains no HTTP client, socket, browser-launch, dynamic-code download, telemetry, shell or arbitrary-filesystem operation. Wiki/source URLs in tables and Markdown are provenance strings.

Local RuneScape APIs remain necessary for exposed player movement/position, loaded NPCs, skills/quests, UI, keyboard events and plugin-scoped PersistentDB storage. These are not web requests by the plugin. 

Only preferences are saved. NPC caches, monster hover targets and map navigation history stay in memory and are discarded at shutdown. No other-player data is collected or exported. Source checks complement manual review;

Features for moderator review

|Feature|Actual behavior and boundary|
|-|-|
|Map/travel/dungeon navigation|Changes a local map view; no movement/teleport action or automatic route instruction is sent. Some pins are approximate reference anchors.|
|Nearby monster information|Uses only loaded exposed NPCs, with validity/attack/drop-record checks; no future state, other-player tracking or world-wide detection.|
|View drops context entry|Opens local reference UI and preserves the native default action. It sends no server action. Optional hiding settings are provided.|
|Minimap button override|Opt-in capture of the visible World Map button at its existing bounds; opens local UI. It does not alter action bars, inventory/equipment/familiar click zones or 3D interaction zones.|
|Keybind|Configurable plugin UI shortcut with typing/capture guards. Native map-key cancellation is unavailable and not promised.|
|Custom images and dependency|Bundled reference artwork plus installed PrettyUI dependency; both must be included in the moderator's review scope.|
|Requirements/reference content|Public/historical or API-exposed information; unknown checks remain unknown. It does not reveal hidden/future state or automatically solve combat mechanics.|

## 

