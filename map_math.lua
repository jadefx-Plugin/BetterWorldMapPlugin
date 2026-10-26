-- map_math.lua
-- Used by: area_terrain.lua, main.lua, nearby_npcs.lua, reference_pins.lua, world_map_icons.lua.
-- Converts map tile coordinates into screen pixels and calculates visible bounds.

--[[
Shared, side-effect-free map coordinate mathematics.
x is east/west and z is north/south; screen y increases downward, so projection flips z.
scale is interface units per world tile. Surface bounds map native source rectangles into
the stitched map; range returns inclusive 64-tile map-square indices for viewport culling.
]]

local M = {}

local surface = require("surface_config")

-- Reference/export callers can supply source x/z; searches surface_config.lua in order and
-- returns transformed x/z for the first matching rectangle, or nil.
function M.worldToSurface(x, z)
    for _, b in ipairs(surface.bounds) do
        if x >= b.sx and x <= b.ex and z >= b.sz and z <= b.ez then
            return x + b.dx - b.sx, z + b.dz - b.sz
        end
    end
    return nil
end
-- Convert map coordinates to view-local UI units, keeping the chosen center at half-width/height.

-- Terrain/marker/NPC renderers supply world x/z, map center, scale and viewport size; returns
-- screen-local x/y, flipping northward z into downward UI y.
function M.project(x, z, cx, cz, scale, w, h)
    return w / 2 + (x - cx) * scale, h / 2 - (z - cz) * scale
end
-- Inverse of project; used for map input rather than any character movement.

-- Input/tool callers can supply view-local x/y and the same geometry; returns map-world x/z.
-- This is the inverse of project and never moves the character.
function M.unproject(x, y, cx, cz, scale, w, h)
    return cx + (x - w / 2) / scale, cz - (y - h / 2) / scale
end

-- main.lua.draw supplies center/scale/viewport geometry; returns inclusive first/last x and z
-- indices of 64-world-tile source squares. main converts those to 4x4 chunk indices.
function M.range(cx, cz, scale, w, h)
    return math.floor((cx - w / 2 / scale) / 64),
        math.floor((cx + w / 2 / scale) / 64),
        math.floor((cz - h / 2 / scale) / 64),
        math.floor((cz + h / 2 / scale) / 64)
end
return M
