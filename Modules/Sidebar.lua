local Sidebar = {}

function Sidebar.new(parent, modules)
    local self = {}
    
    self.frame = Instance.new("Frame")
    self.frame.Size = UDim2.new(0, 120, 1, 0)
    self.frame.BackgroundColor3 = Color3.fromRGB(5, 10, 15)
    self.frame.BorderSizePixel = 0
    self.frame.Parent = parent
    
    self.tabsContainer = Instance.new("ScrollingFrame")
    self.tabsContainer.Size = UDim2.new(1, -10, 1, -10)
    self.tasks
