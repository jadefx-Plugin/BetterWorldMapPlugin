"""Build bundled Lua drop tables from the offline import and verified Jagex changes."""
from pathlib import Path
from collections import defaultdict
from urllib.parse import unquote
import copy
import hashlib
import json
import re

PROJECT = Path(__file__).resolve().parents[2]
WORKSPACE = PROJECT.parents[1]
INPUT = WORKSPACE / 'work/drop-refresh-2026-11-26'
SOURCE = 'https://secure.runescape.com/m=news/patch-notes-late-game-rebalance'
GHRAZI_SOURCE = 'https://secure.runescape.com/m=news/the-week-ahead-ghrazi-blood-knights-solo-mode--community-updates'


def emit(value):
    if isinstance(value, str):
        return json.dumps(value, ensure_ascii=False)
    if value is True:
        return 'true'
    if value is False:
        return 'false'
    if value is None:
        return 'nil'
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        return '{' + ','.join(emit(x) for x in value) + '}'
    return '{' + ','.join('[' + emit(k) + ']=' + emit(v) for k, v in value.items()) + '}'


def normal(name):
    return re.sub(r'[^a-z0-9]', '', name.lower())


def build():
    records = json.loads((INPUT / 'records-refreshed.json').read_text(encoding='utf-8'))
    records.update({name: r for name, r in json.loads((INPUT / 'extra-records.json').read_text(encoding='utf-8')).items() if r['drops']})
    baseline = json.loads((INPUT / 'records-before.json').read_text(encoding='utf-8'))
    changes = json.loads((PROJECT / 'dev/audits/drop_rate_changes_2026_11_23.json').read_text())['changes']
    updates = []
    for change in changes:
        for monster in change['monsters']:
            assert monster in records, monster
            record = records[monster]
            for item in change['items']:
                matches = [d for d in record['drops'] if normal(d['name']) == normal(item)
                           or normal(d['name']).startswith(normal(item))]
                if not matches and monster == 'Vorago' and item == 'Bombi':
                    drop = dict(name='Bombi', quantity='1', rarity='1/50')
                    record['drops'].append(drop)
                    matches = [drop]
                assert matches, (monster, item)
                for drop in matches:
                    old = copy.deepcopy(drop)
                    note = change['notes'].strip()
                    if change['rarity'] is not None:
                        # Published GWD base/normal changes must not erase the
                        # separately labelled hard-mode tables imported today.
                        preserve_hard = monster in {"Kree'arra", 'General Graardor', 'Commander Zilyana',
                            "K'ril Tsutsaroth", 'Vindicta and Gorvek', 'Helwyr', 'Gregorovic', 'The Twin Furies'}
                        hard = [copy.deepcopy(v) for v in drop.get('variants', [])
                                if preserve_hard and 'hard mode' in v.get('condition', '').lower()]
                        drop['rarity'] = change['rarity']
                        drop['variants'] = [dict(quantity=drop['quantity'], rarity=change['rarity'],
                                                 notes=note, condition='Normal mode (base)' if hard else 'Base rates, 23 November 2026')]
                        drop['variants'].extend(hard)
                    else:
                        # Threshold-only change: preserve the actual base probability.
                        for variant in drop.get('variants', []):
                            variant['notes'] = note
                    drop['rateSource'] = SOURCE
                    updates.append(dict(monster=monster, item=drop['name'], before=old,
                                        after=copy.deepcopy(drop), source=SOURCE))
            record['rateUpdates'] = SOURCE

    # Hydrix dragons changed item identity, not just probability.
    for drop in records['Hydrix dragon']['drops']:
        if drop['name'] == 'Onyx bolt tips':
            # The shared rare drop table is independent of the dragon's own
            # common table. Its onyx tips were not replaced by this update.
            if not all('rare drop table' in v.get('section', '').lower() for v in drop.get('variants', [])):
                drop['name'] = 'Hydrix bolt tips'
                drop['rateSource'] = SOURCE
    # Both crossbow hands share the published GWD1 update.
    for drop in records['Commander Zilyana']['drops']:
        if drop['name'] == 'Off-hand Armadyl crossbow':
            drop['rarity'] = '1/320'
            drop['variants'] = [dict(quantity=drop['quantity'], rarity='1/320', notes='Normal-mode base rate.')]
            drop['rateSource'] = SOURCE
    for monster in ["Kree'arra", 'General Graardor', 'Commander Zilyana', "K'ril Tsutsaroth"]:
        for drop in records[monster]['drops']:
            if drop['name'].startswith('Godsword shard'):
                for variant in drop.get('variants', []):
                    variant['notes'] = 'Rare-drop boosts now apply. ' + variant.get('notes', '')
                drop['rateSource'] = SOURCE

    ghrazi = records['The Ghrazi Blood Knights']
    ghrazi['level'] = '4914'
    ghrazi['rateUpdates'] = GHRAZI_SOURCE
    brackets = ['Normal mode', '100% enrage', '500% enrage', '750% enrage', '1000% enrage', '2000%+ enrage (including 4000%)']
    for drop in ghrazi['drops']:
        name = drop['name']
        if name in ["Malachi's tooth", "Malachi's claw", 'Invoke Arisen Flesh incantation codex']:
            denominators = [3000, 750, 450, 300, 175, 125] if 'codex' in name else [1500, 375, 225, 150, 87.5, 62.5]
            drop['variants'] = [dict(quantity='1', rarity='1/' + str(rate), condition=label,
                                    notes='Per-player item chance; solo and duo use the same loot rates.')
                                for label, rate in zip(brackets, denominators)]
            drop['rarity'] = 'Varies by enrage'
            drop['rateSource'] = GHRAZI_SOURCE
        elif name == 'Ghrazi Fauld':
            drop['rarity'] = '1/500 normal; 1/300 hard'
            drop['variants'] = [dict(quantity='1', rarity=drop['rarity'], notes='Base pet chance; threshold 100 kills.')]
            drop['rateSource'] = GHRAZI_SOURCE
        elif name.startswith('Forgotten painting piece'):
            drop['variants'] = [dict(quantity='1', rarity='1/' + str(rate), condition=label,
                                    notes='Painting pieces are obtained in order.')
                                for label, rate in zip(brackets, [40,35,30,25,20,15])]
            drop['rarity'] = 'Varies by enrage'
            drop['rateSource'] = GHRAZI_SOURCE
        elif name == 'Crimson ichor':
            drop['variants'] = []
            for index, label in enumerate(brackets):
                drop['variants'].append(dict(quantity=str([1,1,1,1,2,4][index]), rarity='Always',
                    condition=label + '; guaranteed'))
                quantities=['5','5 / 10 / 20','5 / 10 / 20','5 / 10 / 25','5 / 15 / 30','5 / 20 / 40'][index]
                drop['variants'].append(dict(quantity=quantities, rarity='Common',
                    condition=label + '; common-loot roll',
                    notes='On the ichor roll: low/medium/high amounts have 40%/35%/25% chances.' if index else 'Common ichor roll always gives 5.'))
            drop['rarity'] = 'Guaranteed, plus possible common loot'
            drop['quantity'] = 'Depends on enrage and loot roll'
            drop['rateSource'] = GHRAZI_SOURCE

    # Canonical record names are shared by map pins and context-menu aliases.
    aliases = {'Ghrazi Blood Knights':'The Ghrazi Blood Knights',
               'Lady Karmina Ghrazi':'The Ghrazi Blood Knights', 'Lord Vasily Ghrazi':'The Ghrazi Blood Knights',
               'Vindicta':'Vindicta and Gorvek', 'Gorvek':'Vindicta and Gorvek',
               'Araxxor':'Araxxi', 'Nex, Angel of Death':'Nex: Angel of Death',
               'Ivar':'Ivar, King of Bones', 'Silverquill':'Silverquill, the Dreadhog',
               'Nymora':'The Twin Furies', 'Avaryss':'The Twin Furies'}
    for name in aliases:
        # Do not retain competing stale tables under aliases.
        records.pop(name, None)
    records.pop('Chest (Barrows)', None)

    buckets = defaultdict(dict)
    for name, record in sorted(records.items()):
        bucket = 'a_f' if name[0].lower() < 'g' else 'g_l' if name[0].lower() < 'm' else 'm_r' if name[0].lower() < 's' else 's_z'
        buckets[bucket][name] = record
    folder = PROJECT / 'data/catalogues/drops'
    folder.mkdir(exist_ok=True)
    for bucket, rows in buckets.items():
        lines = ['-- Generated offline drop reference. Wiki contributors, CC BY-NC-SA 3.0.',
                 '-- Conditions and provenance retained; see docs/DROP_DATA.md and docs/WIKI-NPCS.md.', 'return {']
        lines += ['[' + emit(name) + ']=' + emit(record) + ',' for name, record in rows.items()]
        (folder / (bucket + '.lua')).write_text('\n'.join(lines) + '\n}\n', encoding='utf-8')

    # Load the existing item lookup and add names from the native cache name export.
    from lupa import LuaRuntime
    lua = LuaRuntime()
    ids = dict(lua.execute((PROJECT / 'data/catalogues/drop_item_ids.lua').read_text(encoding='utf-8')).items())
    ids.update(json.loads((INPUT / 'extra-item-ids.json').read_text()))
    native = {}
    for item in json.loads((WORKSPACE / 'work/item-names.json').read_text(encoding='utf-8')):
        if not item.get('note'):
            native.setdefault(item['name'].lower(), item['id'])
    missing = set()
    for record in records.values():
        for drop in record['drops']:
            name = drop['name']
            if name not in ids:
                item_id = native.get(name.lower())
                if item_id is None:
                    missing.add(name)
                else:
                    ids[name] = item_id
    text = '-- Native inventory item IDs for drop icons; reference table, not live inventory access.\nreturn {\n'
    text += '\n'.join('[' + emit(name) + ']=' + str(value) + ',' for name, value in sorted(ids.items()))
    (PROJECT / 'data/catalogues/drop_item_ids.lua').write_text(text + '\n}\n', encoding='utf-8')

    aliases_data = dict(names=aliases, ids={32907:'The Ghrazi Blood Knights',32909:'The Ghrazi Blood Knights',
                                           32908:'The Ghrazi Blood Knights',32910:'The Ghrazi Blood Knights',
                                           24004:'Nex: Angel of Death'})
    (PROJECT / 'data/catalogues/drop_aliases.lua').write_text('-- Shared canonical encounter names; Ghrazi combat IDs exclude quest/non-combat variants.\nreturn ' + emit(aliases_data) + '\n', encoding='utf-8')
    bosses = dict(lua.execute((PROJECT / 'data/catalogues/boss_drop_names.lua').read_text(encoding='utf-8')).items())
    for change in changes:
        if "Devil's snare" in change['monsters']:
            break
        for name in change['monsters']:
            bosses[aliases.get(name, name).lower()] = True
    bosses['the ghrazi blood knights'] = True
    for alias, target in aliases.items():
        if bosses.get(target.lower()):
            bosses[alias.lower()] = True
    (PROJECT / 'data/catalogues/boss_drop_names.lua').write_text('-- Boss encounter names and aliases for the optional View drops filter.\nreturn ' + emit(dict(sorted(bosses.items()))) + '\n', encoding='utf-8')
    report = dict(date='2026-11-26', canonicalRecords=len(records), baselineRecords=len(baseline),
        refreshedRecords=sum(r.get('retrieved')=='2026-11-26' for r in records.values()),
        addedRecords=sorted(set(records)-set(baseline)), retainedOlderRecords=sorted(n for n,r in records.items() if r.get('retrieved')!='2026-11-26'),
        verifiedChangeGroups=len(changes), patchedRows=len(updates), changes=updates,
        missingItemArtwork=sorted(missing), ghraziEntrance=dict(x=4780,z=3402,areaID=28,source='https://runescape.wiki/w/Crimson_Gate'),
        sources=[SOURCE,GHRAZI_SOURCE,'https://runescape.wiki/w/The_Ghrazi_Blood_Knights'])
    (PROJECT / 'dev/audits/drop_refresh_2026_11_26.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    (INPUT / 'records-final.json').write_text(json.dumps(records,ensure_ascii=False),encoding='utf-8')
    print(f'Built {len(records)} canonical records in four shards; {len(updates)} verified rate updates; {len(missing)} icon names unresolved.')
    print('Ghrazi missing icons:',[d['name'] for d in ghrazi['drops'] if d['name'] not in ids])


if __name__ == '__main__':
    build()
