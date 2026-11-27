from pathlib import Path
from lupa import LuaRuntime
import json

ROOT = Path(__file__).resolve().parents[2]
lua = LuaRuntime(unpack_returned_tuples=True)
lua.globals().source = lambda name: (ROOT / (name + '.lua')).read_text(encoding='utf-8')
lua.execute('''
local cache={}
function require(n) if not cache[n] then cache[n]=assert(load(source(n)))() end return cache[n] end
local records=require('src/catalogues/monster_drops')
local Menu=require('src/integration/drop_menu')
local Hover=require('src/pins/map_hover')
local ids=require('data/catalogues/drop_item_ids')
local boss=require('data/catalogues/boss_drop_names')
local bestiary=require('data/catalogues/bestiary_data')
local ghrazi=records['The Ghrazi Blood Knights']
assert(ghrazi.level=='4914' and #ghrazi.drops==33)
assert(records['Lady Karmina Ghrazi']==ghrazi and records['Lord Vasily Ghrazi']==ghrazi)
local found
for _,entry in ipairs(bestiary) do
 if entry.name=='The Ghrazi Blood Knights' then found=entry end
end
assert(found and found.locations[1].x==4780 and found.locations[1].z==3402)
local function row(name,item)
 for _,d in ipairs(records[name].drops) do if d.name==item then return d end end
 error(name..': no '..item)
end
local tooth=row('The Ghrazi Blood Knights',"Malachi's tooth")
assert(#tooth.variants==6 and tooth.variants[1].rarity=='1/1500' and tooth.variants[6].rarity=='1/62.5')
assert(tooth.variants[6].condition:find('4000',1,true))
assert(row('The Ghrazi Blood Knights','Invoke Arisen Flesh incantation codex').variants[6].rarity=='1/125')
assert(row('Abyssal demon','Abyssal whip').rarity=='1/512 on task; 1/1,024 off task')
assert(row('Lava strykewyrm','Wyrm spike').rarity=='1/256 on task; 1/1,280 off task')
assert(row('King Black Dragon','Draconic visage').rarity=='1/252')
assert(row('Solak','Blightbound crossbow').rarity=='1/200')
assert(row('Vorago','Seismic wand').variants[1].notes:find('enhanced reward pile',1,true))
assert(row('Giant Mole','Rotten fang').variants[1].notes:find('threshold 200',1,true))
assert(row('The Barrows Brothers','Amulet of the forsaken').rarity=='1/240')
assert(row('Gargoyle','Granite maul').rarity=='1/256 on task; 1/512 off task')
assert(row('Hydrix dragon','Onyx bolt tips').variants[1].section=='Rare drop table')
assert(row('Hydrix dragon','Hydrix bolt tips').variants[1].section=='Other')
for name,record in pairs(records) do
 local names={}
 for _,drop in ipairs(record.drops) do
  assert(not names[drop.name],name..': duplicate icon '..drop.name)
  names[drop.name]=true
  assert(type(drop.rarity)=='string' and type(drop.quantity)=='string')
 end
end
local text=Hover.tooltip(tooth)
assert(text:find('Normal mode',1,true) and text:find('4000',1,true) and text:find('solo and duo',1,true))
assert(not text:find('Wiki reference',1,true))
assert(Hover.tooltip({name='<x>',rarity='Unknown',quantity='1'}):find('&lt;x&gt;',1,true))
for _,d in ipairs(ghrazi.drops) do assert(ids[d.name],d.name..' needs an icon') end
local function npc(configID,name) return {isValid=true,configID=configID,displayName=name} end
for _,id in ipairs({32907,32908,32909,32910}) do
 local matched=Menu.resolve(npc(id,'ignored display name'))
 assert(matched.name=='The Ghrazi Blood Knights' and records[matched.name]==ghrazi)
end
assert(not Menu.resolve(npc(32892,'Lady Karmina Ghrazi')))
assert(not Menu.resolve(npc(32893,'Lord Vasily Ghrazi')))
assert(Menu.resolve(npc(24004,'Nex')).name=='Nex: Angel of Death')
assert(boss['the ghrazi blood knights'])
MiniMenuEntryType={NPC=1}
local chosen
local function menu()
 local m={entries={{actionEntryType=1,npcData={entity=npc(32907,'Lady Karmina Ghrazi')}}}}
 function m:Add(label,callback) self.entries[#self.entries+1]={fullText=label,callback=callback} end
 function m:Swap(a,b) self.entries[a],self.entries[b]=self.entries[b],self.entries[a] end
 return m
end
local m=menu();Menu.apply(m,function(entry)chosen=entry end,{hideBossViewDrops=true});assert(#m.entries==1)
m=menu();Menu.apply(m,function(entry)chosen=entry end,{});assert(#m.entries==2)
m.entries[2].callback();assert(chosen.name=='The Ghrazi Blood Knights')
-- Map click and context action build the same inventory-icon grid from one record.
local grids={}
local function component() local c={};function c:SetPos()end;function c:SetSize()end;return c end
ui={Text={new=component}};id={Font={MUSEO_SANS_15PT_REGULAR=1}}
local P={Window={new=function()return {content={},Close=function()end,Destroy=function()end}end},
 ItemGrid={new=function(_,objects)grids[#grids+1]=objects;return {Destroy=function()end}end}}
found.catalog='Bestiary'
local h=Hover.new(P,nil,nil,nil,{root={x=0,y=0,width=700}},{width=1920,height=1080},function()return found end)
h:SetPins({{x=20,y=30}});assert(h:Click(20,30))
h:Open(chosen)
assert(#grids[1]==33 and #grids[2]==33)
for i,item in ipairs(grids[1]) do
 assert(item.object.id==grids[2][i].object.id and item.tooltip==grids[2][i].tooltip)
end
h:Shutdown()
''')
report = json.loads((ROOT / 'dev/audits/drop_refresh_2026_11_26.json').read_text(encoding='utf-8'))
assert report['verifiedChangeGroups'] == 138
assert report['missingItemArtwork'] == ['Cremation', 'Herbs', 'Nothing', 'Rare drop table', 'Tree seed']
print('PASS: verified rate examples and conditions; Ghrazi mode/enrage/pet rates, 33 item icons, entrance pin, canonical map/context grids, combat IDs and boss filter; no quest-version drop action.')
