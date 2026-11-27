-- Resource-dungeon entrances own their contents, requirements and travel information.
-- Catalogue data has no runtime network/cache scans and does not depend on teleport_data.
local data=require("data/dungeons/resource_dungeon_data")
local visuals=require("data/dungeons/resource_dungeon_visuals_data")
local M={}
local aliases={}
local function normal(value)return tostring(value or ""):lower():gsub("[^%w]","")end
for _,d in ipairs(data)do for _,name in ipairs(d.aliases)do aliases[normal(name)]=d end end
function M.NameMaps(areas)
    for _,d in ipairs(data)do
        local target=d.routeTarget and areas[d.routeTarget.areaID]
        if target then target.name=d.name end
    end
end
function M.IsEntranceTeleport(point)
    local title=point.record and point.record.title
    if title~="Dungeoneering cape" and title~="Dungeoneering master cape" and title~="Hoardstalker ring"then return false end
    local first=point.record.rows and point.record.rows[1]
    return first and aliases[normal(first.name)]~=nil
end
local function marker(d)
    local visual=visuals[d.id]
    local rows={
        {name=d.level.." Dungeoneering",detail="Entry requirement; cannot be boosted."..(d.access~="" and d.id~=2 and (" "..d.access)or "")},
        {name="Inside the dungeon",style="section"},
    }
    for _,row in ipairs(visual.inside)do rows[#rows+1]=row end
    rows[#rows+1]={name="Teleport items",style="section"}
    if #visual.teleports==0 then rows[#rows+1]={name="No direct item teleport listed."}end
    for _,row in ipairs(visual.teleports)do rows[#rows+1]=row end
    if #d.nearbyTravel>0 then rows[#rows+1]={name="Nearby travel (walk to entrance)",detail=table.concat(d.nearbyTravel,"; ")}end
    return {x=d.x,z=d.z,category=100021,sprite=20902,background=18946,iconSize=20,
        tooltip=d.name,resourceDungeonID=d.id,routeTarget=d.routeTarget,
        record={title=d.name,kind="navigation",width=350,maxRows=50,rows=rows,
            note=d.routeTarget and "Click to view the dungeon map." or nil}}
end
-- Prepare copies rather than mutating shared native arrays or their stable surface indices.
function M.Prepare(points,areaID)
    local result={}
    for i,p in ipairs(points)do result[i]=p end
    for _,d in ipairs(data)do
        if d.parentArea==areaID or areaID==28 and d.parentArea==231 then
            local best,distance
            for i,p in ipairs(result)do
                local dist=(p.x-d.x)^2+(p.z-d.z)^2
                if (p.category==949 or p.category==1159 or p.category==100021)
                    and dist<=25 and (not distance or dist<distance)then best,distance=i,dist end
            end
            local entry=marker(d)
            if best then
                local replaced=result[best];result[best]=entry
                -- Duplicate native symbols at the same entrance keep their index but stay hidden.
                for i,p in ipairs(result)do
                    if i~=best and (p.category==949 or p.category==1159)
                        and math.abs(p.x-replaced.x)<=1 and math.abs(p.z-replaced.z)<=1 then
                        local copy={};for k,v in pairs(p)do copy[k]=v end
                        copy.hiddenByResourceDungeon=true;result[i]=copy
                    end
                end
            else result[#result+1]=entry end
        end
    end
    return result
end
return M
