-- live_npc_filter.lua
-- Used by: nearby_npcs.lua.
-- Keeps only valid, attackable loaded monsters with a bundled drop record.

-- nearby_npcs.Render checks every loaded entity before allocating a dot/hit.
-- Native config attackOpIndex is 1..6 for an Attack option, or -1 when absent.
-- DropMenu.resolve recognizes only bundled non-empty drop tables, preferring
-- current/parent config identity over names. Unknown data is excluded.
local Drops = require("drop_menu")
local M = {}
function M.Allows(npc)
    local ok, result = pcall(function()
        if not npc or not npc.isValid then
            return false
        end
        local cfg = npc.config
        if not cfg or cfg.isActive == false or cfg.isFamiliar == true then
            return false
        end
        local op = cfg.attackOpIndex
        return type(op) == "number" and op >= 1 and op <= 6 and Drops.resolve(npc) ~= nil
    end)
    return ok and result == true
end
return M
