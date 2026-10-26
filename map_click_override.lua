-- map_click_override.lua
-- Used by: main.lua.
-- Optionally captures the visible minimap World Map button to open this plugin.

-- Replace only the minimap World Map button's pointer target while enabled.
-- Native component IDs are from the cached modern/classic/legacy minimap configs.
-- Transparent plugin layers capture the click; native game hooks are not edited.
local M = {}
local buttons = { 96010251, 86442015, 125829152, 125829154 }
local function covered(window, x, y)
    if not window or not window.root or window.root.hidden then
        return false
    end
    local r = window.root
    local p = r.xyGlobal
    return x >= p.x and x < p.x + r.width and y >= p.y and y < p.y + r.height
end
function M.new(state, onClick)
    local self = { layers = {}, geometry = {} }
    function self:Clear()
        for _, layer in pairs(self.layers) do
            layer:Destroy()
        end
        self.layers = {}
        self.geometry = {}
    end
    function self:Update(parent, mapWindow, settingsWindow)
        if not state.overrideMapClick then
            if next(self.layers) then
                self:Clear()
            end
            return
        end
        local seen = {}
        for _, id in ipairs(buttons) do
            pcall(function()
                local native = ui.Interfaces:GetComponent(id)
                if
                    not native
                    or not native.visibleGlobal
                    or native.width <= 0
                    or native.height <= 0
                    or native.width > 64
                    or native.height > 64
                then
                    return
                end
                local xy = native.xyGlobal
                if
                    covered(mapWindow, xy.x + native.width / 2, xy.y + native.height / 2)
                    or covered(settingsWindow, xy.x + native.width / 2, xy.y + native.height / 2)
                then
                    return
                end
                local layer = self.layers[id]
                if not layer then
                    layer = ui.Layer.new(parent)
                    layer.clickthrough = false
                    layer:Subscribe(ui.Hook.ONCLICK, function()
                        onClick()
                        return false
                    end)
                    self.layers[id] = layer
                    self.geometry[id] = nil
                end
                local origin = parent.xyGlobal
                local x, y = xy.x - origin.x, xy.y - origin.y
                local geometry = table.concat({ x, y, native.width, native.height }, ":")
                self.geometry = self.geometry or {}
                if self.geometry[id] ~= geometry then
                    layer:SetPos(x, y)
                    layer:SetSize(native.width, native.height)
                    layer:MoveToFront()
                    self.geometry[id] = geometry
                end
                seen[id] = true
            end)
        end
        local remove = {}
        for id, layer in pairs(self.layers) do
            if not seen[id] then
                layer:Destroy()
                remove[#remove + 1] = id
            end
        end
        for _, id in ipairs(remove) do
            self.layers[id] = nil
            self.geometry[id] = nil
        end
    end
    self.Destroy = self.Clear
    return self
end
return M
