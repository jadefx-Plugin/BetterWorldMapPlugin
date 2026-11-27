-- Allocate custom artwork through PrettyUI's shared ID manager.
-- Content-host layers stay in the inherited category: PrettyUI content containers
-- must be parented to category-zero layers. High-volume leaf controls use auto IDs.
local M = {}
function M.New(nativeType, parent)
    if nativeType ~= ui.Layer and prettyui and prettyui.NewComponent then
        return prettyui.NewComponent(nativeType, parent, { categoryID = "auto" })
    end
    return nativeType.new(parent)
end
function M.Batch(parent, callback)
    if prettyui and prettyui.WithCategoryBatch then
        return prettyui.WithCategoryBatch(parent, callback)
    end
    return callback()
end
return M
