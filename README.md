# Better World Map

A resizable world map for RuneScape, with monster and NPC searches, teleport destinations, dungeon links, quest information and drop tables.

Better World Map requires **PrettyUI** (plugin ID **6398181**).

## Getting started

Press **M** to open or close the map. Drag the title bar to move the window, or drag an edge or corner to resize it.

- Drag the map to pan.
- Use the mouse wheel or the **+ / −** buttons to zoom.
- Click **Follow me** to center the map on your character and follow your movement.
- Use the map dropdown to browse another area.
- Click the information button to show or hide the search and map-key panel.
- Click the eye button to show or hide the overview.

You can click the overview to jump to an area, or drag its red box to move around the map. The map switches to supported areas as your character enters them, even with Follow me turned off.

## Monster and NPC searches

Open **Bestiary** or **NPCs** in the left panel and start typing a name. Select a result to show its recorded locations. Use **Clear markers** when you're finished.

Hover a monster pin to see its name and combat level. Clicking a Bestiary pin opens its drop table. You can also open drops from a nearby monster dot or the **View drops** right-click option.

Search pins show recorded locations, so a monster may not always be present there. Nearby monster dots show loaded, attackable monsters with a recorded drop table. Searches don't add boxes or names over characters in the game world.

## Map key and filters

The **Map key** lets you choose which icons appear. Use the gold plus/minus buttons to expand a section, then tick or untick the types you want.

Teleport markers have their own section, covering jewellery, spells, tablets, skillcapes, outfits and other travel items. Methods that share a destination are grouped together. Hover the marker to see the options and their recorded requirements. Use the mouse wheel to scroll longer cards.

The **Filters** menu includes:

- **Quests:** hide completed quests or quests whose requirements aren't met.
- **Teleports:** hide methods whose checked requirements aren't met.
- **Extras:** show or hide nearby monsters, map icons and map labels.

Some requirements can't be checked, and some destinations mark an area rather than an exact landing tile. Items, charges and other access conditions may still apply.

## Dungeon maps

Click a linked dungeon entrance to open its map. Return pins take you back to the previous map, or the surface if there isn't a previous view.

Some dungeon maps are hidden from the dropdown but can still open through linked entrances or when your character enters them. A generic Dungeon pin without a verified destination won't open another map. Not every internal ladder has a linked destination.

Map links and teleport markers only change what you're viewing. They don't move or teleport your character.

## Settings

Click the cog beside the close button to open Settings.

| Page | Options |
| --- | --- |
| Pins | Monster and NPC colours, separate pin transparency, map pin size and a reset button |
| Transparency | Normal map transparency and transparency while walking |
| Drop menu | Hide View drops for all monsters or just known bosses |
| Controls | Map shortcut and the optional minimap-button override |

**0% transparency** is fully visible; **100%** is invisible. The settings window and cog stay visible so you can change this back. Monster appearance settings also affect nearby monster dots.

Accept a colour in the picker to apply it. Settings save locally, including your colours, transparency, pin size, filters, window position and shortcut.

The plugin can't cancel RuneScape's original map shortcut. If both maps open, choose a different plugin shortcut or unbind the original key in the game's settings.

## Local data

Map images, locations, requirements and drop references are included with the plugin. It doesn't search the Wiki, make web requests or send telemetry. It requests no permissions.

Saved preferences stay in the plugin's local storage. Nearby-monster information and map-view history are kept only for the current session. Reference data may be incomplete or become outdated; drop rates and locations aren't guarantees.

See [WIKI-NPCS.md](WIKI-NPCS.md) for source credits and licence information, and [TELEPORT_COVERAGE.md](TELEPORT_COVERAGE.md) for travel coverage.

reporting a problem

For bugs, suggestions or contribution proposals, leave a comment on the plugin's **Mod.io page**. Include the map name, zoom, relevant filters and steps to reproduce the problem. Screenshots are helpful too.

Contact: **jadefx.plugins@gmail.com**

## Working on the code

[CODE_GUIDE.md](CODE_GUIDE.md) explains the file layout, data formats and how the main features work. Start there if you're new to the project.
