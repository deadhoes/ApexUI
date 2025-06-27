# 🎨 ApexUI

ApexUI is a modern, sleek UI library for Roblox with buttery smooth animations and professional components.

---

## ⚡ Quick Start

```lua
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/deadhoes/ApexUI/main/ApexUI.lua"))()
🚀 Features
✨ Smooth TweenService animations

🎨 Modern dark theme with customizable colors

🪟 Professional window system

🎛️ Full component library

📦 Single-file loadstring usage

🖱️ Hover effects & transitions

📱 Intuitive and responsive layout

🪟 Window Component
lua
Kopyala
Düzenle
local window = ApexUI:Window({
    title = "My Window",
    size = UDim2.new(0, 400, 0, 300)
})
🔘 Button Component
lua
Kopyala
Düzenle
local button = ApexUI:Button({
    parent = window.Content,
    text = "Click Me",
    size = UDim2.new(0, 150, 0, 35),
    position = UDim2.new(0, 10, 0, 10),
    color = Color3.fromRGB(64, 156, 255),
    onClick = function()
        print("Button clicked!")
    end
})
📋 Dropdown Component
lua
Kopyala
Düzenle
local dropdown = ApexUI:Dropdown({
    parent = window.Content,
    placeholder = "Select...",
    size = UDim2.new(0, 200, 0, 32),
    position = UDim2.new(0, 10, 0, 50),
    options = {"Option A", "Option B", "Option C"},
    onSelect = function(option, index)
        print("Selected:", option)
    end
})
🔄 Toggle Component
lua
Kopyala
Düzenle
local toggle = ApexUI:Toggle({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 90),
    default = true,
    onToggle = function(state)
        print("Toggle state:", state)
    end
})
☑️ Checkbox Component
lua
Kopyala
Düzenle
local checkbox = ApexUI:Checkbox({
    parent = window.Content,
    position = UDim2.new(0, 10, 0, 130),
    label = "I agree to the Terms",
    default = false,
    onChange = function(checked)
        print("Checked:", checked)
    end
})
🎚️ Slider Component
lua
Kopyala
Düzenle
local slider = ApexUI:Slider({
    parent = window.Content,
    size = UDim2.new(0, 250, 0, 20),
    position = UDim2.new(0, 10, 0, 170),
    min = 0,
    max = 100,
    default = 50,
    onChange = function(value)
        print("Slider value:", value)
    end
})
🧪 Full Example
lua
Kopyala
Düzenle
local ApexUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/deadhoes/ApexUI/main/ApexUI.lua"))()

local window = ApexUI:Window({
    title = "Demo UI",
    size = UDim2.new(0, 450, 0, 500),
    position = UDim2.new(0.5, -225, 0.5, -250)
})

ApexUI:Button({
    parent = window.Content,
    text = "Apply",
    size = UDim2.new(0, 120, 0, 35),
    position = UDim2.new(0, 20, 1, -50),
    color = Color3.fromRGB(76, 175, 80),
    onClick = function()
        print("Applied!")
    end
})

ApexUI:Button({
    parent = window.Content,
    text = "Cancel",
    size = UDim2.new(0, 100, 0, 35),
    position = UDim2.new(0, 150, 1, -50),
    color = Color3.fromRGB(244, 67, 54),
    onClick = function()
        window.Frame:Destroy()
    end
})
📄 License
MIT License – Free to use, modify, and share.

🤝 Contributing
Want to improve ApexUI? PRs are welcome!

⭐ Support
If you find ApexUI helpful, leave a ⭐ on GitHub!
