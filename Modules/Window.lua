local Window = {}

function Window.new(data, screenGui, Modules)
    local self = {}
    
    data = data or {}
    
    self.width = data.Size and data.Size.Width or 600
    self.height = data.Size and data.Size.Height or 350
    self.title = data.Title or "Nexo UI"
    self.draggable = data.Draggable == nil and true or data.Draggable
    self.minimizable = data.Minimizable == nil and true or data.Minimizable
    self.closable = data.Closable == nil and true or data.Closable
    self.theme = data.Theme or "Dark"
    self.themeData = Modules.Theme.Get(self.theme)
    
    self.tabs = {}
    self.currentTab = nil
    self.minimized = false
    self.visible = true
    
    -- MAIN FRAME
    self.frame = Instance.new("Frame")
    self.frame.Name = "MainWindow"
    self.frame.Size = UDim2.new(0, self.width, 0, self.height)
    self.frame.Position = UDim2.new(0.5, -self.width/2, 0.5, -self.height/2)
    self.frame.BackgroundColor3 = self.themeData.WindowBg
    self.frame.BackgroundTransparency = 0.05
    self.frame.BorderSizePixel = 1
    self.frame.BorderColor3 = self.themeData.Border
    self.frame.Visible = true
    self.frame.Active = self.draggable
    self.frame.Parent = screenGui
    Modules.Tween.Apply(self.frame, {BackgroundTransparency = 0.05}, 0.3)
    
    Instance.new("UICorner", self.frame).CornerRadius = UDim.new(0, 10)
    
    -- TITLE BAR
    self.titleBar = Instance.new("Frame")
    self.titleBar.Name = "TitleBar"
    self.titleBar.Size = UDim2.new(1, 0, 0, 35)
    self.titleBar.BackgroundColor3 = self.themeData.TitleBg
    self.titleBar.BorderSizePixel = 0
    self.titleBar.Parent = self.frame
    Instance.new("UICorner", self.titleBar).CornerRadius = UDim.new(0, 10)
    
    self.titleText = Instance.new("TextLabel")
    self.titleText.Size = UDim2.new(0, 200, 1, 0)
    self.titleText.Position = UDim2.new(0, 15, 0, 0)
    self.titleText.BackgroundTransparency = 1
    self.titleText.Text = self.title
    self.titleText.TextColor3 = self.themeData.Accent
    self.titleText.TextSize = 16
    self.titleText.Font = Enum.Font.GothamBlack
    self.titleText.TextXAlignment = Enum.TextXAlignment.Left
    self.titleText.Parent = self.titleBar
    
    -- MINIMIZE BUTTON
    if self.minimizable then
        self.miniButton = Instance.new("TextButton")
        self.miniButton.Size = UDim2.new(0, 30, 0, 30)
        self.miniButton.Position = UDim2.new(1, -70, 0, 2.5)
        self.miniButton.BackgroundColor3 = self.themeData.ButtonBg
        self.miniButton.Text = "-"
        self.miniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        self.miniButton.TextSize = 18
        self.miniButton.Font = Enum.Font.GothamBold
        self.miniButton.Parent = self.titleBar
        Instance.new("UICorner", self.miniButton).CornerRadius = UDim.new(0, 6)
        
        self.miniButton.MouseButton1Click:Connect(function()
            self:ToggleMinimize()
        end)
    end
    
    -- CLOSE BUTTON
    if self.closable then
        self.closeButton = Instance.new("TextButton")
        self.closeButton.Size = UDim2.new(0, 30, 0, 30)
        self.closeButton.Position = UDim2.new(1, -35, 0, 2.5)
        self.closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        self.closeButton.Text = "X"
        self.closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        self.closeButton.TextSize = 16
        self.closeButton.Font = Enum.Font.GothamBold
        self.closeButton.Parent = self.titleBar
        Instance.new("UICorner", self.closeButton).CornerRadius = UDim.new(0, 6)
        
        self.closeButton.MouseButton1Click:Connect(function()
            self:ToggleVisible()
        end)
    end
    
    -- DRAG FUNCTION
    if self.draggable then
        local dragging = false
        local dragStart = nil
        local startPos = nil
        
        self.titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = self.frame.Position
            end
        end)
        
        self.titleBar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                self.frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end
    
    -- SIDEBAR
    self.sidebar = Instance.new("Frame")
    self.sidebar.Name = "Sidebar"
    self.sidebar.Size = UDim2.new(0, 120, 1, -35)
    self.sidebar.Position = UDim2.new(0, 0, 0, 35)
    self.sidebar.BackgroundColor3 = self.themeData.SidebarBg
    self.sidebar.BorderSizePixel = 0
    self.sidebar.Parent = self.frame
    
    self.tabsContainer = Instance.new("ScrollingFrame")
    self.tabsContainer.Size = UDim2.new(1, -10, 1, -10)
    self.tabsContainer.Position = UDim2.new(0, 5, 0, 5)
    self.tabsContainer.BackgroundTransparency = 1
    self.tabsContainer.BorderSizePixel = 0
    self.tabsContainer.ScrollBarThickness = 2
    self.tabsContainer.Parent = self.sidebar
    
    self.tabsLayout = Instance.new("UIListLayout")
    self.tabsLayout.Padding = UDim.new(0, 4)
    self.tabsLayout.Parent = self.tabsContainer
    
    -- CONTENT AREA
    self.contentArea = Instance.new("Frame")
    self.contentArea.Size = UDim2.new(1, -130, 1, -45)
    self.contentArea.Position = UDim2.new(0, 125, 0, 40)
    self.contentArea.BackgroundTransparency = 1
    self.contentArea.Parent = self.frame
    
    self.contentContainer = Instance.new("Frame")
    self.contentContainer.Size = UDim2.new(1, 0, 1, 0)
    self.contentContainer.BackgroundTransparency = 1
    self.contentContainer.Parent = self.contentArea
    
    self:CreateFloatingIcon()
    
    function self:CreateTab(name)
        local tab = Modules.Tab.new(name, self, Modules)
        table.insert(self.tabs, tab)
        
        if not self.currentTab then
            self:SelectTab(tab)
        end
        
        return tab
    end
    
    function self:SelectTab(tab)
        if self.currentTab then
            self.currentTab:Hide()
        end
        self.currentTab = tab
        tab:Show()
    end
    
    function self:ToggleMinimize()
        self.minimized = not self.minimized
        if self.minimized then
            Modules.Tween.Apply(self.frame, {Size = UDim2.new(0, 150, 0, 40)}, 0.3)
            self.sidebar.Visible = false
            self.contentArea.Visible = false
            self.titleText.Text = self.title:sub(1, 3)
            Modules.Tween.Apply(self.frame, {BackgroundTransparency = 0.5}, 0.3)
        else
            Modules.Tween.Apply(self.frame, {Size = UDim2.new(0, self.width, 0, self.height)}, 0.3)
            self.sidebar.Visible = true
            self.contentArea.Visible = true
            self.titleText.Text = self.title
            Modules.Tween.Apply(self.frame, {BackgroundTransparency = 0.05}, 0.3)
        end
    end
    
    function self:ToggleVisible()
        self.visible = not self.visible
        Modules.Tween.Apply(self.frame, {BackgroundTransparency = self.visible and 0.05 or 1}, 0.3)
        task.wait(0.15)
        self.frame.Visible = self.visible
    end
    
    function self:CreateFloatingIcon()
        self.floatingIcon = Instance.new("TextButton")
        self.floatingIcon.Size = UDim2.new(0, 40, 0, 40)
        self.floatingIcon.Position = UDim2.new(0, 10, 0, 70)
        self.floatingIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        self.floatingIcon.BackgroundTransparency = 0
        self.floatingIcon.BorderSizePixel = 0
        self.floatingIcon.Text = "🎭"
        self.floatingIcon.TextColor3 = self.themeData.Accent
        self.floatingIcon.TextSize = 24
        self.floatingIcon.Font = Enum.Font.GothamBlack
        self.floatingIcon.Visible = false
        self.floatingIcon.Parent = screenGui
        Instance.new("UICorner", self.floatingIcon).CornerRadius = UDim.new(0, 8)
        
        self.floatingIcon.MouseButton1Click:Connect(function()
            self.frame.Visible = true
            self.floatingIcon.Visible = false
            Modules.Tween.Apply(self.frame, {BackgroundTransparency = 0.05}, 0.3)
        end)
    end
    
    return self
end

return Window
