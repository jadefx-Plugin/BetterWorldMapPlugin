-- Published teleport-map coordinates, replacing the early approximate district grid.
-- Sources and individual movements are recorded in tools/prif_position_audit.json.
-- These coordinates are references from the cited maps, not in-game landing captures.
local M = {}
local seedSource = "https://runescape.wiki/w/Crystal_teleport_seed"
local camoSource = "https://runescape.wiki/w/Master_camouflage_outfit"
local districts = {
    Iorwerth={2186,3312}, Ithell={2157,3340}, Cadarn={2261,3339}, Amlodd={2157,3382},
    Trahaearn={2231,3312}, Hefin={2185,3410}, Crwys={2263,3384}, Meilyr={2232,3410},
}
local function copy(value)
    if type(value) ~= "table" then return value end
    local result={};for k,v in pairs(value)do result[k]=copy(v)end;return result
end
local function position(point,x,z,source,destination)
    point.x,point.z=x,z
    point.source=source
    point.positionPrecision="Published teleport-map coordinate; not an in-game landing capture"
    if destination then
        point.record.rows[1].name=destination
        point.tooltip=point.record.title.."<br>"..destination
    end
    point.record.rows[1].detail="Teleport destination"
end
function M.Apply(points)
    local additions={}
    for _,point in ipairs(points)do
        if point.areaID==231 then
            local title=point.record.title
            local destination=point.record.rows[1].name
            if (title=="Crystal teleport seed" or title=="Attuned crystal teleport seed"
                or title=="Master camouflage outfit") and districts[destination] then
                local p=districts[destination]
                position(point,p[1],p[2],title=="Master camouflage outfit" and camoSource or seedSource)
            elseif destination=="Morvran" then
                position(point,2194,3327,title=="Ferocious ring"
                    and "https://runescape.wiki/w/Ferocious_ring"
                    or "https://runescape.wiki/w/Slayer_cape")
            elseif destination=="Gorajo Hoardstalker Dungeon" or destination=="Edimmu resource dungeon" then
                position(point,2236,destination=="Gorajo Hoardstalker Dungeon" and 3423 or 3396,
                    "https://runescape.wiki/w/Template:Dungeoneering_cape_teleports")
            elseif title=="Tirannwn quiver" then
                local p=destination=="Ithell" and {2174,3351} or destination=="Meilyr" and {2221,3399}
                if p then position(point,p[1],p[2],"https://runescape.wiki/w/Tirannwn_quiver_4",
                    destination=="Ithell" and "Eluned / Islwyn - Ithell" or "Harmony pillars - Meilyr")end
            elseif destination=="Max Guild" then
                -- Both settings are real destinations; do not pretend the player's choice is known.
                local inside=copy(point)
                position(point,2276,3327,"https://runescape.wiki/w/Max_guild_Teleport","Max Guild garden")
                position(inside,2276,3313,"https://runescape.wiki/w/Max_guild_Teleport","Max Guild tower (configured)")
                inside.requirements=(inside.requirements or "Max Guild access required.")
                    .. " Set your Max Guild arrival to the tower to use this landing."
                additions[#additions+1]=inside
            elseif title=="Waterfall fishing teleport" then
                position(point,2290,3408,"https://runescape.wiki/w/Waterfall_fishing_teleport")
                point.destinationFloor=2
                point.requirements="Consumed on use; arrives at the upper waterfall fishing area."
            elseif destination=="Prifddinas portal" or destination=="Prifddinas house portal" then
                position(point,2166,3336,title=="Prifddinas tablet"
                    and "https://runescape.wiki/w/Prifddinas_tablet"
                    or "https://runescape.wiki/w/Master_constructor%27s_outfit")
            elseif title=="Master constructor's outfit" and destination=="Prifddinas" then
                position(point,2166,3337,"https://runescape.wiki/w/Master_constructor%27s_outfit","Prifddinas estate agent")
            elseif title=="Clan vexillum" then
                position(point,2219,3373,"https://runescape.wiki/w/Clan_vexillum")
            elseif title=="Nature's sentinel outfit" then
                local magic,ivy=copy(point),copy(point)
                local source="https://runescape.wiki/w/Nature%27s_sentinel_outfit"
                position(point,2263,3384,source,"Yew trees - Crwys")
                position(magic,2251,3365,source,"Magic trees - Crwys")
                position(ivy,2241,3375,source,"Choking ivy - Crwys")
                additions[#additions+1]=magic;additions[#additions+1]=ivy
            else
                -- Basic camouflage outfits only document the Tower of Voices area.
                -- Keep its native hub anchor and explicitly avoid claiming an exact arrival.
                point.positionPrecision="Native Tower of Voices area anchor; exact arrival not verified"
                point.record.rows[1].name="Tower of Voices area"
                point.tooltip=title.."<br>Tower of Voices area"
            end
        end
    end
    for _,point in ipairs(additions)do points[#points+1]=point end
end
return M
