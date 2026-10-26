-- map_pin.lua
-- Used by: main.lua.
-- Creates and scales the player-position marker from bundled artwork.

--[[
Creates the player-position pin from bundled artwork.
width/height are UI units; anchorX/anchorY locate the pointed tip relative to the image.
The pin is decorative and clickthrough: actual interactions are handled by the map layer.
]]

-- Smooth native-size sprites; the pointed tip anchors the map coordinate.
local M = { width = 21, height = 27, anchorX = 10, anchorY = 24 }
local visuals = setmetatable({}, { __mode = "k" })
local currentScale = 1
-- main.lua supplies a UI parent and isPlayer artwork choice; returns a clickthrough Layer
-- containing a Sprite. Use anchorX/anchorY to align the pointed tip to the map location.
function M.new(parent, isPlayer)
    local pin = ui.Layer.new(parent)
    pin:SetSize(M.width, M.height)
    pin.clickthrough = true
    local sprite = ui.Sprite.new(pin)
    sprite:SetSize(M.width, M.height)
    sprite.clickthrough = true
    sprite.sprite = isPlayer and Plugin.resources.player_pin or Plugin.resources.mob_pin
    visuals[pin] = { sprite = sprite, isPlayer = isPlayer }
    return pin
end
-- This part resizes the player marker and keeps its pointed tip anchored.
function M.SetScale(scale)
    if scale == currentScale then
        return
    end
    currentScale = scale
    M.width = math.floor(21 * scale + 0.5)
    M.height = math.floor(27 * scale + 0.5)
    M.anchorX = math.floor(10 * scale + 0.5)
    M.anchorY = math.floor(24 * scale + 0.5)
    for pin, visual in pairs(visuals) do
        pin:SetSize(M.width, M.height)
        visual.sprite:SetSize(M.width, M.height)
    end
end
return M
