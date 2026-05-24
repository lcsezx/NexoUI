-- Modules/Utils/Save.lua
local Save = {}

local settings = {}

function Save:Set(key, value)
    settings[key] = value
    return value
end

function Save:Get(key, defaultValue)
    return settings[key] ~= nil and settings[key] or defaultValue
end

function Save:Toggle(key, current)
    local newValue = current ~= nil and current or not self:Get(key, false)
    self:Set(key, newValue)
    return newValue
end

function Save:SaveToFile()
    local data = game:GetService("HttpService"):JSONEncode(settings)
    -- Para salvar, precisa de um executor que suporte writefile
    if writefile then
        writefile("NexoUI_Save.json", data)
    end
    return data
end

function Save:LoadFromFile()
    if readfile then
        local data = readfile("NexoUI_Save.json")
        if data then
            settings = game:GetService("HttpService"):JSONDecode(data)
        end
    end
    return settings
end

return Save
