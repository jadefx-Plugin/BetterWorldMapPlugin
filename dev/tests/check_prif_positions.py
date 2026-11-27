from pathlib import Path
WORKSPACE = Path(__file__).resolve().parents[4]
from lupa import LuaRuntime
import json,re,math
r=Path(__file__).resolve().parents[2];sources=(WORKSPACE/'work/prif-travel-sources')
l=LuaRuntime();l.globals().source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8');l.execute('local c={};function require(n)if not c[n]then c[n]=assert(load(source(n)))()end;return c[n]end')
def py(v):
 if not hasattr(v,'items'):return v
 d={k:py(x) for k,x in v.items()};return [d[i] for i in range(1,len(d)+1)] if d and set(d)==set(range(1,len(d)+1)) else d
points=py(l.eval("require('data/travel/teleport_data').points"));before=json.loads((WORKSPACE/'work/before-prif-positions/teleports.json').read_text(encoding='utf8'))
districts={name:(int(x),int(z)) for x,z,name in re.findall(r'Teleport map\|(\d+),(\d+)\|name=(\w+)',(WORKSPACE/'work/prif-teleport-wiki-15093.txt').read_text(encoding='utf8')) if name in ['Iorwerth','Ithell','Cadarn','Amlodd','Trahaearn','Hefin','Crwys','Meilyr']}
assert len(districts)==8
def indexed(file,index):
 text=(sources/file).read_text(encoding='utf8');matches=re.findall(r'coordinates'+str(index)+r'\s*=\s*(\d+),\s*(\d+)',text);assert matches;return tuple(map(int,matches[-1]))
def bare(file):
 text=(sources/file).read_text(encoding='utf8');match=re.search(r'\{\{Teleport map\|(\d+),(\d+)',text);assert match;return tuple(map(int,match.groups()))
dg=(sources/'Template-Dungeoneering_cape_teleports.txt').read_text(encoding='utf8')
gorajo=tuple(map(int,re.search(r'(\d+),(\d+)\|mapID=28\|name=Gorajo',dg).groups()))
edimmu=tuple(map(int,re.search(r'(\d+),(\d+)\|mapID=28\|name=Edimmu',dg).groups()))
expected={
 'Morvran':indexed('Ferocious_ring.txt',2),'Gorajo Hoardstalker Dungeon':gorajo,'Edimmu resource dungeon':edimmu,
 'Eluned / Islwyn - Ithell':indexed('Tirannwn_quiver_4.txt',4),'Harmony pillars - Meilyr':indexed('Tirannwn_quiver_4.txt',10),
 'Max Guild garden':indexed('Max_guild_Teleport.txt',1),'Max Guild tower (configured)':indexed('Max_guild_Teleport.txt',2),
 'Waterfall fishing':bare('Waterfall_fishing_teleport.txt'),'Prifddinas portal':bare('Prifddinas_tablet.txt'),
 'Prifddinas house portal':bare('Prifddinas_tablet.txt'),'Prifddinas estate agent':indexed('Master_constructors_outfit.txt',5),
 'Tower of Voices clan portal':indexed('Clan_vexillum.txt',2),
 'Yew trees - Crwys':indexed('Natures_sentinel_outfit.txt',25),'Magic trees - Crwys':indexed('Natures_sentinel_outfit.txt',20),
 'Choking ivy - Crwys':indexed('Natures_sentinel_outfit.txt',34),
}
assert len(points)==581
movements=[];verified=0;anchors=0;unchangedOutside=0
for i,p in enumerate(points):
 if p.get('areaID',28)!=231:
  assert p==before[i],('Unrelated marker changed',i+1);unchangedOutside+=1;continue
 title=p['record']['title'];dest=p['record']['rows'][0]['name'];coord=(p['x'],p['z'])
 if title in ['Crystal teleport seed','Attuned crystal teleport seed','Master camouflage outfit']:
  assert coord==districts[dest],(title,dest,coord,districts[dest]);verified+=1
  if title=='Master camouflage outfit':
   text=(sources/'Master_camouflage_outfit.txt').read_text(encoding='utf8')
   assert re.search(r'coordinates\d+='+str(p['x'])+','+str(p['z'])+r'\|name\d+='+dest,text)
 elif dest in expected:assert coord==expected[dest],(title,dest,coord,expected[dest]);verified+=1
 else:assert title in ['Keldagrim camouflage outfit','Prifddinas camouflage outfit','Desert camouflage outfit'];assert coord==(2208,3361);assert 'not verified' in p['positionPrecision'];anchors+=1
 if i<len(before) and coord!=(before[i]['x'],before[i]['z']):movements.append({'index':i+1,'method':title,'destination':dest,'old':[before[i]['x'],before[i]['z']],'new':list(coord),'distanceTiles':round(math.dist(coord,(before[i]['x'],before[i]['z'])),2),'source':p['source']})
assert verified==47 and anchors==3 and unchangedOutside==531
report={'version':'0.12.6','auditedOriginalCityMethods':45,'cityMethodsAfterSplittingDistinctArrivals':50,'methodsMatchingPublishedTeleportMapCoordinates':verified,'nativeHubAreaAnchorsWithoutPublishedArrival':anchors,'unrelatedMarkersUnchanged':unchangedOutside,'movedOriginalMarkers':len(movements),'addedDistinctArrivalMarkers':5,'changes':movements,'districtCoordinatesFromPublishedSeedMaps':districts,'precision':'Published teleport-map coordinates checked against downloaded source wikitext; not live in-game captures.'}
(r/'dev/audits/prif_position_audit.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf8')
print(f'PASS: {verified} city methods match published coordinates; {anchors} explicitly labelled hub-area anchors; {len(movements)} misplaced markers corrected; 531 unrelated markers unchanged.')
