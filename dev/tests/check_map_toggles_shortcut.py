from pathlib import Path
from lupa import LuaRuntime
r=Path(__file__).resolve().parents[2];l=LuaRuntime(unpack_returned_tuples=True)
l.globals().source=lambda n:(r/(n+'.lua')).read_text(encoding='utf8')
l.execute('''
local cache={}
function require(n)if not cache[n]then cache[n]=assert(load(source(n)))()end;return cache[n]end
ui={Hook={ONCLICK=1,ONKEY=2},InputFieldActionResult={SUBMIT=1,SUBMIT_ON_ESCAPE=2,SUBMIT_ON_FOCUS_LOSS=3,CONTENT_CHANGE=4}}
GameKey={M=70,ENTER=84,ESCAPE=13,SHIFT=81,CONTROL=82,ALT=86}
Keyboard={IsBlocked=function()return false end,IsShiftDown=function()return false end,IsControlDown=function()return false end,IsAltDown=function()return false end}
var={VarClient={TOPLEVEL_V2_CHAT_FOCUS={value=0},CHATBOX_FOCUS={value=0}}}
local Guard=require('src/core/input_guard')
var.VarClient.CHATBOX_FOCUS.value=1
assert(not Guard.ChatFocused(),'Legacy focus must not override explicit modern unfocused state')
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS=nil
assert(Guard.ChatFocused(),'Legacy focus remains fallback when modern state unavailable')
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS={value=0}
var.VarClient.CHATBOX_FOCUS.value=0
local Shortcut=require('src/core/map_shortcut')
local s=Shortcut.new('M');local count=0;local function toggle()count=count+1 end
local function field()
 local f={root={hooks={}}}
 function f.root:Subscribe(hook,_,fn)self.hooks[hook]=fn end
 return f
end
local first,second=field(),field();s:Watch(first);s:Watch(second)
-- Native content notifications can arrive after construction, before any user focus.
s:Changed(first,ui.InputFieldActionResult.CONTENT_CHANGE)
s:Changed(second,ui.InputFieldActionResult.CONTENT_CHANGE)
assert(not s.editing,'Initial text assignment must not pretend the user is typing')
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==1)
s:Changed(first,ui.InputFieldActionResult.CONTENT_CHANGE)
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==2)
-- Held/repeated keys remain one action.
s:Request({gameKey=70,isRepeat=true});s:Update(toggle);s:Update(toggle);assert(count==2)
-- Real mouse/keyboard focus blocks typing and cancels pending requests.
first.root.hooks[ui.Hook.ONCLICK]();assert(s.editing==first)
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==2)
s:Changed(first,ui.InputFieldActionResult.SUBMIT_ON_FOCUS_LOSS);assert(not s.editing)
s:Request({gameKey=70,isRepeat=false});first.root.hooks[ui.Hook.ONKEY]()
s:Update(toggle);s:Update(toggle);assert(count==2)
s:Changed(first,ui.InputFieldActionResult.SUBMIT);s:Clear()
-- Chat and the client's restricted-keyboard guard stay in place.
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=1
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==2)
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=0
s:Request({gameKey=70,isRepeat=false});var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=1
s:Update(toggle);s:Update(toggle);assert(count==2)
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=0
Keyboard.IsBlocked=function()return true end
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==2)
Keyboard.IsBlocked=function()return false end
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==3)
-- A native map opened by this valid key can capture keyboard input during the delay.
s:Request({gameKey=70,isRepeat=false})
Keyboard.IsBlocked=function()return true end
s:Update(toggle);s:Update(toggle);assert(count==4,'Late native map focus must not revoke a valid press')
s:Request({gameKey=70,isRepeat=false});s:Update(toggle);s:Update(toggle);assert(count==4,'Already-focused native inputs must still block new requests')
Keyboard.IsBlocked=function()return false end
-- Missing global events: state polling toggles once per press, preserving guards.
local held=false
Keyboard.IsGameKeyDown=function(key)return key==70 and held end
local poll=Shortcut.new('M');local hits=0
local function step(n)for i=1,n do poll:Update(function()hits=hits+1 end)end end
step(2);held=true;step(5);assert(hits==1)
step(10);assert(hits==1,'Held M must not repeat')
held=false;step(1);held=true;step(3);assert(hits==2)
held=false;step(1)
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=1;held=true;step(3);assert(hits==2)
var.VarClient.TOPLEVEL_V2_CHAT_FOCUS.value=0;step(3);assert(hits==2,'Leaving chat with M held must not toggle')
held=false;step(1);held=true;step(3);assert(hits==3)
held=false;step(1);poll:SetCaptureCheck(function()return true end);held=true;step(3);assert(hits==3)
poll:SetCaptureCheck(nil);held=false;step(1)
Keyboard.IsShiftDown=function()return true end;held=true;step(3);assert(hits==3,'Extra modifiers must be rejected')
Keyboard.IsShiftDown=function()return false end;held=false;step(1)
held=true;poll:Request({gameKey=70,isRepeat=false});step(5);assert(hits==4,'Event and poll must not double toggle')
poll:SetBinding('');step(3);assert(hits==4,'Empty binding disables polling')
Keyboard.IsGameKeyDown=nil
-- Enter-to-chat has its own session even when the native focus var stays zero.
local chat=Shortcut.new('M');local actions=0
local function chatStep()chat:Update(function()actions=actions+1 end);chat:Update(function()actions=actions+1 end)end
chat:Request({gameKey=84,isRepeat=false})
chat:Request({gameKey=70,isRepeat=false});chatStep();assert(actions==0)
chat:Request({gameKey=84,isRepeat=true});assert(chat.chatTyping)
chat:Request({gameKey=84,isRepeat=false});assert(not chat.chatTyping)
chat:Request({gameKey=70,isRepeat=false});chatStep();assert(actions==1)
chat:Request({gameKey=84,isRepeat=false});chat:Request({gameKey=13,isRepeat=false})
chat:Request({gameKey=70,isRepeat=false});chatStep();assert(actions==2)
local search=field();chat:Watch(search);search.root.hooks[ui.Hook.ONCLICK]()
chat:Request({gameKey=84,isRepeat=false});assert(not chat.chatTyping,'Submitting plugin search must not open chat session')
chat:Clear();chat:SetCaptureCheck(function()return true end)
chat:Request({gameKey=84,isRepeat=false});assert(not chat.chatTyping,'Capturing Enter must not open chat session')
-- Visual toggles reflect external state changes without invoking user actions again.
local indicators={}
ui.Rectangle={new=function()
 local c={};function c:SetPos()end;function c:SetSize()end
 indicators[#indicators+1]=c;return c
end}
local P={SimpleButton={new=function(_,_,callback,options)
 local button={root={},active=options.active,setCalls=0,callback=callback,toggleable=options.toggleable}
 function button:SetActive(v)self.active=v;self.setCalls=self.setCalls+1 end
 function button:Click()self.active=not self.active;self.callback(self,self.active)end
 return button
end}}
local changes=0;local active
local control=require('src/ui/map_toggle_button').new(P,{},'',function(v)changes=changes+1;active=v end,{width=24,active=true})
assert(control.toggleable and control.active and indicators[1].rgba==0xFFD25AFF)
local art={};control.toggleArt[1]=art
control:SetToggleState(false);assert(not control.active and indicators[1].rgba==0x615C50FF and art.rgba==0x8B877DFF and changes==0)
local writes=control.setCalls;control:SetToggleState(false);assert(control.setCalls==writes)
control:Click();assert(control.active and active and changes==1 and indicators[1].rgba==0xFFD25AFF and art.rgba==0xFFD25AFF)
control:SetToggleState(false);assert(changes==1,'Panning/state reconciliation must not fire click callbacks')
print('PASS: M opens/closes after initial/programmatic search notifications; real search/chat/repeat/blocked-keyboard guards retained; toggle on/off colours, clicks and external-state sync pass.')
''')
