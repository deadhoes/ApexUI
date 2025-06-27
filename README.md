# 🎨 ApexUI

Modern, sleek UI library for Roblox with buttery smooth animations and professional components.

![ApexUI Demo](assets/demo.gif)

## ⚡ Quick Start

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()
```

## 🚀 Features

- ✨ Smooth TweenService animations
- 🎨 Modern dark theme with customizable colors
- 🪟 Professional window management system
- 🎛️ Complete component library
- 📦 Single-file loadstring compatibility
- 🖱️ Interactive hover effects and transitions
- 📱 Responsive and intuitive design

## 📖 Complete Usage Guide

### 🪟 Window Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

-- Create a window with all options
local window = ApexUI:Window({
    title = "My Application",
    icon = "rbxasset://textures/ui/GuiImagePlaceholder.png", -- Optional
    size = UDim2.new(0, 500, 0, 400),
    position = UDim2.new(0.5, -250, 0.5, -200),
    parent = game.Players.LocalPlayer.PlayerGui,
    onClose = function()
        print("Window closed!")
        -- Custom close behavior
    end,
    onMinimize = function(isMinimized)
        print("Window minimized:", isMinimized)
    end,
    onMaximize = function()
        print("Window maximized!")
    end
})

-- Add components to window content
-- Use: window.Content as parent for other components
```

### 🔘 Button Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Button Demo",
    size = UDim2.new(0, 400, 0, 300)
})

-- Create different styled buttons
local primaryButton = ApexUI:Button({
    parent = window.Content,
    text = "Primary Button",
    size = UDim2.new(0, 150, 0, 35),
    position = UDim2.new(0, 10, 0, 10),
    color = Color3.fromRGB(64, 156, 255),
    textColor = Color3.fromRGB(255, 255, 255),
    textSize = 14,
    onClick = function()
        print("Primary button clicked!")
    end
})

local successButton = ApexUI:Button({
    parent = window.Content,
    text = "Success Button",
    size = UDim2.new(0, 150, 0, 35),
    position = UDim2.new(0, 170, 0, 10),
    color = Color3.fromRGB(76, 175, 80),
    onClick = function()
        print("Success!")
    end
})

local warningButton = ApexUI:Button({
    parent = window.Content,
    text = "Warning Button",
    size = UDim2.new(0, 150, 0, 35),
    position = UDim2.new(0, 10, 0, 55),
    color = Color3.fromRGB(255, 152, 0),
    onClick = function()
        print("Warning clicked!")
    end
})
```

### 📋 Dropdown Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Dropdown Demo",
    size = UDim2.new(0, 400, 0, 300)
})

-- Simple dropdown
local gameMode = ApexUI:Dropdown({
    parent = window.Content,
    placeholder = "Select Game Mode...",
    size = UDim2.new(0, 200, 0, 32),
    position = UDim2.new(0, 10, 0, 10),
    options = {"Singleplayer", "Multiplayer", "Co-op", "Battle Royale"},
    onSelect = function(selectedOption, index)
        print("Selected game mode:", selectedOption, "at index", index)
    end
})

-- Settings dropdown
local qualitySettings = ApexUI:Dropdown({
    parent = window.Content,
    placeholder = "Graphics Quality...",
    size = UDim2.new(0, 200, 0, 32),
    position = UDim2.new(0, 10, 0, 50),
    options = {"Low", "Medium", "High", "Ultra", "Custom"},
    onSelect = function(selectedOption, index)
        print("Graphics quality set to:", selectedOption)
        -- Apply graphics settings here
    end
})

-- Character selection
local characterSelect = ApexUI:Dropdown({
    parent = window.Content,
    placeholder = "Choose Character...",
    size = UDim2.new(0, 200, 0, 32),
    position = UDim2.new(0, 10, 0, 90),
    options = {"Warrior", "Mage", "Archer", "Rogue", "Paladin"},
    onSelect = function(selectedOption, index)
        print("Character selected:", selectedOption)
    end
})
```

### 🔄 Toggle Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Toggle Demo",
    size = UDim2.new(0, 400, 0, 300)
})

-- Settings toggles
local soundToggle = ApexUI:Toggle({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 10),
    default = true,
    onToggle = function(isToggled)
        print("Sound enabled:", isToggled)
        -- Toggle sound system
    end
})

local musicToggle = ApexUI:Toggle({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 50),
    default = false,
    onToggle = function(isToggled)
        print("Music enabled:", isToggled)
        -- Toggle background music
    end
})

local notificationsToggle = ApexUI:Toggle({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 90),
    default = true,
    onToggle = function(isToggled)
        print("Notifications enabled:", isToggled)
    end
})

-- Get toggle values
print("Current sound setting:", soundToggle.GetValue())
```

### ☑️ Checkbox Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Checkbox Demo",
    size = UDim2.new(0, 400, 0, 300)
})

-- Terms and conditions
local termsCheckbox = ApexUI:Checkbox({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 10),
    label = "I agree to the Terms and Conditions",
    default = false,
    onChange = function(isChecked)
        print("Terms accepted:", isChecked)
    end
})

-- Newsletter subscription
local newsletterCheckbox = ApexUI:Checkbox({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 40),
    label = "Subscribe to newsletter",
    default = true,
    onChange = function(isChecked)
        print("Newsletter subscription:", isChecked)
    end
})

-- Auto-save feature
local autoSaveCheckbox = ApexUI:Checkbox({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 70),
    label = "Enable auto-save",
    default = true,
    onChange = function(isChecked)
        print("Auto-save enabled:", isChecked)
        -- Toggle auto-save functionality
    end
})

-- Remember login
local rememberCheckbox = ApexUI:Checkbox({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 100),
    label = "Remember me",
    default = false,
    onChange = function(isChecked)
        print("Remember login:", isChecked)
    end
})

-- Get checkbox values
print("Terms accepted:", termsCheckbox.GetValue())
```

### 🎚️ Slider Component

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Slider Demo",
    size = UDim2.new(0, 400, 0, 300)
})

-- Volume slider
local volumeSlider = ApexUI:Slider({
    parent = window.Content,
    size = UDim2.new(0, 250, 0, 20),
    position = UDim2.new(0, 10, 0, 10),
    min = 0,
    max = 100,
    default = 75,
    onChange = function(value)
        print("Volume:", value .. "%")
        -- Set game volume
    end
})

-- Brightness slider
local brightnessSlider = ApexUI:Slider({
    parent = window.Content,
    size = UDim2.new(0, 250, 0, 20),
    position = UDim2.new(0, 10, 0, 50),
    min = 0,
    max = 100,
    default = 50,
    onChange = function(value)
        print("Brightness:", value .. "%")
        -- Adjust screen brightness
    end
})

-- Sensitivity slider
local sensitivitySlider = ApexUI:Slider({
    parent = window.Content,
    size = UDim2.new(0, 250, 0, 20),
    position = UDim2.new(0, 10, 0, 90),
    min = 0.1,
    max = 5.0,
    default = 1.0,
    onChange = function(value)
        print("Mouse sensitivity:", value)
        -- Set mouse sensitivity
    end
})

-- Get and set slider values
print("Current volume:", volumeSlider.GetValue())
volumeSlider.SetValue(50) -- Set to 50%
```

### 🔗 Complete Example

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/ApexUI/main/ApexUI.lua"))()

-- Create main settings window
local settingsWindow = ApexUI:Window({
    title = "Game Settings",
    icon = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    size = UDim2.new(0, 450, 0, 500),
    position = UDim2.new(0.5, -225, 0.5, -250)
})

-- Graphics quality dropdown
local graphicsDropdown = ApexUI:Dropdown({
    parent = settingsWindow.Content,
    placeholder = "Graphics Quality...",
    size = UDim2.new(0, 200, 0, 32),
    position = UDim2.new(0, 20, 0, 20),
    options = {"Low", "Medium", "High", "Ultra"},
    onSelect = function(option, index)
        print("Graphics set to:", option)
    end
})

-- Audio settings
local soundToggle = ApexUI:Toggle({
    parent = settingsWindow.Content,
    position = UDim2.new(0, 20, 0, 70),
    default = true,
    onToggle = function(enabled)
        print("Sound:", enabled)
    end
})

local volumeSlider = ApexUI:Slider({
    parent = settingsWindow.Content,
    size = UDim2.new(0, 300, 0, 20),
    position = UDim2.new(0, 20, 0, 110),
    min = 0,
    max = 100,
    default = 75,
    onChange = function(volume)
        print("Volume:", volume)
    end
})

-- Gameplay options
local autoSaveCheckbox = ApexUI:Checkbox({
    parent = settingsWindow.Content,
    position = UDim2.new(0, 20, 0, 150),
    label = "Enable auto-save",
    default = true,
    onChange = function(enabled)
        print("Auto-save:", enabled)
    end
})

-- Apply and Cancel buttons
local applyButton = ApexUI:Button({
    parent = settingsWindow.Content,
    text = "Apply Settings",
    size = UDim2.new(0, 120, 0, 35),
    position = UDim2.new(0, 20, 1, -50),
    color = Color3.fromRGB(76, 175, 80),
    onClick = function()
        print("Settings applied!")
    end
})

local cancelButton = ApexUI:Button({
    parent = settingsWindow.Content,
    text = "Cancel",
    size = UDim2.new(0, 100, 0, 35),
    position = UDim2.new(0, 150, 1, -50),
    color = Color3.fromRGB(244, 67, 54),
    onClick = function()
        settingsWindow.Frame:Destroy()
    end
})
```

## 🎨 Component Features

### Window Features
- ✅ Draggable title bar
- ✅ Minimize/Maximize/Close buttons
- ✅ Custom icon support
- ✅ Smooth hover animations
- ✅ Event callbacks

### Button Features
- ✅ Hover scaling effect
- ✅ Click animation
- ✅ Color transitions
- ✅ Custom styling options

### Dropdown Features
- ✅ Smooth slide animations
- ✅ Rotating arrow indicator
- ✅ Hover effects on options
- ✅ Custom placeholder text

### Toggle Features
- ✅ Smooth sliding animation
- ✅ Color transition effects
- ✅ Value getter function

### Checkbox Features
- ✅ Smooth check animation
- ✅ Optional labels
- ✅ Value getter function
- ✅ Custom positioning

### Slider Features
- ✅ Smooth dragging
- ✅ Real-time value updates
- ✅ Hover effects
- ✅ Custom min/max values
- ✅ Value getter and setter

## 📄 License

MIT License - Feel free to use ApexUI in your projects!

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## ⭐ Support

If you find ApexUI useful, please consider giving it a star on GitHub!
