-- map_shortcut.lua
-- Used by: main.lua.
-- Matches configurable keyboard shortcuts without interfering with typing or key capture.

--[[
Coordinates the configurable visibility shortcut with catalogue text-field focus.
Input callbacks can arrive after global key events, so toggling is deferred until UI hooks
can cancel it. Repeats and game-blocked input are ignored. Clear cancels pending toggles
when panels/window/focus close; the shortcut changes plugin UI visibility only.
]]

-- Search input hooks suppress the global shortcut, including keyboard focus
-- reached without a mouse click. One logic-tick delay lets UI hooks run first.
local M = {}

-- main.lua calls once; returns state tracking catalogue editing, logic ticks and an optional
-- deferred key request.
function M.new(binding)
    local self = { editing = nil, tick = 0, pending = nil, binding = binding or "M" }

    -- main.lua supplies a catalogue TextField; installs its click/key focus hooks so typing
    -- can suppress the global shortcut.
    function self:Watch(field)
        -- UI event: field.root invokes the handler on ONCLICK. Pointer coordinates, when
        -- supplied, are local to this component.
        field.root:Subscribe(ui.Hook.ONCLICK, "better_world_map_search_focus", function()
            self.editing = field
            self.pending = nil
            return true
        end)
        -- UI event: field.root invokes the handler on ONKEY. Pointer coordinates, when
        -- supplied, are local to this component.
        field.root:Subscribe(ui.Hook.ONKEY, "better_world_map_search_key", function()
            self.editing = field
            self.pending = nil
            return true
        end)
    end

    -- TextField.onChange supplies field and native input reason; updates editing state,
    -- clearing it on submit/escape/focus loss.
    function self:Changed(field, reason)
        local reasons = ui.InputFieldActionResult
        if
            reason == reasons.SUBMIT
            or reason == reasons.SUBMIT_ON_ESCAPE
            or reason == reasons.SUBMIT_ON_FOCUS_LOSS
        then
            if self.editing == field then
                self.editing = nil
            end
        else
            self.editing = field
            self.pending = nil
        end
    end

    -- Window/panel focus cleanup supplies an optional field; clears that editor (or any
    -- editor when omitted) and cancels pending toggles.
    function self:Clear(field)
        if not field or self.editing == field then
            self.editing = nil
        end
        self.pending = nil
    end
    -- Queue, rather than immediately execute, an unblocked non-repeat configured keypress.

    -- main.lua.KeyDown supplies the key event; queues an unblocked, non-repeat matching press
    -- rather than toggling before text hooks run.
    function self:Request(event)
        if
            event.isRepeat
            or self.editing
            or Keyboard.IsBlocked()
            or (self.captureCheck and self.captureCheck())
        then
            return
        end
        local keys = {}
        for part in self.binding:upper():gmatch("[^+]+") do
            keys[#keys + 1] = part:gsub("%s", "")
        end
        if #keys == 0 then
            return
        end
        local triggered = false
        local modifiers = {}
        for _, name in ipairs(keys) do
            if name == "CTRL" then
                name = "CONTROL"
            end
            local key = GameKey[name] or GameKey["_" .. name]
            if key == nil then
                return
            end
            modifiers[name] = true
            if event.gameKey == key then
                triggered = true
            else
                local ok, pressed = pcall(Keyboard.IsGameKeyDown, key)
                if not ok or not pressed then
                    return
                end
            end
        end
        if not triggered then
            return
        end
        local function down(fn)
            local ok, value = pcall(fn)
            return ok and value == true
        end
        if down(Keyboard.IsControlDown) ~= (modifiers.CONTROL == true) then
            return
        end
        if down(Keyboard.IsShiftDown) ~= (modifiers.SHIFT == true) then
            return
        end
        if down(Keyboard.IsAltDown) ~= (modifiers.ALT == true) then
            return
        end
        self.pending = self.tick + 2
    end
    function self:SetBinding(value)
        self.binding = tostring(value or "")
        self.pending = nil
    end
    function self:SetCaptureCheck(callback)
        self.captureCheck = callback
    end
    -- Let text-input hooks cancel the queued shortcut before invoking the UI toggle.

    -- main.lua's logic callback supplies the visibility-toggle function; invokes it only
    -- after the deferred request matures and editing/blocking still allow it.
    function self:Update(toggle)
        self.tick = self.tick + 1
        if self.pending and self.tick >= self.pending then
            self.pending = nil
            if
                not self.editing
                and not Keyboard.IsBlocked()
                and not (self.captureCheck and self.captureCheck())
            then
                toggle()
            end
        end
    end
    return self
end
return M
