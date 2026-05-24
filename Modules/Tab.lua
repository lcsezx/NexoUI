-- Modules/Tab.lua
local Tab = {}

function Tab.new(name, tabsContainer, contentArea, Modules)
    local self = {}
    
    local button = Instance.new("TextButton", tabsContainer)
    button.Size = UDim2.new(1, 0, 0, 35)
    button.BackgroundColor3 = Color3.fromRGB(15, 20, 25)
    button.BackgroundTransparency = 0.5
    button.Text = name
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.TextSize = 12
    button.Font = Enum.Font.Gotham
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    
    local content = Instance.new("ScrollingFrame", contentArea)
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.Visible = false
    
    local layout = Instance.new("UIListLayout", content)
    layout.Padding = UDim.new(0, 8)
    
    local sections = {}
    
    function self:Select()
        content.Visible = true
        for _, otherContent in pairs(contentArea:GetChildren()) do
            if otherContent ~= content and otherContent:IsA("ScrollingFrame") then
                otherContent.Visible = false
            end
        end
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
    
    function self:CreateSection(name)
        local section = Modules.Section.new(name, content, Modules)
        table.insert(sections, section)
        return section
    end
    
    button.MouseButton1Click:Connect(function()
        self:Select()
    end)
    
    return self
end

return Tab
