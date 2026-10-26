-- pin_tooltip.lua
-- Used by: world_map_icons.lua.
-- Lays out bounded map hover cards and scrolls long reference lists.

--[[
Map-local hover cards for resources, navigation and dungeon entrances.
Combines bundled reference records with read-only quest/access checks. Quest records are
delegated to quest_card; other long records are paged inside the visible map bounds.
A layout/revision key reuses existing components until content, page or map size changes.
Cards are clickthrough and do not alter native interfaces or perform gameplay actions.
]]

-- Map-local, opaque, paged hover cards. No screen-space tooltip context.

local details = require("pin_details")

local navigation = require("navigation_details")

local dungeons = require("dungeon_details")

local dungeonLinks = require("dungeon_links")

local NavigationRequirements = require("navigation_requirements")

local QuestRequirements = require("quest_requirements")
local DungeonNavigation = require("dungeon_navigation")
local Visual = require("visual_updates")
local M = {}

-- Private helper also passed to quest_card.lua; returns a filled clickthrough Rectangle using
-- local UI geometry and packed RGBA color.
local function rect(parent, x, y, w, h, colour)
    local r = ui.Rectangle.new(parent)
    r:SetPos(x, y)
    r:SetSize(w, h)
    r.fill = true
    r.rgba = colour
    r.clickthrough = true
    return r
end
-- Draw the badge with native UI rectangles so plugin resource refresh is unnecessary.
local starSpans = {
    { 7, 2, 2 },
    { 7, 3, 2 },
    { 6, 4, 4 },
    { 4, 5, 8 },
    { 2, 6, 12 },
    { 3, 7, 10 },
    { 4, 8, 8 },
    { 5, 9, 6 },
    { 4, 10, 8 },
    { 4, 11, 4 },
    { 8, 11, 4 },
    { 4, 12, 2 },
    { 10, 12, 2 },
}

-- Shared drawing helper; draws small gold/silver rectangle spans at x/y for the membership
-- string. Returns nothing; parent owns the spans.
local function membershipStar(parent, x, y, membership)
    local colour = membership == "members" and 0xF2C142FF or 0xC9D3E0FF
    for _, span in ipairs(starSpans) do
        rect(parent, x + span[1], y + span[2], span[3], 1, colour)
    end
end

-- Private/shared Text factory; returns a clickthrough Text using the supplied local geometry,
-- content and optional color/font.
local function text(parent, value, x, y, w, h, colour, font)
    local t = ui.Text.new(parent)
    t:SetPos(x, y)
    t:SetSize(w, h)
    t.content = value
    t.font = font or id.Font.MUSEO_SANS_15PT_REGULAR
    t.maxLines = 0 -- allow the wrapping already measured by wrapped()
    -- Use client defaults: spacing overrides are unsupported in some beta builds.
    t.rgba = colour or 0xEEEEEEFF
    t.clickthrough = true
    return t
end
local TooltipMetrics = require("tooltip_metrics")

-- Shared measurement helper; returns display text and line count for a width/font. Uses native
-- font measurement or conservative manual wrapping if it fails.
local function wrapped(value, width, fontID)
    value = tostring(value or "")
    local ok, count = pcall(function()
        local font = config.Font.FromID(fontID or id.Font.MUSEO_SANS_15PT_REGULAR)
        return font:GetStringLineCount(value, math.max(1, width - 2), false, false, false)
    end)
    if ok and type(count) == "number" then
        return value, math.max(1, count)
    end
    local limit = math.max(1, math.floor(width / 8))
    local lines, line = {}, ""
    for word in tostring(value or ""):gmatch("%S+") do
        if #line + #word + 1 > limit and #line > 0 then
            lines[#lines + 1] = line
            line = ""
        end
        line = line == "" and word or line .. " " .. word
    end
    lines[#lines + 1] = line
    return table.concat(lines, "<br>"), #lines
end

-- Private inventory-artwork helper; draws a framed native associated-object sprite when itemID
-- is valid. It returns no component/value to callers.
local function item(parent, itemID, x, y, size)
    if not itemID or itemID < 0 then
        return
    end
    rect(parent, x - 1, y - 1, size + 2, size + 2, 0x716B61FF)
    rect(parent, x, y, size, size, 0x171614FF)
    local s = ui.Sprite.new(parent)
    s:SetPos(x, y)
    s:SetSize(size, size)
    s:SetAssociatedObject(itemID)
    s.clickthrough = true
end

-- world_map_icons.lua supplies the map view; returns a tooltip controller and constructs
-- quest_card.lua with shared rect/text/wrapped/star helpers.
function M.new(view)
    local self = { view = view, first = 1 }

    self.questCard = require("quest_card").new(
        view,
        { rect = rect, text = text, wrapped = wrapped, star = membershipStar }
    )

    -- Marker/filter/visibility handlers call this; hides both normal and quest cards without
    -- discarding reusable layout.
    function self:Hide()
        if self.root then
            self.root.hidden = true
        end
        -- Calls quest_card.lua through self.questCard:Hide(...): delegates this
        -- operation to the module that owns that data/UI; see its Hide function
        -- contract.
        self.questCard:Hide()
    end
    -- Prefer typed reference records over plain text, then reuse a stable layout until its
    -- revision changes.

    -- world_map_icons.lua supplies a hit record (position/index/text and optional area
    -- record); loads its typed details, delegates quests, and places the bounded card.
    function self:Show(hit)
        local raw = hit.area and hit.record
            or (not dungeons[hit.index] and not navigation[hit.index] and details[hit.index])
        self.questActive = raw and raw.kind == "quest"
        if self.questActive then
            if self.root then
                self.root.hidden = true
            end
            -- Calls quest_card.lua through self.questCard:Show(...): delegates this
            -- operation to the module that owns that data/UI; see its Show function
            -- contract.
            self.questCard:Show(raw, hit)
            return
        end
        self.questCard:Hide()
        local record, revision
        -- Calls quest_requirements.lua through QuestRequirements.render(...): returns a
        -- display record and content revision without mutating bundled records.
        if hit.area then
            record, revision = QuestRequirements.render(hit.record)
        elseif dungeons[hit.index] then
            record, revision = dungeons[hit.index], ""
        -- Calls navigation_requirements.lua through NavigationRequirements.render(...):
        -- returns a display record and revision after a read-only access check.
        elseif navigation[hit.index] then
            record, revision = NavigationRequirements.render(navigation[hit.index])
        else
            record, revision = QuestRequirements.render(details[hit.index])
        end
        if not hit.area and DungeonNavigation.CanNavigate(hit.index) and record then
            record = {
                title = record.title,
                kind = record.kind,
                width = record.width,
                rows = record.rows,
                note = "Click to view this map.",
            }
        end
        self.record = record
        -- Grouped methods may change with filters while their location/count stays the same.
        local key = hit.area
                and (hit.text .. ":" .. tostring(hit.index) .. ":" .. tostring(
                    record and record.travelKey or ""
                ))
            or hit.index
            or hit.text
        if self.value ~= key then
            self.first = 1
            self.value = key
            self.layout = nil
        end
        if record and self.first > #record.rows then
            self.first = 1
        end
        self.hit = hit
        local monster = record and record.kind == "monster"
        local simple = record and (monster or record.kind == "quest" or record.kind == "navigation")
        local width = math.min(
            record and record.width or (record and record.kind == "quest" and 332 or 268),
            view.width - 8
        )
        -- All title-only map hints fit their label. Cards containing destination
        -- rows, requirements or notes retain their readable multi-line width.
        local plainTitle, plainDetail = hit.text:match("^(.-)<br>(.*)$")
        plainTitle = record and record.title or plainTitle or hit.text
        local compactTitle = (not record or #record.rows == 0)
            and (not plainDetail or plainDetail == "")
            and not (record and record.note)
        if compactTitle then
            local padding = record and record.membership and 56 or 22
            width = math.min(
                width,
                math.max(
                    48,
                    TooltipMetrics.Width(string.upper(plainTitle), id.Font.CINZEL_13PT_BOLD)
                        + padding
                )
            )
        end
        if monster then
            local measured =
                TooltipMetrics.Width(string.upper(plainTitle), id.Font.CINZEL_13PT_BOLD)
            for _, row in ipairs(record.rows) do
                measured = math.max(
                    measured,
                    TooltipMetrics.Width(row.name, id.Font.MUSEO_SANS_15PT_REGULAR)
                )
            end
            width = math.min(width, math.max(48, measured + 22))
        end
        local maxHeight = view.height - 8
        local layout = tostring(width)
            .. ":"
            .. tostring(maxHeight)
            .. ":"
            .. self.first
            .. ":"
            .. revision
        -- Destroy the old card before building the new page, avoiding simultaneous
        -- duplicate UI trees.
        if self.layout ~= layout then
            self.layout = layout
            if self.root then
                self.root:Destroy()
            end
            self.root = ui.Layer.new(view)
            self.root.clickthrough = true
            local title, detail = hit.text:match("^(.-)<br>(.*)$")
            title = record and record.title or title or hit.text
            local star = record and record.membership
            local heading, headingLines =
                wrapped(string.upper(title), width - (star and 52 or 18), id.Font.CINZEL_13PT_BOLD)
            local header = monster and (headingLines * 21 + 10)
                or math.max(42, headingLines * 21 + 12)
            local rows = record and record.rows or {}
            local _, noteLines = wrapped(record and record.note or "", width - 20)
            local footer = monster and 0
                or record and record.kind == "navigation" and not record.note and 8
                or math.max(26, noteLines * 21 + 8)
            local y = header + 4
            local visible = {}
            -- Standard hover menus show at most four entries; height can reduce this further.
            for i = self.first, math.min(#rows, self.first + (record and record.maxRows or 4) - 1) do
                local r = rows[i]
                local nameInset = simple and ((r.spriteID or r.item) and 54 or 22) or 68
                local name, n = wrapped(r.name, width - nameInset)
                local body, b = wrapped(r.detail, width - (simple and 22 or (r.tool and 104 or 68)))
                if not r.detail or r.detail == "" then
                    b = 0
                end
                local h = simple and (n * 21 + b * 21 + (monster and 6 or 14))
                    or math.max(64, n * 21 + b * 21 + 14)
                if y + h + footer > maxHeight and #visible > 0 then
                    break
                end
                h = math.min(h, math.max(monster and 0 or 60, maxHeight - y - footer))
                visible[#visible + 1] =
                    { index = i, row = r, name = name, body = body, nameLines = n, y = y, h = h }
                y = y + h + 3
            end
            self.last = #visible > 0 and visible[#visible].index or self.first
            if #rows == 0 then
                y = header + (detail and 44 or 10)
            end
            local titleOnly = #rows == 0
                and (not detail or detail == "")
                and not (record and record.note)
            if titleOnly then
                header = headingLines * 21 + (compactTitle and 8 or 12)
                y = header
                footer = 0
            end
            self.width = width
            self.height = math.min(maxHeight, y + footer + 5)
            self.root:SetSize(width, self.height)
            rect(self.root, 0, 0, width, self.height, 0x11100FFF)
            rect(self.root, 1, 1, width - 2, self.height - 2, 0x8B773EFF)
            rect(self.root, 3, 3, width - 6, self.height - 6, 0x11100FFF)
            text(
                self.root,
                heading,
                9,
                6,
                width - (star and 52 or 18),
                header - 8,
                0xF2C66DFF,
                id.Font.CINZEL_13PT_BOLD
            )
            if star then
                membershipStar(self.root, width - 29, 13, star)
            end
            if not titleOnly then
                rect(self.root, 7, header, width - 14, 1, 0x8B773EFF)
            end
            for _, v in ipairs(visible) do
                local r = v.row
                rect(self.root, 7, v.y, width - 14, v.h, 0x2B2723FF)
                if simple then
                    local tx = (r.spriteID or r.item) and 43 or 11
                    if r.item then
                        item(self.root, r.item, 12, v.y + 3, 24)
                    elseif r.spriteID then
                        local skillIcon = ui.Sprite.new(self.root)
                        skillIcon:SetPos(12, v.y + 3)
                        skillIcon:SetSize(24, 24)
                        skillIcon.spriteID = r.spriteID
                        skillIcon.clickthrough = true
                    end
                    text(
                        self.root,
                        v.name,
                        tx,
                        v.y + 3,
                        width - tx - 11,
                        v.nameLines * 21,
                        r.colour or 0xF2C66DFF
                    )
                    text(
                        self.root,
                        v.body,
                        11,
                        v.y + v.nameLines * 21 + 5,
                        width - 22,
                        v.h - v.nameLines * 21 - 7
                    )
                else
                    item(self.root, r.tool or r.item, 12, v.y + 8, 30)
                    text(self.root, r.level and "Lvl " .. r.level or "", 9, v.y + 41, 49, 22)
                    text(self.root, v.name, 60, v.y + 1, width - 68, v.nameLines * 21)
                    local by = v.y + v.nameLines * 21 + 5
                    if r.tool then
                        item(self.root, r.item, 61, by, 26)
                    end
                    text(
                        self.root,
                        v.body,
                        r.tool and 96 or 60,
                        by,
                        width - (r.tool and 104 or 68),
                        v.h - (by - v.y) - 2,
                        0xDDD3BDFF
                    )
                end
            end
            if #rows == 0 and detail then
                text(self.root, detail, 10, header + 8, width - 20, 36, 0xDDD3BDFF)
            end
            local note = record and record.note or ""
            if #rows > self.last or self.first > 1 then
                note = self.first
                    .. "-"
                    .. self.last
                    .. " of "
                    .. #rows
                    .. " | Mouse wheel for more"
            end
            local noteText = wrapped(note, width - 20)
            text(self.root, noteText, 10, y + 2, width - 20, footer, 0xBDB29BFF)
        end
        local x, y = hit.x + 16, hit.y + 16
        if x + self.width > view.width - 4 then
            x = hit.x - self.width - 16
        end
        if y + self.height > view.height - 4 then
            y = hit.y - self.height - 16
        end
        Visual.Position(
            self.root,
            math.max(4, math.min(x, view.width - self.width - 4)),
            math.max(4, math.min(y, view.height - self.height - 4))
        )
        if Visual.Hidden(self.root, false) or self.frontRoot ~= self.root then
            self.root:MoveToFront()
            self.frontRoot = self.root
        end
    end
    -- Consume wheel input only while a visible multi-row/page card can scroll.

    -- world_map_icons.lua passes wheel delta; scrolls a visible multi-row card and returns
    -- true when consumed, otherwise false so map zoom can handle it.
    function self:Scroll(delta)
        -- Calls quest_card.lua through self.questCard:Scroll(...): delegates this
        -- operation to the module that owns that data/UI; see its Scroll function
        -- contract.
        if self.questActive then
            return self.questCard:Scroll(delta)
        end
        if not self.root or self.root.hidden or not self.hit then
            return false
        end
        local record = self.record
        if not record or (#record.rows <= self.last and self.first == 1) then
            return false
        end
        local nextFirst = delta > 0 and math.max(1, self.first - 1)
            or math.min(#record.rows, self.first + 1)
        if nextFirst ~= self.first then
            self.first = nextFirst
            self.layout = nil
            self:Show(self.hit)
        end
        return true
    end

    -- world_map_icons.lua.Shutdown calls this; destroys the normal card and the delegated
    -- quest-card controller.
    function self:Destroy()
        if self.root then
            self.root:Destroy()
            self.root = nil
        end
        -- Calls quest_card.lua through self.questCard:Destroy(...): delegates this
        -- operation to the module that owns that data/UI; see its Destroy function
        -- contract.
        self.questCard:Destroy()
    end
    return self
end
return M
