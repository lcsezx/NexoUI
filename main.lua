-- Nexo UI v1.0
-- Developed by lcsezX

local Nexo = {}

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NexoUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local Modules = {
    Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Window.lua"))(),
    Sidebar = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Sidebar.lua"))(),
    Tab = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Tab.lua"))(),
    Section = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Section.lua"))(),
    Toggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Toggle.lua"))(),
    Checkbox = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Checkbox.lua"))(),
    Slider = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Slider.lua"))(),
    Button = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Button.lua"))(),
    Dropdown = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Dropdown.lua"))(),
    ColorPicker = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/ColorPicker.lua"))(),
    Keybind = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Keybind.lua"))(),
    Label = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Label.lua"))(),
    Textbox = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Elements/Textbox.lua"))(),
    Tween = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Utils/Tween.lua"))(),
    Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Utils/Theme.lua"))(),
    Save = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Utils/Save.lua"))(),
    Animations = loadstring(game:HttpGet("https://raw.githubusercontent.com/NexoUI/NexoUI/main/Modules/Utils/Animations.lua"))()
}

function Nexo:CreateWindow(data)
    return Modules.Window.new(data, screenGui, Modules)
end

return Nexo
