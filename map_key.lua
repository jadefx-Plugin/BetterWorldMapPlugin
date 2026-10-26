-- map_key.lua
-- Used by: main.lua.
-- Builds category checkboxes and expandable map-key groups.

--[[
Map-key category controls and group expansion UI.
Category IDs are keys shared by the renderer and saved settings; checkbox updates notify
the owning map without querying or modifying gameplay. Only one group's individual rows
are allocated at a time to limit native UI components. Expanded rows are temporary and
must be destroyed separately from permanent group controls.
]]

local categories = require("map_key_data")
local subgroups = require("map_key_subgroups")
local M = {}
-- Native world-map key artwork, displayed without scaling inside a 20px hit area.

-- The key builder supplies a parent plus click/wheel callbacks; returns a control object with
-- root, SetExpanded and Destroy methods.
local function keyToggle(parent, onClick, onWheel)
    local button = {}
    button.root = ui.Layer.new(parent)
    button.root:SetSize(20, 20)
    button.icon = ui.Sprite.new(button.root)
    button.icon:SetPos(2, 2)
    button.icon:SetSize(16, 16)
    button.icon.clickthrough = true

    -- The group-toggle code supplies a boolean; chooses plus/minus artwork without changing
    -- category rows itself.
    function button:SetExpanded(expanded)
        self.icon.spriteID = expanded and 20263 or 18975
    end

    -- The key's cleanup calls this; destroys the toggle root and its owned icon.
    function button:Destroy()
        self.root:Destroy()
    end
    -- UI event: button.root invokes the handler on ONCLICK. Pointer coordinates, when
    -- supplied, are local to this component.
    button.root:Subscribe(ui.Hook.ONCLICK, function()
        onClick()
        return false
    end)
    -- UI event: button.root invokes the handler on ONSCROLLWHEEL. Pointer coordinates, when
    -- supplied, are local to this component.
    if onWheel then
        button.root:Subscribe(ui.Hook.ONSCROLLWHEEL, "prettyui_scroll_forward", onWheel)
    end
    button:SetExpanded(false)
    return button
end

-- main.lua supplies PrettyUI, parent, onChange and saved initial checks; returns a controller
-- whose enabled table uses category IDs as keys.
function M.new(P, parent, onChange, initial)
    local self = { enabled = {}, groups = {}, controls = {} }
    self.view =
        P.SimpleView.new(parent, { x = 4, y = 4, width = 216, height = 240, scrollable = true })
    local names = {
        [-1] = "Quick Links",
        [0] = "Events",
        [1] = "Navigation",
        [2] = "Activities",
        [3] = "Shops / Trading",
        [4] = "Facilities",
        [5] = "Resources",
        [6] = "Teleports",
    }
    for _, cat in ipairs(categories) do
        self.enabled[cat.id] = not (
            initial and (initial[cat.id] == false or initial[tostring(cat.id)] == false)
        )
        local group = self.groups[cat.group]
        if not group then
            group =
                { id = cat.group, name = names[cat.group] or "Other", items = {}, expanded = false }
            self.groups[cat.group] = group
        end
        group.items[#group.items + 1] = cat
    end
    -- Native Activities param 4031 assigns existing categories to submenu rows.
    -- Keep group.items flat for saved filters and aggregate checkbox semantics.
    for _, group in pairs(self.groups) do
        group.nodes = {}
        group.temporary = {}
        local nested = {}
        for _, cat in ipairs(group.items) do
            local sub = group.id == 2 and subgroups.category[cat.id]
            if sub ~= nil and subgroups.names[sub] then
                if not nested[sub] then
                    nested[sub] = {
                        name = subgroups.names[sub],
                        id = "activity_" .. sub,
                        items = {},
                        expanded = false,
                    }
                end
                nested[sub].items[#nested[sub].items + 1] = cat
            else
                group.nodes[#group.nodes + 1] = { category = cat }
            end
        end
        for sub = 0, 4 do
            if nested[sub] then
                group.nodes[#group.nodes + 1] = nested[sub]
            end
        end
    end
    local order = { -1, 0, 1, 6, 2, 3, 4, 5 }

    -- Private row factory; label/value identify the row, fn receives its checked state,
    -- spriteID optionally adds artwork temporary controls cleanup ownership, and itemID optionally selects real inventory artwork.
    local function checkbox(label, value, fn, spriteID, temporary, itemID)
        local c = P.CheckboxButton.new(
            self.view.content,
            {
                {
                    text = ((spriteID or itemID) and "    " or "")
                        .. (#label > 23 and label:sub(1, 22) .. "Ã¢â‚¬Â¦" or label),
                    value = value,
                    selected = true,
                    tooltip = label,
                },
            },
            -- Callback/function onChange; inputs: _,_,_,selected.
            -- PrettyUI supplies the checked state as selected; the first three
            -- underscore arguments are unused. fn(selected) forwards the useful
            -- state to the owning row/group handler.
            {
                width = 180,
                onChange = function(_, _, _, selected)
                    fn(selected)
                end,
                _onScrollWheel = self.view._onScrollWheel,
            }
        )
        if spriteID or itemID then
            local icon = ui.Sprite.new(c.root)
            icon:SetPos(20, 3)
            icon:SetSize(16, 16)
            icon.clickthrough = true
            -- New teleport filters use the real jewellery/tablet inventory image.
            if itemID then
                icon:SetAssociatedObject(itemID)
            else
                icon.spriteID = spriteID
            end
        end
        if not temporary then
            self.controls[#self.controls + 1] = c
        end
        return c
    end
    local all
    -- Recompute aggregate checks without recursively notifying each checkbox callback.

    -- Checkbox handlers call this; recomputes group/all selected states without recursive
    -- notifications, then calls main.lua's onChange(enabled).
    local function sync()
        local every = true
        for _, cat in ipairs(categories) do
            if not self.enabled[cat.id] then
                every = false
                break
            end
        end
        all:SetSelected("all", every, false)
        for _, group in pairs(self.groups) do
            local checked = true
            for _, cat in ipairs(group.items) do
                if cat.check then
                    cat.check:SetSelected(cat.id, self.enabled[cat.id], false)
                end
                if not self.enabled[cat.id] then
                    checked = false
                end
            end
            for _, node in ipairs(group.nodes) do
                if node.items and node.check then
                    local selected = true
                    for _, cat in ipairs(node.items) do
                        if not self.enabled[cat.id] then
                            selected = false
                            break
                        end
                    end
                    node.check:SetSelected(node.id, selected, false)
                end
            end
            group.check:SetSelected(group.id, checked, false)
        end
        onChange(self.enabled)
    end
    all = checkbox("Select / deselect all", "all", function(selected)
        for _, cat in ipairs(categories) do
            self.enabled[cat.id] = selected
        end
        sync()
    end)
    -- Allocate vertical space only to expanded child rows; release other groups before expanding.

    -- Expansion handlers call this; positions only the active rows and sets the scrollable
    -- content height.
    local layout, renderGroup
    layout = function()
        local y = 0
        all.root:SetPos(0, y)
        y = y + 26
        for _, key in ipairs(order) do
            local g = self.groups[key]
            if g then
                g.check.root:SetPos(0, y)
                g.expand.root:SetPos(174, y)
                y = y + 24
                if g.expanded then
                    for _, node in ipairs(g.nodes) do
                        if node.category then
                            if node.category.check then
                                node.category.check.root:SetPos(10, y)
                                y = y + 22
                            end
                        else
                            node.check.root:SetPos(10, y)
                            node.expand.root:SetPos(174, y)
                            y = y + 24
                            if node.expanded then
                                for _, cat in ipairs(node.items) do
                                    cat.check.root:SetPos(20, y)
                                    y = y + 22
                                end
                            end
                        end
                    end
                end
            end
        end
        self.view:SetContentHeight(y + 4)
    end
    -- Release temporary rows before rebuilding; only one subgroup opens at a time.
    local function clearGroup(g)
        for _, control in ipairs(g.temporary) do
            control:Destroy()
        end
        g.temporary = {}
        for _, cat in ipairs(g.items) do
            cat.check = nil
        end
        for _, node in ipairs(g.nodes) do
            if node.items then
                node.check = nil
                node.expand = nil
            end
        end
    end
    renderGroup = function(g)
        clearGroup(g)
        if not g.expanded then
            return
        end
        local function leaf(cat)
            cat.check = checkbox(cat.name, cat.id, function(selected)
                self.enabled[cat.id] = selected
                sync()
            end, cat.sprite, true, cat.itemID)
            cat.check:SetSelected(cat.id, self.enabled[cat.id], false)
            g.temporary[#g.temporary + 1] = cat.check
        end
        for _, node in ipairs(g.nodes) do
            if node.category then
                leaf(node.category)
            else
                node.check = checkbox(node.name, node.id, function(selected)
                    for _, cat in ipairs(node.items) do
                        self.enabled[cat.id] = selected
                    end
                    sync()
                end, nil, true)
                g.temporary[#g.temporary + 1] = node.check
                node.expand = keyToggle(self.view.content, function()
                    local opening = not node.expanded
                    for _, other in ipairs(g.nodes) do
                        if other.items then
                            other.expanded = false
                        end
                    end
                    node.expanded = opening
                    renderGroup(g)
                    sync()
                    layout()
                end, self.view._onScrollWheel)
                g.temporary[#g.temporary + 1] = node.expand
                node.expand:SetExpanded(node.expanded)
                if node.expanded then
                    for _, cat in ipairs(node.items) do
                        leaf(cat)
                    end
                end
            end
        end
    end
    for _, key in ipairs(order) do
        local g = self.groups[key]
        if g then
            g.check = checkbox(g.name, g.id, function(selected)
                for _, cat in ipairs(g.items) do
                    self.enabled[cat.id] = selected
                end
                sync()
            end)
            g.expand = keyToggle(self.view.content, function()
                local opening = not g.expanded
                if opening then
                    for _, other in pairs(self.groups) do
                        if other ~= g then
                            other.expanded = false
                            other.expand:SetExpanded(false)
                            clearGroup(other)
                        end
                    end
                end
                g.expanded = opening
                renderGroup(g)
                sync()
                g.expand:SetExpanded(g.expanded)
                layout()
            end, self.view._onScrollWheel)
            self.controls[#self.controls + 1] = g.expand
        end
    end

    -- main.lua.resizeContents supplies available height; resizes the key view while
    -- preserving a usable minimum.
    function self:SetSize(height)
        self.view:SetSize(216, math.max(100, height), 0, 0)
    end
    -- Temporary category rows are not in controls, so destroy them before permanent controls.

    -- main.lua.PluginShutdown calls this; destroys temporary category rows, permanent
    -- controls and the scrolling view.
    function self:Destroy()
        for _, g in pairs(self.groups) do
            clearGroup(g)
        end
        for _, control in ipairs(self.controls) do
            control:Destroy()
        end
        self.view:Destroy()
    end
    layout()
    sync()
    return self
end
return M
