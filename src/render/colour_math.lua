-- colour_math.lua
-- Used by: wheel_picker.lua.
-- Converts colour-wheel positions and HSV values to packed RGBA colours.

-- Shared HSV wheel math. Values are fractions, colours are native RRGGBBAA integers.
local M = {}
function M.HSV(h, s, v)
    h = (h % 1) * 6
    local i = math.floor(h)
    local f = h - i
    local p, q, t = v * (1 - s), v * (1 - f * s), v * (1 - (1 - f) * s)
    local r, g, b
    if i == 0 then
        r, g, b = v, t, p
    elseif i == 1 then
        r, g, b = q, v, p
    elseif i == 2 then
        r, g, b = p, v, t
    elseif i == 3 then
        r, g, b = p, q, v
    elseif i == 4 then
        r, g, b = t, p, v
    else
        r, g, b = v, p, q
    end
    return math.floor(r * 255 + 0.5) * 0x1000000
        + math.floor(g * 255 + 0.5) * 0x10000
        + math.floor(b * 255 + 0.5) * 0x100
        + 255
end
function M.Wheel(x, y, radius)
    local dx, dy = x - radius, y - radius
    return (math.atan(dy, dx) / (2 * math.pi)) % 1,
        math.min(1, math.sqrt(dx * dx + dy * dy) / radius)
end
return M
