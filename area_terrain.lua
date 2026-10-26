-- area_terrain.lua
-- Used by: main.lua.
-- Draws the visible pieces of a bundled underground map and releases offscreen pieces.

--[[
Viewport renderer for bundled non-surface map images.
area_tiles_data indexes each map area into texture-sized pieces. Coordinates are map
world tiles, not image pixels; Map.project converts them to local UI positions.
Releases offscreen components before allocating replacements and reports missing assets
without treating cached geography as live game information.
]]

local data = require("area_tiles_data")

local Map = require("map_math")
local M = {}

-- main.lua calls this with the parent UI layer; returns the area renderer object that owns
-- sprites on that layer.
function M.new(parent)
    local self = { sprites = {} }
    -- Release all area sprites when switching maps or shutting down.

    -- main.lua calls this on map switches/shutdown; destroys this renderer's terrain sprites
    -- and returns nothing.
    function self:Clear()
        for _, sprite in pairs(self.sprites) do
            sprite:Destroy()
        end
        self.sprites = {}
    end
    -- Cull and release first, then load visible resources; failures must not leave orphaned
    -- components.

    -- main.lua.draw supplies an area definition, center, scale and viewport dimensions;
    -- projects/culls its pieces and returns how many pieces were drawn.
    function self:Draw(area, cx, cz, scale, width, height)
        local used, candidates = {}, {}
        local resources = Plugin.resources.area_tiles or {}
        local tiles = data[area.id] or {}
        local missing = #tiles == 0
        for _, tile in ipairs(tiles) do
            if not resources[tile.key] then
                missing = true
                break
            end
        end
        -- Older registrations already contain area_maps/a_ID. Use that complete
        -- cached image if newly added tile files have not registered yet.
        local full = Plugin.resources.area_maps and Plugin.resources.area_maps["a_" .. area.id]
        if missing and full and area.fullImageSafe ~= false then
            local key = "full_" .. area.id
            resources = { [key] = full }
            tiles = { { key = key, x = area.x, z = area.z, w = area.w, h = area.h } }
        elseif missing and self.missingArea ~= area.id then
            self.missingArea = area.id
            log(
                "[BetterWorldMap] Missing terrain resources for map "
                    .. area.id
                    .. "; refresh plugin resources."
            )
        end
        for _, tile in ipairs(tiles) do
            -- Calls map_math.lua through Map.project(...): takes world position/view
            -- geometry and returns local UI x/y.
            local x, y = Map.project(tile.x, tile.z + tile.h, cx, cz, scale, width, height)
            local w, h = tile.w * scale, tile.h * scale
            if
                x < width
                and y < height
                and x + w > 0
                and y + h > 0
                and resources
                and resources[tile.key]
            then
                used[tile.key] = true
                candidates[#candidates + 1] = { tile = tile, x = x, y = y, w = w, h = h }
            end
        end
        local stale = {}
        for key, sprite in pairs(self.sprites) do
            if not used[key] then
                sprite:Destroy()
                stale[#stale + 1] = key
            end
        end
        for _, key in ipairs(stale) do
            self.sprites[key] = nil
        end
        local count = 0
        for _, hit in ipairs(candidates) do
            local key = hit.tile.key
            local sprite = self.sprites[key]
            if not sprite then
                sprite = ui.Sprite.new(parent)
                sprite.clickthrough = true
                local ok, err = pcall(function()
                    sprite.sprite = resources[key]
                end)
                if ok then
                    self.sprites[key] = sprite
                else
                    sprite:Destroy()
                    sprite = nil
                    if self.error ~= tostring(err) then
                        self.error = tostring(err)
                        log("[BetterWorldMap] Map tile: " .. self.error)
                    end
                end
            end
            if sprite then
                sprite.hidden = false
                sprite:SetPos(math.floor(hit.x), math.floor(hit.y))
                sprite:SetSize(
                    math.floor(hit.x + hit.w) - math.floor(hit.x),
                    math.floor(hit.y + hit.h) - math.floor(hit.y)
                )
                count = count + 1
            end
        end
        return count
    end
    return self
end
return M
