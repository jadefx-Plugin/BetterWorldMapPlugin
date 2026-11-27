local Native = require("src/ui/native_components")
-- Selected native frame plus a persistent gold/grey indicator, independent of hover.
local M={}
function M.new(P,parent,content,onChange,options)
    options=options or {};options.toggleable=true
    local control
    control=P.SimpleButton.new(parent,content,function(_,active)
        control:SetToggleState(active)
        onChange(active)
    end,options)
    control.toggleArt={}
    local indicator=Native.New(ui.Rectangle, control.root)
    indicator:SetPos(4,-3,0,1);indicator:SetSize((options.width or 24)-8,2)
    indicator.fill=true;indicator.clickthrough=true
    function control:SetToggleState(active,force)
        active=active==true
        if self._toggleState==active and not force then return end
        self._toggleState=active;self:SetActive(active)
        indicator.rgba=active and 0xFFD25AFF or 0x615C50FF
        for _,art in ipairs(self.toggleArt)do art.rgba=active and 0xFFD25AFF or 0x8B877DFF end
    end
    control:SetToggleState(options.active,true)
    return control
end
return M
