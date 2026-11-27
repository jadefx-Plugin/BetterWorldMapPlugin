from pathlib import Path
from lupa import LuaRuntime
r=Path(__file__).resolve().parents[2];l=LuaRuntime(unpack_returned_tuples=True)
# Check all Lua sources compile without executing native game calls.
for p in [r/'main.lua',*(r/'src').rglob('*.lua'),*(r/'data').rglob('*.lua')]:
 result=l.eval('function(s,n) local f,e=load(s,n);return f~=nil,e end')(p.read_text(encoding='utf8'),p.name)
 assert result[0],(p.name,result[1])
l.globals().read_source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8')
l.execute('''
local modules={}
function require(n)if not modules[n]then modules[n]=assert(load(read_source(n)))()end;return modules[n]end
local manifest=require('data/maps/terrain_atlas')
local R=require('src/render/terrain_renderer')
local created,destroyed,live,peak=0,0,0,0
local function sprite()
 created=created+1;live=live+1;peak=math.max(peak,live)
 local s={}
 function s:SetPos(x,y)self.x=x;self.y=y end
 function s:SetSize(w,h)assert(w>=0 and h>=0);self.w=w;self.h=h end
 function s:Destroy()assert(not self.destroyed);self.destroyed=true;destroyed=destroyed+1;live=live-1 end
 return s
end
local assets={surface_chunks={},own_terrain={}}
for _,level in ipairs(manifest.levels)do for _,t in ipairs(level.tiles)do assets[level.group][t.key]=t.key end end
local opts={makeSprite=sprite,resources=function(g)return assets[g]end,warn=function(s)error(s)end}
local renderer=R.new(nil,opts)
assert(renderer:SelectLevel(8).density==4)
assert(renderer:SelectLevel(4).density==4)
assert(renderer:SelectLevel(2).density==2)
assert(renderer:SelectLevel(1).density==1)
assert(renderer:SelectLevel(.25).density==.5)
renderer:Draw(3222,3218,2,1200,800)
assert(live>0 and live<=27)
local previous=created
renderer:Draw(3222,3218,2,1200,800);assert(created==previous,'Unchanged viewport must not allocate')
for _,scale in ipairs({8,4,2,1,.5,.25,1,4,2})do
 for i=1,8 do
  local stats=renderer:Draw(2500+i*150,3200+i*50,scale,2800,1400)
  assert(stats.drawn<=76 and live==stats.drawn)
 end
end
renderer:Draw(-100000,-100000,2,1000,700);assert(live==0)
renderer:Draw(3222,3218,2,1200,800);assert(live>0)
renderer:Draw(3222,3218,0,1200,800);assert(live==0)
renderer:Draw(0/0,3218,2,1200,800);assert(live==0)
assets.own_terrain=nil
assert(renderer:SelectLevel(.5).name=='detail','Unregistered LOD images must fall back to original local tiles')
renderer:Draw(3222,3218,.5,2400,1400);assert(live>0)
renderer:Shutdown();assert(live==0 and created==destroyed)
-- Shared world boundaries must round to the same pixel even at fractional scales.
local a={version=1,levels={{name='test',group='test',span=256,density=4,tiles={{key='a',x=0,z=0},{key='b',x=256,z=0}}}}}
local seam=R.new(nil,{atlas=a,makeSprite=sprite,resources=function()return {a='a',b='b'}end,warn=function(s)error(s)end})
seam:Draw(256.17,128.3,1.37,1000,700)
assert(seam.sprites['test/a'].x+seam.sprites['test/a'].w==seam.sprites['test/b'].x,'Adjacent tiles must share exact edges')
seam:Shutdown();assert(live==0)
-- A resource-assignment failure must release the just-created native component.
local errors=0
local failed=R.new(nil,{atlas=a,resources=function()return {a='a',b='b'}end,
 makeSprite=function()local s=sprite();return setmetatable(s,{__newindex=function(t,k,v)if k=='sprite'then error('simulated missing resource')else rawset(t,k,v)end end})end,
 warn=function()errors=errors+1 end})
failed:Draw(256,128,1,1000,700);assert(live==0 and errors==1)
failed:Shutdown()
print('PASS: 4 LOD levels, viewport reuse, repeated pan/zoom, bounded sprites, fallback, seam alignment, failure cleanup and shutdown; peak '..peak..' terrain sprites')
''')
print('PASS: all current-feature project Lua files compile')
