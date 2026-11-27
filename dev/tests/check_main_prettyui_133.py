"""Startup/shutdown smoke test using real PrettyUI and a mocked native host."""
from pathlib import Path
from lupa import LuaRuntime
ROOT=Path(__file__).resolve().parents[2]
PRETTY=ROOT.parents[1]/'work/prettyui-1.3.3'
lua=LuaRuntime(unpack_returned_tuples=True)
def source(name):
    if name=='pretty_main':return (PRETTY/'main.lua').read_text(encoding='utf-8')
    p=ROOT/(name+'.lua')
    return (p if p.is_file() else PRETTY/(name+'.lua')).read_text(encoding='utf-8')
lua.globals().source=source
lua.execute((ROOT/'dev/tests/native_ui_fixture.lua').read_text(encoding='utf-8'))
lua.execute('''
local cache={}
function require(n)if not cache[n]then cache[n]=assert(load(source(n),n))()end;return cache[n]end
prettyui=require('pretty_main')
PersistentDB={GetStructuredData=function()return nil end,SetStructuredData=function()return true end}
GameKey={M=70,ENTER=84,ESCAPE=13,SHIFT=81,CONTROL=82,ALT=86,FromID=function()return 'M'end}
config.Quest={FromID=function()return {hasFinishedQuest=false}end}
MiniMenuEntryType={NPC=1}
local messages={};log=function(message)messages[#messages+1]=message end
assert(load(source('main'),'main'))()
assert(AllocatedCount()>100,'Startup did not create the map UI')
assert(messages[#messages]:find('Ready',1,true))
for _,callback in pairs(Event.Logic.handlers)do callback()end
for _,message in ipairs(messages)do
 assert(not message:find('attempt to',1,true) and not message:find('Failed',1,true),message)
end
PluginShutdown()
assert(AllocatedCount()==0,'Shutdown leaked native components: '..AllocatedSummary())
''')
print('PASS: complete map startup, logic update and shutdown against actual PrettyUI 1.3.3; no UI leaks.')
