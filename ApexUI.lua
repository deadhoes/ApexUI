-- Modern UI Library for Roblox
-- Usage: local UI = loadstring(game:HttpGet("your-url"))()

local UI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Theme Configuration
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

-- Utility Functions
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

-- Window Component
function UI:Window(props)
    props = props or {}
    
    local window = Instance.new("Frame")
    window.Name = "Window"
    window.Size = props.size or UDim2.new(0, 400, 0, 300)
    window.Position = props.position or UDim2.new(0.5, -200, 0.5, -150)
    window.BackgroundColor3 = Theme.Surface
    window.BorderSizePixel = 0
    window.Parent = props.parent or game.Players.LocalPlayer.PlayerGui
    
    CreateCorner(window)
    CreateStroke(window)
    
    -- Title Bar
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 32)
    titleBar.BackgroundColor3 = Theme.Background
    titleBar.BorderSizePixel = 0
    titleBar.Parent = window
    
    CreateCorner(titleBar)
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -100, 1, 0)
    title.Position = UDim2.new(0, 40, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = props.title or "Window"
    title.TextColor3 = Theme.Text
    title.TextSize = 14
    title.Font = Enum.Font.Gotham
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = titleBar
    
    -- Icon
    if props.icon then
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 8, 0.5, -10)
        icon.BackgroundTransparency = 1
        icon.Image = props.icon
        icon.Parent = titleBar
    end
    
    -- Window Controls
    local controlsFrame = Instance.new("Frame")
    controlsFrame.Name = "Controls"
    controlsFrame.Size = UDim2.new(0, 90, 1, 0)
    controlsFrame.Position = UDim2.new(1, -90, 0, 0)
    controlsFrame.BackgroundTransparency = 1
    controlsFrame.Parent = titleBar
    
    -- Minimize Button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "Minimize"
    minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
    minimizeBtn.Position = UDim2.new(0, 2, 0.5, -14)
    minimizeBtn.BackgroundColor3 = Theme.Secondary
    minimizeBtn.Text = "−"
    minimizeBtn.TextColor3 = Theme.Text
    minimizeBtn.TextSize = 16
    minimizeBtn.Font = Enum.Font.Gotham
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Parent = controlsFrame
    
    CreateCorner(minimizeBtn, UDim.new(0, 4))
    
    -- Maximize Button
    local maximizeBtn = Instance.new("TextButton")
    maximizeBtn.Name = "Maximize"
    maximizeBtn.Size = UDim2.new(0, 28, 0, 28)
    maximizeBtn.Position = UDim2.new(0, 32, 0.5, -14)
    maximizeBtn.BackgroundColor3 = Theme.Secondary
    maximizeBtn.Text = "□"
    maximizeBtn.TextColor3 = Theme.Text
    maximizeBtn.TextSize = 14
    maximizeBtn.Font = Enum.Font.Gotham
    maximizeBtn.BorderSizePixel = 0
    maximizeBtn.Parent = controlsFrame
    
    CreateCorner(maximizeBtn, UDim.new(0, 4))
    
    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "Close"
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(0, 62, 0.5, -14)
    closeBtn.BackgroundColor3 = Theme.Error
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 16
    closeBtn.Font = Enum.Font.Gotham
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = controlsFrame
    
    CreateCorner(closeBtn, UDim.new(0, 4))
    
    -- Content Area
    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Size = UDim2.new(1, -16, 1, -48)
    content.Position = UDim2.new(0, 8, 0, 40)
    content.BackgroundTransparency = 1
    content.Parent = window
    
    -- Window Dragging
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Button Hover Effects
    for _, btn in pairs({minimizeBtn, maximizeBtn, closeBtn}) do
        btn.MouseEnter:Connect(function()
            CreateTween(btn, {BackgroundTransparency = 0.2}):Play()
        end)
        
        btn.MouseLeave:Connect(function()
            CreateTween(btn, {BackgroundTransparency = 0}):Play()
        end)
    end
    
    -- Button Functions
    closeBtn.MouseButton1Click:Connect(function()
        if props.onClose then
            props.onClose()
        else
            window:Destroy()
        end
    end)
    
    minimizeBtn.MouseButton1Click:Connect(function()
        local isMinimized = window.Size.Y.Offset <= 32
        if isMinimized then
            CreateTween(window, {Size = props.size or UDim2.new(0, 400, 0, 300)}):Play()
        else
            CreateTween(window, {Size = UDim2.new(window.Size.X.Scale, window.Size.X.Offset, 0, 32)}):Play()
        end
        if props.onMinimize then props.onMinimize(not isMinimized) end
    end)
    
    maximizeBtn.MouseButton1Click:Connect(function()
        if props.onMaximize then props.onMaximize() end
    end)
    
    -- Return window object with methods
    local windowObj = {
        Frame = window,
        Content = content,
        AddChild = function(self, child)
            if typeof(child) == "table" and child.Frame then
                child.Frame.Parent = content
            elseif typeof(child) == "Instance" then
                child.Parent = content
            end
        end
    }
    
    return windowObj
end

-- Button Component
function UI:Button(props)
    props = props or {}
    
    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Size = props.size or UDim2.new(0, 100, 0, 32)
    button.Position = props.position or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = props.color or Theme.Primary
    button.Text = props.text or "Button"
    button.TextColor3 = props.textColor or Color3.fromRGB(255, 255, 255)
    button.TextSize = props.textSize or 14
    button.Font = Enum.Font.Gotham
    button.BorderSizePixel = 0
    button.Parent = props.parent
    
    CreateCorner(button)
    
    -- Hover Effects
    button.MouseEnter:Connect(function()
        CreateTween(button, {BackgroundColor3 = button.BackgroundColor3:lerp(Color3.fromRGB(255, 255, 255), 0.1)}):Play()
        CreateTween(button, {Size = button.Size + UDim2.new(0, 2, 0, 2)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        CreateTween(button, {BackgroundColor3 = props.color or Theme.Primary}):Play()
        CreateTween(button, {Size = props.size or UDim2.new(0, 100, 0, 32)}):Play()
    end)
    
    -- Click Effect
    button.MouseButton1Down:Connect(function()
        CreateTween(button, {Size = (props.size or UDim2.new(0, 100, 0, 32)) - UDim2.new(0, 4, 0, 4)}):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        CreateTween(button, {Size = props.size or UDim2.new(0, 100, 0, 32)}):Play()
    end)
    
    if props.onClick then
        button.MouseButton1Click:Connect(props.onClick)
    end
    
    return {Frame = button}
end

-- Dropdown Component
function UI:Dropdown(props)
    props = props or {}
    
    local dropdown = Instance.new("Frame")
    dropdown.Name = "Dropdown"
    dropdown.Size = props.size or UDim2.new(0, 150, 0, 32)
    dropdown.Position = props.position or UDim2.new(0, 0, 0, 0)
    dropdown.BackgroundColor3 = Theme.Surface
    dropdown.BorderSizePixel = 0
    dropdown.Parent = props.parent
    
    CreateCorner(dropdown)
    CreateStroke(dropdown)
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = props.placeholder or "Select..."
    button.TextColor3 = Theme.Text
    button.TextSize = 14
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
    list.Name = "List"
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
            CreateTween(list, {Size = UDim2.new(1, 0, 0, #(props.options or {}) * 32)}):Play()
        else
            CreateTween(arrow, {Rotation = 0}):Play()
            CreateTween(list, {Size = UDim2.new(1, 0, 0, 0)}):Play()
        end
    end)
    
    if props.options then
        for i, option in ipairs(props.options) do
            local optionBtn = Instance.new("TextButton")
            optionBtn.Size = UDim2.new(1, 0, 0, 32)
            optionBtn.BackgroundTransparency = 1
            optionBtn.Text = option
            optionBtn.TextColor3 = Theme.Text
            optionBtn.TextSize = 14
            optionBtn.Font = Enum.Font.Gotham
            optionBtn.TextXAlignment = Enum.TextXAlignment.Left
            optionBtn.LayoutOrder = i
            optionBtn.Parent = list
            
            local optionPadding = Instance.new("UIPadding")
            optionPadding.PaddingLeft = UDim.new(0, 12)
            optionPadding.Parent = optionBtn
            
            optionBtn.MouseEnter:Connect(function()
                CreateTween(optionBtn, {BackgroundColor3 = Theme.Secondary, BackgroundTransparency = 0}):Play()
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
                
                if props.onSelect then
                    props.onSelect(option, i)
                end
            end)
        end
    end
    
    return {Frame = dropdown}
end

-- Toggle (Switch) Component
function UI:Toggle(props)
    props = props or {}
    
    local toggle = Instance.new("Frame")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0, 50, 0, 26)
    toggle.Position = props.position or UDim2.new(0, 0, 0, 0)
    toggle.BackgroundColor3 = Theme.Secondary
    toggle.BorderSizePixel = 0
    toggle.Parent = props.parent
    
    CreateCorner(toggle, UDim.new(0, 13))
    
    local thumb = Instance.new("Frame")
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 22, 0, 22)
    thumb.Position = UDim2.new(0, 2, 0.5, -11)
    thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    thumb.BorderSizePixel = 0
    thumb.Parent = toggle
    
    CreateCorner(thumb, UDim.new(0, 11))
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = toggle
    
    local isToggled = props.default or false
    
    local function updateToggle()
        if isToggled then
            CreateTween(thumb, {Position = UDim2.new(1, -24, 0.5, -11)}):Play()
            CreateTween(toggle, {BackgroundColor3 = Theme.Primary}):Play()
        else
            CreateTween(thumb, {Position = UDim2.new(0, 2, 0.5, -11)}):Play()
            CreateTween(toggle, {BackgroundColor3 = Theme.Secondary}):Play()
        end
    end
    
    updateToggle()
    
    button.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        updateToggle()
        
        if props.onToggle then
            props.onToggle(isToggled)
        end
    end)
    
    return {Frame = toggle, GetValue = function() return isToggled end}
end

-- Checkbox Component
function UI:Checkbox(props)
    props = props or {}
    
    local checkbox = Instance.new("Frame")
    checkbox.Name = "Checkbox"
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = props.position or UDim2.new(0, 0, 0, 0)
    checkbox.BackgroundColor3 = Theme.Surface
    checkbox.BorderSizePixel = 0
    checkbox.Parent = props.parent
    
    CreateCorner(checkbox, UDim.new(0, 4))
    CreateStroke(checkbox)
    
    local checkmark = Instance.new("TextLabel")
    checkmark.Size = UDim2.new(1, 0, 1, 0)
    checkmark.BackgroundTransparency = 1
    checkmark.Text = "✓"
    checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkmark.TextSize = 14
    checkmark.Font = Enum.Font.GothamBold
    checkmark.TextTransparency = 1
    checkmark.Parent = checkbox
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = ""
    button.Parent = checkbox
    
    local isChecked = props.default or false
    
    local function updateCheckbox()
        if isChecked then
            CreateTween(checkbox, {BackgroundColor3 = Theme.Primary}):Play()
            CreateTween(checkmark, {TextTransparency = 0}):Play()
        else
            CreateTween(checkbox, {BackgroundColor3 = Theme.Surface}):Play()
            CreateTween(checkmark, {TextTransparency = 1}):Play()
        end
    end
    
    updateCheckbox()
    
    button.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        updateCheckbox()
        
        if props.onChange then
            props.onChange(isChecked)
        end
    end)
    
    -- Add label if provided
    if props.label then
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 200, 0, 20)
        label.Position = UDim2.new(0, 25, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = props.label
        label.TextColor3 = Theme.Text
        label.TextSize = 14
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = props.parent
    end
    
    return {Frame = checkbox, GetValue = function() return isChecked end}
end

-- Slider Component
function UI:Slider(props)
    props = props or {}
    
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.Size = props.size or UDim2.new(0, 200, 0, 20)
    slider.Position = props.position or UDim2.new(0, 0, 0, 0)
    slider.BackgroundColor3 = Theme.Secondary
    slider.BorderSizePixel = 0
    slider.Parent = props.parent
    
    CreateCorner(slider, UDim.new(0, 10))
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = Theme.Primary
    fill.BorderSizePixel = 0
    fill.Parent = slider
    
    CreateCorner(fill, UDim.new(0, 10))
    
    local thumb = Instance.new("Frame")
    thumb.Name = "Thumb"
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
    
    local minValue = props.min or 0
    local maxValue = props.max or 100
    local currentValue = props.default or minValue
    local isDragging = false
    
    local function updateSlider(value)
        currentValue = math.clamp(value, minValue, maxValue)
        local percentage = (currentValue - minValue) / (maxValue - minValue)
        
        CreateTween(fill, {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
        CreateTween(thumb, {Position = UDim2.new(percentage, -8, 0.5, -8)}):Play()
        
        if props.onChange then
            props.onChange(currentValue)
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
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        CreateTween(thumb, {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(thumb.Position.X.Scale, -10, 0.5, -10)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        if not isDragging then
            CreateTween(thumb, {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(thumb.Position.X.Scale, -8, 0.5, -8)}):Play()
        end
    end)
    
    updateSlider(currentValue)
    
    return {Frame = slider, GetValue = function() return currentValue end, SetValue = updateSlider}
end

return UI
