from pathlib import Path
WORKSPACE = Path(__file__).resolve().parents[4]
from lupa import LuaRuntime
import json,re,copy
r=Path(__file__).resolve().parents[2];l=LuaRuntime();l.globals().source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8');l.execute('local c={};function require(n)if not c[n]then c[n]=assert(load(source(n)))()end;return c[n]end')
def py(v):
 if not hasattr(v,'items'):return v
 d={k:py(x)for k,x in v.items()};return [d[i]for i in range(1,len(d)+1)]if d and set(d)==set(range(1,len(d)+1))else d
def emit(v):
 if isinstance(v,str):return json.dumps(v,ensure_ascii=False)
 if isinstance(v,bool):return str(v).lower()
 if isinstance(v,(int,float)):return str(v)
 if isinstance(v,list):return '{'+','.join(emit(x)for x in v)+'}'
 return '{'+','.join('['+emit(k)+']='+emit(x)for k,x in v.items())+'}'
def key(s):return re.sub('[^a-z0-9]','',s.lower())
refs={}
for record in py(l.eval("require('data/pins/pin_details')")).values():
 if record.get('kind')=='resource':
  for row in record['rows']:
   if row.get('item')or row.get('level'):refs.setdefault(key(row['name']),row)
for points in py(l.eval("require('data/dungeons/submap_resources_data')")).values():
 for p in points:
  for row in p.get('record',{}).get('rows',[]):
   if row.get('item')or row.get('level'):refs.setdefault(key(row['name']),row)
items={}
for item in json.load(open(WORKSPACE/'work/item-names.json')):
 if item.get('note')is None:items.setdefault(key(item['name']),item['id'])
catalog=json.load(open(WORKSPACE/'work/resource-dungeon-catalogue-raw.json'));dungeons=py(l.eval("require('data/dungeons/resource_dungeon_data')"));result={};unresolved=[];resourceCount=0
for i,(raw,dungeon)in enumerate(zip(catalog,dungeons),1):
 inside=[]
 for line in raw['resourcesWiki'].splitlines():
  if not line.lstrip().startswith('*'):continue
  link=re.search(r'\[\[([^\]|]+)(?:\|([^\]]+))?\]\]',line)
  if not link:continue
  name=link[1];display=link[2]or name;count=re.match(r'\s*\*\s*(\d+)\s',line);count=int(count[1])if count else None
  candidates=[key(name),key(display),key(name+' tree'),key(name+' rock'),key(name.replace(' (rock)','')),key(display+' tree')]
  base=next((refs[k]for k in candidates if k in refs),None)
  if base:
   row=copy.deepcopy(base);row['style']='resource';resourceCount+=1
   if count:row['detail']=str(count)+' '+('trees'if 'tree'in row['name'].lower()else 'rocks')+'; '+row.get('detail','')
   if i==2 and 'phasmatite'in row['name'].lower():row['detail']=row.get('detail','')+'\nHard Daemonheim achievements required.'
  else:
   item=next((items[k]for k in candidates if k in items),None)
   row={'name':display[:1].upper()+display[1:],'style':'item','detail':(str(count)+' spawns'if count else 'Resource inside the dungeon')}
   if item:row['item']=item;row['iconSize']=32
   else:unresolved.append({'dungeon':dungeon['name'],'resource':name})
  inside.append(row)
 if i in [2,5]:inside.append({'name':'Bank deposit box','spriteID':22459,'detail':'Inside the dungeon'+(' extension'if i==5 else ''),'style':'item','iconSize':32})
 monsters=re.sub(r'\[\[([^\]|]+)\|([^\]]+)\]\]',r'\2',raw['monstersWiki']);monsters=re.sub(r'\[\[([^\]]+)\]\]',r'\1',monsters);monsters=re.sub(r'\{\{.*?\}\}','',monsters);monsters='; '.join(line.strip(' *')for line in monsters.splitlines()if line.strip(' *'))
 if i==17:monsters='Fungal rodents; infested axes; fungal mages; grifolaroos; grifolapines; ganodermic runts; ganodermic beasts'
 if monsters:inside.append({'name':'Creatures','detail':monsters})
 teleport=[]
 for name in dungeon['teleportItems']:
  item={'Dungeoneering cape':18508,'Dungeoneering master cape':19709,'Hoardstalker ring':28581}.get(name)or items.get(key(name))
  row={'name':name,'style':'item','iconSize':32,'detail':{'Dungeoneering cape':'99 Dungeoneering; cape teleport.','Dungeoneering master cape':'120 Dungeoneering; cape teleport.','Hoardstalker ring':'Requires a previous visit and a charged ring; arrives inside.'}.get(name,'Destination unlocks apply.')}
  if item:row['item']=item
  teleport.append(row)
 result[i]={'inside':inside,'teleports':teleport}
r.joinpath('data/dungeons/resource_dungeon_visuals_data.lua').write_text('-- Resource rows reuse bundled mining/woodcutting item and skill metadata; teleport artwork uses native item IDs.\nreturn '+emit(result)+'\n',encoding='utf8')
r.joinpath('dev/audits/resource_dungeon_visuals_audit.json').write_text(json.dumps({'dungeons':len(result),'miningWoodcuttingRows':resourceCount,'teleportRows':sum(len(v['teleports'])for v in result.values()),'unresolvedResourceIcons':unresolved,'teleportItemIDs':{'Dungeoneering cape':18508,'Dungeoneering master cape':19709,'Hoardstalker ring (8)':28581}},indent=2)+'\n',encoding='utf8')
print(json.dumps({'typedResourceRows':resourceCount,'unresolved':unresolved}))
