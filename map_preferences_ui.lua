-- map_preferences_ui.lua
-- Used by: main.lua.
-- Opens categorized settings and keeps the cog attached to the title bar.

-- Settings cog and independent preference window. Main owns the state table,
-- invalidates rendering on edits, and persists it with the usual settings snapshot.
-- The independent settings window stays opaque; main.fadeExclusions skips the
-- title-bar cog so a fully transparent map can still be configured.
local Wheel = require("wheel_picker")
local M = {}
local function label(parent, value, x, y, w, h)
    local t = ui.Text.new(parent)
    t:SetPos(x, y)
    t:SetSize(w, h or 24)
    t.content = value
    t.font = id.Font.MUSEO_SANS_15PT_REGULAR
    t.rgba = 0xE7D7B0FF
    t.clickthrough = true
    t.maxLines = 0
    return t
end
local function keys(value)
    local result = {}
    for part in tostring(value or ""):upper():gmatch("[^+]+") do
        local name = part:gsub("%s", "")
        if name == "CTRL" then
            name = "CONTROL"
        end
        local key = GameKey[name] or GameKey["_" .. name]
        if key then
            result[#result + 1] = key
        end
    end
    if #result > 2 then
        return {}
    end
    return result
end
function M.new(P, parent, mapWindow, state, shortcut, onChange, onSave)
    local self = { controls = {}, pickers = {} }
    self.cog = ui.Layer.new(mapWindow.root)
    self.cog:SetPos(-54, 6, 1, 0)
    self.cog:SetSize(22, 22)
    self.cog.clickthrough = false
    -- Native CHAT_V2_SETTINGS_ON_9 / OVER_9 artwork, the same 16px cog as chat.
    local art = ui.Sprite.new(self.cog)
    art:SetPos(3, 3)
    art:SetSize(16, 16)
    art.clickthrough = true
    art.spriteID = 21038
    self.cog:Subscribe(ui.Hook.ONMOUSEOVER, function()
        art.spriteID = 21109
        return true
    end)
    self.cog:Subscribe(ui.Hook.ONMOUSELEAVE, function()
        art.spriteID = 21038
        return true
    end)
    -- This part closes settings and releases keyboard capture.
    function self:Close()
        for _, picker in ipairs(self.pickers) do
            picker:Close()
        end
        if self.keyField then
            self.keyField:CancelListening()
        end
        shortcut:Clear()
        if self.window then
            self.window:Close()
        end
    end
    -- This part opens settings and builds its category pages once.
    function self:Open()
        if self.window then
            self.window:Show()
            return
        end
        local win
        win = P.Window.new(parent, {
            title = "Better World Map Settings",
            x = math.max(0, (parent.width - 600) / 2),
            y = math.max(0, (parent.height - 500) / 2),
            width = 600,
            height = 500,
            minWidth = 600,
            minHeight = 500,
            resizable = false,
            scrollable = false,
            destroyOnClose = false,
            onClose = function()
                for _, picker in ipairs(self.pickers) do
                    picker:Close()
                end
                if self.keyField then
                    self.keyField:CancelListening()
                end
                shortcut:Clear()
                onSave()
            end,
        })
        self.window = win
        local content = win.content
        self.sections = {}
        self.sliderControls = {}
        local heading = label(content, "Pins", 162, 4, 400, 28)
        local selection = ui.Rectangle.new(content)
        selection:SetSize(138, 28)
        selection.fill = false
        selection.rgba = 0xD9BD7FFF
        selection.clickthrough = true
        local function section(name, index)
            local panel = ui.Layer.new(content)
            panel:SetPos(154, 36)
            panel:SetSize(420, 420)
            panel.clickthrough = false
            local button = P.SimpleButton.new(content, name, function()
                for _, other in pairs(self.sections) do
                    other.hidden = true
                end
                panel.hidden = false
                heading.content = name
                selection:SetPos(6, 10 + (index - 1) * 34)
                selection:MoveToFront()
            end, { x = 8, y = 12 + (index - 1) * 34, width = 134, height = 24 })
            self.controls[#self.controls + 1] = button
            self.sections[name] = panel
            panel.hidden = index ~= 1
            return panel
        end
        local pins = section("Pins", 1)
        local transparency = section("Transparency", 2)
        local drops = section("Drop menu", 3)
        local controls = section("Controls", 4)
        selection:SetPos(6, 10)
        selection:MoveToFront()
        local function picker(title, key, y)
            label(pins, title, 14, y, 270)
            local control = Wheel.new(P, pins, {
                x = 324,
                y = y - 3,
                value = state[key],
                windowParent = parent,
                onChange = function(_, value)
                    state[key] = math.floor(value / 256) * 256 + 255
                    onChange()
                end,
            })
            self.pickers[#self.pickers + 1] = control
            self.controls[#self.controls + 1] = control
        end
        picker("Monster pin color", "monsterPinColor", 16)
        picker("NPC pin color", "npcPinColor", 56)
        local function slider(panel, title, key, y, min, max)
            local caption = label(panel, title .. ": " .. math.floor(state[key]) .. "%", 14, y, 370)
            local control = P.Slider.new(panel, {
                x = 14,
                y = y + 26,
                width = 366,
                min = min or 0,
                max = max or 100,
                step = 1,
                value = state[key],
                onChange = function(_, value)
                    state[key] = value
                    caption.content = title .. ": " .. math.floor(value) .. "%"
                    onChange()
                end,
            })
            self.sliderControls[key] = { control = control, caption = caption, title = title }
            self.controls[#self.controls + 1] = control
        end
        slider(pins, "Monster pin transparency", "monsterPinTransparency", 112)
        slider(pins, "NPC pin transparency", "npcPinTransparency", 178)
        slider(pins, "Map pin size", "mapPinSize", 246, 50, 200)
        local reset = P.SimpleButton.new(pins, "Reset pin appearance", function()
            state.monsterPinColor = 0xFFD45FFF
            state.npcPinColor = 0x66CCFFFF
            state.monsterPinTransparency = 0
            state.npcPinTransparency = 0
            state.mapPinSize = 100
            self.pickers[1]:SetValue(state.monsterPinColor, false)
            self.pickers[2]:SetValue(state.npcPinColor, false)
            for _, key in ipairs({ "monsterPinTransparency", "npcPinTransparency", "mapPinSize" }) do
                local row = self.sliderControls[key]
                row.control:SetValue(state[key], false)
                row.caption.content = row.title .. ": " .. state[key] .. "%"
            end
            onChange()
        end, { x = 14, y = 326, width = 190, height = 24 })
        self.controls[#self.controls + 1] = reset
        label(
            pins,
            "Monster controls also affect live monster dots. Size applies to map markers and search pins.",
            14,
            364,
            370,
            48
        )
        slider(transparency, "Transparency", "transparency", 16)
        slider(transparency, "Walking transparency", "walkingTransparency", 80)
        label(transparency, "0% = opaque     100% = transparent", 14, 154, 370, 24)
        local function checkbox(panel, text, key, y)
            local check = P.CheckboxButton.new(
                panel,
                { { text = text, value = key, selected = state[key] } },
                {
                    x = 14,
                    y = y,
                    width = 380,
                    onChange = function(_, _, _, selected)
                        state[key] = selected
                        onChange()
                    end,
                }
            )
            check:SetSelected(key, state[key], false)
            self.controls[#self.controls + 1] = check
        end
        checkbox(drops, 'Hide "View drops" right-click option', "hideViewDrops", 16)
        checkbox(drops, 'Hide "View drops" on bosses', "hideBossViewDrops", 58)
        label(
            drops,
            "These options affect the added right-click entry. Searching and clicking map markers still works.",
            14,
            112,
            370,
            60
        )
        label(controls, "Keybind", 14, 16, 150)
        self.keyField = P.KeybindField.new(controls, {
            x = 174,
            y = 10,
            width = 206,
            height = 32,
            value = keys(state.mapKeybind),
            onChange = function(_, value)
                local names = {}
                for _, key in ipairs(value) do
                    names[#names + 1] = GameKey.FromID(key)
                end
                state.mapKeybind = table.concat(names, " + ")
                shortcut:SetBinding(state.mapKeybind)
                onChange()
            end,
        })
        self.controls[#self.controls + 1] = self.keyField
        local help = label(
            controls,
            "Native key override is unavailable. Use a free key, or unbind the original map key in RuneScape settings.",
            14,
            62,
            370,
            72
        )
        help.rgba = 0xBBAE95FF
        checkbox(controls, "Overwrite Click to open map", "overrideMapClick", 160)
    end
    self.cog:Subscribe(ui.Hook.ONCLICK, function()
        self:Open()
        return false
    end)
    -- This part keeps the cog visible and reserves its title-bar click area.
    function self:Sync()
        local hidden = mapWindow.root.hidden == true
        local changed = self.cog.hidden ~= hidden
        if changed then
            self.cog.hidden = hidden
        end
        if not self.cog.hidden then
            -- Native parent-relative anchoring tracks drag/resize immediately.
            -- PrettyUI keeps a separate title-drag hit layer above the root;
            -- leave the cog/close region out of that layer when not capturing.
            if
                mapWindow.titleDrag
                and mapWindow.titleDrag.height == 32
                and mapWindow.titleDrag.width ~= mapWindow.root.width - 60
            then
                mapWindow.titleDrag:SetSize(mapWindow.root.width - 60, 32)
            end
            if changed or not self.positioned then
                self.cog:MoveToFront()
                self.positioned = true
            end
        end
    end
    -- This part releases settings controls during plugin shutdown.
    function self:Destroy()
        for _, control in ipairs(self.controls) do
            control:Destroy()
        end
        self.controls = {}
        self.pickers = {}
        if self.window then
            self.window:Destroy()
            self.window = nil
        end
        self.cog:Destroy()
    end
    if P.KeybindField then
        shortcut:SetCaptureCheck(P.KeybindField.IsCapturing)
    end
    self:Sync()
    return self
end
return M
