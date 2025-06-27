
# 🌟 Modern UI Library for Roblox (Rayfield Style)

A powerful, modern, and customizable UI library built for Roblox developers. This library comes with sleek components, smooth animations, and a clean theme – inspired by Rayfield.

---

## 🚀 Getting Started

To get started, simply include the library using:

```lua
local UI = loadstring(game:HttpGet("your-url"))()
```

---

## 🎨 Theme & Style

This UI framework includes a modern dark theme:
- **Background:** #191919
- **Primary Color:** Blue (#409CFF)
- **Success/Warning/Error:** Green, Orange, Red
- **Rounded Corners & Smooth Transitions**

---

## 🪟 `UI:CreateWindow(props)`

Creates a draggable main window with title bar and tab support.

### `props` table:
- `Name`: (string) Name of the window

### Example:
```lua
local window = UI:CreateWindow({ Name = "My UI" })
```

---

## 📑 Tabs

### `window:CreateTab(name)`
Creates a new tab in the sidebar.

```lua
local tab = window:CreateTab("Main")
```

---

## 🧩 Components

### 🔘 Buttons

```lua
tab:CreateButton({
    Name = "Click Me",
    Callback = function()
        print("Button Clicked!")
    end
})
```

---

### 🎚️ Slider

```lua
tab:CreateSlider({
    Name = "Volume",
    Range = {0, 100},
    CurrentValue = 50,
    Suffix = "%",
    Callback = function(value)
        print("Slider:", value)
    end
})
```

---

### 📋 Dropdown

```lua
tab:CreateDropdown({
    CurrentOption = {"Option 1"},
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(selected)
        print("Selected:", selected)
    end
})
```

---

### 📂 Sections

```lua
tab:CreateSection("Settings")
```

---

## 🔔 `UI:Notify(props)`

Creates a temporary notification.

### `props` table:
- `Title`: (string) The notification title
- `Content`: (string) The message content
- `Duration`: (number) Duration in seconds

### Example:
```lua
UI:Notify({
    Title = "Success!",
    Content = "Your action was completed.",
    Duration = 3
})
```

---

## 📦 Return Object

Each window and tab returns an object with utility functions like:
- `SetValue` / `GetValue` for sliders
- Callback binding for dropdowns/buttons

---

## 📄 License

MIT License – Free to use, modify, and distribute.

---

## 💡 Tip

Drag the window using the top bar, and click tabs to switch views. Smooth transitions and hover effects are built-in.

