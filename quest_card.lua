-- quest_card.lua
-- Used by: pin_tooltip.lua.
-- Draws quest reference cards and exposed requirement/completion checks.

--[[
Quest hover-card models and bounded on-map presentation.
Uses exposed config.Quest checks for current status, falling back to bundled descriptions,
icons and requirements when live checks are unavailable. Missing checks stay neutral.
Long content is paged and descriptions are shortened for layout; no completion or route
is inferred. Rebuilds UI only for a changed model revision, map size or page.
]]

local data = require("quest_card_data")

local icons = require("quest_hover_assets").skillIcons
local M = {}
local GOLD, GREY, GREEN, RED = 0xF2C66DFF, 0xD7CFC3FF, 0x91D68AFF, 0xF08080FF
local difficulties =
    { [0] = "Novice", "Intermediate", "Experienced", "Master", "Grandmaster", "Varies" }

-- Private protected-read helper; fn is a zero-argument client-property accessor. Returns its
-- result, or nil when the API property cannot be read.
local function get(fn)
    local ok, v = pcall(fn)
    if ok then
        return v
    end
end

-- Private text helper; returns plain display text after replacing break markup with spaces and
-- removing remaining tags.
local function clean(s)
    return tostring(s or ""):gsub("<br>", " "):gsub("<[^>]*>", "")
end

-- Private status helper; done=true/false/nil selects green/red/neutral packed RGBA respectively.
local function colour(done)
    return done == true and GREEN or done == false and RED or GREY
end
-- Resolve presentation models and a content signature without mutating shared fallback data.

-- Show supplies a record of quest rows; returns display models and a signature, combining
-- config.Quest live state with quest_card_data fallback descriptions/artwork.
function M.models(record)
    local result, signature = {}, {}
    local available = get(function()
        return Player.IsAvailable()
    end) == true
    for _, entry in ipairs(record.rows) do
        local cached = data[entry.questID] or {}
        local q = available
            and get(function()
                return config.Quest.FromID(entry.questID)
            end)
        local finished = q and get(function()
            return q.hasFinishedQuest
        end)
        local started = q and get(function()
            return q.hasStartedQuest
        end)
        local canStart = q and get(function()
            return q.canStartQuest
        end)
        local status = not q and "Unavailable"
            or finished and "Completed"
            or started and "In progress"
            or canStart == true and "Available"
            or canStart == false and "Locked"
            or "Not started"
        local members = q and get(function()
            return q.isMembers
        end)
        if members == nil then
            members = cached.members
        end
        local model = {
            name = clean(entry.name or cached.name),
            description = clean(cached.description ~= "" and cached.description or entry.detail),
            -- Journal artwork is 50x50; quest-list iconID sprites are only 15x15.
            icon = cached.icon or 31962,
            difficulty = (q and difficulties[get(function()
                return q.difficulty
            end)]) or cached.difficulty or "Unknown",
            length = cached.length or "Unknown",
            status = status,
            statusColour = finished and GREEN or GREY,
            membership = members and "members" or "free",
            skills = {},
            quests = {},
        }
        local levels = q and get(function()
            return q.preReqSkills
        end)
        local checks = q
            and get(function()
                return q.completedPreReqSkills
            end)
        if levels then
            for i, r in ipairs(levels) do
                local kind = get(function()
                    return r.skillType
                end)
                model.skills[#model.skills + 1] = {
                    level = get(function()
                        return r.minimumLevel
                    end) or "?",
                    icon = icons[kind],
                    colour = colour(checks and get(function()
                        return checks[i]
                    end)),
                }
            end
        else
            for _, r in ipairs(cached.skills or {}) do
                model.skills[#model.skills + 1] =
                    { level = r.level, icon = icons[r.skill], colour = GREY }
            end
        end
        local prereqs = q and get(function()
            return q.preReqQuests
        end)
        local questChecks = q
            and get(function()
                return q.completedPreReqQuests
            end)
        if prereqs then
            for i, r in ipairs(prereqs) do
                model.quests[#model.quests + 1] = {
                    name = clean(get(function()
                        return r.name
                    end) or "Quest"),
                    colour = colour(questChecks and get(function()
                        return questChecks[i]
                    end)),
                }
            end
        else
            for _, id in ipairs(cached.quests or {}) do
                model.quests[#model.quests + 1] =
                    { name = clean((data[id] or {}).name or "Quest"), colour = GREY }
            end
        end
        signature[#signature + 1] = model.name
            .. status
            .. model.membership
            .. tostring(model.icon)
            .. model.difficulty
            .. model.length
            .. model.description
        for _, s in ipairs(model.skills) do
            signature[#signature + 1] = tostring(s.level)
                .. ":"
                .. tostring(s.icon)
                .. ":"
                .. s.colour
        end
        for _, q in ipairs(model.quests) do
            signature[#signature + 1] = q.name .. q.colour
        end
        result[#result + 1] = model
    end
    return result, table.concat(signature, "|")
end

-- pin_tooltip.lua supplies view plus H helper functions; returns the quest-card controller,
-- reusing those drawing/measurement functions instead of duplicating them.
function M.new(view, H)
    local self = { page = 1 }

    -- Private wrapper around H.wrapped from pin_tooltip.lua; returns measured text and line
    -- count for a width and optional font.
    -- Calls the wrapped helper passed in by pin_tooltip.lua via H; quest_card does not own a
    -- second copy of that drawing/measurement function.
    local function measure(s, w, font)
        return H.wrapped(s, w, font)
    end
    -- Shorten at word boundaries until the description fits three lines.

    -- Private layout helper; shortens description text at word boundaries until it fits
    -- three lines, returning measured text and line count.
    local function shortDescription(s, w)
        s = clean(s)
        local _, n = measure(s, w)
        local shortened = false
        while n > 3 and #s > 0 do
            shortened = true
            s = s:match("^(.*)%s+%S+$") or s:sub(1, #s - 1)
            _, n = measure(s .. "...", w)
        end
        return measure(s .. (shortened and "..." or ""), w)
    end

    -- pin_tooltip.lua calls when another card takes over; hides the current quest-card layer
    -- while retaining its layout cache.
    function self:Hide()
        if self.root then
            self.root.hidden = true
        end
    end
    -- Measure blocks into bounded pages; redraw only the page whose layout/model changed.

    -- pin_tooltip.lua supplies a quest record and screen-space hit; derives models/pages and
    -- builds only the selected page when its content/layout changed.
    function self:Show(record, hit)
        self.record, self.hit = record, hit
        if self.value ~= record then
            self.value = record
            self.page = 1
            self.revision = nil
        end
        local models, revision = M.models(record)
        local width = math.min(268, view.width - 8)
        local maxHeight = view.height - 8
        local key = revision .. ":" .. width .. ":" .. maxHeight
        if self.revision ~= key then
            self.revision = key
            self.pages = {}
            for _, model in ipairs(models) do
                local heading, lines =
                    measure(string.upper(model.name), width - 48, id.Font.CINZEL_13PT_BOLD)
                local header = lines * 21 + 12
                local intro, n = shortDescription(model.description, width - 78)
                local blocks = {
                    { kind = "intro", text = intro, h = math.max(58, n * 21 + 10) },
                    {
                        kind = "pair",
                        label = "Status:",
                        value = model.status,
                        colour = model.statusColour,
                        h = 28,
                    },
                    { kind = "pair", label = "Difficulty:", value = model.difficulty, h = 28 },
                    { kind = "pair", label = "Length:", value = model.length, h = 28 },
                }
                local columns = math.max(1, math.floor((width - 20) / 58))
                for first = 1, #model.skills, columns do
                    local skills = {}
                    for i = first, math.min(#model.skills, first + columns - 1) do
                        skills[#skills + 1] = model.skills[i]
                    end
                    blocks[#blocks + 1] = {
                        kind = "skills",
                        skills = skills,
                        heading = first == 1,
                        h = first == 1 and 88 or 62,
                    }
                end
                for i, quest in ipairs(model.quests) do
                    local text, n = measure("Ã¢â‚¬Â¢ " .. quest.name, width - 22)
                    blocks[#blocks + 1] = {
                        kind = "prereq",
                        text = text,
                        colour = quest.colour,
                        heading = i == 1,
                        h = n * 21 + 8 + (i == 1 and 25 or 0),
                    }
                end
                local page = { model = model, heading = heading, header = header, blocks = {} }
                local height = header + 5
                for _, block in ipairs(blocks) do
                    if height + block.h + 30 > maxHeight and #page.blocks > 0 then
                        page.height = height
                        self.pages[#self.pages + 1] = page
                        page = { model = model, heading = heading, header = header, blocks = {} }
                        height = header + 5
                    end
                    page.blocks[#page.blocks + 1] = block
                    height = height + block.h + 2
                end
                page.height = height
                self.pages[#self.pages + 1] = page
            end
            if self.page > #self.pages then
                self.page = 1
            end
            self.drawn = nil
        end
        local page = self.pages[self.page]
        if not page then
            return
        end
        if self.drawn ~= self.page then
            self.drawn = self.page
            if self.root then
                self.root:Destroy()
            end
            self.root = ui.Layer.new(view)
            self.root.clickthrough = true
            self.width = width
            self.height = math.min(maxHeight, page.height + (#self.pages > 1 and 27 or 6))
            self.root:SetSize(width, self.height)
            -- Calls the rect helper passed in by pin_tooltip.lua via H; quest_card
            -- does not own a second copy of that drawing/measurement function.
            H.rect(self.root, 0, 0, width, self.height, 0x8B773EFF)
            H.rect(self.root, 2, 2, width - 4, self.height - 4, 0x11100FFF)
            -- Calls the text helper passed in by pin_tooltip.lua via H; quest_card
            -- does not own a second copy of that drawing/measurement function.
            H.text(
                self.root,
                page.heading,
                8,
                5,
                width - 46,
                page.header - 7,
                GOLD,
                id.Font.CINZEL_13PT_BOLD
            )
            -- Calls the star helper passed in by pin_tooltip.lua via H; quest_card
            -- does not own a second copy of that drawing/measurement function.
            H.star(self.root, width - 29, 10, page.model.membership)
            H.rect(self.root, 6, page.header, width - 12, 1, 0x8B773EFF)
            local y = page.header + 5
            for _, block in ipairs(page.blocks) do
                H.rect(self.root, 6, y, width - 12, block.h, 0x2B2723FF)
                if block.kind == "intro" then
                    H.rect(self.root, 9, y + 2, 52, 52, 0x716B61FF)
                    H.rect(self.root, 10, y + 3, 50, 50, 0x171614FF)
                    if page.model.icon and page.model.icon >= 0 then
                        local image = ui.Sprite.new(self.root)
                        image:SetPos(10, y + 3)
                        image:SetSize(50, 50)
                        image.spriteID = page.model.icon
                        image.clickthrough = true
                    end
                    H.text(self.root, block.text, 67, y + 3, width - 78, block.h - 6, GREY)
                elseif block.kind == "pair" then
                    H.text(self.root, block.label, 10, y + 3, 83, 22, GREY)
                    local label = H.text(
                        self.root,
                        block.value,
                        94,
                        y + 3,
                        width - 105,
                        22,
                        block.colour or GREY
                    )
                    if ui.AlignMode then
                        label.alignHorizontal = ui.AlignMode.BOTTOMRIGHT
                    end
                elseif block.kind == "skills" then
                    local top = y + 4
                    if block.heading then
                        H.text(self.root, "Level Requirements:", 10, top, width - 20, 22, GREY)
                        top = top + 25
                    end
                    local cell = (width - 20) / math.max(1, math.floor((width - 20) / 58))
                    for i, skill in ipairs(block.skills) do
                        local x = 10 + (i - 1) * cell
                        H.rect(self.root, x + 8, top, 34, 34, 0x716B61FF)
                        H.rect(self.root, x + 9, top + 1, 32, 32, 0x171614FF)
                        if skill.icon then
                            local icon = ui.Sprite.new(self.root)
                            icon:SetPos(x + 9, top + 1)
                            icon:SetSize(32, 32)
                            icon.spriteID = skill.icon
                            icon.clickthrough = true
                        end
                        H.text(
                            self.root,
                            "Lvl " .. skill.level,
                            x + 1,
                            top + 35,
                            cell - 2,
                            22,
                            skill.colour
                        )
                    end
                else
                    local top = y + 3
                    if block.heading then
                        H.text(self.root, "Prerequisites:", 10, top, width - 20, 22, GREY)
                        top = top + 25
                    end
                    H.text(
                        self.root,
                        block.text,
                        10,
                        top,
                        width - 20,
                        block.h - (top - y) - 2,
                        block.colour
                    )
                end
                y = y + block.h + 2
            end
            if #self.pages > 1 then
                H.text(
                    self.root,
                    self.page .. " / " .. #self.pages .. " | Mouse wheel for more",
                    10,
                    y + 1,
                    width - 20,
                    23,
                    GREY
                )
            end
        end
        local x, y = hit.x + 16, hit.y + 16
        if x + self.width > view.width - 4 then
            x = hit.x - self.width - 16
        end
        if y + self.height > view.height - 4 then
            y = hit.y - self.height - 16
        end
        self.root:SetPos(
            math.max(4, math.min(x, view.width - self.width - 4)),
            math.max(4, math.min(y, view.height - self.height - 4))
        )
        self.root.hidden = false
        self.root:MoveToFront()
    end
    -- Clamp page changes and reuse the same record/hit position for redisplay.

    -- pin_tooltip.lua passes wheel delta; changes the bounded page index and returns true
    -- only for a visible multi-page card.
    function self:Scroll(delta)
        if not self.root or self.root.hidden or #self.pages < 2 then
            return false
        end
        self.page = math.max(1, math.min(#self.pages, self.page + (delta > 0 and -1 or 1)))
        self:Show(self.record, self.hit)
        return true
    end

    -- pin_tooltip.lua.Destroy calls this; destroys the owned quest-card layer and clears its
    -- reference.
    function self:Destroy()
        if self.root then
            self.root:Destroy()
            self.root = nil
        end
    end
    return self
end
return M
