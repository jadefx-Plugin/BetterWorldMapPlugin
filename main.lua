-- main.lua
-- Loaded by the RuneScape plugin host.
-- Coordinates plugin startup, map state, controls, local client polling and shutdown.

--[[
Better World Map entry point and UI/event coordinator.
Creates a separate PrettyUI map window; map clicks pan/select UI and never walk the player.
Owns view state (cx/cz in map tiles, scale in interface units per tile), persistence,
area selection, terrain drawing, catalogues, and plugin event subscriptions.
See CODE_GUIDE.md for the module/data inventory and lifecycle. PluginShutdown releases
subscriptions and owned UI; the caller must still verify behavior in the live client.
]]

local P = prettyui
assert(P and P.Window and P.SimpleButton, "PrettyUI dependency unavailable")

local Map = require("map_math")

local Areas = require("map_areas")

local Pin = require("map_pin")

local WorldMapIcons = require("world_map_icons")
local sidebar, resizeSidebar, lastSidebarHeight
local mapKey
local mapIcons
local nearbyNPCs
local mapResize

local preferences = require("map_settings").new(PersistentDB)
local appearance = preferences.value
Pin.SetScale(appearance.mapPinSize / 100)
local settingsUI, mapClickOverride

local shortcut = require("map_shortcut").new(appearance.mapKeybind)
-- Cross-file controller: movement_opacity.lua samples only the local player and
-- fades owned window roots; it does not depend on which map is being displayed.
local movementOpacity = require("movement_opacity").new(appearance)
-- Calls map_areas.lua through Areas.Get(...): returns an area definition, with a surface
-- fallback for unknown IDs.
local activeArea = Areas.Get(preferences.value.mapArea)
local areaTerrain, mapSelector, overviewImage, pendingArea
local labelStyles = {}
local showMapIcons = preferences.value.showMapIcons
local filterOptions = {
    showCompleted = preferences.value.showCompleted,
    showRequirementsMet = preferences.value.showRequirementsMet,
    showRequirementsUnmet = preferences.value.showRequirementsUnmet,
    hideLiveNPCs = preferences.value.hideLiveNPCs,
    hideTeleportRequirements = preferences.value.hideTeleportRequirements,
}

local questFilter = require("quest_pin_filter").new(filterOptions)
local teleportFilter = require("teleport_filter").new(filterOptions)
teleportFilter:Refresh()
-- Calls quest_pin_filter.lua through questFilter:Refresh(...): returns whether eligibility
-- changed, allowing cached pins to be invalidated.
questFilter:Refresh()

local tiles = require("surface_chunks")
local terrainResources = Plugin.resources.surface_chunks
assert(
    terrainResources,
    "Surface chunk resources are not registered yet. Run poff BetterWorldMap, then prf, then pon BetterWorldMap."
)

local Bestiary = require("bestiary")

local NpcData = require("npc_data")

local MapHover = require("map_hover")

local DropMenu = require("drop_menu")
local hoverCard
local selectedMonster
local mapBackground
local window, view, tileLayer, input, marker, zoomText
local referenceLayer, referencePins, mapIconLayer
local overview, overviewFrame, overviewMarker
local showLabels = preferences.value.showLabels
local showSidebar = preferences.value.showSidebar
local showOverview = preferences.value.showOverview
local overviewBounds = { x = 1856, z = 1344, w = 3008, h = 3200 }
local sprites, labels = {}, {}
local cx, cz, scale, follow = 3222, 3218, 2, true
local player, drag, lastError = nil, nil, nil
local dirty, retry = true, 0
local lastTerrainView
local Visual = require("visual_updates")
-- Persist a defensive snapshot; UI components can already be unavailable during shutdown.

-- UI changes, the logic tick and shutdown call this; builds a preference snapshot and delegates
-- its local write to map_settings.lua.Save. No return value is used.
-- This part saves window preferences and appearance to local storage.
local function saveSettings()
    if not window then
        return
    end
    -- Interface components may already be gone during client shutdown. The
    -- last periodic snapshot still survives, and cleanup must be allowed to run.
    local geometry = preferences.value
    local ok, current = pcall(function()
        local r = window.root
        return { x = r.x, y = r.y, width = r.width, height = r.height }
    end)
    if ok then
        geometry = current
    end
    local snapshot = {
        x = geometry.x,
        y = geometry.y,
        width = geometry.width,
        height = geometry.height,
        showMapIcons = showMapIcons,
        showLabels = showLabels,
        showSidebar = showSidebar,
        showOverview = showOverview,
        mapArea = activeArea.id,
        showCompleted = filterOptions.showCompleted,
        showRequirementsMet = filterOptions.showRequirementsMet,
        showRequirementsUnmet = filterOptions.showRequirementsUnmet,
        hideLiveNPCs = filterOptions.hideLiveNPCs,
        hideTeleportRequirements = filterOptions.hideTeleportRequirements,
        monsterPinColor = appearance.monsterPinColor,
        npcPinColor = appearance.npcPinColor,
        transparency = appearance.transparency,
        walkingTransparency = appearance.walkingTransparency,
        monsterPinTransparency = appearance.monsterPinTransparency,
        npcPinTransparency = appearance.npcPinTransparency,
        mapPinSize = appearance.mapPinSize,
        hideViewDrops = appearance.hideViewDrops,
        hideBossViewDrops = appearance.hideBossViewDrops,
        mapKeybind = appearance.mapKeybind,
        overrideMapClick = appearance.overrideMapClick,
        filters = mapKey and mapKey.enabled or preferences.value.filters,
    }
    -- Calls map_settings.lua through preferences:Save(...): persists a normalized
    -- local-preference snapshot when it changed.
    preferences:Save(snapshot)
end
local places = {
    { "Lumbridge", 3222, 3218 },
    { "Varrock", 3212, 3424 },
    { "Falador", 2965, 3380 },
    { "Draynor", 3093, 3244 },
    { "Al Kharid", 3293, 3184 },
    { "Port Sarim", 3027, 3217 },
    { "Ardougne", 2662, 3305 },
    { "Catherby", 2808, 3434 },
    { "Seers", 2725, 3485 },
    { "Burthorpe", 2898, 3544 },
    { "Prifddinas", 2236, 3373 },
    { "Menaphos", 3205, 2715 },
    { "Canifis", 3493, 3489 },
    { "Anachronia", 3894, 4270 },
    { "Havenhythe", 4337, 3311 },
    { "Wendlewick", 4185, 3348 },
    { "Amberfell", 4433, 3361 },
    { "Heathervein", 4570, 3470 },
    { "Berylbrook", 4563, 3348 },
    { "Shuruk-Ba", 4747, 3396 },
    { "Fenmoor", 4625, 3221 },
    { "Moonsylvar Wood", 4438, 3247 },
}

-- Private UI factory; creates a Text owned by parent using value and local x/y/w/h, then returns
-- that component for later updates.
local function text(parent, value, x, y, w, h)
    local t = ui.Text.new(parent)
    t:SetPos(x, y)
    t:SetSize(w, h)
    t.content = value
    t.font = id.Font.MUSEO_SANS_15PT_REGULAR
    t.rgba = 0xE7D7B0FF
    t.clickthrough = true
    return t
end

-- Private UI factory; creates and returns a decorative Rectangle in parent using local geometry
-- and packed RGBA colour. The caller chooses whether to fill it.
local function rect(parent, x, y, w, h, colour)
    local c = ui.Rectangle.new(parent)
    c:SetPos(x, y)
    c:SetSize(w, h)
    c.rgba = colour
    c.clickthrough = true
    return c
end

-- Map/overview/catalogue interactions supply map-world x/z; changes center, disables player
-- follow and marks the next draw dirty.
local function setCenter(x, z)
    cx = x
    cz = z
    follow = false
    dirty = true
end

-- Wheel/toolbar handlers supply a scale multiplier such as 2 or 0.5; clamps scale and requests
-- redraw without moving the character.
local function zoom(factor)
    scale = math.max(0.25, math.min(8, scale * factor))
    dirty = true
end
-- Switch map data and terrain ownership together; optionally retain the existing surface view.

-- Queued dropdown/entrance changes supply a map ID; keepView optionally preserves geometry.
-- Calls map_areas.lua and world_map_icons.lua to replace the current map and marker data
-- together.
-- Each history entry remembers the map and viewport before a real map switch.
local mapHistory = {}
local mapReturnPoint
-- This part changes the displayed map and its terrain, labels and markers.
local function selectArea(id, keepView, returning, entryPoint)
    lastTerrainView = nil
    local nextArea = Areas.Get(id)
    if not returning and activeArea.id ~= nextArea.id then
        mapHistory[#mapHistory + 1] = {
            id = activeArea.id,
            cx = cx,
            cz = cz,
            scale = scale,
            follow = follow,
            entryPoint = mapReturnPoint,
        }
    end
    mapReturnPoint = entryPoint
    activeArea = nextArea
    if mapBackground then
        mapBackground.rgba = activeArea.id == 28 and 0x60769AFF or 0x000000FF
    end
    for key, sprite in pairs(sprites) do
        sprite:Destroy()
        sprites[key] = nil
    end

    if areaTerrain then
        areaTerrain:Clear()
    end
    if mapIcons then
        -- Calls world_map_icons.lua through mapIcons:SetPoints(...): replaces the
        -- point/index namespace for the selected map.
        mapIcons:SetPoints(
            activeArea.id == 28 and require("world_map_data")
                or require("dungeon_return").Build(
                    activeArea,
                    entryPoint,
                    mapHistory[#mapHistory] and mapHistory[#mapHistory].id,
                    Areas.data
                ),
            activeArea.id == 28,
            activeArea.id
        )
        -- Calls world_map_icons.lua through mapIcons:HideHover(...): delegates this
        -- operation to the module that owns that data/UI; see its HideHover function
        -- contract.
        mapIcons:HideHover()
    end

    if nearbyNPCs then
        nearbyNPCs.areaID = activeArea.id
        nearbyNPCs:Leave()
    end

    if hoverCard then
        hoverCard:Hide()
    end
    if overviewImage then
        local resource = activeArea.id == 28 and Plugin.resources.overview
            or (
                (Plugin.resources.area_tiles and Plugin.resources.area_tiles["o_" .. activeArea.id])
                or (
                    Plugin.resources.area_maps
                    and Plugin.resources.area_maps["a_" .. activeArea.id]
                )
            )
        overviewImage.hidden = resource == nil
        if resource then
            overviewImage.sprite = resource
        end
    end
    overviewBounds = { x = activeArea.x, z = activeArea.z, w = activeArea.w, h = activeArea.h }
    if mapSelector then
        if Areas.IsSelectable(activeArea.id) then
            mapSelector:Select(activeArea.id, false)
        else
            -- Show the current hidden area in the field without adding a menu choice.
            mapSelector.selectedID = activeArea.id
            mapSelector.selectedLabel = activeArea.name
            if mapSelector._SetInput then
                mapSelector:_SetInput(activeArea.name)
            end
        end
    end
    player = nil
    if not keepView then
        follow = false
        cx = activeArea.x + activeArea.w / 2
        cz = activeArea.z + activeArea.h / 2
        if view then
            scale = math.max(
                0.25,
                math.min(
                    8,
                    math.min((view.width - 32) / activeArea.w, (view.height - 32) / activeArea.h)
                )
            )
        end
    end
    dirty = true
end
-- Dungeon-exit clicks pop history instead of creating another forward entry.
-- A dungeon opened without history (for example after reload) returns to surface.
local function returnToPreviousMap()
    local previous = table.remove(mapHistory)
    if previous then
        selectArea(previous.id, true, true, previous.entryPoint)
        cx = previous.cx
        cz = previous.cz
        scale = previous.scale
        follow = previous.follow
        dirty = true
    else
        selectArea(28, false, true)
    end
end
-- Render only dirty view state. Surface ranges are converted from 64-tile squares to 256-tile
-- chunks.

-- The logic loop calls only when dirty; reads current view state, draws terrain, delegates
-- markers/NPC overlays, updates the overview and clears the dirty flag.
-- This part updates map visuals after an input or client-state change.
local function draw()
    if not view then
        return
    end
    local w, h = view.width, view.height
    -- Terrain and labels depend on the viewport, not player-marker motion or
    -- appearance changes. Reuse their native layout until those inputs change.
    local terrainView =
        table.concat({ activeArea.id, cx, cz, scale, w, h, tostring(showLabels) }, ":")
    local terrainChanged = terrainView ~= lastTerrainView
    if terrainChanged then
        local used = {}
        -- Calls map_math.lua through Map.range(...): returns source-square bounds, which main
        -- converts into chunk indices.
        local x0, x1, z0, z1 = Map.range(cx, cz, scale, w, h)
        x0, x1, z0, z1 =
            math.floor(x0 / 4), math.floor(x1 / 4), math.floor(z0 / 4), math.floor(z1 / 4)
        if activeArea.id == 28 then
            -- Free offscreen terrain before creating incoming tiles.
            local stale = {}
            for key, sprite in pairs(sprites) do
                local tx, tz = key:match("^c_(%d+)_(%d+)$")
                tx = tonumber(tx)
                tz = tonumber(tz)
                if not tx or tx < x0 or tx > x1 or tz < z0 or tz > z1 then
                    sprite:Destroy()
                    stale[#stale + 1] = key
                end
            end
            for _, key in ipairs(stale) do
                sprites[key] = nil
            end
            for z = z0, z1 do
                for x = x0, x1 do
                    local key = "c_" .. x .. "_" .. z
                    if tiles[key] then
                        local s = sprites[key]
                        if not s then
                            local resource = terrainResources[key]
                            if resource then
                                s = ui.Sprite.new(tileLayer)
                                s.sprite = resource
                                s.clickthrough = true
                                sprites[key] = s
                            end
                        end
                        if s then
                            -- Calls map_math.lua through Map.project(...): takes world
                            -- position/view geometry and returns local UI x/y.
                            local px, py = Map.project(x * 256, (z + 1) * 256, cx, cz, scale, w, h)
                            -- Shared rounded edges keep neighbouring tiles flush without
                            -- stretching them over one another.
                            s:SetPos(math.floor(px), math.floor(py))
                            s:SetSize(
                                math.floor(px + 256 * scale) - math.floor(px),
                                math.floor(py + 256 * scale) - math.floor(py)
                            )
                            s.hidden = false
                            used[key] = true
                        end
                    end
                end
            end
            -- Destroy offscreen components so panning does not grow the component pool.
            local remove = {}
            for key, s in pairs(sprites) do
                if not used[key] then
                    s:Destroy()
                    remove[#remove + 1] = key
                end
            end
            for _, key in ipairs(remove) do
                sprites[key] = nil
            end
        else
            -- Calls area_terrain.lua through areaTerrain:Draw(...): returns the visible
            -- underground image-piece count.
            if areaTerrain then
                areaTerrain:Draw(activeArea, cx, cz, scale, w, h)
            end
        end
        local mapLabels = activeArea.id == 28 and places or (activeArea.labels or {})
        for i, p in ipairs(mapLabels) do
            local px, py = Map.project(p[2], p[3], cx, cz, scale, w, h)
            local t = labels[i]
            if not t then
                t = text(tileLayer, p[1], 0, 0, 115, 20)
                t.rgba = 0xFFF0B8FF
                labels[i] = t
            end
            if t.content ~= p[1] then
                t.content = p[1]
            end
            local labelColor = activeArea.id ~= 28 and 0xFFFFFFFF or 0xFFF0B8FF
            if labelStyles[i] ~= labelColor then
                t.rgba = labelColor
                labelStyles[i] = labelColor
                if activeArea.id ~= 28 then
                    t:SetSize(180, 64)
                else
                    t:SetSize(115, 20)
                end
            end
            if ui.AlignMode then
                t.alignHorizontal = activeArea.id ~= 28 and ui.AlignMode.CENTRE
                    or ui.AlignMode.TOPLEFT
            end
            t.hidden = not showLabels or px < 0 or px > w or py < 0 or py > h
            t:SetPos(
                math.floor(px) - (activeArea.id ~= 28 and 90 or 0),
                math.floor(py) - (activeArea.id ~= 28 and 12 or 0)
            )
            t:MoveToFront()
        end
        for i = #mapLabels + 1, #labels do
            labels[i].hidden = true
        end
        lastTerrainView = terrainView
    end
    local markerVisible = false
    if player and player.surface then
        local px, py = Map.project(player.x + 0.5, player.z + 0.5, cx, cz, scale, w, h)
        if px >= 10 and px < w - 10 and py >= 24 and py < h then
            Visual.Position(marker, math.floor(px) - Pin.anchorX, math.floor(py) - Pin.anchorY)
            markerVisible = true
        end
    end
    Visual.Hidden(marker, not markerVisible)
    -- Calls world_map_icons.lua through mapIcons:Draw(...): draws the eligible marker layer
    -- and preserves independent hit records.
    if mapIcons then
        mapIcons:Draw(cx, cz, scale, w, h, showMapIcons)
    end

    if nearbyNPCs then
        nearbyNPCs:SetViewport(cx, cz, scale, w, h, showMapIcons and not filterOptions.hideLiveNPCs)
    end
    referencePins:Draw(selectedMonster, activeArea.id, cx, cz, scale, w, h, appearance)
    if hoverCard then
        hoverCard:SetPins(referencePins.hits)
    end
    if terrainChanged then
        marker:MoveToFront()
        input:MoveToFront()
    end
    local zoomLabel = string.format("%.0f%%", scale * 50)
    if zoomText.content ~= zoomLabel then
        zoomText.content = zoomLabel
    end
    if overview then
        local b = overviewBounds
        local ow, oh = overview.width, overview.height
        if terrainChanged then
            local left = (cx - w / 2 / scale - b.x) / b.w * ow
            local right = (cx + w / 2 / scale - b.x) / b.w * ow
            local top = (b.z + b.h - (cz + h / 2 / scale)) / b.h * oh
            local bottom = (b.z + b.h - (cz - h / 2 / scale)) / b.h * oh
            local visible = right > 0 and left < ow and bottom > 0 and top < oh
            for _, part in ipairs(overviewFrame) do
                part.hidden = not visible
            end
            if visible then
                left = math.max(0, left)
                right = math.min(ow, right)
                top = math.max(0, top)
                bottom = math.min(oh, bottom)
                overviewFrame[5]:SetPos(math.floor(left), math.floor(top))
                overviewFrame[5]:SetSize(
                    math.max(1, math.floor(right - left)),
                    math.max(1, math.floor(bottom - top))
                )
                overviewFrame[1]:SetPos(math.floor(left), math.floor(top))
                overviewFrame[1]:SetSize(math.max(1, math.floor(right - left)), 2)
                overviewFrame[2]:SetPos(math.floor(left), math.max(0, math.floor(bottom) - 2))
                overviewFrame[2]:SetSize(math.max(1, math.floor(right - left)), 2)
                overviewFrame[3]:SetPos(math.floor(left), math.floor(top))
                overviewFrame[3]:SetSize(2, math.max(1, math.floor(bottom - top)))
                overviewFrame[4]:SetPos(math.max(0, math.floor(right) - 2), math.floor(top))
                overviewFrame[4]:SetSize(2, math.max(1, math.floor(bottom - top)))
            end
        end
        local overviewMarkerVisible = false
        if player and player.surface then
            local px = (player.x - b.x) / b.w * ow
            local py = (b.z + b.h - player.z) / b.h * oh
            if px >= 2 and px < ow - 2 and py >= 2 and py < oh - 2 then
                overviewMarkerVisible = true
                Visual.Position(overviewMarker, math.floor(px) - 2, math.floor(py) - 2)
            end
        end
        Visual.Hidden(overviewMarker, not overviewMarkerVisible)
    end
    dirty = false
end
-- Construct the plugin-owned window, controls and interaction layers in drawing order.

-- Startup/retry code calls this; builds the plugin window, controllers and UI hooks. Returns
-- false if the native host is unavailable, otherwise true after its first draw.
-- This part builds the map window and wires its controls.
local function create()
    local parent = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__PLUGIN_BUILD_LAYER_TOP)
    if not parent then
        return false
    end
    -- Calls map_settings.lua through preferences:Geometry(...): returns a clamped initial
    -- window rectangle.
    local geometry = preferences:Geometry(parent)
    window = P.Window.new(parent, {
        title = "Better World Map",
        x = geometry.x,
        y = geometry.y,
        width = geometry.width,
        height = geometry.height,
        minWidth = 820,
        minHeight = 600,
        resizable = true,
        scrollable = false,
        destroyOnClose = false,
        -- Callback/function onClose; inputs: none.
        -- PrettyUI calls when the window closes; stops drag/hover work, clears pending
        -- input and saves local settings without disabling the plugin.
        onClose = function()
            if settingsUI then
                settingsUI:Close()
            end
            pendingArea = nil
            if nearbyNPCs then
                nearbyNPCs:Leave()
            end
            saveSettings()
            shortcut:Clear()
            if mapResize then
                mapResize:Stop()
            end
            if hoverCard then
                hoverCard:Hide()
            end
            if mapIcons then
                mapIcons:HideHover()
            end
        end,
    })
    local root = window.content
    settingsUI = require("map_preferences_ui").new(
        P,
        parent,
        window,
        appearance,
        shortcut,
        function()
            if nearbyNPCs then
                nearbyNPCs:SetColour(appearance.monsterPinColor)
                nearbyNPCs:SetAppearance(appearance)
            end
            Pin.SetScale(appearance.mapPinSize / 100)
            if mapIcons then
                mapIcons:SetPinScale(appearance.mapPinSize / 100)
            end
            shortcut:SetBinding(appearance.mapKeybind)
            dirty = true
            saveSettings()
        end,
        saveSettings
    )
    mapClickOverride = require("map_click_override").new(appearance, function()
        if window.root.hidden then
            window:Show()
        else
            window:Close()
        end
        dirty = true
    end)
    local toolbarBg = rect(root, 0, 0, 1, 34, 0x34312BFF)
    toolbarBg.fill = true
    toolbarBg:SetSize(0, 34, 1, 0)

    -- Private factory inside create; label is text or a sprite ID and fn is the click
    -- action. Returns a PrettyUI SimpleButton at local x/y with the requested width.
    local function button(label, fn, x, y, width)
        return P.SimpleButton.new(
            root,
            label,
            fn,
            { x = x, y = y, width = width, height = 24, iconSize = 16 }
        )
    end

    -- Private helper inside create; draws spriteID at right-relative x and installs a click
    -- that calls zoom(factor). Returns no value.
    local function zoomButton(spriteID, factor, x)
        local control = ui.Sprite.new(root)
        control.spriteID = spriteID
        control:SetSize(20, 20)
        control:SetPos(x, 6, 1, 0)
        -- UI event: control invokes the handler on ONCLICK. Pointer coordinates, when
        -- supplied, are local to this component.
        control:Subscribe(ui.Hook.ONCLICK, function()
            zoom(factor)
            return false
        end)
    end
    zoomButton(20263, 0.5, -116)
    zoomButton(18975, 2, -32)
    zoomText = text(root, "100%", 0, 5, 56, 22)
    zoomText:SetPos(-92, 5, 1, 0)
    zoomText.alignHorizontal = ui.AlignMode.CENTRE
    zoomText.alignVertical = ui.AlignMode.CENTRE
    local followButton = button("Follow me", function()
        follow = true
        player = nil
        dirty = true
    end, 0, 4, 96)
    followButton.root:SetPos(338, 4)
    sidebar = ui.Layer.new(root)
    sidebar:SetPos(0, 34)
    sidebar:SetSize(232, -34, 0, 1)
    sidebar.clickthrough = false
    local panelBg = rect(sidebar, 0, 0, 232, 1, 0x34312BFF)
    panelBg.fill = true
    panelBg:SetSize(0, 0, 1, 1)
    overview = ui.Layer.new(sidebar)
    overview:SetPos(0, 0)
    overview:SetSize(232, 232)
    overview.clickthrough = false
    local mini = ui.Sprite.new(overview)
    overviewImage = mini
    mini.sprite = Plugin.resources.overview
    mini:SetSize(0, 0, 1, 1)
    mini.clickthrough = true
    overviewFrame = {}
    overviewFrame[5] = rect(overview, 0, 0, 1, 1, 0xFF777744)
    overviewFrame[5].fill = true
    for i = 1, 4 do
        overviewFrame[i] = rect(overview, 0, 0, 1, 1, 0xFA514AFF)
        overviewFrame[i].fill = true
    end
    overviewMarker = rect(overview, 0, 0, 4, 4, 0xFFFFFFFF)
    -- Keep a permanent outline separate from the moving viewport frame.
    for _, edge in ipairs({
        { 0, 0, 232, 3 },
        { 0, 229, 232, 3 },
        { 0, 0, 3, 232 },
        { 229, 0, 3, 232 },
    }) do
        local border = rect(overview, edge[1], edge[2], edge[3], edge[4], 0x423A2CFF)
        border.fill = true
    end
    local overviewDrag
    -- UI event: overview invokes the handler on ONCLICK. Pointer coordinates, when supplied,
    -- are local to this component.
    overview:Subscribe(ui.Hook.ONCLICK, function(_, x, y)
        local b = overviewBounds
        local wx = b.x + x / overview.width * b.w
        local wz = b.z + b.h - y / overview.height * b.h
        -- Grabbing inside the viewport preserves the point under the pointer.
        local inside = math.abs(wx - cx) <= view.width / 2 / scale
            and math.abs(wz - cz) <= view.height / 2 / scale
        overviewDrag = { dx = inside and cx - wx or 0, dz = inside and cz - wz or 0 }
        setCenter(wx + overviewDrag.dx, wz + overviewDrag.dz)
        return false
    end)
    -- UI event: overview invokes the handler on ONHOLD. Pointer coordinates, when supplied,
    -- are local to this component.
    overview:Subscribe(ui.Hook.ONHOLD, function(_, x, y)
        if overviewDrag then
            local b = overviewBounds
            x = math.max(0, math.min(overview.width, x))
            y = math.max(0, math.min(overview.height, y))
            setCenter(
                b.x + x / overview.width * b.w + overviewDrag.dx,
                b.z + b.h - y / overview.height * b.h + overviewDrag.dz
            )
        end
        return false
    end)

    -- Overview release/leave hooks call this; clears its saved drag offset and returns false
    -- to finish handling the UI event.
    local function stopOverviewDrag()
        overviewDrag = nil
        return false
    end
    -- UI event: overview invokes the handler on ONRELEASE. Pointer coordinates, when
    -- supplied, are local to this component.
    overview:Subscribe(ui.Hook.ONRELEASE, stopOverviewDrag)
    -- UI event: overview invokes the handler on ONMOUSELEAVE. Pointer coordinates, when
    -- supplied, are local to this component.
    overview:Subscribe(ui.Hook.ONMOUSELEAVE, stopOverviewDrag)

    local catalogs = {}
    local resizeContents
    -- Both catalogues share search/selection behavior; virtual_results bounds the live row count.

    -- create calls once for Bestiary and once for NPCs; title/noun label the section and
    -- records optionally supplies npc_data. Returns a collapsible section and registers its
    -- controls for layout.
    local function makeCatalog(title, noun, records)
        local bestiary
        local searchField
        bestiary = P.CollapseButton.new(
            sidebar,
            title,
            -- Callback/function onToggle; inputs: _,expanded.
            -- PrettyUI calls when this catalogue/key section expands or collapses; closes
            -- peer sections and recalculates available content height.
            {
                x = 4,
                y = 193,
                width = 224,
                indent = 0,
                expanded = false,
                onToggle = function(_, expanded)
                    if not expanded and searchField then
                        shortcut:Clear(searchField)
                    end
                    if expanded then
                        for _, catalog in ipairs(catalogs) do
                            if catalog.section ~= bestiary then
                                catalog.section:SetExpanded(false)
                            end
                        end
                    end
                    if resizeContents then
                        resizeContents()
                    end
                end,
            }
        )
        local query, matches = "", {}
        local virtualResults
        local matchText = text(bestiary.content, "Enter " .. noun .. " name", 8, 46, 208, 22)
        local resultList
        local refreshResults

        -- The catalogue selection handler passes the original data entry; calls
        -- display reference positions.
        local function selectMonster(entry)
            for _, catalog in ipairs(catalogs) do
                if catalog.list and catalog.list ~= resultList then
                    catalog.list:UnselectAll()
                end
            end
            if hoverCard then
                hoverCard:Hide()
            end
            selectedMonster = entry
            entry.catalog = title
            -- selected catalogue record (or nil) to live entity matching.
            local origin = player and player.surface and player or { x = cx, z = cz }
            -- Calls bestiary.lua through Bestiary.nearest(...): returns one closest
            -- reference position from the entry, or nil.
            local point = Bestiary.nearest(entry, origin.x, origin.z, activeArea.id)
            if point then
                local areaID = point.areaID or 28
                if activeArea.id ~= areaID then
                    selectArea(areaID)
                end
                setCenter(point.x, point.z)
                scale = 2
            end
            dirty = true
        end
        -- Search returns all matches; the virtual list constructs only the currently visible rows.
        -- Callback/function refreshResults; inputs: none.
        -- The search-field handler calls this; reads query, calls bestiary.lua.search, updates
        -- the count and sends all matches to virtual_results.lua.SetResults.
        refreshResults = function()
            -- Calls bestiary.lua through Bestiary.search(...): returns all literal name
            -- matches; the display adapter decides which rows need UI components.
            matches = Bestiary.search(query, records)
            matchText.content = query:match("^%s*$") and "Enter " .. noun .. " name"
                or (#matches == 0 and "No matches found" or string.format("%d matches", #matches))
            -- Calls virtual_results.lua through virtualResults:SetResults(...): stores all
            -- logical matches while creating only visible rows.
            if virtualResults then
                virtualResults:SetResults(matches)
            end
        end
        searchField = bestiary:AddTextField({
            x = 8,
            y = 8,
            width = 208,
            widthAnchor = 0,
            height = 32,
            placeholder = "Search " .. noun .. "s...",
            maxLength = 80,
            -- Callback/function onChange; inputs: field,reason,content.
            -- PrettyUI calls after this control changes. The parameter names below identify
            -- search text, result/map ID or checkbox state; the body updates local state and
            -- delegates to the referenced helper.
            -- Search input callback: content is the new text; reason is sent to
            -- map_shortcut.lua, then refreshResults calls bestiary.lua and
            -- virtual_results.lua.
            onChange = function(field, reason, content)
                -- Calls map_shortcut.lua through shortcut:Changed(...): delegates this
                -- operation to the module that owns that data/UI; see its Changed
                -- function contract.
                shortcut:Changed(field, reason)
                query = tostring(content or field:GetText() or "")
                refreshResults()
            end,
        })

        shortcut:Watch(searchField)
        resultList = bestiary:AddList({
            x = 8,
            y = 76,
            width = 208,
            widthAnchor = 0,
            height = 156,
            entryHeight = 26,
            maxSelected = 1,
            backgroundColour = 0x302E29FF,
            borderColour = 0x716B61FF,
            hoverColour = 0x514B3CFF,
            selectedColour = 0x695A38FF,
            entries = {},
            -- Callback/function onChange; inputs: _,entryID,selected.
            -- PrettyUI calls after this control changes. The parameter names below identify
            -- search text, result/map ID or checkbox state; the body updates local state and
            -- delegates to the referenced helper.
            -- Result-selection callback: entryID is the original full matches-array index,
            -- not the physical visible-row number. Only selected=true opens that record.
            onChange = function(_, entryID, selected)
                if selected and matches[entryID] then
                    selectMonster(matches[entryID])
                end
            end,
        })

        virtualResults = require("virtual_results").new(resultList)
        local clearMarkers = bestiary:AddSimpleButton("Clear markers", function()
            if hoverCard then
                hoverCard:Hide()
            end
            selectedMonster = nil
            for _, catalog in ipairs(catalogs) do
                if catalog.list then
                    catalog.list:UnselectAll()
                end
            end
            dirty = true
        end, { x = 8, y = 240, width = 208, height = 26 })
        catalogs[#catalogs + 1] = { section = bestiary, list = resultList, clear = clearMarkers }
        return bestiary
    end
    makeCatalog("Bestiary", "monster", nil)
    makeCatalog("NPCs", "NPC", NpcData)
    local keySection
    keySection = P.CollapseButton.new(sidebar, "Map key", {
        x = 4,
        y = 241,
        width = 224,
        indent = 0,
        expanded = false,
        -- Callback/function onToggle; inputs: _,expanded.
        -- PrettyUI calls when this catalogue/key section expands or collapses; closes
        -- peer sections and recalculates available content height.
        onToggle = function(_, expanded)
            if expanded then
                for _, catalog in ipairs(catalogs) do
                    if catalog.section ~= keySection then
                        catalog.section:SetExpanded(false)
                    end
                end
            end
            if resizeContents then
                resizeContents()
            end
        end,
    })

    mapKey = require("map_key").new(P, keySection.content, function(enabled)
        -- Calls world_map_icons.lua through mapIcons:SetFilters(...): delegates this
        -- operation to the module that owns that data/UI; see its SetFilters function
        -- contract.
        if mapIcons then
            mapIcons:SetFilters(enabled)
        end
        dirty = true
        saveSettings()
    end, preferences.value.filters)
    catalogs[#catalogs + 1] = { section = keySection, key = mapKey }
    -- Hide-labelled quest controls retain the existing show-flag persistence.
    -- Eligible, unfinished quests remain visible; no separate "Requirements Met" toggle.
    filterOptions.showRequirementsMet = true
    local filterState = {
        showCompleted = filterOptions.showCompleted,
        showRequirementsUnmet = filterOptions.showRequirementsUnmet,
        nearbyMonsters = not filterOptions.hideLiveNPCs,
        icons = showMapIcons,
        labels = showLabels,
        hideTeleportRequirements = filterOptions.hideTeleportRequirements,
    }
    local filterMenu = require("map_filters").new(P, root, filterState, function()
        filterOptions.showCompleted = filterState.showCompleted
        filterOptions.showRequirementsUnmet = filterState.showRequirementsUnmet
        filterOptions.hideLiveNPCs = not filterState.nearbyMonsters
        filterOptions.hideTeleportRequirements = filterState.hideTeleportRequirements
        teleportFilter:Refresh()
        showMapIcons = filterState.icons
        showLabels = filterState.labels
        questFilter:Refresh()
        if mapIcons then
            mapIcons.selection = nil
            mapIcons:HideHover()
        end
        if nearbyNPCs then
            nearbyNPCs:Leave()
        end
        dirty = true
        saveSettings()
    end)
    local filterPanel = filterMenu.panel
    questFilter:Refresh()

    mapSelector = P.ComboBox.new(root, {
        x = 76,
        y = 4,
        width = 250,
        height = 24,
        -- Calls map_areas.lua through Areas.Entries(...): returns dropdown id/label/order records.
        entries = Areas.Entries(),
        selectedID = activeArea.id,
        maxVisibleEntries = 12,
        -- Callback/function onChange; inputs: _,id,_,eventType.
        -- PrettyUI calls after this control changes. The parameter names below identify
        -- search text, result/map ID or checkbox state; the body updates local state and
        -- delegates to the referenced helper.
        -- Map dropdown callback: id is a map-area ID. Ignore deselection notifications;
        -- queue pendingArea so the main logic tick can switch maps once.
        onChange = function(_, id, _, eventType)
            -- ComboField also reports the old entry being deselected. Do not
            -- re-select that entry while the native control is changing state.
            if
                eventType ~= nil
                and ui.SelectionChangeEvent
                and eventType ~= ui.SelectionChangeEvent.SELECTED
            then
                return
            end
            id = tonumber(id)
            if id and Areas.data[id] then
                pendingArea = id
            end
        end,
    })
    view = ui.Layer.new(root)
    view:SetPos(0, 34)
    view:SetSize(0, -34, 1, 1)
    view.clickthrough = false
    mapBackground = rect(view, 0, 0, 1, 1, activeArea.id == 28 and 0x60769AFF or 0x000000FF)
    mapBackground.fill = true
    mapBackground:SetSize(0, 0, 1, 1)
    tileLayer = ui.Layer.new(view)
    tileLayer:SetSize(0, 0, 1, 1)
    tileLayer.clickthrough = true

    areaTerrain = require("area_terrain").new(tileLayer)
    mapIconLayer = ui.Layer.new(view)
    mapIconLayer:SetSize(0, 0, 1, 1)
    mapIconLayer.clickthrough = true
    mapIcons = WorldMapIcons.new(mapIconLayer)
    mapIcons:SetTeleportFilter(teleportFilter)
    mapIcons:SetPinScale(appearance.mapPinSize / 100)
    mapIcons.questFilter = questFilter
    mapIcons:SetFilters(mapKey.enabled)
    referenceLayer = ui.Layer.new(view)
    referenceLayer:SetSize(0, 0, 1, 1)
    referenceLayer.clickthrough = true
    referencePins = require("reference_pins").new(referenceLayer)
    referencePins:SetOpacity(movementOpacity.factor)
    marker = Pin.new(view, true)
    local nearbyLayer = ui.Layer.new(view)
    nearbyLayer:SetSize(0, 0, 1, 1)
    nearbyLayer.clickthrough = true

    nearbyNPCs = require("nearby_npcs").new(nearbyLayer)
    nearbyNPCs:SetColour(appearance.monsterPinColor)
    nearbyNPCs:SetAppearance(appearance)
    nearbyNPCs:SetOpacity(movementOpacity.factor)
    input = ui.Layer.new(view)
    input:SetSize(0, 0, 1, 1)
    input.clickthrough = false
    -- The main input layer handles map panning and local popup/map selection.
    -- UI event: input invokes the handler on ONCLICK. Pointer coordinates, when supplied,
    -- are local to this component.
    input:Subscribe(ui.Hook.ONCLICK, function(_, x, y)
        filterMenu:Close()
        if
            nearbyNPCs
            and hoverCard
            and nearbyNPCs:Click(x, y, function(entry)
                hoverCard:Open(entry)
            end)
        then
            drag = nil
            return false
        end
        if hoverCard and hoverCard:Click(x, y) then
            drag = nil
            return false
        end
        -- Calls world_map_icons.lua through mapIcons:DungeonAt(...): returns a
        -- destination area ID, or nil; the number 0 is a valid destination.
        drag = { x = x, y = y, cx = cx, cz = cz, dungeon = mapIcons and mapIcons:DungeonAt(x, y) }
        return false
    end)
    -- UI event: input invokes the handler on ONHOLD. Pointer coordinates, when supplied, are
    -- local to this component.
    input:Subscribe(ui.Hook.ONHOLD, function(_, x, y)
        if drag and (math.abs(x - drag.x) > 2 or math.abs(y - drag.y) > 2) then
            drag.moved = true
            follow = false
            cx = drag.cx - (x - drag.x) / scale
            cz = drag.cz + (y - drag.y) / scale
            dirty = true
        end
        return false
    end)
    -- UI event: input invokes the handler on ONRELEASE. Pointer coordinates, when supplied,
    -- are local to this component.
    input:Subscribe(ui.Hook.ONRELEASE, function(_, x, y)
        local gesture = drag
        drag = nil
        if
            gesture
            and gesture.dungeon
            and not gesture.moved
            and (not x or math.abs(x - gesture.x) <= 2 and math.abs(y - gesture.y) <= 2)
        then
            if gesture.dungeon == "back" then
                returnToPreviousMap()
            elseif type(gesture.dungeon) == "table" then
                -- A dungeon route can cross maps or join offset chambers in one map.
                -- Preserve zoom/history on map changes, then center its display tile.
                local target = gesture.dungeon
                if activeArea.id ~= target.areaID then
                    selectArea(target.areaID, true, false, target)
                end
                setCenter(target.x, target.z)
            else
                selectArea(gesture.dungeon)
            end
            saveSettings()
        end
        return false
    end)
    -- UI event: input invokes the handler on ONMOUSELEAVE. Pointer coordinates, when
    -- supplied, are local to this component.
    input:Subscribe(ui.Hook.ONMOUSELEAVE, function()
        drag = nil
        return false
    end)
    -- UI event: input invokes the handler on ONSCROLLWHEEL. Pointer coordinates, when
    -- supplied, are local to this component.
    input:Subscribe(ui.Hook.ONSCROLLWHEEL, function(_, delta)
        -- Calls world_map_icons.lua through mapIcons:ScrollHover(...): returns true when
        -- the card consumed wheel input, so the map must not also zoom.
        if mapIcons and delta ~= 0 and mapIcons:ScrollHover(delta) then
            return false
        end
        if delta ~= 0 then
            zoom(delta > 0 and 0.5 or 2)
        end
        return false
    end)
    -- UI event: view invokes the handler on ONRESIZE. Pointer coordinates, when supplied,
    -- are local to this component.
    view:Subscribe(ui.Hook.ONRESIZE, function()
        dirty = true
    end)
    -- Overview/key panels overlay a fixed full-width map; hiding them must not change map geometry.
    -- Callback/function resizeContents; inputs: none.
    -- Window/section/panel changes call this; reads the available height,
    -- resizes/repositions catalogue and key content, keeping the underlying map projection
    -- full-width.
    resizeContents = function()
        lastSidebarHeight = sidebar.height
        sidebar.hidden = not (showSidebar or showOverview)
        sidebar.clickthrough = not showSidebar
        -- Keep the overview usable on its own without painting an empty key panel.
        panelBg:SetSize(0, showSidebar and 0 or 232, 1, showSidebar and 1 or 0)
        overview.hidden = not showOverview
        -- Panels overlay a fixed full-width map, so toggles never change its viewport.
        view:SetPos(0, 34)
        view:SetSize(0, -34, 1, 1)
        sidebar:MoveToFront()
        if not filterPanel.hidden then
            filterPanel:MoveToFront()
        end
        local startY = showOverview and 236 or 4
        local listHeight = math.max(80, sidebar.height - startY - 190)
        local y = startY
        for _, catalog in ipairs(catalogs) do
            catalog.section.root.hidden = not showSidebar
            if catalog.key then
                local height = math.max(110, sidebar.height - y - 32)
                catalog.section:_SetContentHeight(height + 8)
                catalog.key:SetSize(height)
                catalog.section.root:SetPos(4, y)
                y = y + (catalog.section.expanded and height + 32 or 20) + 4
            else
                catalog.list:SetSize(208, listHeight, 0, 0)
                catalog.clear.root:SetPos(8, 76 + listHeight + 8)
                local contentHeight = 76 + listHeight + 8 + 26
                catalog.section:_SetContentHeight(contentHeight)
                catalog.section.root:SetPos(4, y)
                y = y + (catalog.section.expanded and contentHeight + 24 or 20) + 4
            end
        end
        dirty = true
    end
    button(id.Sprite.RS3_ICON_INFO_21PX_2, function()
        showSidebar = not showSidebar
        if not showSidebar then
            shortcut:Clear()
        end
        resizeContents()
        saveSettings()
    end, 8, 4, 24):SetTooltip("Show / hide legend and key panel")
    button(id.Sprite.RS3_ICON_WARDROBE_EFFECTS_24PX_2, function()
        showOverview = not showOverview
        resizeContents()
        saveSettings()
    end, 40, 4, 24):SetTooltip("Show / hide overview map")
    resizeSidebar = resizeContents
    -- UI event: window.root invokes the handler on ONRESIZE. Pointer coordinates, when
    -- supplied, are local to this component.
    window.root:Subscribe(ui.Hook.ONRESIZE, resizeContents)
    hoverCard = MapHover.new(P, view, input, root, window, parent, function()
        return selectedMonster
    end, function()
        return drag ~= nil
    end)
    mapIcons.nearby = nearbyNPCs
    mapIcons.references = referencePins
    mapIcons:BindHover(P, view, input, root, window, parent, function()
        return drag ~= nil
    end)

    mapResize = require("map_resize").new(window, function()
        if mapIcons then
            mapIcons:HideHover()
        end
        dirty = true
    end)
    resizeContents()
    selectArea(activeArea.id, activeArea.id == 28)
    dirty = true
    draw()
    return true
end
-- Project the current player into the selected map; reject unsupported floor/instance coordinates.

-- The logic loop calls periodically; reads the live player and uses map_areas.lua.Project for
-- supported map/floor coordinates. Returns a mapped record or nil if unavailable.
-- Remember the last detected player area, independently of the currently browsed
-- map. This makes real area transitions automatic without cancelling manual browsing
-- on every tick while the character remains in the same place/map.
local playerAreaID
local function playerPosition()
    if not Player.IsAvailable() then
        return nil
    end
    local entity = Player.GetEntity()
    if not entity or entity.isValid == false then
        return nil
    end
    local c = entity.coordGrid
    if not c then
        return nil
    end
    if World.IsRegion() then
        return nil
    end
    local areaID, mx, mz = Areas.Find(c.x, c.z, c.level, playerAreaID or activeArea.id)
    if not areaID then
        return nil
    end
    local transitioned = areaID ~= playerAreaID
    playerAreaID = areaID
    if activeArea.id ~= areaID and (transitioned or follow) then
        -- Real area changes switch by default, even after Follow me was disabled.
        -- Keep zoom and follow state; automatic switches do not add exit history.
        selectArea(areaID, true, true)
        cx = mx
        cz = mz
        dirty = true
    end
    if activeArea.id ~= areaID then
        -- A manually selected map can remain open until the next real area change.
        mx, mz = Areas.Project(activeArea.id, c.x, c.z, c.level)
        if not mx then
            return nil
        end
    end
    return { x = mx, z = mz, surface = true, areaID = activeArea.id }
end
-- Canvas/reference pins/live dots manage their own final RGBA, so generic UI
-- traversal must skip these subtrees entirely rather than fading them again.
local function fadeExclusions()
    local excluded = {}
    if settingsUI then
        excluded[#excluded + 1] = settingsUI.cog
    end
    if mapIconLayer then
        excluded[#excluded + 1] = mapIconLayer
    end
    if referenceLayer then
        excluded[#excluded + 1] = referenceLayer
    end
    if nearbyNPCs then
        excluded[#excluded + 1] = nearbyNPCs.dotLayer
    end
    return excluded
end
-- Tick loop owns deferred shortcuts, pending map changes, dirty draws and less-frequent live
-- refreshes.
-- Client event Logic invokes this handler; better_world_map_logic identifies it for unsubscribe.
-- This part polls local client state and schedules only necessary visual changes.
Event.Logic.Subscribe("better_world_map_logic", function()
    local ok, err = pcall(function()
        retry = retry + 1

        shortcut:Update(function()
            if not window then
                create()
            elseif window.root.hidden then
                window:Show()
                dirty = true
            else
                window:Close()
                dirty = true
            end
        end)
        if not window then
            if retry % 50 == 0 then
                create()
            end
            return
        end
        if settingsUI then
            settingsUI:Sync()
        end
        if mapClickOverride then
            mapClickOverride:Update(window.parent, window, settingsUI and settingsUI.window)
        end
        -- Fade the actual map/drop-window descendants during movement. The Canvas
        -- receives matching command alpha through SetOpacity on movement changes.
        if
            movementOpacity:Update(window, hoverCard and hoverCard.popup, fadeExclusions(), true)
        then
            if mapIcons then
                mapIcons:SetOpacity(movementOpacity.factor)
            end
            if referencePins then
                referencePins:SetOpacity(movementOpacity.factor)
            end
            if nearbyNPCs then
                nearbyNPCs:SetOpacity(movementOpacity.factor)
            end
            dirty = true
        end
        if pendingArea ~= nil then
            local id = pendingArea
            pendingArea = nil
            selectArea(id)
            saveSettings()
        end
        if sidebar and resizeSidebar and sidebar.height ~= lastSidebarHeight then
            lastSidebarHeight = sidebar.height
            resizeSidebar()
        end
        if retry % 10 == 0 then
            local nextPlayer = playerPosition()
            if
                (player ~= nil) ~= (nextPlayer ~= nil)
                or player
                    and nextPlayer
                    and (nextPlayer.x ~= player.x or nextPlayer.z ~= player.z or nextPlayer.surface ~= player.surface)
            then
                dirty = true
            end
            player = nextPlayer
            if follow and player and player.surface then
                cx = player.x
                cz = player.z
            end
        end
        if dirty and not window.root.hidden then
            draw()
        end
        if retry % 5 == 0 and nearbyNPCs and not window.root.hidden then
            nearbyNPCs:Update(
                cx,
                cz,
                scale,
                view.width,
                view.height,
                showMapIcons and not filterOptions.hideLiveNPCs
            )
        end
        -- Reconcile alpha after map labels and popup text have been updated.
        movementOpacity:Refresh(window, hoverCard and hoverCard.popup, fadeExclusions())
        if retry % 50 == 0 then
            if not window.root.hidden and teleportFilter:Refresh() then
                if mapIcons then
                    mapIcons.selection = nil
                    mapIcons:HideHover()
                end
                dirty = true
            end
            if not window.root.hidden and questFilter:Refresh() then
                if mapIcons then
                    mapIcons.selection = nil
                end
                dirty = true
            end
            saveSettings()
        end
    end)
    if not ok and tostring(err) ~= lastError then
        lastError = tostring(err)
        log("[BetterWorldMap] " .. lastError)
    end
end)
-- Live NPC motion is rendered per frame independently of static map redraws.
-- Client event Draw invokes this handler; better_world_map_nearby_frame identifies it for
-- unsubscribe.
-- This part projects moving loaded monsters between logic ticks.
Event.Draw.Subscribe("better_world_map_nearby_frame", function()
    if nearbyNPCs and window and not window.root.hidden then
        nearbyNPCs:Render()
    end
end)
-- Client event KeyDown invokes this handler; better_world_map_toggle identifies it for unsubscribe.
Event.KeyDown.Subscribe("better_world_map_toggle", function(e)
    shortcut:Request(e)
end)
-- Menu customization opens reference UI only; drop_menu preserves the original default action.
-- Client event MiniMenuReady invokes this handler; better_world_map_drop_menu identifies it for
-- unsubscribe.
Event.MiniMenuReady.Subscribe("better_world_map_drop_menu", function(event)
    DropMenu.apply(event.miniMenu, function(entry)
        if not window then
            create()
        end
        if hoverCard then
            hoverCard:Open(entry)
        end
    end, appearance)
end)
-- Disable callbacks before releasing owned UI, then clear retained references for a clean reload.

-- The client calls on disable/reload; saves preferences, stops module callbacks, destroys owned
-- UI and clears references. No return value is needed.
-- This part saves preferences and releases plugin-owned UI and event subscriptions.
function PluginShutdown()
    -- Restore temporary visual state before releasing any owned window roots.
    movementOpacity:Restore()
    saveSettings()
    shortcut:Clear()
    if mapClickOverride then
        mapClickOverride:Destroy()
        mapClickOverride = nil
    end
    if settingsUI then
        settingsUI:Destroy()
        settingsUI = nil
    end

    if mapResize then
        mapResize:Destroy()
        mapResize = nil
    end

    if hoverCard then
        hoverCard:Shutdown()
        hoverCard = nil
    end
    Event.MiniMenuReady.Unsubscribe("better_world_map_drop_menu")
    if mapKey then
        mapKey:Destroy()
        mapKey = nil
    end
    if referencePins then
        referencePins:Destroy()
        referencePins = nil
    end
    if nearbyNPCs then
        nearbyNPCs:Shutdown()
        nearbyNPCs = nil
    end
    if areaTerrain then
        areaTerrain:Clear()
        areaTerrain = nil
    end
    if mapIcons then
        mapIcons:Shutdown()
        mapIcons = nil
    end

    Event.Draw.Unsubscribe("better_world_map_nearby_frame")
    Event.Logic.Unsubscribe("better_world_map_logic")
    Event.KeyDown.Unsubscribe("better_world_map_toggle")
    if window then
        pcall(function()
            window:Destroy()
        end)
    end
    sidebar = nil
    resizeSidebar = nil
    lastSidebarHeight = nil
    mapBackground = nil
    window = nil
    referenceLayer = nil
    mapIconLayer = nil
    sprites = {}
    labels = {}
    labelStyles = {}
    areaTerrain = nil
    mapSelector = nil
    overviewImage = nil
    pendingArea = nil
end
create()
log(
    "[BetterWorldMap] Ready. "
        .. (appearance.mapKeybind ~= "" and appearance.mapKeybind or "(shortcut disabled)")
        .. " toggles Better World Map."
)
