-- reference_pins.lua
-- Used by: main.lua.
-- Draws selected monster/NPC reference pins with cached pixel runs and hover targets.

-- Search-reference pins share one Canvas with the original shaded pixel mask. No sprite pool, screen-cell winners
-- or zoom-dependent pin limit: exact duplicate world tiles alone are coalesced.
-- Saved colour contributes RGB only; global and per-type opacity are combined
-- once here. This avoids invalid packed colour alpha hiding an entire pin set.
local Map = require("map_math")
local M = {}
local Mask = require("pin_mask")
local Monsters = require("monster_drops")
local function int(v)
    return math.floor(v + 0.5)
end
-- main.create supplies the map layer; returns the Canvas owner and hit list.
function M.new(parent)
    local self = { hits = {}, opacity = 1 }
    self.canvas = ui.Canvas.new(parent)
    self.canvas:SetSize(0, 0, 1, 1)
    self.canvas.clickthrough = true
    -- main.Logic supplies the movement/map opacity factor; invalidate cached geometry.
    -- This part invalidates pin artwork when transparency changes.
    function self:SetOpacity(alpha)
        if self.opacity ~= alpha then
            self.opacity = alpha
            self.last = nil
        end
    end
    -- main.draw supplies the selected catalogue entry and viewport in map tiles/UI pixels.
    -- Rebuild only on input changes; hits lets the hover card resolve map markers.
    -- This part projects selected reference positions and reuses unchanged artwork.
    function self:Draw(entry, areaID, cx, cz, zoom, w, h, options)
        local npc = entry and entry.catalog == "NPCs"
        local transparency = npc and options.npcPinTransparency or options.monsterPinTransparency
        local colour = npc and options.npcPinColor or options.monsterPinColor
        local size = (options.mapPinSize or 100) / 100
        local alpha = int(255 * self.opacity * (1 - (transparency or 0) / 100))
        colour = math.floor((colour or 0xFFD45FFF) / 256) * 256 + alpha
        local key = table.concat({ areaID, cx, cz, zoom, w, h, colour, size, npc and 1 or 0 }, ":")
        if self.last == key and self.entry == entry then
            return
        end
        self.last = key
        self.entry = entry
        self.hits = {}
        self.canvas:Clear()
        local maskKey = colour .. ":" .. size
        if self.maskKey ~= maskKey then
            self.maskKey = maskKey
            self.runs, self.anchorX, self.anchorY = Mask.Build(size, colour, alpha / 255)
        end
        local runs, anchorX, anchorY = self.runs, self.anchorX, self.anchorY
        local seen = {}
        for _, point in ipairs(entry and entry.locations or {}) do
            local tile = point.x .. ":" .. point.z
            if (point.areaID or 28) == areaID and not seen[tile] then
                seen[tile] = true
                local x, y = Map.project(point.x, point.z, cx, cz, zoom, w, h)
                if alpha > 0 and x >= 0 and x < w and y >= 0 and y < h then
                    local px, py = int(x) - anchorX, int(y) - anchorY
                    for _, run in ipairs(runs) do
                        self.canvas:AddRectangle(px + run[1], py + run[2], run[3], run[4], run[5])
                    end
                    self.hits[#self.hits + 1] =
                        { x = x, y = y - 12 * size, radius = math.max(7, 9 * size) }
                end
            end
        end
    end
    -- world_map_icons.BindHover asks for the closest searched monster marker.
    -- Return a normal typed tooltip record, using bundled combat-level reference
    -- data (including variant ranges); unavailable levels are labelled explicitly.
    -- This part supplies the hovered monster name and combat level.
    function self:Hit(x, y)
        if not self.entry or self.entry.catalog ~= "Bestiary" then
            return nil
        end
        local best, distance
        for _, hit in ipairs(self.hits) do
            local d = (hit.x - x) ^ 2 + (hit.y - y) ^ 2
            if d <= hit.radius ^ 2 and (not distance or d < distance) then
                best, distance = hit, d
            end
        end
        if not best then
            return nil
        end
        local record = Monsters[self.entry.name]
        local level = record and record.level
        if level == nil or level == "" then
            level = "Unknown"
        end
        return {
            x = best.x,
            y = best.y,
            index = -1,
            area = true,
            text = self.entry.name,
            record = {
                title = self.entry.name,
                kind = "monster",
                rows = { { name = "Combat level: " .. tostring(level) } },
            },
        }
    end
    -- PluginShutdown releases the sole native component owned by this controller.
    function self:Destroy()
        self.canvas:Destroy()
        self.hits = {}
    end
    return self
end
return M
