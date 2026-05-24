-- Modules/Elements/Checkbox.lua
local Checkbox = {}

function Checkbox.new(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 180, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 18, 0, 18)
    button.Position = UDim2.new(1, -22, 0.5, -9)
    button.BackgroundColor3 = default and Color3.fromRGB(0, 150, 200) or Color3.fromRGB(50, 50, 50)
    button.Text = default and "✓" or ""
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 12
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 3)
    
    local state = default
    
    button.MouseButton1Click:Connect(function()
        state = not state
        button.BackgroundColor3 = state and Color3.fromRGB(0, 150, 200) or Color3.fromRGB(50, 50, 50)
        button.Text = state and "✓" or ""
        if callback then callback(state) end
    end)
    
    return frame
end

return Checkbox
