-- Modules/Utils/Theme.lua
local Theme = {}

local themes = {
    Dark = {
        Background = Color3.fromRGB(10, 10, 15),
        Sidebar = Color3.fromRGB(5, 10, 15),
        TitleBar = Color3.fromRGB(0, 20, 30),
        Border = Color3.fromRGB(0, 100, 150),
        Text = Color3.fromRGB(200, 200, 200),
        Highlight = Color3.fromRGB(0, 150, 200)
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 245),
        Sidebar = Color3.fromRGB(230, 230, 235),
        TitleBar = Color3.fromRGB(220, 220, 230),
        Border = Color3.fromRGB(100, 100, 150),
        Text = Color3.fromRGB(30, 30, 40),
        Highlight = Color3.fromRGB(0, 120, 200)
    },
    Blue = {
        Background = Color3.fromRGB(5, 10, 30),
        Sidebar = Color3.fromRGB(0, 5, 20),
        TitleBar = Color3.fromRGB(0, 20, 50),
        Border = Color3.fromRGB(0, 100, 200),
        Text = Color3.fromRGB(200, 220, 255),
        Highlight = Color3.fromRGB(0, 150, 255)
    },
    Red = {
        Background = Color3.fromRGB(30, 10, 10),
        Sidebar = Color3.fromRGB(20, 5, 5),
        TitleBar = Color3.fromRGB(50, 0, 0),
        Border = Color3.fromRGB(200, 0, 0),
        Text = Color3.fromRGB(255, 200, 200),
        Highlight = Color3.fromRGB(255, 50, 50)
    }
}

function Theme:Apply(window, themeName)
    local theme = themes[themeName] or themes.Dark
    
    window.BackgroundColor3 = theme.Background
    window.BorderColor3 = theme.Border
    
    for _, child in pairs(window:GetChildren()) do
        if child.Name == "TitleBar" then
            child.BackgroundColor3 = theme.TitleBar
        elseif child.Name == "Sidebar" then
            child.BackgroundColor3 = theme.Sidebar
        end
    end
end

function Theme:Get(themeName)
    return themes[themeName] or themes.Dark
end

return Theme
