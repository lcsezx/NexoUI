-- Modules/Section.lua
local Section = {}

function Section.new(name, parent, Modules)
    local self = {}
    
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = Color3.fromRGB(0, 150, 255)
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local line = Instance.new("Frame", frame)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 25)
    line.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
    line.BackgroundTransparency = 0.5
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(1, -20, 0, 0)
    container.BackgroundTransparency = 1
    
    local layout = Instance.new("UIListLayout", container)
    layout.Padding = UDim.new(0, 6)
    
    local elements = {}
    
    function self:UpdateHeight()
        local height = 0
        for _, child in pairs(container:GetChildren()) do
            if child:IsA("Frame") then
                height = height + child.Size.Y.Offset + 6
            end
        end
        container.Size = UDim2.new(1, -20, 0, height)
        frame.Size = UDim2.new(1, -20, 0, 30 + height)
    end
    
    function self:Toggle(text, default, callback)
        local element = Modules.Elements.Toggle.new(container, text, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Checkbox(text, default, callback)
        local element = Modules.Elements.Checkbox.new(container, text, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Slider(text, min, max, default, callback)
        local element = Modules.Elements.Slider.new(container, text, min, max, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Button(text, callback)
        local element = Modules.Elements.Button.new(container, text, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Dropdown(text, options, default, callback)
        local element = Modules.Elements.Dropdown.new(container, text, options, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:ColorPicker(text, default, callback)
        local element = Modules.Elements.ColorPicker.new(container, text, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Keybind(text, default, callback)
        local element = Modules.Elements.Keybind.new(container, text, default, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Label(text)
        local element = Modules.Elements.Label.new(container, text)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    function self:Textbox(text, callback)
        local element = Modules.Elements.Textbox.new(container, text, callback)
        table.insert(elements, element)
        self:UpdateHeight()
        return element
    end
    
    return self
end

return Section
