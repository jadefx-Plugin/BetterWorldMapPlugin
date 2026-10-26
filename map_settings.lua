-- map_settings.lua
-- Used by: main.lua.
-- Validates, saves and reloads plugin preferences through local PersistentDB storage.

--[[
Plugin-local preferences stored through PersistentDB.
Normalizes untrusted/stale saved values, clamps usable geometry and validates filter keys.
Stable fingerprints avoid redundant writes; storage errors are logged once per message.
Only local UI preferences are stored here, not account credentials or player histories.
]]

-- Local, plugin-scoped preferences. No external storage or network calls.
local M = {}
local KEY = "better_world_map_settings_v1"

-- Private saved-value validator; returns a rounded finite number or the supplied fallback for
-- missing/invalid values.
local function number(value, fallback)
    if type(value) ~= "number" or value ~= value or value == math.huge or value == -math.huge then
        return fallback
    end
    return math.floor(value + 0.5)
end
-- Treat saved values as untrusted and provide backward-compatible defaults for missing fields.

-- Private schema helper called when loading/saving; returns a fresh preference table with
-- validated geometry, booleans, area and filter keys.
local function bounded(value, default, min, max)
    return math.max(min, math.min(max, number(value, default)))
end
-- Packed RGBA may exceed the native signed-integer storage range. Persist it
-- as an exact hexadecimal string; accept older numeric snapshots on load.
local function colour(value, default)
    if type(value) == "string" then
        value = tonumber(value:match("^#(%x%x%x%x%x%x%x%x)$") or "", 16)
    end
    return math.floor(bounded(value, default, 0, 0xFFFFFFFF) / 256) * 256 + 255
end
-- This part validates old or missing preference values.
local function normalize(value)
    value = type(value) == "table" and value or {}
    local filters = {}
    for key, enabled in pairs(type(value.filters) == "table" and value.filters or {}) do
        local id = tonumber(key)
        if id and id >= 0 and id % 1 == 0 and type(enabled) == "boolean" then
            filters[tostring(id)] = enabled
        end
    end
    return {
        version = 1,
        mapArea = math.max(0, number(value.mapArea, 28)),
        x = number(value.x, 100),
        y = number(value.y, 100),
        width = math.max(820, number(value.width, 820)),
        height = math.max(600, number(value.height, 600)),
        showCompleted = value.showCompleted ~= false,
        showRequirementsMet = value.showRequirementsMet ~= false,
        showRequirementsUnmet = value.showRequirementsUnmet ~= false,
        hideLiveNPCs = value.hideLiveNPCs == true,
        showMapIcons = value.showMapIcons ~= false,
        showLabels = value.showLabels ~= false,
        hideTeleportRequirements = value.hideTeleportRequirements == true,
        monsterPinColor = colour(value.monsterPinColor, 0xFFD45FFF),
        npcPinColor = colour(value.npcPinColor, 0x66CCFFFF),
        transparency = bounded(value.transparency, 0, 0, 100),
        walkingTransparency = bounded(value.walkingTransparency, 50, 0, 100),
        monsterPinTransparency = bounded(value.monsterPinTransparency, 0, 0, 100),
        npcPinTransparency = bounded(value.npcPinTransparency, 0, 0, 100),
        mapPinSize = bounded(value.mapPinSize, 100, 50, 200),
        hideViewDrops = value.hideViewDrops == true,
        hideBossViewDrops = value.hideBossViewDrops == true,
        mapKeybind = type(value.mapKeybind) == "string" and value.mapKeybind:sub(1, 40) or "M",
        overrideMapClick = value.overrideMapClick == true,
        showSidebar = value.showSidebar ~= false,
        showOverview = value.showOverview ~= false,
        filters = filters,
    }
end
-- Sort category keys so table iteration order cannot trigger unnecessary persistence writes.

-- Private change detector; returns a stable string from normalized values and sorted filter IDs
-- so dictionary iteration order cannot cause needless writes.
local function fingerprint(value)
    local parts = {
        value.mapArea,
        value.x,
        value.y,
        value.width,
        value.height,
        tostring(value.showMapIcons),
        tostring(value.showLabels),
        tostring(value.showSidebar),
        tostring(value.showOverview),
        tostring(value.showCompleted),
        tostring(value.showRequirementsMet),
        tostring(value.showRequirementsUnmet),
        tostring(value.hideLiveNPCs),
        tostring(value.hideTeleportRequirements),
    }
    for _, key in ipairs({
        "monsterPinColor",
        "npcPinColor",
        "transparency",
        "walkingTransparency",
        "mapKeybind",
        "overrideMapClick",
        "monsterPinTransparency",
        "npcPinTransparency",
        "mapPinSize",
        "hideViewDrops",
        "hideBossViewDrops",
    }) do
        parts[#parts + 1] = tostring(value[key])
    end
    local keys = {}
    for k in pairs(value.filters) do
        keys[#keys + 1] = k
    end
    table.sort(keys)
    for _, k in ipairs(keys) do
        parts[#parts + 1] = k .. "=" .. tostring(value.filters[k])
    end
    return table.concat(parts, ":")
end

-- main.lua supplies PersistentDB; loads and validates saved preferences, returning an object
-- with value, Geometry and Save.
function M.new(db)
    local self = {}
    local ok, value = pcall(function()
        return db:GetStructuredData(KEY)
    end)
    self.value = normalize(ok and value or nil)
    self.last = ok and type(value) == "table" and fingerprint(self.value) or nil
    -- Rewrite older snapshots once when fields have been retired from the schema.
    if ok and type(value) == "table" then
        for key in pairs(value) do
            if self.value[key] == nil then
                self.last = nil
                break
            end
        end
    end

    -- main.lua.create supplies the native parent dimensions; returns x/y/width/height
    -- clamped to usable screen/window bounds.
    function self:Geometry(parent)
        local s = self.value
        local w = math.min(s.width, math.max(820, parent.width))
        local h = math.min(s.height, math.max(600, parent.height))
        return {
            x = math.max(0, math.min(s.x, math.max(0, parent.width - w))),
            y = math.max(0, math.min(s.y, math.max(0, parent.height - h))),
            width = w,
            height = h,
        }
    end
    -- Commit the normalized preferences only after the database confirms a successful write.

    -- main.lua.saveSettings supplies a snapshot; writes only when its normalized fingerprint
    -- changed and returns a success boolean. Failed writes keep the previous successful
    -- state.
    -- This part writes only changed settings and retries failed writes.
    function self:Save(value)
        local nextValue = normalize(value)
        local hash = fingerprint(nextValue)
        if hash == self.last then
            return true
        end
        local stored = {}
        for key, field in pairs(nextValue) do
            stored[key] = field
        end
        stored.monsterPinColor = string.format("#%08X", nextValue.monsterPinColor)
        stored.npcPinColor = string.format("#%08X", nextValue.npcPinColor)
        local success, err = pcall(function()
            return db:SetStructuredData(KEY, stored)
        end)
        if success and err ~= true then
            success = false
            err = "PersistentDB rejected the settings write"
        end
        if success then
            self.value = nextValue
            self.last = hash
            self.error = nil
        elseif self.error ~= tostring(err) then
            self.error = tostring(err)
            log("[BetterWorldMap] Could not save settings: " .. self.error)
        end
        return success
    end
    return self
end
return M
