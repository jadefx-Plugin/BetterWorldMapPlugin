-- Fairy-ring codes need a small label, not a full navigation card.
local M={}
function M.Compact(hit,record)
    if hit.category~=4476 then return record end
    local code
    for _,row in ipairs(record and record.rows or {})do
        local value=tostring(row.name or ""):match("[Cc]ode:%s*(.+)")
        if value then
            value=value:gsub("%s","")
            if value:match("^%u%u%u$")then code=value;break end
        end
    end
    if not code then
        code=tostring(record and record.title or hit.text or ""):match("%f[%u](%u%u%u)%f[^%u]")
    end
    return {title="Fairy ring"..(code and (" - "..code)or ""),kind="navigation",width=220,rows={}}
end
return M
