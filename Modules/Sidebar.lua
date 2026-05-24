-- Modules/Sidebar.lua
local Sidebar = {}

function Sidebar.new(parent, Modules)
    local self = {}
    
    local sidebar = Instance.new("Frame", parent)
    sidebar.Size = UDim2.new(0, 120, 1, 0)
    sidebar.BackgroundColor3 = Color3.fromRGB(5, 10, 15)
    sidebar.BorderSizePixel = 0
    
    local tabsContainer = Instance.new("ScrollingFrame", sidebar)
    tabsContainer.Size = UDim2.new(1, -10, 1, -10)
    tabsContainer.Position = UDim2.new(0, 5, 0, 5)
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.BorderSizePixel = 0
    tabsContainer.ScrollBarThickness = 2
    
    function self:AddTab(name, callback)
        local button = Instance.new("TextButton", tabsContainer)
        button.Size = UDim2.new(1, 0, 0, 35)
        button.BackgroundColor3 = Color3.fromRGB(15, 20, 25)
        button.BackgroundTransparency = 0.5
        button.Text = name
        button.TextColor3 = Color3.fromRGB(200, 200, 200)
        button.TextSize = 12
        button.Font = Enum.Font.Gotham
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
        
        button.MouseButton1Click:Connect(function()
            callback()
            for _, btn in pairs(tabsContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    btn.BackgroundColor3 = Color3.fromRGB(15, 20, 25)
                    btn.BackgroundTransparency = 0.5
                    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
                end
            end
            button.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
            button.BackgroundTransparency = 0.1
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        
        return button
    end
    
    return self
end

return Sidebar
