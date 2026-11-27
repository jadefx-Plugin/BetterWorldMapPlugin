"""Build a Mod.io ZIP. Run from any directory; pass an optional destination ZIP."""
from pathlib import Path
import argparse
import json
import re
import zipfile

PROJECT = Path(__file__).resolve().parents[2]


def release_files():
    files = [PROJECT / name for name in ('main.lua', 'plugin.json', 'README.md', 'CHANGELOG.md')]
    for folder in ('src', 'data', 'resources', 'docs'):
        files.extend(p for p in (PROJECT / folder).rglob('*') if p.is_file()
                     and 'submission' not in p.relative_to(PROJECT).parts
                     and '__pycache__' not in p.parts)
    return sorted(files)


def validate(files):
    """Check literal runtime imports before creating a release."""
    included = {p.relative_to(PROJECT).as_posix() for p in files}
    for p in files:
        if p.suffix != '.lua':
            continue
        text = p.read_text(encoding='utf-8')
        for name in re.findall(r'require\s*\(\s*["\']([^"\']+)["\']\s*\)', text):
            assert name + '.lua' in included, f'{p.name}: missing module {name}'
    assert 'main.lua' in included and 'plugin.json' in included


def build(destination):
    files = release_files()
    validate(files)
    destination = Path(destination).resolve()
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary = destination.with_suffix(destination.suffix + '.tmp')
    with zipfile.ZipFile(temporary, 'w', zipfile.ZIP_DEFLATED) as archive:
        for p in files:
            archive.write(p, p.relative_to(PROJECT))
    with zipfile.ZipFile(temporary) as archive:
        assert archive.testzip() is None, 'Corrupt ZIP'
        assert json.loads(archive.read('plugin.json')) == json.loads((PROJECT / 'plugin.json').read_text())
        assert not any(n.startswith(('dev/', '.git/')) for n in archive.namelist())
    temporary.replace(destination)
    return destination, len(files)


if __name__ == '__main__':
    version = json.loads((PROJECT / 'plugin.json').read_text())['version']
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('destination', nargs='?', type=Path,
                        default=PROJECT.parent / 'releases' / f'BetterWorldMap-{version}.zip')
    args = parser.parse_args()
    destination, count = build(args.destination)
    print(f'Created {destination} ({count} files, {destination.stat().st_size / 1024**2:.1f} MiB)')
