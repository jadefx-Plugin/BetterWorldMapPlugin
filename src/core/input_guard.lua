-- Read focus state only; chat message contents are never accessed.
local M={}
local function active(value)
    return value==true or (type(value)=='number' and value>0)
end
function M.KeyboardBlocked()
    if Keyboard and Keyboard.IsBlocked then
        local ok,blocked=pcall(Keyboard.IsBlocked)
        if ok and active(blocked) then return true end
    end
    return false
end
local function readFocus(name)
    local domain=var and var.VarClient
    if not domain then return nil end
    local ok,value=pcall(function()
        local variable=domain[name]
        return variable and variable.value
    end)
    if ok and (type(value)=='number' or type(value)=='boolean') then return value end
    return nil
end
function M.ChatFocused()
    -- These belong to different chat implementations. A legacy value must not
    -- override an explicit unfocused state from the modern chat implementation.
    local modern=readFocus('TOPLEVEL_V2_CHAT_FOCUS')
    if modern~=nil then return active(modern) end
    return active(readFocus('CHATBOX_FOCUS'))
end
function M.FocusDiagnostic()
    return 'modern='..tostring(readFocus('TOPLEVEL_V2_CHAT_FOCUS'))
        ..'; legacy='..tostring(readFocus('CHATBOX_FOCUS'))
end
function M.IsTyping()
    return M.KeyboardBlocked() or M.ChatFocused()
end
return M
