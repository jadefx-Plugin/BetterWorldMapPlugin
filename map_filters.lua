-- map_filters.lua
-- Used by: main.lua.
-- Builds the expandable Quests, Teleports and Extras filter controls.

-- main.create supplies presentation state and a save/refresh callback.
-- Reuse the same PrettyUI CollapseButton artwork as Bestiary/NPCs/Map key.
-- Hide-labelled quest options invert the existing saved show flags; nearby
-- monsters invert hideLiveNPCs. Category IDs and saved preferences do not change.
local M = {}
function M.new(P, parent, state, onChange)
    local self = { groups = {}, checks = {} }
    self.panel = ui.Layer.new(parent)
    self.panel:SetPos(-254, 32, 1, 0)
    self.panel:SetSize(244, 56)
    self.panel.clickthrough = false
    self.panel.hidden = true
    local background = ui.Rectangle.new(self.panel)
    background:SetSize(0, 0, 1, 1)
    background.fill = true
    background.rgba = 0x34312BFF
    background.clickthrough = true
    self.header = P.CollapseButton.new(parent, "Filters", {
        width = 132,
        indent = 0,
        expanded = false,
        onToggle = function(_, expanded)
            self.panel.hidden = not expanded
            if expanded then
                self.panel:MoveToFront()
            end
        end,
    })
    self.header.root:SetPos(-256, 6, 1, 0)
    local function layout()
        local y = 6
        for _, group in ipairs(self.groups) do
            group.root:SetPos(6, y)
            y = y + 20 + (group.expanded and 4 + group.contentHeight or 0) + 4
        end
        self.panel:SetSize(244, y + 2)
    end
    local function section(name, rows)
        local group = P.CollapseButton.new(self.panel, name, {
            width = 232,
            indent = 0,
            expanded = false,
            onToggle = function()
                layout()
            end,
        })
        self.groups[#self.groups + 1] = group
        group:_SetContentHeight(#rows * 26 + 2)
        for i, row in ipairs(rows) do
            local key, inverted = row[2], row[3]
            local selected = (inverted and not state[key] or not inverted and state[key]) == true
            local check = P.CheckboxButton.new(
                group.content,
                { { text = row[1], value = key, selected = selected, tooltip = row[4] } },
                {
                    width = 224,
                    onChange = function(_, _, _, value)
                        if inverted then
                            state[key] = not value
                        else
                            state[key] = value
                        end
                        onChange()
                    end,
                }
            )
            check.root:SetPos(8, (i - 1) * 26)
            check:SetSelected(key, selected, false)
            self.checks[key] = check
        end
    end
    section("Quests", {
        { "Hide Completed", "showCompleted", true },
        { "Hide Requirements not Met", "showRequirementsUnmet", true },
    })
    section("Teleports", {
        {
            "Hide Requirements not Met",
            "hideTeleportRequirements",
            false,
            "Checks known skill and quest requirements. Unknown unlocks remain visible.",
        },
    })
    section("Extras", {
        { "Show Nearby Monsters", "nearbyMonsters", false },
        { "Show Map Icons", "icons", false },
        { "Show Map Labels", "labels", false },
    })
    function self:Close()
        self.header:SetExpanded(false)
        self.panel.hidden = true
    end
    layout()
    return self
end
return M
