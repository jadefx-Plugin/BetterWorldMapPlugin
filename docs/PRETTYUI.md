# PrettyUI integration

Better World Map 1.2.0.0 is tested against **PrettyUI 1.3.3**. Update PrettyUI in
RuneScape's Plugin Hub before using this release. Its dependency ID remains 6398181.

## Automatic component allocation

The main window, settings and drop popup opt into `categoryID = "auto"`.
Custom artwork uses `src/ui/native_components.lua`, which routes sprites, text,
rectangles and canvases through `PrettyUI.NewComponent`. The main construction
pass uses `WithCategoryBatch` so it shares the library's occupancy snapshot.

Raw layout-host layers intentionally retain their inherited category-zero IDs:
PrettyUI 1.3.3 requires a content container's parent to be a category-zero layer
or a client-supplied host. The high-volume artwork and managed widgets use
automatic nonzero category allocation. Keep this distinction when adding controls.

## Window geometry

PrettyUI supplies all edge/corner handles, resize cursors, capture, scaled pointer
deltas and min/max constraints. The old eight-handle custom resize implementation
has been replaced by a small `src/ui/map_resize.lua` adapter. It reserves header
controls, reflows the map after native geometry changes, and commits saved size
after resizing stops. Minimum map size remains 520 by 360.

The main window's `onPositionChange` saves the position once a title drag ends.
Window size is retained while other controls are clicked. Parent clamping and
saved-geometry validation continue to use the existing settings module.

The map, settings and drop popup explicitly use `respectInterfaceLock = false`
to retain the plugin's movable-window behavior even when RuneScape's interface
is locked. No native game interface setting is changed.

## Transparency and tooltips

Settings > Transparency includes **Match game background transparency**. It is
off by default, preserving existing appearance. When enabled, the map and drop
window backgrounds use PrettyUI's native transparency watcher. The existing
normal/walking opacity is composed with that background alpha once, rather than
repeatedly multiplied on every update. Map terrain retains its existing opacity
controls; the native setting affects the window background.

PrettyUI's tooltips are now lazy: hidden attachments do not allocate artwork,
and hiding releases their native controls. The map's custom pin cards retain
their existing on-demand lifecycle. The searchable map dropdown retains the
plugin's batched filtering optimization, including its new explicit scroll reset
when the search results change.

## Validation

`dev/tests/check_prettyui_133.py` exercises the actual installed library's code
against a mocked native UI host: 6,000 simultaneous auto-ID sprites, repeated
allocation/release, 1,000 hidden tooltip attachments, real window/resize callbacks,
the 33-item Ghrazi popup, settings/colour-picker construction, opacity composition,
preference writes and teardown. `check_main_prettyui_133.py` boots and shuts down
the full map against that same library and checks that no native controls remain.

These tests do not substitute for a live-client visual check. The test fixture
is extracted to the workspace's `work/prettyui-1.3.3/`; it is not shipped inside
the plugin. PrettyUI continues to be loaded as a separate dependency.
