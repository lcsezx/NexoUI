-- Modules/Elements/Dropdown.lua
local Dropdown = {}

function Dropdown.new(parent, text, options, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 100, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local currentIndex = 1
    for i, opt in ipairs(options) do
        if opt == default then currentIndex = i end
    end
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 120, 0, 25)
    button.Position = UDim2.new(1, -125, 0.5, -12.5)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    button.Text = options[currentIndex]
    button.TextColor3 = Color3.fromRGB(0, 150, 200)
    button.TextSize = 11
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 3)
    
    button.MouseButton1Click:Connect(function()
        currentIndex = currentIndex + 1
        if currentIndex > #options then currentIndex = 1 end
        button.Text = options[currentIndex]
        if callback then callback(options[currentIndex]) end
    end)
    
    return frame
end

return Dropdown
