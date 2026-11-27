"""Offline Wiki drop import; keeps modes and footnotes. No runtime HTTP calls."""
from pathlib import Path
from urllib.parse import urlencode, quote, unquote
from urllib.request import Request, urlopen
from concurrent.futures import ThreadPoolExecutor, as_completed
from bs4 import BeautifulSoup
import hashlib
import json
import re
import time

PROJECT = Path(__file__).resolve().parents[2]
WORKSPACE = PROJECT.parents[1]
OUTPUT = WORKSPACE / 'work/drop-refresh-2026-11-26'
DATE = '2026-11-26'

ADDITIONAL_PAGES = [
    'The Ghrazi Blood Knights', 'Lady Karmina Ghrazi', 'Lord Vasily Ghrazi', 'Crimson Throne',
    'Ivar, King of Bones', 'Silverquill, the Dreadhog', 'Barrows', 'Giant Mole',
    'King Black Dragon', 'Queen Black Dragon', 'Kalphite Queen', 'Exiled Kalphite Queen',
    'Kalphite King', 'Dagannoth Rex', 'Dagannoth Prime', 'Dagannoth Supreme',
    'Corporeal Beast', 'Orikalka', 'Rathis', 'Pthentraken', 'Osseous',
    'The Gate of Elidinis', 'The Magister', 'Solak', 'Legio Primus', 'Legio Secundus',
    'Legio Tertius', 'Legio Quartus', 'Legio Quintus', 'Legio Sextus', 'Vorago',
    'Araxxor', 'Araxxi', 'Croesus', "Kree'arra", 'General Graardor', 'Commander Zilyana',
    "K'ril Tsutsaroth", 'Nex: Angel of Death', 'Vindicta', 'Helwyr', 'Gregorovic',
    'The Twin Furies', "Devil's snare", 'Luminous snaggler', 'Lampenflora',
    'Liverworts', 'Feral dinosaur', 'Venomous dinosaur', 'Brutish dinosaur', 'Ripper dinosaur',
    'Wyvern', 'Camel Warrior', 'Ripper Demon', 'Acheron mammoth', 'Ice strykewyrm',
    'Lava strykewyrm', 'Automaton guardian', 'Automaton tracer', 'Automaton generator',
    'Aquanite', 'Cave horror', 'Unspeakable horror', 'Dragonstone dragon', 'Onyx dragon',
    'Hydrix dragon', 'Abyssal demon', 'Nightmare', 'Dark beast', 'Gargoyle', 'Airut',
    'Mutated jadinko guard', 'Mutated jadinko male', 'Corrupted scorpion', 'Corrupted scarab',
    'Corrupted lizard', 'Corrupted dust devil', 'Corrupted kalphite marauder',
    'Corrupted kalphite worker', 'Salawa akh', 'Feline akh', 'Scarab akh', 'Crocodile akh',
    'Gorilla akh', 'Imperial mage akh', 'Imperial ranger akh', 'Imperial warrior akh',
    'Rorarius', 'Gladius', 'Capsarius', 'Scutarius', 'Oculi apoterrasaur', 'Malletops',
    'Pavosaurus rex',
]


def fetch(title):
    target = OUTPUT / 'pages' / (hashlib.sha256(title.encode()).hexdigest()[:24] + '.json')
    if target.exists():
        return title, json.loads(target.read_text(encoding='utf-8'))
    params = dict(action='parse', page=title, prop='text|wikitext|revid', format='json',
                  formatversion=2, redirects=1, maxlag=5, disablelimitreport=1)
    for attempt in range(3):
        try:
            req = Request('https://runescape.wiki/api.php?' + urlencode(params),
                          headers={'User-Agent': 'BetterWorldMap/1.1.0.2 (offline drop reference refresh)'})
            with urlopen(req, timeout=35) as response:
                data = json.load(response)
            if 'error' in data:
                raise ValueError(data['error'])
            target.write_text(json.dumps(data, ensure_ascii=False), encoding='utf-8')
            time.sleep(.2)
            return title, data
        except Exception as exc:
            if attempt == 2:
                return title, {'error': str(exc)}
            time.sleep(1 + attempt)


def clean(node):
    copy = BeautifulSoup(str(node), 'html.parser')
    for ref in copy.select('sup.reference, .reference, .sortkey, .mw-editsection'):
        ref.decompose()
    return re.sub(r'\s+', ' ', copy.get_text(' ', strip=True)).strip()


def parse(data):
    if 'parse' not in data:
        return {'drops': [], 'error': str(data.get('error'))}
    page = data['parse']
    soup = BeautifulSoup(page['text'], 'html.parser')
    levels = []
    for table in soup.select('table.infobox-monster'):
        for row in table.select('tr'):
            heading, value = row.find('th'), row.find('td')
            if heading and value and clean(heading).lower() == 'combat level':
                level = clean(value)
                if level not in levels:
                    levels.append(level)
    drops = {}
    for table in soup.select('table.item-drops'):
        heading = table.find_previous('h2')
        if heading and not any(w in clean(heading).lower() for w in ('drop', 'loot', 'reward')):
            continue
        condition = ''
        item = table.find_parent('div', class_='item')
        if item and item.get('data-id'):
            switch = item.find_parent('div', class_='switch-infobox')
            trigger = switch.select_one('.trigger[data-id="' + item['data-id'] + '"]') if switch else None
            if trigger:
                condition = clean(trigger)
        subheading = table.find_previous(['h2', 'h3', 'h4', 'h5'])
        section = clean(subheading) if subheading else ''
        rank = 7
        for ancestor in table.find_all_previous(['h2', 'h3', 'h4', 'h5']):
            level = int(ancestor.name[1])
            if level >= rank:
                continue
            rank = level
            label = clean(ancestor)
            if re.search(r'\bmode\b|free-to-play|members|on.task|off.task', label, re.I):
                if label not in condition:
                    condition = '; '.join(filter(None, [condition, label]))
            if level == 2:
                break
        for row in table.select('tr'):
            item_cell = row.select_one('td.item-col')
            cells = row.find_all('td', recursive=False)
            if not item_cell or len(cells) < 4:
                continue
            item_link = item_cell.find('a', href=re.compile(r'^/w/'))
            name = clean(item_link or item_cell)
            quantity, rarity = clean(cells[2]), clean(cells[3])
            if not name:
                continue
            notes = []
            for cell in (cells[2], cells[3]):
                for ref in cell.select('sup.reference a[href^="#"]'):
                    if not re.search(r'\b[dfq]\s*\d', ref.get_text(' ', strip=True), re.I):
                        continue
                    note = soup.find(id=unquote(ref['href'][1:]))
                    if note:
                        value = note.select_one('.reference-text') or note
                        text = clean(value)
                        # Drop backlinks are navigation rather than conditions.
                        text = re.sub(r'^[\^\s↑a-z0-9.]+(?=[A-Z])', '', text)
                        if text and text not in notes:
                            notes.append(text)
            variant = dict(quantity=quantity or 'Unknown', rarity=rarity or 'Unknown')
            if condition:
                variant['condition'] = condition
            if section:
                variant['section'] = section
            if notes:
                variant['notes'] = ' '.join(notes)
            record = drops.setdefault(name, dict(name=name, quantity=quantity or 'Unknown',
                                                rarity=rarity or 'Unknown', variants=[]))
            if variant not in record['variants']:
                record['variants'].append(variant)
    return dict(level=' / '.join(levels) or 'Unknown', drops=list(drops.values()),
                source='https://runescape.wiki/w/' + quote(page['title'].replace(' ', '_')),
                revision=page.get('revid'), retrieved=DATE)


def run():
    OUTPUT.mkdir(exist_ok=True)
    (OUTPUT / 'pages').mkdir(exist_ok=True)
    baseline = json.loads((OUTPUT / 'records-before.json').read_text(encoding='utf-8'))
    titles = {name: unquote(record.get('source', '').split('/w/')[-1]).replace('_', ' ') or name
              for name, record in baseline.items()}
    for title in ADDITIONAL_PAGES:
        if title not in titles:
            titles[title] = title
    pages = {}
    unique = sorted(set(titles.values()))
    with ThreadPoolExecutor(max_workers=2) as pool:
        futures = [pool.submit(fetch, title) for title in unique]
        for index, future in enumerate(as_completed(futures), 1):
            title, data = future.result()
            pages[title] = parse(data)
            if index % 20 == 0 or index == len(unique):
                print(f'Fetched and parsed {index}/{len(unique)} pages', flush=True)
    records, failures = {}, {}
    for name, title in titles.items():
        record = pages[title]
        if record.get('error') or not record['drops']:
            failures[name] = record.get('error') or 'No direct drop table on page'
            if name in baseline:
                records[name] = baseline[name]
        else:
            records[name] = record
    (OUTPUT / 'records-refreshed.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    (OUTPUT / 'import-report.json').write_text(json.dumps(dict(pages=len(unique), records=len(records),
        refreshed=sum(r.get('retrieved') == DATE for r in records.values()), retained=failures), indent=2), encoding='utf-8')
    print(f'Done: {len(records)} records; {len(failures)} empty/unavailable pages retained or skipped.', flush=True)


if __name__ == '__main__':
    run()
