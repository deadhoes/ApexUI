# API Reference

## UI Library Methods

### UI:CreateWindow(props)
Creates a new window with tabs and components.

**Parameters:**
- `props` (table): Window configuration
  - `Name` (string): Window title

**Returns:** Window object

**Example:**
```lua
local Window = UI:CreateWindow({
    Name = "My Window"
})
```

### UI:Notify(props)
Shows a notification popup.

**Parameters:**
- `props` (table): Notification configuration
  - `Title` (string): Notification title
  - `Content` (string): Notification content
  - `Duration` (number): Display duration in seconds (default: 5)

**Example:**
```lua
UI:Notify({
    Title = "Success",
    Content = "Operation completed!",
    Duration = 3
})
```

## Window Methods

### Window:CreateTab(name, image)
Creates a new tab in the window.

**Parameters:**
- `name` (string): Tab name
- `image` (string, optional): Tab icon

**Returns:** Tab object

**Example:**
```lua
local MainTab = Window:CreateTab("Main")
```

## Tab Methods

### Tab:CreateSection(name)
Creates a section header in the tab.

**Parameters:**
- `name` (string): Section name

**Returns:** Section label

**Example:**
```lua
MainTab:CreateSection("Controls")
```

### Tab:CreateButton(props)
Creates a clickable button.

**Parameters:**
- `props` (table): Button configuration
  - `Name` (string): Button text
  - `Callback` (function): Function to call when clicked

**Returns:** Button object

**Example:**
```lua
MainTab:CreateButton({
    Name = "Click Me",
    Callback = function()
        print("Button clicked!")
    end
})
```

### Tab:CreateSlider(props)
Creates a value slider.

**Parameters:**
- `props` (table): Slider configuration
  - `Name` (string): Slider label
  - `Range` (table): {min, max} values
  - `CurrentValue` (number): Initial value
  - `Suffix` (string, optional): Value suffix text
  - `Callback` (function): Function called with new value

**Returns:** Slider object with methods:
- `GetValue()`: Returns current value
- `SetValue(value)`: Sets slider value

**Example:**
```lua
local slider = MainTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100},
    CurrentValue = 16,
    Suffix = " WS",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
```

### Tab:CreateDropdown(props)
Creates a dropdown selection menu.

**Parameters:**
- `props` (table): Dropdown configuration
  - `CurrentOption` (table): {default_option}
  - `Options` (table): Array of available options
  - `Callback` (function): Function called with selected option

**Returns:** Dropdown object

**Example:**
```lua
MainTab:CreateDropdown({
    CurrentOption = {"Option 1"},
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(option)
        print("Selected:", option)
    end
})
```

## Theme Configuration

The library uses a global theme object that can be modified:

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

## Utility Functions

### CreateTween(object, properties, duration)
Creates a smooth tween animation.

### CreateCorner(parent, radius)
Adds rounded corners to a GUI element.

### CreateStroke(parent, color, thickness)
Adds a border stroke to a GUI element.

## Events and Interactions

- All buttons support hover effects automatically
- Windows can be dragged by the title bar
- Sliders support click and drag interaction
- Dropdowns expand/collapse with smooth animations
- Close button destroys the entire UI

## Best Practices

1. Always provide callback functions for interactive elements
2. Use meaningful names for tabs and components
3. Group related components with sections
4. Test slider ranges to ensure they work with your use case
5. Keep notification durations reasonable (2-5 seconds)
6. Use consistent naming conventions across your UI
