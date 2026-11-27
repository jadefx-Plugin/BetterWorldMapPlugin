-- Merge cache-placed resource pins without changing existing map marker order.
local additions=require("data/dungeons/submap_resources_data")
local M={}
function M.Apply(areas)
    for id,points in pairs(additions)do
        local area=areas[id]
        if area then
            local seen={}
            for _,p in ipairs(area.points)do seen[p.x..":"..p.z..":"..p.category]=true end
            for _,p in ipairs(points)do
                local key=p.x..":"..p.z..":"..p.category
                if not seen[key]then area.points[#area.points+1]=p;seen[key]=true end
            end
        end
    end
end
return M
