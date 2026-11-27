from pathlib import Path
from lupa import LuaRuntime
import json
root=Path(__file__).resolve().parents[2];lua=LuaRuntime(unpack_returned_tuples=True)
lua.globals().source=lambda n:(root/(n+'.lua')).read_text(encoding='utf8')
lua.execute('''
local cache={}
function require(n)if not cache[n]then cache[n]=assert(load(source(n)))()end;return cache[n]end
local function component()
 local c={}
 function c:SetPos(x,y)self.x=x;self.y=y end
 function c:SetSize(w,h)self.width=w;self.height=h end
 function c:Clear()end
 function c:AddSprite(...)end
 function c:AddLine(...)end
 function c:SetAssociatedObject(id)assert(type(id)=='number')end
 function c:Destroy()end
 return c
end
ui={Canvas={new=component},Sprite={new=component}}
local world=require('data/pins/world_map_data')
local city=require('data/pins/prif_city_pins')
assert(#city==91)
for _,p in ipairs(city)do
 assert(p.tooltip and not p.tooltip:find('map marker'))
 assert(p.record and p.record.title and p.record.rows and #p.record.rows>0)
end
local tp=require('data/travel/teleport_data').points
assert(#tp==581)
local count=0;local portal=0;local attuned={}
for _,p in ipairs(tp)do
 local a=require('data/maps/map_areas_data')[p.areaID or 28]
 assert(p.x>=a.x and p.x<a.x+a.w and p.z>=a.z and p.z<a.z+a.h)
 if p.areaID==231 then
  count=count+1
  if p.record.title=='Attuned crystal teleport seed'then attuned[p.record.rows[1].name]=true end
  if p.record.rows[1].name=='Prifddinas portal'then
   assert(p.x==2166 and p.z==3336);portal=portal+1
  end
 end
end
assert(count==50 and portal==2)
local n=0;for _ in pairs(attuned)do n=n+1 end;assert(n==8)
local renderer=require('src/pins/world_map_icons').new({})
renderer:SetPoints(world,true,28)
renderer:Draw(2176,3360,3,1200,1200,true)
local expected={};for _,p in ipairs(city)do if not p.hiddenOnSurface and not (p.category==1159 and p.record.title:lower():find('resource dungeon',1,true)) then expected[p.x..':'..p.z..':'..p.tooltip]=true end end
local lodestones=0;local fairies=0;local travel=0
for _,h in ipairs(renderer.hits)do
 if h.mapX>=2048 and h.mapX<2304 and h.mapZ>=3264 and h.mapZ<3456 then
 local key=h.mapX..':'..h.mapZ..':'..h.text
 if expected[key]then assert(h.area and h.record and h.record.title==h.text);expected[key]=nil end
 if h.category==2613 then lodestones=lodestones+1;assert(h.mapX==2208 and h.mapZ==3361)end
 if h.category==4476 then fairies=fairies+1;assert(h.record.title=='Fairy ring DJS')end
 if h.members then travel=travel+#h.members end
 end
end
assert(next(expected)==nil,'Every visible city marker must have an embedded tooltip hit')
assert(lodestones==1 and fairies==1 and travel==46)
-- Map-key filtering removes item teleports while native city hover records survive.
renderer:SetFilters({[100007]=false})
renderer:Draw(2176,3360,3,1200,1200,true)
local typed=0
for _,h in ipairs(renderer.hits)do
 if h.members then for _,m in ipairs(h.members)do assert(m.point.category~=100007)end end
 if h.mapX>=2048 and h.mapX<2304 and h.mapZ>=3264 and h.mapZ<3456 and h.record and h.record.kind=='resource' then typed=typed+1 end
end
assert(typed==7)
renderer:Shutdown()
-- Existing requirements filter hides all city teleports when Plague's End is unfinished.
Player={IsAvailable=function()return true end}
config={Quest={FromID=function()return {hasFinishedQuest=false}end}}
local filter=require('src/pins/teleport_filter').new({hideTeleportRequirements=true})
filter:Refresh()
for _,p in ipairs(tp)do if p.areaID==231 then assert(not filter:Allows(p))end end
''')
print('PASS: 91 embedded city tooltips; 50 city travel methods; eight attuned district destinations; corrected house portal; all 581 markers within map bounds; single visible lodestone; map-key and quest filtering; renderer cleanup.')
