# Components Guide

## Overview

This UI library provides several components for creating modern Roblox interfaces. Each component is designed with smooth animations and a consistent theme.

## Window

The main container for your UI. All other components must be inside a window.

```lua
local Window = UI:CreateWindow({
    Name = "Window Title"
})
```

**Features:**
- Draggable title bar
- Close button
- Tab system
- Automatic centering
- Smooth animations

## Tabs

Organize your UI into different sections using tabs.

```lua
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")
```

**Features:**
- Automatic tab switching
- Smooth selection animation
- Scrollable content area
- Color-coded selection

## Sections

Group related components together with section headers.

```lua
MainTab:CreateSection("Player Controls")
MainTab:CreateSection("Game Settings")
```

**Features:**
- Bold text styling
- Automatic spacing
- Visual separation

## Buttons

Interactive buttons for triggering actions.

```lua
MainTab:CreateButton({
    Name = "Execute Action",
    Callback = function()
        -- Your code here
    end
})
```

**Features:**
- Hover effects
- Click animations
- Custom callback functions
- Rounded corners

## Sliders

Numeric input with visual feedback.

```lua
MainTab:CreateSlider({
    Name = "Player Speed",
    Range = {16, 100},
    CurrentValue = 16,
    Suffix = " Studs/s",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
```

**Features:**
- Smooth dragging
- Real-time value updates
- Custom value ranges
- Optional suffix text
- Visual fill animation

**Methods:**
- `GetValue()` - Returns current value
- `SetValue(number)` - Sets new value

## Dropdowns

Selection menus with multiple options.

```lua
MainTab:CreateDropdown({
    CurrentOption = {"Default"},
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(selected)
        print("Selected:", selected)
    end
})
```

**Features:**
- Smooth expand/collapse
- Hover effects on options
- Auto-close after selection
- Customizable option list

## Notifications

Temporary popup messages.

```lua
UI:Notify({
    Title = "Success",
    Content = "Operation completed successfully!",
    Duration = 3
})
```

**Features:**
- Slide-in animation
- Auto-dismiss timer
- Customizable duration
- Non-blocking display

## Component Styling

All components follow the same design principles:

### Colors
- Background: Dark theme base
- Surface: Elevated elements
- Primary: Interactive elements
- Text: High contrast text
- Borders: Subtle outlines

### Animations
- Duration: 0.2 seconds
- Easing: Quart Out
- Smooth transitions
- Hover effects

### Layout
- Consistent spacing
- Rounded corners
- Proper padding
- Responsive sizing

## Usage Examples

### Basic Setup
```lua
local UI = loadstring(game:HttpGet("your-url"))()
local Window = UI:CreateWindow({Name = "My Script"})
local Tab = Window:CreateTab("Main")
```

### Player Controls
```lua
Tab:CreateSection("Player")

Tab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 100},
    CurrentValue = 16,
    Callback = function(speed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end
})

Tab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 200},
    CurrentValue = 50,
    Callback = function(power)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = power
    end
})
```

### Game Actions
```lua
Tab:CreateSection("Actions")

Tab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        end
    end
})

Tab:CreateDropdown({
    CurrentOption = {"Normal"},
    Options = {"Normal", "Neon", "ForceField"},
    Callback = function(effect)
        -- Apply effect to player
    end
})
```

### Settings Management
```lua
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateSection("Interface")

SettingsTab:CreateSlider({
    Name = "UI Scale",
    Range = {0.5, 2},
    CurrentValue = 1,
    Callback = function(scale)
        Window.MainFrame.Size = UDim2.new(0, 500 * scale, 0, 400 * scale)
    end
})
```

## Advanced Tips

### Storing Values
```lua
local settings = {
    speed = 16,
    jumpPower = 50
}

Tab:CreateSlider({
    Name = "Speed",
    Range = {16, 100},
    CurrentValue = settings.speed,
    Callback = function(value)
        settings.speed = value
        -- Apply setting
    end
})
```

### Conditional Components
```lua
if game.Players.LocalPlayer.Name == "Developer" then
    Tab:CreateButton({
        Name = "Admin Panel",
        Callback = function()
            -- Admin functions
        end
    })
end
```

### Error Handling
```lua
Tab:CreateButton({
    Name = "Safe Action",
    Callback = function()
        local success, error = pcall(function()
            -- Potentially risky code
        end)
        
        if success then
            UI:Notify({Title = "Success", Content = "Action completed"})
        else
            UI:Notify({Title = "Error", Content = "Something went wrong"})
        end
    end
})
```
