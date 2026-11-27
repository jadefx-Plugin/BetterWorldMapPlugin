-- PrettyUI owns resize handles, cursors, pointer capture and scaled deltas.
-- This adapter reserves title controls, reflows map content and commits geometry.
local M = {}
function M.SyncHeader(window)
    local drag, root = window.titleDrag, window.root
    -- A full-surface capture layer belongs to an active PrettyUI drag.
    if not drag or drag.height ~= 32 then return end
    local controls = window.titleControls or {}
    local left, right = controls.left or 0, controls.right or 34
    local x, y, width = root.x + left, root.y, math.max(1, root.width-left-right)
    if drag.x ~= x or drag.y ~= y then drag:SetPos(x,y) end
    if drag.width ~= width then drag:SetSize(width,32) end
end
function M.new(window, onResize, onCommit)
    local self = { width=window.root.width, height=window.root.height, pending=false, quiet=0 }
    function self:Update()
        M.SyncHeader(window)
        local root = window.root
        if root.width ~= self.width or root.height ~= self.height then
            self.width, self.height = root.width, root.height
            self.pending, self.quiet = true, 0
            if onResize then onResize() end
        elseif self.pending then
            -- Wait for the library's resize capture to end before saving.
            if window.resize and window.resize.dragState then return end
            self.quiet = self.quiet + 1
            if self.quiet >= 2 then self:Commit() end
        end
    end
    function self:Commit()
        if self.pending then
            self.pending = false
            if onCommit then onCommit() end
        end
    end
    function self:Stop()
        if window.resize and window.resize.Cancel then window.resize:Cancel() end
        M.SyncHeader(window)
        self:Commit()
        return false
    end
    function self:Destroy() self:Stop() end
    M.SyncHeader(window)
    return self
end
return M
