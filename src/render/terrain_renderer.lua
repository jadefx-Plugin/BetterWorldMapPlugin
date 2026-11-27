local Native = require("src/ui/native_components")
-- Original Better World Map surface renderer.
-- Authored for this project from viewport geometry and the native Sprite API.
-- No ClueTrainer, PrettyMap or RuneApps renderer code is imported.
local atlas = require('data/maps/terrain_atlas')
local M = {}

local function finite(n)
    return type(n)=='number' and n==n and n~=math.huge and n~=-math.huge
end

function M.new(parent, options)
    options=options or {}
    local self={sprites={},lastFrame=nil,stats={drawn=0,created=0,released=0}}
    local manifest=options.atlas or atlas
    local resources=options.resources or function(group) return Plugin.resources[group] end
    local make=options.makeSprite or function()return Native.New(ui.Sprite, parent)end
    local warn=options.warn or function(message)log('[BetterWorldMap] '..message)end

    function self:Clear()
        for _,sprite in pairs(self.sprites)do sprite:Destroy()end
        self.sprites={};self.lastFrame=nil;self.stats={drawn=0,created=0,released=0}
    end

    function self:SelectLevel(scale)
        local selected
        for _,level in ipairs(manifest.levels)do
            local group=resources(level.group)
            local complete=group~=nil
            if complete then
                for _,tile in ipairs(level.tiles)do
                    if not group[tile.key]then complete=false;break end
                end
            end
            if complete and (not selected or
                (level.density>=scale and level.density<selected.density) or
                (selected.density<scale and level.density>selected.density))then
                selected=level
            end
        end
        return selected
    end

    function self:Draw(cx,cz,scale,width,height)
        if not finite(cx) or not finite(cz) or not finite(scale) or scale<=0
            or not finite(width) or not finite(height) or width<=0 or height<=0 then
            self:Clear();return self.stats
        end
        local level=self:SelectLevel(scale)
        if not level then
            self:Clear()
            if not self.missingReported then
                self.missingReported=true;warn('No registered terrain level is complete; refresh plugin resources.')
            end
            return self.stats
        end
        self.missingReported=false
        local frame=table.concat({level.name,cx,cz,scale,width,height},':')
        if frame==self.lastFrame then return self.stats end
        local wanted,layout={},{}
        local west,east=cx-width/(2*scale),cx+width/(2*scale)
        local south,north=cz-height/(2*scale),cz+height/(2*scale)
        for _,tile in ipairs(level.tiles)do
            if tile.x<east and tile.x+level.span>west and tile.z<north and tile.z+level.span>south then
                local key=level.name..'/'..tile.key
                local left=math.floor(width/2+(tile.x-cx)*scale)
                local right=math.floor(width/2+(tile.x+level.span-cx)*scale)
                local top=math.floor(height/2+(cz-tile.z-level.span)*scale)
                local bottom=math.floor(height/2+(cz-tile.z)*scale)
                wanted[key]=true
                layout[#layout+1]={key=key,resource=tile.key,x=left,y=top,w=right-left,h=bottom-top}
            end
        end
        local released,created,drawn=0,0,0
        -- Reconcile removals first so a pan or zoom never holds two full views.
        local obsolete={}
        for key,sprite in pairs(self.sprites)do
            if not wanted[key]then sprite:Destroy();obsolete[#obsolete+1]=key;released=released+1 end
        end
        for _,key in ipairs(obsolete)do self.sprites[key]=nil end
        local group=resources(level.group)
        for _,tile in ipairs(layout)do
            local sprite=self.sprites[tile.key]
            if not sprite then
                local candidate
                local ok,err=pcall(function()
                    candidate=make();candidate.clickthrough=true
                    candidate.sprite=group[tile.resource]
                    candidate:SetPos(tile.x,tile.y);candidate:SetSize(tile.w,tile.h)
                end)
                if ok then
                    sprite=candidate;self.sprites[tile.key]=sprite;created=created+1
                else
                    if candidate then pcall(function()candidate:Destroy()end)end
                    if self.lastError~=tostring(err)then self.lastError=tostring(err);warn('Terrain sprite: '..self.lastError)end
                end
            end
            if sprite then
                sprite:SetPos(tile.x,tile.y);sprite:SetSize(tile.w,tile.h);sprite.hidden=false;drawn=drawn+1
            end
        end
        self.stats={drawn=drawn,created=created,released=released,level=level.name,span=level.span}
        -- Failed allocations can recover next frame instead of caching a hole.
        self.lastFrame=drawn==#layout and frame or nil
        return self.stats
    end
    function self:Shutdown()self:Clear()end
    return self
end
return M
