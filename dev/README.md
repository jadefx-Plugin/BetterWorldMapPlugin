# Development files

These files are retained for maintenance and are excluded from Mod.io ZIPs.

- `tools/`: original offline builders and the release packager.
- `audits/`: coverage checks, coordinate audits, build reports and the organization inventory.
- `tests/`: regression checks for the current runtime module paths.
- `archive/legacy/`: the two superseded surface manifest modules.
- `archive/resources/`: original surface/source terrain images unused by the current renderer. Keep these for rebuilding or comparison.

## Package a release

From the project root:

```powershell
python dev/tools/package_release.py
```

The default output is `../releases/BetterWorldMap-<version>.zip`. Pass a full ZIP
path to write elsewhere. The packager validates module imports, checks the ZIP,
keeps `main.lua` and `plugin.json` at the top level, and excludes this development
folder, Git history and internal submission drafts.

## Regression checks

Requires Python with `lupa`. Run the scripts under `dev/tests/`; they resolve the
project independently of the current directory. The dropdown and PrettyUI integration checks
also use the existing PrettyUI fixture at the workspace's
`work/prettyui-1.3.3/`.

## Rebuilding assets

`tools/package.json` declares the Sharp dependency for the JavaScript image
builders. Install it in `dev/tools/`, then use `npm run build` to rebuild the
surface LOD atlas from `resources/surface_chunks/`. Reports go to `dev/audits/`.
The blending, Prifddinas and resource-data builders also require their original
offline cache/wiki extraction inputs from the workspace `work/` directory. They
are maintenance tools, not runtime dependencies. The organization does not
re-download or regenerate game data.
