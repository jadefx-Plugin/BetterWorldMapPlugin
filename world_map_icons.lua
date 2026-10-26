-- world_map_icons.lua
-- Used by: main.lua.
-- Draws static/travel markers, caches visibility and owns local hover/click hit testing.

--[=[
BEGINNER WALKTHROUGH: world_map_icons.lua

Read SetPoints -> SetFilters -> Draw, then BindHover/DungeonAt. The Canvas is drawing output;
self.hits is plain Lua input data. Clearing Canvas commands does not remove data records or
allocate a separate Sprite for every icon.

Function comments below state the caller, what inputs represent, and the return value
or side effects. For coordinates, distinguish world map tiles from UI pixels/units.
A nil result means unavailable/no match; it is different from valid numeric ID 0.

Cross-file connections:
  require("dungeon_links") loads dungeon_links.lua and uses the table it returns.
  require("map_math") loads map_math.lua and uses the table it returns.
  require("pin_tooltip") loads pin_tooltip.lua and uses the table it returns.
  require("world_map_data") loads world_map_data.lua and uses the table it returns.
  require("teleport_data") adds Navigation reference pins/categories without changing native indices.
  Required directly by: main.lua.

require normally caches a module after the first load. A data module returns values;
a helper module returns functions/state constructors. See CODE_GUIDE.md for the full flow.
]=]

--[[
Map-marker rendering and hit testing: native/spell pins share one Canvas.
Visible grouped item destinations use native associated-item sprites for exact
inventory artwork. One Canvas draws other background/icon pairs; Lua hit records independently
retain hover text, quest/resource records and dungeon targets for every eligible marker.
Panning/zooming do not impose a marker-count cutoff. Filter/quest changes invalidate the
eligible-record cache; unchanged view state reuses existing Canvas commands and hit data.
Native API reference: https://developer.runescape.com/rs/ui/decorative_components/canvas.html
]]

local points = require("world_map_data")
-- Separate reference pins keep every native surface index stable. The same module
-- supplies the three Navigation category definitions to map_key_data.lua.
local teleports = require("teleport_data")

local Map = require("map_math")

local dungeonLinks = require("dungeon_links")
local DungeonNavigation = require("dungeon_navigation")
local TravelGroups = require("travel_groups")
-- Navigation categories identify native travel/network/entrance artwork.
local travelCategories = {}
for _, category in ipairs(require("map_key_data")) do
    if category.group == 1 or category.group == 6 then
        travelCategories[category.id] = true
    end
end
local Visual = require("visual_updates")
local M = {}
local important =
    { [1156] = 1, [4632] = 2, [1228] = 3, [4476] = 4, [2613] = 5, [949] = 6, [948] = 6, [1206] = 7 }
local ordered = {}
for index, point in ipairs(points) do
    ordered[#ordered + 1] = { index = index, point = point }
end
table.sort(ordered, function(a, b)
    local pa, pb = important[a.point.category] or 10, important[b.point.category] or 10
    if pa ~= pb then
        return pa < pb
    end
    return a.index < b.index
end)

-- main.lua supplies the marker overlay parent; returns a renderer owning one Canvas, cached
-- eligibility and hit records, without one UI Sprite per pin.
function M.new(parent)
    local self = { enabled = {}, hits = {}, opacity = 1, itemSprites = {} }
    self.canvas = ui.Canvas.new(parent)
    self.canvas:SetSize(0, 0, 1, 1)
    self.canvas.clickthrough = true
    -- main.lua calls this on movement transitions. Canvas draw commands have
    -- their own RGBA color, separate from a parent container's alpha.
    function self:SetOpacity(alpha)
        alpha = math.max(0, math.min(1, alpha))
        if self.opacity == alpha then
            return false
        end
        self.opacity = alpha
        self.lastDraw = nil
        return true
    end
    -- Map switches replace the point/index namespace and invalidate eligibility and hit data.

    -- main.lua.selectArea supplies a map's ordered point list, surface flag and native area ID; clears old
    -- Canvas/hits and invalidates eligible records.
    function self:SetPoints(newPoints, isSurface, areaID)
        self.ordered = {}
        self.selection = nil
        self.isSurface = isSurface
        self.hoverMapX = nil
        self.hoverMapZ = nil
        for index, point in ipairs(newPoints) do
            self.ordered[#self.ordered + 1] = { index = index, point = point }
        end
        -- Cape references can belong to dungeon maps; older references default to surface.
        local currentArea = areaID or (isSurface and 28)
        for index, point in ipairs(teleports.points) do
            if (point.areaID or 28) == currentArea then
                self.ordered[#self.ordered + 1] = { index = #newPoints + index, point = point }
            end
        end
        table.sort(self.ordered, function(a, b)
            local pa, pb = important[a.point.category] or 10, important[b.point.category] or 10
            if pa ~= pb then
                return pa < pb
            end
            return a.index < b.index
        end)
        self.canvas:Clear()
        self.hits = {}
        for _, sprite in pairs(self.itemSprites) do
            sprite:Destroy()
        end
        self.itemSprites = {}
    end
    -- Invalidate eligibility, not the bundled points; checkbox state may be shared with the UI.

    -- main.lua's key callback supplies category-ID booleans; stores the shared table and
    -- invalidates eligibility for the next Draw.

    function self:SetFilters(enabled)
        self.enabled = enabled
        self.selection = nil
        if self.tooltip then
            self.tooltip:Hide()
        end
    end
    -- Main owns the live teleport snapshot; keep category checks independent.
    function self:SetTeleportFilter(filter)
        self.teleportFilter = filter
        self.selection = nil
    end
    function self:SetPinScale(scale)
        scale = math.max(0.5, math.min(2, scale))
        if self.pinScale ~= scale then
            self.pinScale = scale
            self.lastDraw = nil
        end
    end
    -- Cache identity includes selection plus viewport/visibility; player-only redraws can
    -- reuse pins.

    -- main.lua.draw supplies map center, scale, size and visibility; updates Canvas commands
    -- and Lua hits only when that state or eligible records changed. Returns no value.
    function self:Draw(cx, cz, scale, width, height, visible)
        local previous = self.lastDraw
        if
            self.selection
            and previous
            and previous.selection == self.selection
            and previous.cx == cx
            and previous.cz == cz
            and previous.scale == scale
            and previous.width == width
            and previous.height == height
            and previous.visible == visible
        then
            return
        end
        self.canvas:Clear()
        local tint = 0xFFFFFF00 + math.floor(self.opacity * 255 + 0.5)
        self.hits = {}
        local itemHits, usedItems = {}, {}
        -- Keep eligibility independent of zoom: grid winners used to evict
        -- unrelated pins whenever a zoom level changed cell boundaries.
        if not self.selection then
            self.selection = {}
            for _, entry in ipairs(self.ordered or ordered) do
                local point = entry.point
                if
                    (
                        not point.custom
                        or not self.teleportFilter
                        or self.teleportFilter:Allows(point)
                    )
                    and ((self.isSurface == false and (point.returnToPrevious or point.category == 948)) or self.enabled[point.category] ~= false)
                    and (
                        not self.questFilter
                        or (self.isSurface == false and (not point.questID or self.questFilter:AllowsQuest(
                            point.questID
                        )))
                        or (self.isSurface ~= false and self.questFilter:Allows(entry.index))
                    )
                then
                    self.selection[#self.selection + 1] = entry
                end
            end
            -- Merge only enabled teleport methods; native indices and entrance links stay intact.
            self.selection = TravelGroups.Build(self.selection)
        end
        if visible or self.isSurface == false then
            -- Route lines share the existing Canvas and movement alpha: no native
            -- component is allocated per line. Draw underneath the ladder artwork.
            for _, entry in ipairs(self.selection) do
                local point = entry.point
                if
                    visible
                    and point.connector
                    and point.routeTarget
                    and self.hoverMapX
                    and (
                        (
                            math.abs(self.hoverMapX - point.x) <= 1
                            and math.abs(self.hoverMapZ - point.z) <= 1
                        )
                        or (
                            math.abs(self.hoverMapX - point.routeTarget.x) <= 1
                            and math.abs(self.hoverMapZ - point.routeTarget.z) <= 1
                        )
                    )
                then
                    local x, y = Map.project(point.x, point.z, cx, cz, scale, width, height)
                    local ex, ey = Map.project(
                        point.routeTarget.x,
                        point.routeTarget.z,
                        cx,
                        cz,
                        scale,
                        width,
                        height
                    )
                    self.canvas:AddLine(
                        math.floor(x),
                        math.floor(y),
                        math.floor(ex),
                        math.floor(ey),
                        1,
                        0xF2C66D00 + math.floor(self.opacity * 255 + 0.5)
                    )
                end
            end
            for _, entry in ipairs(self.selection) do
                local point = entry.point
                -- Calls map_math.lua through Map.project(...): takes world
                -- position/view geometry and returns local UI x/y.
                local x, y = Map.project(point.x, point.z, cx, cz, scale, width, height)
                x = x + (point.offsetX or 0)
                y = y + (point.offsetY or 0)
                -- Larger travel artwork has a matching hover/click hit area.
                local size = math.floor(
                    (
                        point.iconSize
                        or (point.custom and 32 or (travelCategories[point.category] and 28 or 20))
                    )
                            * (self.pinScale or 1)
                        + 0.5
                )
                local radius = size / 2
                if
                    (
                        visible
                        or self.isSurface == false
                            and (point.returnToPrevious or point.category == 948)
                    )
                    and x >= radius
                    and x < width - radius
                    and y >= radius
                    and y < height - radius
                then
                    local px, py = math.floor(x - radius), math.floor(y - radius)
                    -- Draw native background first, then its icon, matching
                    -- the precomposed artwork layer order.
                    if point.background and point.background > 0 then
                        self.canvas:AddSprite(px, py, size, size, point.background, tint)
                    end
                    if point.markerStyle == "dot" then
                        -- Native route/obstacle endpoints are tiny yellow squares.
                        self.canvas:AddRectangle(
                            math.floor(x) - 2,
                            math.floor(y) - 2,
                            4,
                            4,
                            0xF2C66D00 + math.floor(self.opacity * 255 + 0.5)
                        )
                    elseif point.itemID then
                        -- Inventory models require SetAssociatedObject, not a
                        -- generic map symbol. Only these new item pins allocate
                        -- components only for visible item references; native/spell pins share Canvas.
                        itemHits[#itemHits + 1] =
                            { index = entry.index, point = point, x = px, y = py, size = size }
                        usedItems[entry.index] = true
                    else
                        local iw, ih =
                            point.iconWidth and math.floor(
                                point.iconWidth * (self.pinScale or 1) + 0.5
                            ) or size,
                            point.iconHeight and math.floor(
                                point.iconHeight * (self.pinScale or 1) + 0.5
                            ) or size
                        self.canvas:AddSprite(
                            math.floor(x - iw / 2),
                            math.floor(y - ih / 2),
                            iw,
                            ih,
                            point.sprite,
                            tint
                        )
                    end
                    local record = point.record
                    if
                        self.isSurface == false
                        and (
                            point.returnToPrevious
                            or not point.routeTarget and point.category == 948
                        )
                    then
                        record = {
                            title = point.mapNavigationOnly and "Map navigation" or "Dungeon exit",
                            kind = "navigation",
                            rows = { { name = "Return to previous map / RuneScape Surface" } },
                            note = point.mapNavigationOnly
                                    and "Map-view return shortcut; not an in-game exit location."
                                or "Click to return to the previous map and view.",
                        }
                    end
                    self.hits[#self.hits + 1] = {
                        x = x,
                        y = y,
                        radius = radius,
                        text = point.tooltip,
                        index = entry.index,
                        record = record,
                        area = self.isSurface == false or point.custom == true,
                        members = entry.members,
                        category = point.category,
                        returnToPrevious = point.returnToPrevious,
                        routeTarget = point.routeTarget,
                        mapX = point.x,
                        mapZ = point.z,
                    }
                end
            end
        end
        -- Release outgoing item pins before creating incoming ones. No pooling or
        -- hidden sprite retention is used; native marker IDs remain untouched.
        local stale = {}
        for index, sprite in pairs(self.itemSprites) do
            if not usedItems[index] then
                sprite:Destroy()
                stale[#stale + 1] = index
            end
        end
        for _, index in ipairs(stale) do
            self.itemSprites[index] = nil
        end
        for _, hit in ipairs(itemHits) do
            local sprite = self.itemSprites[hit.index]
            if not sprite then
                sprite = ui.Sprite.new(parent)
                sprite:SetSize(hit.size, hit.size)
                sprite.clickthrough = true
                sprite:SetAssociatedObject(hit.point.itemID)
                self.itemSprites[hit.index] = sprite
            end
            if sprite.width ~= hit.size then
                sprite:SetSize(hit.size, hit.size)
            end
            -- Associated-object images are runtime sprites. Explicit component alpha
            -- fades the model artwork; Canvas tint applies only to native/map sprites.
            if sprite.alpha ~= self.opacity then
                sprite.alpha = self.opacity
            end
            Visual.Position(sprite, hit.x, hit.y)
        end
        self.visibleCount = #self.hits
        self.lastDraw = {
            selection = self.selection,
            cx = cx,
            cz = cz,
            scale = scale,
            width = width,
            height = height,
            visible = visible,
        }
    end
    -- Hit-test linked entrances only, so overlapping resource/bank icons cannot consume the click.

    -- main.lua's map-press handler supplies local x/y; returns a linked destination area ID
    -- (0 is valid), "back" for a dungeon exit, or nil.
    function self:DungeonAt(x, y)
        local nearest, distance
        for _, hit in ipairs(self.hits) do
            local d = (hit.x - x) ^ 2 + (hit.y - y) ^ 2
            -- Decorative/overlapping icons must not intercept a linked entrance.
            local linked = self.isSurface == false
                    and (hit.routeTarget or hit.category == 948 or hit.returnToPrevious)
                or self.isSurface ~= false and DungeonNavigation.CanNavigate(hit.index)
            if
                linked
                and math.abs(hit.x - x) <= (hit.radius or 10)
                and math.abs(hit.y - y) <= (hit.radius or 10)
                and (not distance or d < distance)
            then
                nearest, distance = hit, d
            end
        end
        if nearest and nearest.returnToPrevious then
            return "back"
        end
        if nearest and nearest.routeTarget then
            return nearest.routeTarget
        end
        if nearest and self.isSurface == false then
            return "back"
        end
        return nearest and dungeonLinks[nearest.index] or nil
    end
    -- Hover changes only redraw the existing Canvas when the endpoint changes.
    -- Either end reveals its connector, including one-way arrival endpoints.
    function self:SetConnectorHover(hit)
        local x, z = hit and hit.mapX, hit and hit.mapZ
        if x == self.hoverMapX and z == self.hoverMapZ then
            return
        end
        self.hoverMapX, self.hoverMapZ = x, z
        local view = self.lastDraw
        self.lastDraw = nil
        if view then
            self:Draw(view.cx, view.cz, view.scale, view.width, view.height, view.visible)
        end
    end
    -- Live NPC dots take hover precedence; static cards are suppressed during map dragging.

    -- main.lua supplies UI layers and isDragging callback; creates pin_tooltip.lua and
    -- installs hover hooks, giving nearby_npcs.lua dots hover precedence.
    function self:BindHover(P, view, input, root, window, overlay, isDragging)
        self.tooltip = require("pin_tooltip").new(view)
        -- UI event: input invokes the handler on ONMOUSEREPEAT. Pointer coordinates,
        -- when supplied, are local to this component.
        input:Subscribe(ui.Hook.ONMOUSEREPEAT, "better_world_map_icons_hover", function(_, x, y)
            if self.nearby then
                if isDragging() then
                    self.nearby:Leave()
                elseif self.nearby:ShowHover(x, y) then
                    self:SetConnectorHover(nil)
                    self.tooltip:Hide()
                    return true
                end
            end
            if self.references and not isDragging() then
                local hit = self.references:Hit(x, y)
                if hit then
                    self:SetConnectorHover(nil)
                    self.tooltip:Show(hit)
                    return true
                end
            end
            local nearest, distance
            if not isDragging() then
                for _, hit in ipairs(self.hits) do
                    local d = (hit.x - x) ^ 2 + (hit.y - y) ^ 2
                    local radius = hit.radius or 10
                    if
                        math.abs(hit.x - x) <= radius
                        and math.abs(hit.y - y) <= radius
                        and (not distance or d < distance)
                    then
                        nearest = hit
                        distance = d
                    end
                end
            end
            self:SetConnectorHover(nearest)
            if nearest then
                -- Calls pin_tooltip.lua through self.tooltip:Show(...):

                self.tooltip:Show(nearest)
            else
                self.tooltip:Hide()
            end
            return true
        end)
        -- UI event: input invokes the handler on ONMOUSELEAVE. Pointer coordinates, when
        -- supplied, are local to this component.
        input:Subscribe(ui.Hook.ONMOUSELEAVE, "better_world_map_icons_leave", function()
            self:HideHover()
            return true
        end)
        self.input = input
        self.hoverView = view
        self.P = P
    end

    -- main.lua/map leave handlers call this; hides nearby-NPC and static-pin cards without
    -- changing marker visibility.
    function self:HideHover()
        self:SetConnectorHover(nil)
        if self.nearby then
            self.nearby:Leave()
        end
        if self.tooltip then
            self.tooltip:Hide()
        end
    end

    -- main.lua passes wheel delta; delegates to pin_tooltip.lua.Scroll and returns whether a
    -- card consumed the event.
    function self:ScrollHover(delta)
        return self.tooltip and self.tooltip:Scroll(delta) or false
    end
    -- Release tooltip hooks/cards and the single Canvas; drawing commands are owned by the Canvas.

    -- main.lua.PluginShutdown calls this; removes tooltip hooks/cards and destroys the one
    -- native Canvas.
    function self:Shutdown()
        for _, sprite in pairs(self.itemSprites) do
            sprite:Destroy()
        end
        self.itemSprites = {}
        if self.tooltip then
            -- Calls pin_tooltip.lua through self.tooltip:Destroy(...): delegates
            -- this operation to the module that owns that data/UI; see its Destroy
            -- function contract.
            self.tooltip:Destroy()
            self.input:Unsubscribe(ui.Hook.ONMOUSEREPEAT, "better_world_map_icons_hover")
            self.input:Unsubscribe(ui.Hook.ONMOUSELEAVE, "better_world_map_icons_leave")
        end
        if self.canvas then
            self.canvas:Destroy()
            self.canvas = nil
        end
    end
    return self
end
return M
