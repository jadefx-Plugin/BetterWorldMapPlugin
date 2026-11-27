from pathlib import Path
WORKSPACE = Path(__file__).resolve().parents[4]
from lupa import LuaRuntime
root=Path(__file__).resolve().parents[2];pretty=Path(__file__).resolve().parents[4]/'work/prettyui-1.3.3'
lua=LuaRuntime(unpack_returned_tuples=True)
lua.globals().read_source=lambda n:(root/(n+'.lua')).read_text(encoding='utf8')
lua.globals().has_source=lambda n:(root/(n+'.lua')).is_file()
lua.globals().ordered_source=(pretty/'src/ordered_combo_box.lua').read_text(encoding='utf8')
lua.execute('''
local cache={}
function require(n)
 if n=='src/core/math'then return {clamp=function(x,a,b)return math.max(a,math.min(b,x))end}end
 if n:sub(1,4)=='src/' and not has_source(n) then return {}end
 if not cache[n]then cache[n]=assert(load(read_source(n)))()end;return cache[n]
end
ui={SelectionChangeEvent={SELECTED=1}}
local Ordered=assert(load(ordered_source))()
local Optimize=require('src/ui/map_dropdown').Optimize
local actual=require('src/map/map_areas').Entries()
local function create()
 local self=setmetatable({entries={},entriesByID={},selectedID=28,selectedLabel='RuneScape Surface',
  _pendingInputContents={},entryHeight=24,maxVisibleEntries=12,root={x=76,y=4,width=250,height=24},
  overlayParent={height=600},input={content='RuneScape Surface'},rebuilds=0,rowCreations=0,layouts=0,callbacks=0}, {__index=Ordered})
 local dropdown={root={hidden=true},entriesByID={},scroll=0}
 function dropdown.root:SetPos(x,y)self.x=x;self.y=y end
 function dropdown.root:MoveToFront()end
 function dropdown:SetSize(w,h)self.width=w;self.height=h;self.owner.layouts=self.owner.layouts+1 end
 function dropdown:SetScrollPosition(y)self.scroll=y end
 function dropdown:_RebuildRows()
  self.owner.rebuilds=self.owner.rebuilds+1
  for _,e in ipairs(self.owner.entries)do if e.visible then self.owner.rowCreations=self.owner.rowCreations+1 end end
 end
 function dropdown:SetEntryVisible(id,visible)
  local e=self.entriesByID[id];e.visible=visible;if not visible then e.selected=false end
  self:_RebuildRows()
 end
 function dropdown:SetSelected(id,selected)self.entriesByID[id].selected=selected end
 dropdown.owner=self;self.dropdown=dropdown
 self.onChange=function()self.callbacks=self.callbacks+1 end
 for _,e in ipairs(actual)do
  local entry={id=e.id,label=e.label,visible=true}
  self.entries[#self.entries+1]=entry;self.entriesByID[e.id]=entry
  dropdown.entriesByID[e.id]={visible=true,selected=e.id==28}
 end
 return self
end
local baseline=create();baseline:_Open()
assert(baseline.rebuilds==#actual and baseline.rowCreations==#actual*#actual)
local combo=Optimize(create());combo:_Open()
assert(combo.open and not combo.dropdown.root.hidden)
assert(combo.rebuilds==0 and combo.rowCreations==0 and combo.callbacks==0)
combo.dropdown.scroll=96
for i=1,100 do combo:_LayoutDropdown()end
assert(combo.layouts==1 and combo.dropdown.scroll==96,'Idle overlay updates must retain scroll without relayout')
local wanted=actual[20]
combo:_Filter(wanted.label:upper())
assert(combo.rebuilds==1)
local matches=0
for _,e in ipairs(combo.entries)do
 local expected=e.label:lower():find(wanted.label:lower(),1,true)~=nil
 assert(e.visible==expected and combo.dropdown.entriesByID[e.id].visible==expected)
 if e.visible then matches=matches+1 end
end
assert(matches>=1 and combo.callbacks==0 and combo.dropdown.scroll==0)
combo:_Filter(wanted.label:upper());assert(combo.rebuilds==1)
combo:Select(wanted.id,true);combo:_Close()
assert(combo.callbacks==1 and combo:GetSelectedID()==wanted.id and combo:GetSelectedLabel()==wanted.label)
assert(not combo.open and combo.dropdown.root.hidden)
combo:_Open();assert(combo.rebuilds==2 and combo.callbacks==1)
combo:_Filter('this-map-does-not-exist');assert(combo.rebuilds==3)
for _,e in ipairs(combo.entries)do assert(not e.visible)end
combo:_Close();combo:_Open();assert(combo.rebuilds==4)
combo.root.width=310;combo:_LayoutDropdown();assert(combo.dropdown.width==310)
local other={};assert(Optimize(other)==other)
local broken=Optimize(create());broken.dropdown.entriesByID[actual[1].id]=nil
-- Future incompatible shapes retain the dependency's own behavior rather than partially mutating entries.
local originalCalls=0
local fallback={_Filter=function()originalCalls=originalCalls+1 end,_LayoutDropdown=function()end,
 dropdown={_RebuildRows=function()end,entriesByID={}},entries={{id=123,label='Test'}},root={}}
Optimize(fallback):_Filter('test');assert(originalCalls==1)
print('PASS: '..#actual..' maps; opening goes from '..baseline.rebuilds..' rebuilds / '..baseline.rowCreations..' recreated rows to zero; one rebuild per changed search; selection, callbacks, empty results, scrolling, resize and fallback preserved.')
''')
