-- navigation_requirements.lua
-- Used by: pin_tooltip.lua.
-- Formats the bundled access requirements shown on navigation cards.

--[[
Read-only live filtering of the fairy-ring access note.
A confirmed client quest-completion check may remove the access warning. Missing API data
keeps the warning visible; it is never taken as proof that the player has access.
Returns a presentation record and revision key without changing the bundled record.
]]

-- Only hide the fairy ring access note on confirmed quest completion.
local M = {}

-- pin_tooltip.lua supplies a navigation record; returns a display record plus revision string. A
-- confirmed completion check may remove an access note; unavailable checks preserve it.
function M.render(record)
    if not record or not record.accessQuestID then
        return record, ""
    end
    local ok, completed = pcall(function()
        return Player.IsAvailable()
            and config.Quest.FromID(record.accessQuestID).hasFinishedQuest == true
    end)
    if not ok or not completed then
        return record, "ring:access-note"
    end
    return {
        title = record.title,
        kind = record.kind,
        width = record.width,
        rows = {
            record.rows[1],
        },
    },
        "ring:completed"
end
return M
