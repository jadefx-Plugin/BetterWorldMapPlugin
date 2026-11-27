from pathlib import Path
from lupa import LuaRuntime
r=Path(__file__).resolve().parents[2];l=LuaRuntime(unpack_returned_tuples=True)
l.globals().source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8')
l.execute('''
local modules={}
function require(n)if not modules[n]then modules[n]=assert(load(source(n)))()end;return modules[n]end
local artwork={}
local function component()
 local c={}
 function c:SetSize(w,h)self.width=w;self.height=h end
 function c:SetPos(x,y)self.x=x;self.y=y end
 function c:Clear()end
 function c:AddSprite()end
 function c:AddLine()end
 function c:SetAssociatedObject(id)assert(type(id)=='number');artwork[id]=true end
 function c:Destroy()end
 function c:MoveToFront()end
 return c
end
ui={Canvas={new=component},Sprite={new=component}}
local areas=require('data/maps/map_areas_data')
local A=require('src/map/map_areas')
local data=require('data/dungeons/resource_dungeon_data')
local R=require('src/dungeons/resource_dungeons')
assert(#data==22)
local resourceCount,rockCount,linked=0,0,0
for areaID,points in pairs(require('data/dungeons/submap_resources_data'))do
 local area=assert(areas[areaID]);local seen={}
 for _,p in ipairs(points)do
  assert(p.x>=area.x and p.x<area.x+area.w and p.z>=area.z and p.z<area.z+area.h)
  local key=p.x..':'..p.z..':'..p.category;assert(not seen[key]);seen[key]=true
  if p.resourceObjectID then resourceCount=resourceCount+1;assert(p.record and p.record.rows[1].name)end
  if areaID==18 and p.category==1159 then rockCount=rockCount+1 end
 end
end
assert(resourceCount==450 and rockCount==43)
local count={}
for _,p in ipairs(require('data/dungeons/submap_resources_data')[373])do count[p.tooltip]=(count[p.tooltip]or 0)+1 end
assert(count['Gold rock']==7 and count['Mithril rock']==4 and count['Phasmatite rock']==4 and count['Bank deposit box']==1)
local recognized=0
for _,p in ipairs(require('data/travel/teleport_data').points)do if R.IsEntranceTeleport(p)then recognized=recognized+1 end end
assert(recognized==42)
for _,d in ipairs(data)do
 local parent=assert(areas[d.parentArea]);assert(d.level>=10 and d.level<=100)
 local isSurface=d.parentArea==28 or d.parentArea==231
 local points=isSurface and require('data/pins/world_map_data')or parent.points
 local previousCount=#points
 local renderer=require('src/pins/world_map_icons').new({})
 renderer:SetPoints(points,isSurface,isSurface and 28 or d.parentArea)
 assert(#points==previousCount,'Shared native arrays must retain their stable indices')
 renderer:Draw(d.x,d.z,4,1200,1000,true)
 local entrance,found=0
 for _,hit in ipairs(renderer.hits)do
  if hit.resourceDungeonID==d.id then
   entrance=entrance+1;found=hit
   assert(hit.area and hit.category==100021 and hit.record.title==d.name)
   assert(hit.record.rows[1].name==d.level..' Dungeoneering')
   assert(hit.record.rows[2].name=='Inside the dungeon' and hit.record.rows[2].style=='section')
   local teleports=0;local section=false
   for _,row in ipairs(hit.record.rows)do
    if row.name=='Teleport items' and row.style=='section'then section=true end
    if section and row.item then teleports=teleports+1;assert(row.style=='item' and row.iconSize==32 and row.detail)end
   end
   if d.id~=7 then assert(teleports==3)end
  end
  for _,member in ipairs(hit.members or {})do assert(not R.IsEntranceTeleport(member.point),'Cape/ring must not cover the entrance')end
 end
 assert(entrance==1,'Each dungeon has exactly one visible entrance: '..d.name)
 local target=renderer:DungeonAt(found.x,found.y)
 if d.routeTarget then
  assert(type(target)=='table' and target.areaID==d.routeTarget.areaID,d.name..' wrong click target')
  local inside=assert(A.Get(target.areaID));assert(inside.id==target.areaID)
  assert(target.x>=inside.x and target.x<inside.x+inside.w and target.z>=inside.z and target.z<inside.z+inside.h)
  linked=linked+1
 else assert(target==nil,'No fabricated or unrelated interior target: '..d.name)end
 renderer:SetFilters({[100021]=false})
 renderer:Draw(d.x,d.z,4,1200,1000,true)
 for _,hit in ipairs(renderer.hits)do assert(not hit.resourceDungeonID)end
 renderer:Shutdown()
end
assert(linked==19)
local exits=require('src/dungeons/dungeon_return').Build(areas[373],nil,18,areas)
local back=0
for _,p in ipairs(exits)do if p.returnToPrevious then back=back+1;assert(math.abs(p.x-1041)<=1 and math.abs(p.z-4575)<=1)end end
assert(back==1,'The native interior exit is retained as one return marker')
-- Exercise the actual hover-card layout: level, contents and travel fit together.
ui.Layer={new=component};ui.Rectangle={new=component};ui.Text={new=component}
id={Font={MUSEO_SANS_15PT_REGULAR=1,CINZEL_13PT_BOLD=2}}
config={Font={FromID=function()return {
 GetStringWidth=function(_,s)return #s*8 end,
 GetStringLineCount=function(_,s,w)return math.max(1,math.ceil(#s*8/w))end,
}end}}
local entrance
for _,p in ipairs(R.Prepare(areas[18].points,18))do if p.resourceDungeonID==2 then entrance=p end end
local tooltip=require('src/pins/pin_tooltip').new({width=900,height=500})
tooltip:Show({area=true,category=100021,record=entrance.record,text=entrance.tooltip,index=1,x=150,y=150})
assert(tooltip.height<=492)
local oreRows={}
for _,row in ipairs(entrance.record.rows)do if row.style=='resource'then oreRows[row.name]=row;assert(row.tool==1265 and row.item and row.level)end end
assert(oreRows['Gold rock'].level==40 and oreRows['Gold rock'].item==444)
assert(oreRows['Mithril rock'].level==30 and oreRows['Mithril rock'].item==447)
assert(oreRows['Phasmatite rock'].level==70 and oreRows['Phasmatite rock'].detail:find('Hard Daemonheim',1,true))
for _,d in ipairs(data)do
 local entry
 for _,p in ipairs(R.Prepare({},d.parentArea))do if p.resourceDungeonID==d.id then entry=p end end
 assert(entry)
 tooltip:Show({area=true,category=100021,record=entry.record,text=entry.tooltip,index=d.id,x=150,y=150})
 local seen={}
 for step=1,#entry.record.rows do
  assert(tooltip.height<=492)
  for j=tooltip.first,tooltip.last do seen[j]=true end
  tooltip:Scroll(-1)
 end
 for j in ipairs(entry.record.rows)do assert(seen[j],'Every resource/item row must be reachable by scrolling: '..d.name)end
end
assert(artwork[18508]and artwork[19709]and artwork[28581],'Actual item image components must be created for both capes and the charged ring')
tooltip:Hide()
local unique={};for _,id in ipairs(require('src/map/native_map_list'))do assert(not unique[id]);unique[id]=true end
print('PASS: all 22 entrance cards, 19 bundled interior links, no 42 duplicate cape/ring pins; 450 resource/utility pins; 43 Dwarven Mine rocks; 7 gold/4 mithril/4 phasmatite inside; filtering, native indices, exit return and cleanup.')
''')
