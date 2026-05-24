-- Modules/Elements/Button.lua
local Button = {}

function Button.new(parent, text, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.BackgroundTransparency = 1
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 80, 120)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 12
    button.Font = Enum.Font.GothamBold
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)
    
    button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
    
    return frame
end

return Button
