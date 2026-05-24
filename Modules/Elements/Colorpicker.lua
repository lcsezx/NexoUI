-- Modules/Elements/ColorPicker.lua
local ColorPicker = {}

function ColorPicker.new(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 150, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextSize = 12
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local preview = Instance.new("Frame", frame)
    preview.Size = UDim2.new(0, 25, 0, 25)
    preview.Position = UDim2.new(1, -30, 0.5, -12.5)
    preview.BackgroundColor3 = default
    Instance.new("UICorner", preview).CornerRadius = UDim.new(0, 4)
    
    local r, g, b = default.R, default.G, default.B
    
    preview.MouseButton1Click:Connect(function()
        local colorFrame = Instance.new("Frame", frame)
        colorFrame.Size = UDim2.new(0, 150, 0, 100)
        colorFrame.Position = UDim2.new(1, -155, 0, 25)
        colorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        colorFrame.BorderSizePixel = 1
        colorFrame.BorderColor3 = Color3.fromRGB(0, 100, 150)
        Instance.new("UICorner", colorFrame).CornerRadius = UDim.new(0, 6)
        
        local rSlider = Instance.new("Frame", colorFrame)
        rSlider.Size = UDim2.new(0.8, 0, 0, 3)
        rSlider.Position = UDim2.new(0.1, 0, 0.2, 0)
        rSlider.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Instance.new("UICorner", rSlider).CornerRadius = UDim.new(0, 2)
        
        local gSlider = Instance.new("Frame", colorFrame)
        gSlider.Size = UDim2.new(0.8, 0, 0, 3)
        gSlider.Position = UDim2.new(0.1, 0, 0.4, 0)
        gSlider.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        Instance.new("UICorner", gSlider).CornerRadius = UDim.new(0, 2)
        
        local bSlider = Instance.new("Frame", colorFrame)
        bSlider.Size = UDim2.new(0.8, 0, 0, 3)
        bSlider.Position = UDim2.new(0.1, 0, 0.6, 0)
        bSlider.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
        Instance.new("UICorner", bSlider).CornerRadius = UDim.new(0, 2)
        
        local confirm = Instance.new("TextButton", colorFrame)
        confirm.Size = UDim2.new(0.8, 0, 0, 20)
        confirm.Position = UDim2.new(0.1, 0, 0.8, 0)
        confirm.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
        confirm.Text = "Confirmar"
        confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
        confirm.TextSize = 10
        Instance.new("UICorner", confirm).CornerRadius = UDim.new(0, 3)
        
        confirm.MouseButton1Click:Connect(function()
            local newColor = Color3.fromRGB(r * 255, g * 255, b * 255)
            preview.BackgroundColor3 = newColor
            if callback then callback(newColor) end
            colorFrame:Destroy()
        end)
        
        local dragging = false
        local currentSlider = nil
        
        local function updateSlider(slider, axis, input)
            local pos = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
            if axis == "R" then
                r = pos
                slider.Parent.Parent.BackgroundColor3 = Color3.fromRGB(r * 255, g * 255, b * 255)
            elseif axis == "G" then
                g = pos
                slider.Parent.Parent.BackgroundColor3 = Color3.fromRGB(r * 255, g * 255, b * 255)
            elseif axis == "B" then
                b = pos
                slider.Parent.Parent.BackgroundColor3 = Color3.fromRGB(r * 255, g * 255, b * 255)
            end
        end
        
        rSlider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                currentSlider = {slider = rSlider, axis = "R"}
                updateSlider(rSlider, "R", input)
            end
        end)
        
        gSlider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                currentSlider = {slider = gSlider, axis = "G"}
                updateSlider(gSlider, "G", input)
            end
        end)
        
        bSlider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                currentSlider = {slider = bSlider, axis = "B"}
                updateSlider(bSlider, "B", input)
            end
        end)
