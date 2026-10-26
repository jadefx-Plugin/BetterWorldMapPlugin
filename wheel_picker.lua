-- wheel_picker.lua
-- Used by: map_preferences_ui.lua.
-- Adapts the PrettyUI colour popup into a hue/saturation wheel and brightness strip.

-- Adapt the existing PrettyUI colour picker into a hue/saturation wheel.
-- Retain its popup, preview, Accept/Cancel, drag capture and lifetime handling.
-- The side strip controls brightness. One Canvas draws the wheel, not hundreds
-- of native UI components. No downloaded texture or extra resource is required.
local Colour = require("colour_math")
local M = {}
function M.new(P, parent, options)
    local picker = P.ColourPicker.new(parent, options)
    local update = picker._UpdatePickerVisuals
    -- This part draws the hue/saturation wheel.
    function picker:_DrawColourField()
        self.fieldCanvas:Clear()
        for y = 0, 127, 3 do
            for x = 0, 127, 3 do
                local dx, dy = x + 1.5 - 64, y + 1.5 - 64
                if dx * dx + dy * dy <= 64 * 64 then
                    local h, s = Colour.Wheel(x + 1.5, y + 1.5, 64)
                    self.fieldCanvas:AddRectangle(
                        x,
                        y,
                        math.min(3, 128 - x),
                        math.min(3, 128 - y),
                        Colour.HSV(h, s, 1)
                    )
                end
            end
        end
    end
    function picker:_DrawHueSpectrum()
        self.hueCanvas:Clear()
        self.hueCanvas:AddGradientV(0, 0, 24, 128, 0xFFFFFFFF, 0x000000FF)
    end
    -- This part turns a wheel drag into the selected colour.
    function picker:_UpdateFieldFromMouse(layer, x, y)
        local mx, my = self:_PickerLocalMousePosition(layer, x, y)
        if not mx then
            return false
        end
        self.pendingHue, self.pendingSaturation = Colour.Wheel(mx - 16, my - 12, 64)
        self:_UpdatePickerVisuals(false)
        return false
    end
    -- This part adjusts brightness from the side strip.
    function picker:_UpdateHueFromMouse(layer, x, y)
        local _, my = self:_PickerLocalMousePosition(layer, x, y)
        if not my then
            return false
        end
        self.pendingValue = 1 - math.max(0, math.min(1, (my - 12) / 127))
        self:_UpdatePickerVisuals(false)
        return false
    end
    function picker:_UpdatePickerVisuals(redraw)
        update(self, redraw)
        local angle = self.pendingHue * 2 * math.pi
        local x = 16 + 64 + math.cos(angle) * self.pendingSaturation * 63
        local y = 12 + 64 + math.sin(angle) * self.pendingSaturation * 63
        self.fieldMarkerHorizontal:SetPos(math.floor(x) - 4, math.floor(y))
        self.fieldMarkerVertical:SetPos(math.floor(x), math.floor(y) - 4)
        self.hueMarkerShadow:SetY(12 + math.floor((1 - self.pendingValue) * 127) - 2)
        self.hueMarker:SetY(12 + math.floor((1 - self.pendingValue) * 127) - 1)
    end
    return picker
end
return M
