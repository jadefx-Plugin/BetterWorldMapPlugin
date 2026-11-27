-- Shared monster-drop reference for map popups and native context menus.
-- Bundled offline data: Wiki attribution and official rate sources are in docs/DROP_DATA.md.
-- Shards keep generated tables readable and below per-function constant limits.
local data = {}
local function merge(records)
    for name, record in pairs(records) do data[name] = record end
end
merge(require("data/catalogues/drops/a_f"))
merge(require("data/catalogues/drops/g_l"))
merge(require("data/catalogues/drops/m_r"))
merge(require("data/catalogues/drops/s_z"))
local aliases = require("data/catalogues/drop_aliases")
for name, target in pairs(aliases.names) do
    data[name] = data[target]
end
return data
