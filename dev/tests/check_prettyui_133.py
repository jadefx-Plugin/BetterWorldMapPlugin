from pathlib import Path
from lupa import LuaRuntime

ROOT=Path(__file__).resolve().parents[2]
PRETTY=ROOT.parents[1]/'work/prettyui-1.3.3'
lua=LuaRuntime(unpack_returned_tuples=True)
def source(name):
    if name=='pretty_main':return (PRETTY/'main.lua').read_text(encoding='utf-8')
    project=ROOT/(name+'.lua')
    return (project if project.is_file() else PRETTY/(name+'.lua')).read_text(encoding='utf-8')
lua.globals().source=source
lua.execute((ROOT/'dev/tests/native_ui_fixture.lua').read_text(encoding='utf-8'))
lua.execute('''
local cache={}
function require(n)if not cache[n]then cache[n]=assert(load(source(n),n))()end;return cache[n]end
prettyui=require('pretty_main')
local Native=require('src/ui/native_components')
local Layout=require('src/ui/map_resize')
local commits,reflows,moves=0,0,0
local window=prettyui.Window.new(TestHost,{title='Map',x=100,y=100,width=820,height=600,
 minWidth=520,minHeight=360,resizable=true,categoryID='auto',respectInterfaceLock=false,
 onPositionChange=function()moves=moves+1 end})
assert(window.resize and not window.locked,'Native lock must not disable plugin movement')
window.titleControls={left=40,right=282}
local adapter=Layout.new(window,function()reflows=reflows+1 end,function()commits=commits+1 end)
assert(window.titleDrag.x==140 and window.titleDrag.width==498)
local function fire(component,hook,x,y)
 for _,callback in pairs(component.hooks[hook] or {})do callback(component,x,y)end
end
local title=window.titleDrag
SetPointer(title.x+10,title.y+10);fire(title,ui.Hook.ONCLICK,10,10)
fire(title,ui.Hook.ONHOLD,10,10)
SetPointer(220,150);fire(title,ui.Hook.ONHOLD,220,150)
assert(moves==0,'Position save must wait for drag completion')
fire(title,ui.Hook.ONRELEASE,220,150);assert(moves==1)
Layout.SyncHeader(window)
-- Native content-host layers must remain valid parents for PrettyUI containers.
local layer=Native.New(ui.Layer,window.content)
local view=prettyui.SimpleView.new(layer,{width=220,height=150,categoryID='auto'})
assert(view.content)
local sprites={}
Native.Batch(window.content,function()
 for i=1,6000 do sprites[i]=Native.New(ui.Sprite,window.content) end
end)
for _,sprite in ipairs(sprites)do assert(sprite.categoryID>0 and sprite.dynamicID<=234)end
for _,sprite in ipairs(sprites)do sprite:Destroy()end
for round=1,3 do
 for i=1,3000 do sprites[i]=Native.New(ui.Sprite,window.content)end
 for i=1,3000 do sprites[i]:Destroy()end
end
-- The library's own edge handler commits geometry; our adapter only reflows/saves.
local resize=window.resize
local handle=resize.handles.se_h
SetPointer(920,700);resize:_Begin('se_h',handle,0,0)
SetPointer(1060,780);resize:_Move(handle,140,80)
adapter:Update();assert(reflows==1 and commits==0)
for i=1,5 do adapter:Update()end;assert(commits==0,'Do not save while captured')
resize:Cancel();adapter:Update();adapter:Update();assert(commits==1)
assert(window.root.width>=520 and window.root.height>=360)
local width,height=window.root.width,window.root.height
adapter:Update();assert(window.root.width==width and window.root.height==height)
-- A caption capture layer must not be shrunk while a drag is underway.
window.titleDrag:SetSize(1920,1080);Layout.SyncHeader(window);assert(window.titleDrag.height==1080)
window.titleDrag:SetSize(700,32);Layout.SyncHeader(window)
-- New tooltip attachments allocate only while shown.
local target=Native.New(ui.Sprite,window.content)
local before=AllocatedCount()
local tips={}
for i=1,1000 do tips[i]=prettyui.Tooltip.attach(target,window.content,'Test item')end
assert(AllocatedCount()==before,'Attaching hidden tooltips must not allocate native artwork')
tips[1]:Show();assert(AllocatedCount()>before)
tips[1]:Hide();assert(AllocatedCount()==before)
for _,tip in ipairs(tips)do tip:Destroy()end
target:Destroy()
-- Exercise the actual drop-popup controller with actual 1.3.3 ItemGrid/Window.
local selected={name='The Ghrazi Blood Knights',catalog='Bestiary'}
local popup=require('src/pins/map_hover').new(prettyui,nil,nil,nil,window,TestHost,
 function()return selected end,{useNativeTransparency=true})
local popupBefore=AllocatedCount()
popup:Open(selected)
assert(popup.popup.useNativeTransparency and not popup.popup.respectInterfaceLock)
assert(popup.grid:GetSlot(33).object.id)
popup:Shutdown();assert(AllocatedCount()==popupBefore,'Drop-popup teardown leaked controls')
-- New transparency preference defaults off, persists and does not churn writes.
local writes=0
local db={GetStructuredData=function()return nil end,SetStructuredData=function()writes=writes+1;return true end}
local prefs=require('src/core/map_settings').new(db)
assert(prefs.value.useNativeTransparency==false)
prefs.value.useNativeTransparency=true;assert(prefs:Save(prefs.value))
local written=writes;assert(prefs:Save(prefs.value) and writes==written)
GameKey={M=70,FromID=function()return 'M'end}
local shortcuts={Clear=function()end,SetCaptureCheck=function()end,SetBinding=function()end}
local settings=require('src/ui/map_preferences_ui').new(prettyui,TestHost,window,prefs.value,shortcuts,function()end,function()end)
settings:Open()
assert(not settings.window.respectInterfaceLock)
settings.pickers[1]:Open();settings.pickers[1]:Close()
settings:Destroy()
-- New native transparency composes once with our existing walking/window fade.
window:SetUseNativeTransparency(true)
local base=1-128/255
assert(math.abs(window.background.alpha-base)<1e-8)
local fade=require('src/core/movement_opacity').new({transparency=50})
fade:Update(window);assert(math.abs(window.background.alpha-base*.5)<1e-8)
for i=1,5 do fade:Update(window)end
assert(math.abs(window.background.alpha-base*.5)<1e-8,'Opacity must not compound')
window:SetUseNativeTransparency(false);fade:Update(window)
assert(math.abs(window.background.alpha-.5)<1e-8)
fade:Restore();assert(math.abs(window.background.alpha-1)<1e-8)
view:Destroy();adapter:Destroy();window:Destroy()
assert(AllocatedCount()==0,'Window/resize teardown leaked native controls')
''')
print('PASS: actual PrettyUI 1.3.3 windows/settings/colour picker, native resize and position callback, 33-item drop popup, 1000 lazy tooltips, 6000 auto-ID sprites, preference persistence, opacity and cleanup.')
