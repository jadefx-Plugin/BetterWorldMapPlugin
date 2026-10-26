-- tooltip_metrics.lua
-- Used by: nearby_npcs.lua, pin_tooltip.lua.
-- Measures text with native font metrics and supplies a conservative fallback.

-- Shared native font measurement for map-pin and nearby-monster tooltip titles.
-- Caller supplies the same font used to draw the label; fallback avoids narrow clips.
local M = {}
function M.Width(value, fontID)
    local clean = tostring(value or ""):gsub("<br>", "\n"):gsub("<[^>]+>", "")
    local width = 0
    for line in (clean .. "\n"):gmatch("(.-)\n") do
        local ok, pixels = pcall(function()
            return config.Font.FromID(fontID):GetStringWidth(line, false)
        end)
        width = math.max(width, ok and type(pixels) == "number" and pixels or #line * 12)
    end
    return math.ceil(width)
end
return M
