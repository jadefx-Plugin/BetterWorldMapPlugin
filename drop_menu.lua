-- drop_menu.lua
-- Used by: live_npc_filter.lua, main.lua, nearby_npcs.lua.
-- Adds local View drops menu entries while preserving the native default action.

--[[
Adds a local View drops action to NPC context menus with bundled drop information.
Prefer config/parent-config identity over display names to distinguish variants.
The callback opens a plugin window only; it sends no NPC interaction or gameplay action.
Preserves the native menu's original default action by lowering the added entry priority.
]]

local records = require("monster_drops")

local bestiary = require("bestiary_data")
local Bosses = require("boss_drop_names")
local M = {}
local byName, byID = {}, {}

-- Private helper for name indexes/resolution; returns trimmed lowercase visible name text
-- without client formatting tags.
local function clean(name)
    return tostring(name or ""):gsub("<[^>]*>", ""):lower():match("^%s*(.-)%s*$")
end
for name, record in pairs(records) do
    if #record.drops > 0 then
        byName[clean(name)] = { name = name }
    end
end
for _, entry in ipairs(bestiary) do
    if records[entry.name] and #records[entry.name].drops > 0 then
        for configID in pairs(entry.ids or {}) do
            if not byID[configID] then
                byID[configID] = { name = entry.name }
            end
        end
    end
end
-- Read only valid loaded entities, with config identity taking precedence over shared names.

-- The menu handler and nearby_npcs.lua.Click pass a valid live NPC entity; returns a small name
-- record identifying monster_drops data, or nil if no record matches.
function M.resolve(npc)
    if not npc or not npc.isValid then
        return nil
    end
    -- Several Wiki variants share the same in-game display name.
    -- Match the actual config before falling back to that generic name.
    return byID[npc.configID] or byID[npc.parentConfigID] or byName[clean(npc.displayName)]
end
-- Deduplicate menu additions for the same catalogue monster before adding local callbacks.

-- Optional options contains hideViewDrops and hideBossViewDrops; these affect menu
-- additions only, leaving resolve available for live-dot eligibility and reference lookup.
-- main.lua's MiniMenuReady handler supplies a context menu and an onOpen callback; adds local
-- View drops entries. Choosing one calls onOpen(record); no gameplay action is sent.
function M.apply(menu, onOpen, options)
    if options and options.hideViewDrops then
        return
    end
    local targets, seen = {}, {}
    for _, entry in ipairs(menu.entries) do
        if entry.actionEntryType == MiniMenuEntryType.NPC then
            local match = M.resolve(entry.npcData and entry.npcData.entity)
            if
                match
                and not seen[match.name]
                and not (options and options.hideBossViewDrops and Bosses[clean(match.name)])
            then
                seen[match.name] = true
                targets[#targets + 1] = match
            end
        end
    end
    for _, target in ipairs(targets) do
        local selected = target
        local label = "View drops <col=ffff00>" .. selected.name .. "</col>"
        local exists = false
        for _, entry in ipairs(menu.entries) do
            if entry.fullText == label or entry.overrideText == label then
                exists = true
                break
            end
        end
        if not exists then
            local oldCount = #menu.entries
            menu:Add(label, function()
                onOpen(selected)
            end)
            -- Keep the original default left-click action and entry order.
            -- The API stores the highest-priority action last.
            local entries = menu.entries
            local addedIndex
            for index, entry in ipairs(entries) do
                if
                    entry.fullText == label
                    or entry.overrideText == label
                    or entry.verbText == label
                then
                    addedIndex = index
                    break
                end
            end
            -- Display fields may not be populated until the next tick.
            if not addedIndex and #entries == oldCount + 1 then
                addedIndex = #entries
            end
            if addedIndex then
                for position = addedIndex, 3, -1 do
                    menu:Swap(position, position - 1)
                end
            end
        end
    end
end
return M
