-- Modules/Elements/Keybind.lua
local Keybind = {}

function Keybind.new(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 150, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 80, 0, 25)
    button.Position = UDim2.new(1, -85, 0.5, -12.5)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    button.Text = default
    button.TextColor3 = Color3.fromRGB(0, 150, 200)
    button.TextSize = 11
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 3)
    
    local waiting = false
    
    button.MouseButton1Click:Connect(function()
        waiting = true
        button.Text = "..."
        button.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
        
        local inputBegan
        inputBegan = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if waiting and input.KeyCode ~= Enum.KeyCode.Unknown then
                waiting = false
                local key = input.KeyCode.Name
                button.Text = key
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                if callback then callback(key) end
                inputBegan:Disconnect()
            end
        end)
        
        task.wait(3)
        if waiting then
            waiting = false
            button.Text = default
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            inputBegan:Disconnect()
        end
    end)
    
    return frame
end

return Keybind
