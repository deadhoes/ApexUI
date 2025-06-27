# Themes Guide

## Default Theme

The library comes with a dark theme optimized for Roblox environments.

```lua
Theme = {
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
```

## Creating Custom Themes

### Purple Theme
```lua
local PurpleTheme = {
    Background = Color3.fromRGB(20, 15, 25),
    Surface = Color3.fromRGB(30, 25, 35),
    Primary = Color3.fromRGB(138, 43, 226),
    Secondary = Color3.fromRGB(40, 35, 45),
    Text = Color3.fromRGB(245, 245, 245),
    TextSecondary = Color3.fromRGB(170, 170, 180),
    Border = Color3.fromRGB(50, 45, 55),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 146, 60),
    Error = Color3.fromRGB(239, 68, 68)
}
```

### Green Theme
```lua
local GreenTheme = {
    Background = Color3.fromRGB(15, 25, 15),
    Surface = Color3.fromRGB(25, 35, 25),
    Primary = Color3.fromRGB(34, 197, 94),
    Secondary = Color3.fromRGB(35, 45, 35),
    Text = Color3.fromRGB(245, 255, 245),
    TextSecondary = Color3.fromRGB(170, 180, 170),
    Border = Color3.fromRGB(45, 55, 45),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 146, 60),
    Error = Color3.fromRGB(239, 68, 68)
}
```

### Red Theme
```lua
local RedTheme = {
    Background = Color3.fromRGB(25, 15, 15),
    Surface = Color3.fromRGB(35, 25, 25),
    Primary = Color3.fromRGB(239, 68, 68),
    Secondary = Color3.fromRGB(45, 35, 35),
    Text = Color3.fromRGB(255, 245, 245),
    TextSecondary = Color3.fromRGB(180, 170, 170),
    Border = Color3.fromRGB(55, 45, 45),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 146, 60),
    Error = Color3.fromRGB(239, 68, 68)
}
```

### Light Theme
```lua
local LightTheme = {
    Background = Color3.fromRGB(250, 250, 250),
    Surface = Color3.fromRGB(255, 255, 255),
    Primary = Color3.fromRGB(59, 130, 246),
    Secondary = Color3.fromRGB(240, 240, 240),
    Text = Color3.fromRGB(15, 15, 15),
    TextSecondary = Color3.fromRGB(100, 100, 100),
    Border = Color3.fromRGB(220, 220, 220),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 146, 60),
    Error = Color3.fromRGB(239, 68, 68)
}
```

## Applying Custom Themes

### Method 1: Direct Modification
```lua
local UI = loadstring(game:HttpGet("your-url"))()

for key, value in pairs(PurpleTheme) do
    if Theme[key] then
        Theme[key] = value
    end
end

local Window = UI:CreateWindow({Name = "Purple UI"})
```

### Method 2: Theme Function
```lua
local function ApplyTheme(customTheme)
    for key, value in pairs(customTheme) do
        Theme[key] = value
    end
end

ApplyTheme(GreenTheme)
local Window = UI:CreateWindow({Name = "Green UI"})
```

### Method 3: Runtime Theme Switching
```lua
local themes = {
    Default = DefaultTheme,
    Purple = PurpleTheme,
    Green = GreenTheme,
    Red = RedTheme,
    Light = LightTheme
}

local function SwitchTheme(themeName)
    local selectedTheme = themes[themeName]
    if selectedTheme then
        ApplyTheme(selectedTheme)
        UI:Notify({
            Title = "Theme Changed",
            Content = "Switched to " .. themeName .. " theme",
            Duration = 2
        })
    end
end
```

## Animation Customization

### Fast Animations
```lua
Theme.Animation = {
    Duration = 0.1,
    Style = Enum.EasingStyle.Linear,
    Direction = Enum.EasingDirection.Out
}
```

### Slow Animations
```lua
Theme.Animation = {
    Duration = 0.5,
    Style = Enum.EasingStyle.Sine,
    Direction = Enum.EasingDirection.InOut
}
```

### Bouncy Animations
```lua
Theme.Animation = {
    Duration = 0.3,
    Style = Enum.EasingStyle.Back,
    Direction = Enum.EasingDirection.Out
}
```

### Elastic Animations
```lua
Theme.Animation = {
    Duration = 0.4,
    Style = Enum.EasingStyle.Elastic,
    Direction = Enum.EasingDirection.Out
}
```

## Corner Radius Styles

### Sharp Corners
```lua
Theme.CornerRadius = UDim.new(0, 0)
```

### Rounded Corners
```lua
Theme.CornerRadius = UDim.new(0, 12)
```

### Very Rounded
```lua
Theme.CornerRadius = UDim.new(0, 20)
```

## Color Schemes

### Monochrome
```lua
local MonochromeTheme = {
    Background = Color3.fromRGB(20, 20, 20),
    Surface = Color3.fromRGB(40, 40, 40),
    Primary = Color3.fromRGB(255, 255, 255),
    Secondary = Color3.fromRGB(60, 60, 60),
    Text = Color3.fromRGB(255, 255, 255),
    TextSecondary = Color3.fromRGB(180, 180, 180),
    Border = Color3.fromRGB(80, 80, 80)
}
```

### Ocean Theme
```lua
local OceanTheme = {
    Background = Color3.fromRGB(15, 25, 35),
    Surface = Color3.fromRGB(25, 35, 45),
    Primary = Color3.fromRGB(59, 130, 246),
    Secondary = Color3.fromRGB(35, 45, 55),
    Text = Color3.fromRGB(240, 250, 255),
    TextSecondary = Color3.fromRGB(160, 180, 200),
    Border = Color3.fromRGB(45, 55, 65)
}
```

### Sunset Theme
```lua
local SunsetTheme = {
    Background = Color3.fromRGB(35, 20, 15),
    Surface = Color3.fromRGB(45, 30, 25),
    Primary = Color3.fromRGB(251, 146, 60),
    Secondary = Color3.fromRGB(55, 40, 35),
    Text = Color3.fromRGB(255, 240, 230),
    TextSecondary = Color3.fromRGB(200, 170, 150),
    Border = Color3.fromRGB(65, 50, 45)
}
```

## Theme Presets

### Gaming Theme
```lua
local GamingTheme = {
    Background = Color3.fromRGB(10, 10, 15),
    Surface = Color3.fromRGB(20, 20, 25),
    Primary = Color3.fromRGB(0, 255, 127),
    Secondary = Color3.fromRGB(
