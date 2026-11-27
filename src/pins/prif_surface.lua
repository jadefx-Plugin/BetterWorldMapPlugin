-- Merge upper-floor city pins without changing existing surface indices.
local city=require("data/pins/prif_city_pins")
local M={}
function M.Merge(points)
 local seen={}
 for _,p in ipairs(points)do
  seen[p.x..':'..p.z..':'..p.sprite]=true
  -- Superseded ground-floor lodestone variants retain their indices for old detail links.
  if p.category==2613 and p.x==2208 and p.z==3369 then p.hiddenOnSurface=true end
 end
 for _,p in ipairs(city)do
  local k=p.x..':'..p.z..':'..p.sprite
  if not seen[k]then points[#points+1]=p;seen[k]=true end
 end
 return points
end
return M
