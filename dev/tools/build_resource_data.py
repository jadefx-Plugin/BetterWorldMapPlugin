from pathlib import Path
WORKSPACE = Path(__file__).resolve().parents[4]
from lupa import LuaRuntime
import json,re,html,math,copy
r=Path(__file__).resolve().parents[2];l=LuaRuntime();l.globals().source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8');l.execute('local c={};function require(n)if not c[n]then c[n]=assert(load(source(n)))()end;return c[n]end')
def py(v):
 if not hasattr(v,'items'):return v
 d={k:py(x) for k,x in v.items()};return [d[i] for i in range(1,len(d)+1)] if d and set(d)==set(range(1,len(d)+1)) else d
def emit(v):
 if isinstance(v,str):return json.dumps(v,ensure_ascii=False)
 if isinstance(v,bool):return str(v).lower()
 if isinstance(v,(int,float)):return str(v)
 if isinstance(v,list):return '{'+','.join(emit(x) for x in v)+'}'
 return '{'+','.join('['+emit(k)+']='+emit(x) for k,x in v.items())+'}'
def write(name,data,comment):r.joinpath(name).write_text('-- '+comment+'\nreturn '+emit(data)+'\n',encoding='utf8')
areas=json.loads((WORKSPACE/'work/all-map-areas.json').read_text());areas={int(k):v for k,v in areas.items()};zones={a['id']:a for a in json.load(open(WORKSPACE/'work/map-zones.json'))}
restored={}
for aid,name in [(121,"Braindeath Island 'Rum'-geon"),(266,'Polypore Dungeon'),(267,'Polypore Resource Dungeon'),(619,'Waterfall cave'),(674,'Gorajo Hoardstalker Dungeon'),(675,'Edimmu resource dungeon')]:
 zone=zones[aid];bs=zone['bounds'];x=min(b['dst']['xstart']//64*64 for b in bs);z=min(b['dst']['zstart']//64*64 for b in bs);ex=max((b['dst']['xend']//64+1)*64 for b in bs);ez=max((b['dst']['zend']//64+1)*64 for b in bs)
 area={'id':aid,'name':name,'x':x,'z':z,'w':ex-x,'h':ez-z,'segments':[{'sx':b['src']['xstart'],'sz':b['src']['zstart'],'dx':b['dst']['xstart'],'dz':b['dst']['zstart'],'w':b['src']['xend']-b['src']['xstart']+1,'h':b['src']['zend']-b['src']['zstart']+1,'level':b['plane'],'levels':1} for b in bs],'points':[],'labels':[],'fullImageSafe':True}
 restored[aid]=area;areas[aid]=area
write('data/maps/resource_submaps.lua',restored,'Additional bundled native maps needed to browse resource-dungeon entrances and interiors.')
def project(aid,x,z,level=0):
 for b in areas[aid]['segments']:
  if b['sx']<=x<b['sx']+b['w'] and b['sz']<=z<b['sz']+b['h'] and b['level']<=level<b['level']+b['levels']:return x+b['dx']-b['sx'],z+b['dz']-b['sz']
 a=areas[aid]
 if a['x']<=x<a['x']+a['w'] and a['z']<=z<a['z']+a['h']:return x,z
 raise ValueError((aid,x,z,level))
names={};rows={}
world=py(l.eval("require('data/pins/world_map_data')"));details=py(l.eval("require('data/pins/pin_details')"))
for i,record in details.items():
 if record.get('kind')=='resource':
  for row in record['rows']:
   key=row.get('name','').lower();rows.setdefault(key,copy.deepcopy(row))
keys=py(l.eval("require('data/pins/map_key_data')"));sprites={p['id']:p.get('sprite') for p in keys}
placements=json.load(open(WORKSPACE/'work/submap-resource-placements.json'));resourcePoints={};counts={}
for key,ps in placements['points'].items():
 aid=int(key);result=[];dedup=set()
 for p in ps:
  name=p['name'];kind=p['type'];xy=(p['x'],p['z']);token=(name,*xy)
  if token in dedup:continue
  dedup.add(token)
  if kind=='exit':
   if aid not in list(range(372,386))+[121,267,667,674,675,717]:continue
   point={'x':p['x'],'z':p['z'],'sprite':20903,'background':18946,'category':948,'tooltip':'Dungeon exit','returnToPrevious':True}
  else:
   category={'mining':1159,'woodcutting':1158,'deposit':4632,'anvil':1161,'furnace':1160}[kind]
   row=copy.deepcopy(rows.get(name.lower(),{'name':name}))
   record={'title':name,'kind':'resource' if kind in ['mining','woodcutting'] else 'navigation','width':275,'rows':[row]}
   if aid==373 and name=='Phasmatite rock':record['note']='Requires hard Daemonheim achievements to access the extension.'
   point={'x':p['x'],'z':p['z'],'sprite':sprites.get(category) or 22566,'background':18950,'category':category,'tooltip':name,'iconSize':12 if kind in ['mining','woodcutting'] else 18,'record':record,'resourceObjectID':p['placedObject']}
  result.append(point);counts[kind]=counts.get(kind,0)+1
 resourcePoints[aid]=result
write('data/dungeons/submap_resources_data.lua',resourcePoints,'Resource and utility pins projected from verified native scenery placements; offline cache extraction.')
def clean(text):
 text=re.sub(r'<!--.*?-->','',text,flags=re.S);text=re.sub(r'<ref\b[^>]*>.*?</ref>|<ref[^>]*/>','',text,flags=re.S)
 text=re.sub(r'\[\[([^\]|]+)\|([^\]]+)\]\]',r'\2',text);text=re.sub(r'\[\[([^\]]+)\]\]',r'\1',text)
 text=re.sub(r'\{\{NA\}\}','',text,flags=re.I);text=re.sub(r'\{\{.*?\}\}','',text,flags=re.S);text=re.sub(r'<[^>]+>','',text)
 return html.unescape(re.sub(r'\s+',' ',text.replace('*','; ')).strip(' ;'))
catalog=json.load(open(WORKSPACE/'work/resource-dungeon-catalogue-raw.json'))
parents=[31,18,31,13,28,619,28,18,19,17,17,31,28,23,28,13,266,25,28,231,231,28]
interiors=[372,373,374,375,None,376,None,377,121,378,379,380,None,381,383,384,267,385,667,675,674,717]
aliases={0:['Edgeville chaos druids'],2:['Edgeville hill giants'],8:['Braindeath Island Rum-geon'],17:['Asgarnian Ice resource dungeon'],18:['Kalgerion resource dungeon']}
out=[]
for i,c in enumerate(catalog):
 raw=re.sub(r'<!--.*?-->','',c.get('pageText',''),flags=re.S);entry=c['entry'].copy()
 m=re.search(r'\{\{Map\|([^}]+)',raw)
 if m:
  fields=dict(re.findall(r'(\w+)=([^|}]+)',m[1]));entry.update({k:v.strip()for k,v in fields.items()})
 parent=parents[i];x,z=project(parent,int(entry['x']),int(entry['y']),int(entry.get('plane',0)))
 name=c['name'];content=clean(c['resourcesWiki']);monsters=clean(c['monstersWiki']);
 if i==16:monsters='Fungal rodents; infested axes; fungal mages; grifolaroos; grifolapines; ganodermic runts; ganodermic beasts'
 if i in [1,4]:content+='; bank deposit box'
 inside='; '.join(s for s in [content,monsters]if s)
 access=[]
 if i==5:access.append('Waterfall Quest required.')
 if i==8:access.append('A Clockwork Syringe required.')
 if i==12:access.append('One of a Kind required.')
 if i in [19,20]:access.append("Plague's End required.")
 if i==1:access.append('Phasmatite extension: hard Daemonheim achievements.')
 if i==4:access.append('Extended area: medium Daemonheim achievements.')
 if i==19:access.append('An appropriate Slayer assignment is needed for the edimmu room.')
 items=[] if i==6 else ['Dungeoneering cape','Dungeoneering master cape','Hoardstalker ring']
 extra=[]
 teleport=re.search(r'^\|teleport\s*=\s*\n(.*?)(?=^\|\w|^\}\})',raw,re.M|re.S)
 if teleport:
  for link in re.findall(r'\[\[([^\]|]+)',teleport[1]):
   if link.lower()not in [x.lower()for x in items]and link not in extra:extra.append(link)
 if i==6:extra=['Ring of kinship (Daemonheim; then walk)','Fort Forinthry lodestone (then walk)']
 row={'id':i+1,'name':name,'level':c['level'],'parentArea':parent,'x':x,'z':z,'contents':inside or 'See dungeon description.','access':' '.join(access),'teleportItems':items,'nearbyTravel':extra,'aliases':[name]+aliases.get(i,[]),'source':'https://runescape.wiki/w/'+name.replace(' ','_')}
 interior=interiors[i]
 if interior:
  area=areas[interior];exits=[p for p in resourcePoints.get(interior,[])if p['category']==948]
  pos=exits[0]if exits else {'x':area['x']+area['w']/2,'z':area['z']+area['h']/2}
  row['routeTarget']={'areaID':interior,'x':pos['x'],'z':pos['z']}
 out.append(row)
write('data/dungeons/resource_dungeon_data.lua',out,'All 22 resource dungeons: published entry requirements/contents and native map projections. See dev/audits/resource_dungeon_audit.json.')
r.joinpath('dev/audits/resource_dungeon_audit.json').write_text(json.dumps({'resourceDungeons':len(out),'submapAreasScanned':placements['areasScanned'],'sourceRegionsScanned':placements['regions'],'resourcePlacementsByType':counts,'mapsWithAddedResources':sum(any(p.get('resourceObjectID') for p in ps) for ps in resourcePoints.values()),'additionalNativeMaps':list(restored),'catalogue':out,'missingCacheRegions':placements['failures'],'sources':['https://runescape.wiki/w/Resource_dungeons','https://runescape.wiki/w/Template:Dungeoneering_cape_teleports','Individual resource-dungeon pages and native cache scenery placements']},indent=2)+'\n',encoding='utf8')
print('Generated',len(out),'resource dungeon entrances;',sum(map(len,resourcePoints.values())),'submap placements;',len(restored),'restored maps.')
