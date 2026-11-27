"""Validate module resolution, dependency cycles and release boundaries."""
from pathlib import Path
import ast
import importlib.util
import json
import re

ROOT = Path(__file__).resolve().parents[2]
sources = [ROOT / 'main.lua', *(ROOT / 'src').rglob('*.lua'), *(ROOT / 'data').rglob('*.lua')]
modules = {p.relative_to(ROOT).with_suffix('').as_posix(): p for p in sources}
graph = {}
for name, p in modules.items():
    text = p.read_text(encoding='utf-8')
    text = re.sub(r'--\[(=*)\[.*?\]\1\]', '', text, flags=re.S)
    text = re.sub(r'--[^\n]*', '', text)
    dependencies = re.findall(r'require\s*\(\s*["\']([^"\']+)["\']\s*\)', text)
    for dependency in dependencies:
        assert dependency in modules, (name, dependency)
    graph[name] = dependencies

visited, active = set(), set()


def visit(name):
    assert name not in active, f'Cyclic dependency: {name}'
    if name in visited:
        return
    active.add(name)
    for dependency in graph[name]:
        visit(dependency)
    active.remove(name)
    visited.add(name)


visit('main')
assert visited == set(modules), f'Unreachable runtime modules: {set(modules) - visited}'
assert {p.name for p in ROOT.glob('*.lua')} == {'main.lua'}
assert not (ROOT / 'resources/surface').exists()
assert not (ROOT / 'resources/terrain').exists()
for p in (ROOT / 'dev').rglob('*.py'):
    ast.parse(p.read_text(encoding='utf-8'), filename=str(p))

spec = importlib.util.spec_from_file_location('package_release', ROOT / 'dev/tools/package_release.py')
packager = importlib.util.module_from_spec(spec)
spec.loader.exec_module(packager)
files = packager.release_files()
packager.validate(files)
assert not any({'dev', '.git', 'submission'} & set(p.relative_to(ROOT).parts) for p in files)
assert re.fullmatch(r'\d+(?:\.\d+)*', json.loads((ROOT / 'plugin.json').read_text())['version'])
print(f'PASS: {len(modules)} reachable modules, no missing/cyclic imports; development scripts parse; release excludes audits, archive and Git history.')
