local UI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Theme = {
    Background = Color3.fromRGB(25, 25, 25),
    Surface = Color3.fromRGB(35, 35, 35),
    Primary = Color3.fromRGB(64, 156, 255),
    Secondary = Color3.fromRGB(45, 45, 45),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 180),
    Border = Color3.fromRGB(55, 55, 55),
    Success = Color3.fromRGB(76, 175, 80),
    Warning = Color3.fromRGB(255, 152, 0),
    Error = Color3.fromRGB(244, 67, 54),
    CornerRadius = UDim.new(0, 8),
    Animation = {
        Duration = 0.2,
        Style = Enum.EasingStyle.Quart,
        Direction = Enum.EasingDirection.Out
    }
}

local function CreateTween(object, properties, duration)
    duration = duration or Theme.Animation.Duration
    local info = TweenInfo.new(duration, Theme.Animation.Style, Theme.Animation.Direction)
    return TweenService:Create(object, info, properties)
end

local function CreateCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or Theme.CornerRadius
    corner.Parent = parent
    return corner
end

local function CreateStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Theme.Border
    stroke.Thickness = thickness or 1
    stroke.Parent = parent
    return stroke
end

function UI:CreateWindow(props)
    props = props or {}
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = props.Name or "UILibrary"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    mainFrame.BackgroundColor3 = Theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    CreateCorner(mainFrame)
    CreateStroke(mainFrame)
    
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Theme.Surface
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    CreateCorner(titleBar)
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -80, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = props.Name or "UI Library"
    title.TextColor3 = Theme.Text
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
    closeBtn.BackgroundColor3 = Theme.Error
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = titleBar
    
    CreateCorner(closeBtn, UDim.new(0, 4))
    
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(0, 120, 1, -40)
    tabContainer.Position = UDim2.new(0, 0, 0, 40)
    tabContainer.BackgroundColor3 = Theme.Surface
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = mainFrame
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 2)
    tabLayout.Parent = tabContainer
    
    local tabPadding = Instance.new("UIPadding")
    tabPadding.PaddingTop = UDim.new(0, 5)
    tabPadding.PaddingLeft = UDim.new(0, 5)
    tabPadding.PaddingRight = UDim.new(0, 5)
    tabPadding.Parent = tabContainer
    
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -120, 1, -40)
    contentContainer.Position = UDim2.new(0, 120, 0, 40)
    contentContainer.BackgroundTransparency = 1
    contentContainer.Parent = mainFrame
    
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
    
    local windowObj = {
        ScreenGui = screenGui,
        MainFrame = mainFrame,
        TabContainer = tabContainer,
        ContentContainer = contentContainer,
        CurrentTab = nil,
        Tabs = {}
    }
    
    function windowObj:CreateTab(name, image)
        local tabButton = Instance.new("TextButton")
        tabButton.Name = name
        tabButton.Size = UDim2.new(1, 0, 0, 35)
        tabButton.BackgroundColor3 = Theme.Secondary
        tabButton.Text = name
        tabButton.TextColor3 = Theme.TextSecondary
        tabButton.TextSize = 12
        tabButton.Font = Enum.Font.Gotham
        tabButton.BorderSizePixel = 0
        tabButton.Parent = self.TabContainer
        
        CreateCorner(tabButton, UDim.new(0, 6))
        
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = name .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.ScrollBarThickness = 4
        tabContent.ScrollBarImageColor3 = Theme.Primary
        tabContent.Visible = false
        tabContent.Parent = self.ContentContainer
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 5)
        contentLayout.Parent = tabContent
        
        local contentPadding = Instance.new("UIPadding")
        contentPadding.PaddingAll = UDim.new(0, 10)
        contentPadding.Parent = tabContent
        
        tabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(self.Tabs) do
                tab.Content.Visible = false
                tab.Button.BackgroundColor3 = Theme.Secondary
                tab.Button.TextColor3 = Theme.TextSecondary
            end
            
            tabContent.Visible = true
            tabButton.BackgroundColor3 = Theme.Primary
            tabButton.TextColor3 = Theme.Text
            self.CurrentTab = name
        end)
        
        local tabObj = {
            Button = tabButton,
            Content = tabContent,
            Name = name
        }
        
        function tabObj:CreateSection(name)
            local sectionLabel = Instance.new("TextLabel")
            sectionLabel.Name = name
            sectionLabel.Size = UDim2.new(1, 0, 0, 25)
            sectionLabel.BackgroundTransparency = 1
            sectionLabel.Text = name
            sectionLabel.TextColor3 = Theme.Text
            sectionLabel.TextSize = 14
            sectionLabel.Font = Enum.Font.GothamBold
            sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            sectionLabel.Parent = self.Content
            
            return sectionLabel
        end
        
        function tabObj:CreateButton(props)
            local buttonFrame = Instance.new("Frame")
            buttonFrame.Size = UDim2.new(1, 0, 0, 35)
            buttonFrame.BackgroundTransparency = 1
            buttonFrame.Parent = self.Content
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundColor3 = Theme.Surface
            button.Text = props.Name or "Button"
            button.TextColor3 = Theme.Text
            button.TextSize = 12
            button.Font = Enum.Font.Gotham
            button.BorderSizePixel = 0
            button.Parent = buttonFrame
            
            CreateCorner(button)
            
            button.MouseEnter:Connect(function()
                CreateTween(button, {BackgroundColor3 = Theme.Primary}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                CreateTween(button, {BackgroundColor3 = Theme.Surface}):Play()
            end)
            
            if props.Callback then
                button.MouseButton1Click:Connect(props.Callback)
            end
            
            return button
        end
        
        function tabObj:CreateSlider(props)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 50)
            sliderFrame.BackgroundTransparency = 1
            sliderFrame.Parent = self.Content
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0, 20)
            label.BackgroundTransparency = 1
            label.Text = props.Name or "Slider"
            label.TextColor3 = Theme.Text
            label.TextSize = 12
            label.Font = Enum.Font.Gotham
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = sliderFrame
            
            local slider = Instance.new("Frame")
            slider.Size = UDim2.new(1, 0, 0, 20)
            slider.Position = UDim2.new(0, 0, 0, 25)
            slider.BackgroundColor3 = Theme.Secondary
            slider.BorderSizePixel = 0
            slider.Parent = sliderFrame
            
            CreateCorner(slider, UDim.new(0, 10))
            
            local fill = Instance.new("Frame")
            fill.Size = UDim2.new(0.5, 0, 1, 0)
            fill.BackgroundColor3 = Theme.Primary
            fill.BorderSizePixel = 0
            fill.Parent = slider
            
            CreateCorner(fill, UDim.new(0, 10))
            
            local thumb = Instance.new("Frame")
            thumb.Size = UDim2.new(0, 16, 0, 16)
            thumb.Position = UDim2.new(0.5, -8, 0.5, -8)
            thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            thumb.BorderSizePixel = 0
            thumb.Parent = slider
            
            CreateCorner(thumb, UDim.new(0, 8))
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundTransparency = 1
            button.Text = ""
            button.Parent = slider
            
            local minValue = props.Range[1] or 0
            local maxValue = props.Range[2] or 100
            local currentValue = props.CurrentValue or minValue
            local isDragging = false
            
            local function updateSlider(value)
                currentValue = math.clamp(value, minValue, maxValue)
                local percentage = (currentValue - minValue) / (maxValue - minValue)
                
                CreateTween(fill, {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
                CreateTween(thumb, {Position = UDim2.new(percentage, -8, 0.5, -8)}):Play()
                
                label.Text = (props.Name or "Slider") .. ": " .. math.floor(currentValue) .. (props.Suffix or "")
                
                if props.Callback then
                    props.Callback(currentValue)
                end
            end
            
            local function getValueFromPosition(x)
                local percentage = math.clamp((x - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                return minValue + (maxValue - minValue) * percentage
            end
            
            button.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isDragging = true
                    updateSlider(getValueFromPosition(input.Position.X))
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(getValueFromPosition(input.Position.X))
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isDragging = false
                end
            end)
            
            updateSlider(currentValue)
            
            return {
                GetValue = function() return currentValue end,
                SetValue = updateSlider
            }
        end
        
        function tabObj:CreateDropdown(props)
            local dropdownFrame = Instance.new("Frame")
            dropdownFrame.Size = UDim2.new(1, 0, 0, 35)
            dropdownFrame.BackgroundTransparency = 1
            dropdownFrame.Parent = self.Content
            
            local dropdown = Instance.new("Frame")
            dropdown.Size = UDim2.new(1, 0, 1, 0)
            dropdown.BackgroundColor3 = Theme.Surface
            dropdown.BorderSizePixel = 0
            dropdown.Parent = dropdownFrame
            
            CreateCorner(dropdown)
            
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 1, 0)
            button.BackgroundTransparency = 1
            button.Text = props.CurrentOption[1] or "Select..."
            button.TextColor3 = Theme.Text
            button.TextSize = 12
            button.Font = Enum.Font.Gotham
            button.TextXAlignment = Enum.TextXAlignment.Left
            button.Parent = dropdown
            
            local padding = Instance.new("UIPadding")
            padding.PaddingLeft = UDim.new(0, 12)
            padding.PaddingRight = UDim.new(0, 12)
            padding.Parent = button
            
            local arrow = Instance.new("TextLabel")
            arrow.Size = UDim2.new(0, 20, 1, 0)
            arrow.Position = UDim2.new(1, -20, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Text = "▼"
            arrow.TextColor3 = Theme.TextSecondary
            arrow.TextSize = 10
            arrow.Font = Enum.Font.Gotham
            arrow.Parent = dropdown
            
            local list = Instance.new("Frame")
            list.Size = UDim2.new(1, 0, 0, 0)
            list.Position = UDim2.new(0, 0, 1, 2)
            list.BackgroundColor3 = Theme.Surface
            list.BorderSizePixel = 0
            list.Visible = false
            list.Parent = dropdown
            
            CreateCorner(list)
            CreateStroke(list)
            
            local listLayout = Instance.new("UIListLayout")
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Parent = list
            
            local isOpen = false
            
            button.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                list.Visible = isOpen
                
                if isOpen then
                    CreateTween(arrow, {Rotation = 180}):Play()
                    CreateTween(list, {Size = UDim2.new(1, 0, 0, #(props.Options or {}) * 30)}):Play()
                    CreateTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 35 + #(props.Options or {}) * 30)}):Play()
                else
                    CreateTween(arrow, {Rotation = 0}):Play()
                    CreateTween(list, {Size = UDim2.new(1, 0, 0, 0)}):Play()
                    CreateTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 35)}):Play()
                end
            end)
            
            if props.Options then
                for i, option in ipairs(props.Options) do
                    local optionBtn = Instance.new("TextButton")
                    optionBtn.Size = UDim2.new(1, 0, 0, 30)
                    optionBtn.BackgroundTransparency = 1
                    optionBtn.Text = option
                    optionBtn.TextColor3 = Theme.Text
                    optionBtn.TextSize = 12
                    optionBtn.Font = Enum.Font.Gotham
                    optionBtn.TextXAlignment = Enum.TextXAlignment.Left
                    optionBtn.LayoutOrder = i
                    optionBtn.Parent = list
                    
                    local optionPadding = Instance.new("UIPadding")
                    optionPadding.PaddingLeft = UDim.new(0, 12)
                    optionPadding.Parent = optionBtn
                    
                    optionBtn.MouseEnter:Connect(function()
                        CreateTween(optionBtn, {BackgroundColor3 = Theme.Primary, BackgroundTransparency = 0}):Play()
                    end)
                    
                    optionBtn.MouseLeave:Connect(function()
                        CreateTween(optionBtn, {BackgroundTransparency = 1}):Play()
                    end)
                    
                    optionBtn.MouseButton1Click:Connect(function()
                        button.Text = option
                        isOpen = false
                        list.Visible = false
                        CreateTween(arrow, {Rotation = 0}):Play()
                        CreateTween(list, {Size = UDim2.new(1, 0, 0, 0)}):Play()
                        CreateTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 35)}):Play()
                        
                        if props.Callback then
                            props.Callback(option)
                        end
                    end)
                end
            end
            
            return dropdown
        end
        
        self.Tabs[name] = tabObj
        
        if not self.CurrentTab then
            tabButton.MouseButton1Click:Fire()
        end
        
        return tabObj
    end
    
    return windowObj
end

function UI:Notify(props)
    props = props or {}
    
    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 80)
    notification.Position = UDim2.new(1, -320, 0, 20)
    notification.BackgroundColor3 = Theme.Surface
    notification.BorderSizePixel = 0
    notification.Parent = CoreGui
    
    CreateCorner(notification)
    CreateStroke(notification)
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 25)
    title.Position = UDim2.new(0, 10, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = props.Title or "Notification"
    title.TextColor3 = Theme.Text
    title.TextSize = 14
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = notification
    
    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, -20, 0, 40)
    content.Position = UDim2.new(0, 10, 0, 25)
    content.BackgroundTransparency = 1
    content.Text = props.Content or ""
    content.TextColor3 = Theme.TextSecondary
    content.TextSize = 12
    content.Font = Enum.Font.Gotham
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.TextWrapped = true
    content.Parent = notification
    
    CreateTween(notification, {Position = UDim2.new(1, -320, 0, 20)}):Play()
    
    wait(props.Duration or 5)
    CreateTween(notification, {Position = UDim2.new(1, 0, 0, 20)}):Play()
    wait(0.3)
    notification:Destroy()
end

return UI
