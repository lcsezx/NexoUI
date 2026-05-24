-- Modules/Elements/Textbox.lua
local Textbox = {}

function Textbox.new(parent, text, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 35)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 100, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local textbox = Instance.new("TextBox", frame)
    textbox.Size = UDim2.new(0, 120, 0, 25)
    textbox.Position = UDim2.new(1, -125, 0.5, -12.5)
    textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    textbox.Text = ""
    textbox.PlaceholderText = "Digite..."
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.TextSize = 11
    Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 3)
    
    textbox.FocusLost:Connect(function()
        if callback and textbox.Text ~= "" then
            callback(textbox.Text)
            textbox.Text = ""
        end
    end)
    
    return frame
end

return Textbox
