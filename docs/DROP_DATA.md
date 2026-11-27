# Monster drops and rates

## Current reference snapshot

Updated on **26 November 2026**, including Jagex's **23 November 2026** late-game
rebalance and the Ghrazi Blood Knights loot-rate reveal on **9 November 2026**.

- 517 canonical reference records, plus aliases pointing to the same records.
- 452 records have freshly imported drop tables. The 65 retained older records
  have no drop rows; a failed or empty import never erases an existing populated table.
- 138 official rebalance change groups are checked against 196 affected item rows.
- All 33 Ghrazi item names have native inventory icons. Five non-item categories
  (`Nothing`, `Herbs`, `Tree seed`, `Rare drop table`, `Cremation`) use the explicit
  no-inventory-icon fallback.

Drop probabilities are reference information. Base rates, luck modifiers, Slayer
assignments, enrage, contribution, group size, pet thresholds and eligibility can
change the applicable chance. A rate per loot pile is not a rate per kill.

## Finding the data

- `src/catalogues/monster_drops.lua` loads and joins the generated reference shards.
- `data/catalogues/drops/a_f.lua`, `g_l.lua`, `m_r.lua`, `s_z.lua` hold the records,
  grouped by monster-name initial. Four shards keep the generated constants bounded.
- `data/catalogues/drop_aliases.lua` maps encounter aliases and selected native
  combat IDs to one canonical name.
- `data/catalogues/drop_item_ids.lua` maps inventory item names to native artwork IDs.
- `src/pins/map_hover.lua` renders rate variants in the item tooltip.
- `src/integration/drop_menu.lua` uses the same records as map clicks.

Each record retains its source URL, Wiki revision and retrieval date. A row
overridden from Jagex's release notes includes `rateSource`; `variants` holds
mode/quantity/rate/condition information. Previously separate normal/hard tables
remain labelled. Jagex's base-rate corrections take priority over stale Wiki
numbers; unrelated tables are not adjusted using guessed multipliers.

The Ghrazi reference pin at **4780, 3402** represents the published Crimson Gate
entrance, not an arena spawn. Repeatable combat IDs are 32907, 32909, 32908 and
32910. Quest and non-combat versions do not receive the Ghrazi drop menu action.

## Sources and attribution

- [Jagex: Late-Game Rebalance patch notes](https://secure.runescape.com/m=news/patch-notes-late-game-rebalance)
- [Jagex: Ghrazi solo mode and drop rates](https://secure.runescape.com/m=news/the-week-ahead-ghrazi-blood-knights-solo-mode--community-updates)
- [RuneScape Wiki: Ghrazi Blood Knights](https://runescape.wiki/w/The_Ghrazi_Blood_Knights)
- [RuneScape Wiki: Crimson Gate](https://runescape.wiki/w/Crimson_Gate)
- Individual Wiki source/revision metadata is retained in each generated record.

Wiki-derived reference data is attributed to RuneScape Wiki contributors under
CC BY-NC-SA 3.0; see [WIKI-NPCS.md](WIKI-NPCS.md). Numerical corrections are
derived from the official Jagex announcements linked above.

## Offline maintenance

The plugin never requests Wiki pages at runtime. The date-specific maintenance
tools are `dev/tools/refresh_monster_drops.py` and `build_drop_data.py`. Their
inputs and cached API replies are under the workspace's
`work/drop-refresh-2026-11-26/`. The verified change definitions and build audit
are under `dev/audits/` and are excluded from release ZIPs.

For a later refresh, use a new dated snapshot and review new official changes.
Do not relabel this frozen snapshot as newly verified without fetching and
checking its source data again.
