local UI = loadstring(game:HttpGet("your-url-here"))()

local CustomTheme = {
    Background = Color3.fromRGB(15, 15, 20),
    Surface = Color3.fromRGB(25, 25, 35),
    Primary = Color3.fromRGB(138, 43, 226),
    Secondary = Color3.fromRGB(35, 35, 45),
    Text = Color3.fromRGB(240, 240, 240),
    TextSecondary = Color3.fromRGB(160, 160, 170),
    Border = Color3.fromRGB(45, 45, 55),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 146, 60),
    Error = Color3.fromRGB(239, 68, 68),
    CornerRadius = UDim.new(0, 12),
    Animation = {
        Duration = 0.3,
        Style = Enum.EasingStyle.Back,
        Direction = Enum.EasingDirection.Out
    }
}

local function ApplyCustomTheme()
    local originalTheme = getgenv().Theme or {}
    for key, value in pairs(CustomTheme) do
        originalTheme[key] = value
    end
    getgenv().Theme = originalTheme
end

ApplyCustomTheme()

local Window = UI:CreateWindow({
    Name = "Custom Theme Demo"
})

local MainTab = Window:CreateTab("Main")
local ColorsTab = Window:CreateTab("Colors")

MainTab:CreateSection("Theme Preview")

MainTab:CreateButton({
    Name = "Primary Color Button",
    Callback = function()
        UI:Notify({
            Title = "Custom Theme",
            Content = "Purple theme is active!",
            Duration = 3
        })
    end
})

MainTab:CreateSlider({
    Name = "Animation Speed",
    Range = {0.1, 1},
    CurrentValue = 0.3,
    Suffix = "s",
    Callback = function(value)
        CustomTheme.Animation.Duration = value
        ApplyCustomTheme()
    end
})

ColorsTab:CreateSection("Color Customization")

ColorsTab:CreateDropdown({
    CurrentOption = {"Purple"},
    Options = {"Purple", "Blue", "Green", "Red", "Orange"},
    Callback = function(color)
        if color == "Purple" then
            CustomTheme.Primary = Color3.fromRGB(138, 43, 226)
        elseif color == "Blue" then
            CustomTheme.Primary = Color3.fromRGB(59, 130, 246)
        elseif color == "Green" then
            CustomTheme.Primary = Color3.fromRGB(34, 197, 94)
        elseif color == "Red" then
            CustomTheme.Primary = Color3.fromRGB(239, 68, 68)
        elseif color == "Orange" then
            CustomTheme.Primary = Color3.fromRGB(249, 115, 22)
        end
        ApplyCustomTheme()
    end
})

ColorsTab:CreateButton({
    Name = "Reset to Default",
    Callback = function()
        CustomTheme.Primary = Color3.fromRGB(64, 156, 255)
        CustomTheme.Background = Color3.fromRGB(25, 25, 25)
        CustomTheme.Surface = Color3.fromRGB(35, 35, 35)
        ApplyCustomTheme()
        UI:Notify({
            Title = "Reset",
            Content = "Theme reset to default colors",
            Duration = 2
        })
    end
})

UI:Notify({
    Title = "Custom Theme Loaded",
    Content = "Purple theme is now active!",
    Duration = 4
})
