-- Minimal native host for exercising the installed PrettyUI implementation.
local function enums()
    return setmetatable({}, {__index=function(t,k) local n=1;for _ in pairs(t)do n=n+1 end;rawset(t,k,n);return n end})
end
id=setmetatable({}, {__index=function(t,k)local v=enums();rawset(t,k,v);return v end})
config={Cursor=setmetatable({}, {__index=function(t,k)local v={id=id.Cursor[k]};rawset(t,k,v);return v end})}
config.Font={MUSEO_SANS_15PT_REGULAR={baseline=18,
 GetStringWidth=function(_,text)return #text*7 end,
 GetStringHeightAndLineCount=function(_,text,width)local lines=math.max(1,math.ceil(#text*7/width));return lines*18,lines end}}
Event=setmetatable({}, {__index=function(t,k)
 local e={handlers={}}
 function e.Subscribe(name,callback)e.handlers[name]=callback end
 function e.Unsubscribe(name)e.handlers[name]=nil end
 rawset(t,k,e);return e
end})
local ops={SetOpCursor=function()end,ClearOpCursors=function()end}
local methods={}
local host
local allocated={}
local function key(c,d)return tostring(c)..':'..tostring(d)end
function methods:SetPos(x,y,xa,ya)
 self.x=(x or 0)+(xa or 0)*(self.parent and self.parent.width or 0)
 self.y=(y or 0)+(ya or 0)*(self.parent and self.parent.height or 0)
 self.xyGlobal={x=self.x,y=self.y}
end
function methods:SetSize(w,h,wa,ha)
 self.width=(w or 0)+(wa or 0)*(self.parent and self.parent.width or 0)
 self.height=(h or 0)+(ha or 0)*(self.parent and self.parent.height or 0)
end
function methods:SetX(x)self.x=x end
function methods:SetY(y)self.y=y end
function methods:SetWidth(w)self.width=w end
function methods:SetHeight(h)self.height=h end
function methods:SetScrollSize(w,h)self.scrollWidth=w;self.scrollHeight=h end
function methods:SetScrollPosition(x,y)self.scrollX=x;self.scrollY=y end
methods.SetScrollPos=methods.SetScrollPosition
function methods:Subscribe(hook,name,callback)
 if type(name)=='function'then callback=name;name='default'end
 self.hooks[hook]=self.hooks[hook] or {};self.hooks[hook][name]=callback
end
function methods:Unsubscribe(hook,name)if self.hooks[hook]then self.hooks[hook][name or 'default']=nil end end
function methods:MoveToFront()end
function methods:MoveToBack()end
function methods:Clear()end
function methods:Setup()end
function methods:SetAssociatedObject()end
function methods:AddRectangle()end
function methods:AddSprite()end
function methods:AddLine()end
function methods:AddGradientV()end
function methods:Destroy()
 if self.destroyed then return end
 self.destroyed=true
 for _,child in ipairs(self.children)do child:Destroy()end
 allocated[key(self.categoryID,self.dynamicID)]=nil
end
function methods:GetChild(c,d)return allocated[key(c,d)]end
local function iterate(self,callback)
 for _,child in ipairs(self.children)do if not child.destroyed and callback(child)then return end end
end
local function make(kind,parent,c,d)
 if c==nil then
  c=parent.categoryID==-1 and 0 or parent.categoryID
  d=parent.categoryID==-1 and 0 or parent.dynamicID+1
  while allocated[key(c,d)]do d=d+1 end
 end
 assert(c>=0 and c<=234 and d>=0 and d<=(c==0 and 4095 or 234),'invalid native ID')
 assert(not allocated[key(c,d)],'ID collision')
 local obj=setmetatable({parent=parent,parentStatic=host,interfaceID=1,staticID=1,
  categoryID=c,dynamicID=d,children={},hooks={},x=0,y=0,width=1,height=1,
  alpha=1,hidden=false,visibleGlobal=true,enabled=true,opConfig=ops,cursorConfig={},text={},containerSprite={},kind=kind}, {__index=methods})
 if kind=='Layer'then obj.IterateDynamicComponents=iterate end
 allocated[key(c,d)]=obj;parent.children[#parent.children+1]=obj
 return obj
end
host=setmetatable({interfaceID=1,staticID=1,categoryID=-1,dynamicID=-1,
 x=0,y=0,xyGlobal={x=0,y=0},width=1920,height=1080,children={},hooks={},visibleGlobal=true,IterateDynamicComponents=iterate}, {__index=methods})
host.parentStatic=host
ui={Hook=enums(),InputFieldActionResult=enums(),SelectionChangeEvent=enums(),Interfaces={}}
ui.Margin={new=function(...)return {...}end}
setmetatable(ui,{__index=function(t,k)local value=enums();rawset(t,k,value);return value end})
for _,kind in ipairs({'Layer','Sprite','Rectangle','Text','Canvas','Button','InputField','ComboField','Check','RadioGroup','Slider'})do
 ui[kind]={new=function(parent,c,d)return make(kind,parent,c,d)end}
end
function ui.Interfaces:GetInterface(n)if n==1 then return host end end
function ui.Interfaces:GetComponent(a,b,c,d)
 if c==nil then return host end
 return allocated[key(c,d)]
end
local pointer={x=0,y=0}
Mouse={GetPosition=function()return pointer end}
function SetPointer(x,y)pointer={x=x,y=y}end
game={options={InterfaceScale={setting=100}}}
Keyboard={IsAvailable=function()return true end,IsBlocked=function()return false end,IsAltDown=function()return false end}
var={VarPlayer={TOPLEVEL_V2_TRANSPARENCY={value=128},TOPLEVEL_V2_CUSTOMIZATION_LOCK={value=1},TOPLEVEL_V2_LEGACY_INTERFACE={value=0}}}
Plugin={resources={}}
Player={IsAvailable=function()return false end}
log=function()end
TestHost=host
function AllocatedCount()local n=0;for _ in pairs(allocated)do n=n+1 end;return n end
function AllocatedSummary()
 local rows={}
 for k,c in pairs(allocated)do rows[#rows+1]=k..' '..c.kind..' parent='..key(c.parent.categoryID,c.parent.dynamicID)end
 table.sort(rows);return table.concat(rows,'; ')
end
