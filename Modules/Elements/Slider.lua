-- Modules/Elements/Slider.lua
local Slider = {}

function Slider.new(parent, text, min, max, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. tostring(default)
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 11
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(1, -10, 0, 4)
    bar.Position = UDim2.new(0, 5, 0, 28)
    bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 2)
    
    local fill = Instance.new("Frame", bar)
    local percent = (default - min) / (max - min)
    fill.Size = UDim2.new(percent, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 2)
    
    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.new(0, 10, 0, 10)
    knob.Position = UDim2.new(percent, -5, 0.5, -5)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0.5, 0)
    
    local dragging = false
    local currentValue = default
    
    local function update(input)
        local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + (max - min) * pos)
        currentValue = newValue
        fill.Size = UDim2.new(pos, 0, 1, 0)
        knob.Position = UDim2.new(pos, -5, 0.5, -5)
        label.Text = text .. ": " .. tostring(newValue)
        if callback then callback(newValue) end
    end
    
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            update(input)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return frame
end

return Slider
