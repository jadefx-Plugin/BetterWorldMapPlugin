-- nearby_npcs.lua
-- Used by: main.lua.
-- Projects eligible loaded monsters onto the map using one cached Canvas.

--[[
Live, API-exposed NPC dots and local hover/click handling.
Enumerates loaded NPCs only, projects their current floor into the selected map, and
smooths rendered movement using the current entity position where available.
Protects property access against despawns. Clicks open a reference popup, never interact
with an NPC. Shutdown removes dots, motion caches and the module-owned tooltip.
]]

-- Live client entities only; no catalogue scans or network access.

local Map = require("map_math")

local Areas = require("map_areas")
local LiveFilter = require("live_npc_filter")
local TooltipMetrics = require("tooltip_metrics")
local Visual = require("visual_updates")
local M = {}

-- main.lua supplies the overlay parent; returns a controller owning live-dot components, motion
-- caches, hit records and a name tooltip.
function M.new(parent)
    local self = { dots = {}, motion = {}, hits = {}, colour = 0xFFD45FFF, opacity = 1 }
    -- Dots have a single RGB/alpha owner. Tooltips remain outside this layer and
    -- continue using the normal window fade traversal.
    self.dotLayer = ui.Layer.new(parent)
    self.dotLayer:SetSize(0, 0, 1, 1)
    self.dotLayer.clickthrough = true
    self.dotCanvas = ui.Canvas.new(self.dotLayer)
    self.dotCanvas:SetSize(0, 0, 1, 1)
    self.dotCanvas.clickthrough = true
    local function tint()
        local transparency = self.appearance and self.appearance.monsterPinTransparency or 0
        return math.floor(self.colour / 256) * 256
            + math.floor(255 * self.opacity * (1 - transparency / 100) + 0.5)
    end
    -- Capture the exposed loaded-NPC list at the logic cadence; Render handles smoother motion.

    -- main.lua supplies center/scale/view dimensions and visibility; captures exposed loaded
    -- NPCs, stores that geometry and calls Render.
    -- Map panning updates projection without re-enumerating the client's NPC list.
    -- main.draw uses this; the slower logic cadence owns actual list refreshes.
    function self:SetViewport(cx, cz, scale, width, height, enabled)
        self.viewport = { cx, cz, scale, width, height }
        if not enabled then
            self.list = {}
        end
        self:Render()
    end
    function self:Update(cx, cz, scale, width, height, enabled)
        self.viewport = { cx, cz, scale, width, height }
        local ok, list = pcall(function()
            if not enabled or not Player.IsAvailable() or World.IsRegion() then
                return {}
            end
            local player = Player.GetEntity()
            if
                not player
                or not player.coordGrid
                or (self.areaID or 28) == 28 and player.coordGrid.level ~= 0
            then
                return {}
            end
            return NPCList.All()
        end)
        if not ok then
            list = {}
        end
        self.list = list or {}
        self:Render()
    end
    -- Entity validity/property reads can change between ticks, so protect each entity
    -- independently.

    -- main.lua calls per frame and Update calls after enumeration; projects/smooths current
    -- valid NPCs, moves dots, rebuilds hits and removes despawned dots.
    function self:Render()
        if not self.viewport then
            return
        end
        if not next(self.list or {}) and not next(self.dots) then
            return
        end
        local cx, cz, scale, width, height = table.unpack(self.viewport)
        local seen, active = {}, {}
        self.hits = {}
        for _, npc in ipairs(self.list or {}) do
            -- Entities can despawn between enumeration and property access.
            local valid, uid, x, y = pcall(function()
                if not LiveFilter.Allows(npc) then
                    return
                end
                local c = npc.coordGrid
                if not c then
                    return
                end
                -- Calls map_areas.lua through Areas.Project(...): returns two
                -- mapped coordinates only when source position/floor belongs to
                -- the selected area.
                local wx, wz = Areas.Project(self.areaID or 28, c.x, c.z, c.level)
                if not wx then
                    return
                end
                active[npc.uid] = true
                local x, z = wx + 0.5, wz + 0.5
                pcall(function()
                    local p = npc.position
                    if p and math.abs(p.x / 512 - c.x) < 4 and math.abs(p.z / 512 - c.z) < 4 then
                        x, z = wx + p.x / 512 - c.x, wz + p.z / 512 - c.z
                    end
                end)
                local previous = self.motion[npc.uid]
                if previous and math.abs(x - previous.x) < 8 and math.abs(z - previous.z) < 8 then
                    x, z = previous.x + (x - previous.x) * 0.4, previous.z + (z - previous.z) * 0.4
                end
                previous = previous or {}
                previous.x, previous.z = x, z
                self.motion[npc.uid] = previous
                -- Calls map_math.lua through Map.project(...): takes world
                -- position/view geometry and returns local UI x/y.
                local px, py = Map.project(x, z, cx, cz, scale, width, height)
                if px < 4 or px > width - 4 or py < 4 or py > height - 4 then
                    return
                end
                self.hits[#self.hits + 1] = {
                    uid = npc.uid,
                    x = px,
                    y = py,
                    npc = npc,
                    name = tostring(npc.displayName or "NPC"):gsub("<[^>]*>", ""),
                }
                return npc.uid, math.floor(px), math.floor(py)
            end)
            if valid and uid ~= nil then
                seen[uid] = true
                local dot = self.dots[uid]
                if not dot then
                    dot = { uid = uid }
                    self.dots[uid] = dot
                    self.orderDirty = true
                end
                if dot.x ~= x or dot.y ~= y then
                    dot.x, dot.y = x, y
                    self.dotsDirty = true
                end
            end
        end
        local stale = {}
        for uid in pairs(self.dots) do
            if not seen[uid] then
                stale[#stale + 1] = uid
            end
        end
        for _, uid in ipairs(stale) do
            self.dots[uid] = nil
            self.motion[uid] = nil
            self.orderDirty = true
            self.dotsDirty = true
        end
        for uid in pairs(self.motion) do
            if not active[uid] then
                self.motion[uid] = nil
            end
        end
        -- Keep deterministic draw order, but sort only when membership changes.
        -- Ordinary motion reuses each dot record and the existing ordered list.
        if self.orderDirty or not self.ordered then
            self.ordered = {}
            for _, dot in pairs(self.dots) do
                self.ordered[#self.ordered + 1] = dot
            end
            table.sort(self.ordered, function(a, b)
                return tostring(a.uid) < tostring(b.uid)
            end)
            self.orderDirty = false
        end
        local ordered = self.ordered
        local size = math.max(
            2,
            math.floor(4 * ((self.appearance and self.appearance.mapPinSize or 100) / 100) + 0.5)
        )
        local colour = tint()
        if self.dotsDirty or self.lastColour ~= colour or self.lastSize ~= size then
            self.dotsDirty = false
            self.lastColour, self.lastSize = colour, size
            self.dotCanvas:Clear()
            if colour % 256 > 0 then
                for _, dot in ipairs(ordered) do
                    self.dotCanvas:AddRectangle(
                        dot.x - math.floor(size / 2),
                        dot.y - math.floor(size / 2),
                        size,
                        size,
                        colour
                    )
                end
            end
        end
        if colour % 256 == 0 then
            self.hits = {}
        end
        if self.hoverX then
            self:ShowHover(self.hoverX, self.hoverY)
        end
    end
    function self:SetColour(colour)
        if self.colour == colour then
            return
        end
        self.colour = colour
        self.dotsDirty = true
    end
    function self:SetOpacity(alpha)
        alpha = math.max(0, math.min(1, alpha))
        if self.opacity == alpha then
            return
        end
        self.opacity = alpha
        self.dotsDirty = true
    end
    function self:SetAppearance(options)
        self.appearance = options
        local key = tostring(options.monsterPinTransparency) .. ":" .. tostring(options.mapPinSize)
        if key ~= self.appearanceKey then
            self.appearanceKey = key
            self.dotsDirty = true
        end
    end
    -- Return the nearest dot within the fixed hover radius; UID resolves exact ties.

    -- ShowHover/Click supply local pointer x/y; returns the nearest dot hit within the
    -- radius or nil, with UID resolving equal-distance ties.
    function self:Hit(x, y)
        local best, distance
        for _, hit in ipairs(self.hits) do
            local d = (hit.x - x) ^ 2 + (hit.y - y) ^ 2
            if
                d <= 49 and (not distance or d < distance or d == distance and hit.uid < best.uid)
            then
                best, distance = hit, d
            end
        end
        return best
    end

    -- Pointer/filter/click handlers call this; clears stored hover coordinates and hides the
    -- name tooltip.
    function self:Leave()
        self.hoverX, self.hoverY = nil, nil
        if self.tip then
            self.tip.hidden = true
        end
    end

    -- world_map_icons.lua supplies pointer x/y before testing static markers; displays a
    -- matching loaded-NPC name and returns whether it handled the hover.
    function self:ShowHover(x, y)
        self.hoverX, self.hoverY = x, y
        local hit = self:Hit(x, y)
        if not hit then
            if self.tip then
                self.tip.hidden = true
            end
            return false
        end
        local ok, entry = pcall(require("drop_menu").resolve, hit.npc)
        local record = ok and entry and require("monster_drops")[entry.name]
        local level = record and record.level
        if level == nil or level == "" then
            level = "Unknown"
        end
        local caption = hit.name .. " (level " .. tostring(level) .. ")"
        if not self.tip then
            self.tip = ui.Layer.new(parent)
            self.tip.clickthrough = true
            self.tipBG = ui.Rectangle.new(self.tip)
            self.tipBG.fill = true
            self.tipBG.rgba = 0x11100FFF
            self.tipBG.clickthrough = true
            self.tipBorder = ui.Rectangle.new(self.tip)
            self.tipBorder:SetPos(1, 1)
            self.tipBorder.fill = true
            self.tipBorder.rgba = 0x8B773EFF
            self.tipBorder.clickthrough = true
            self.tipInner = ui.Rectangle.new(self.tip)
            self.tipInner:SetPos(3, 3)
            self.tipInner.fill = true
            self.tipInner.rgba = 0x11100FFF
            self.tipInner.clickthrough = true
            self.tipText = ui.Text.new(self.tip)
            self.tipText:SetPos(9, 6)
            self.tipText.maxLines = 0
            self.tipText.font = id.Font.CINZEL_13PT_BOLD
            self.tipText.rgba = 0xF2C66DFF
            self.tipText.clickthrough = true
        end
        if self.tipMeasuredName ~= caption then
            self.tipMeasuredName = caption
            self.tipMeasuredWidth =
                TooltipMetrics.Width(string.upper(caption), id.Font.CINZEL_13PT_BOLD)
        end
        local w = math.min(268, self.viewport[4] - 8, math.max(48, self.tipMeasuredWidth + 22))
        if self.tipName ~= caption or self.tipWidth ~= w then
            local title = string.upper(caption)
            local ok, lines = pcall(function()
                return config.Font
                    .FromID(id.Font.CINZEL_13PT_BOLD)
                    :GetStringLineCount(title, w - 20, false, false, false)
            end)
            if not ok or type(lines) ~= "number" then
                lines = math.ceil(#title / math.max(1, math.floor((w - 20) / 9)))
            end
            self.tipHeight = math.max(1, lines) * 21 + 13
            self.tipName, self.tipWidth = caption, w
            self.tipText.content = title
            self.tip:SetSize(w, self.tipHeight)
            self.tipBG:SetSize(w, self.tipHeight)
            self.tipBorder:SetSize(w - 2, self.tipHeight - 2)
            self.tipInner:SetSize(w - 6, self.tipHeight - 6)
            self.tipText:SetSize(w - 18, self.tipHeight - 8)
        end
        local h = self.tipHeight
        Visual.Position(
            self.tip,
            math.max(4, math.min(x + 12, self.viewport[4] - w - 4)),
            math.max(4, math.min(y + 12, self.viewport[5] - h - 4))
        )
        if Visual.Hidden(self.tip, false) or self.frontTip ~= self.tip then
            self.tip:MoveToFront()
            self.frontTip = self.tip
        end
        return true
    end
    -- Resolve an optional drop record and open local UI; never issue an NPC action.

    -- main.lua supplies pointer x/y and onOpen; resolves a drop_menu record if possible,
    -- invokes the popup callback and returns true only for a dot hit.
    function self:Click(x, y, onOpen)
        local hit = self:Hit(x, y)
        if not hit then
            return false
        end

        local ok, entry = pcall(require("drop_menu").resolve, hit.npc)
        onOpen(ok and entry or { name = hit.name })
        self:Leave()
        return true
    end

    -- main.lua.PluginShutdown calls this; destroys dots/name-tooltip and clears motion,
    -- enumeration and hit data.
    function self:Shutdown()
        self.dots = {}
        self.ordered = nil
        self.motion = {}
        self.list = {}
        self.hits = {}
        if self.tip then
            self.tip:Destroy()
            self.tip = nil
        end
        self.dotCanvas:Destroy()
        self.dotLayer:Destroy()
    end
    return self
end
return M
