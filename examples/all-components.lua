local UI = loadstring(game:HttpGet("https://github.com/deadhoes/ApexUI/blob/main/ApexUI.lua"))()

local Window = UI:CreateWindow({
    Name = "UI Library Demo"
})

local MainTab = Window:CreateTab("Main")
local ComponentsTab = Window:CreateTab("Components")
local SettingsTab = Window:CreateTab("Settings")

MainTab:CreateSection("Welcome")

MainTab:CreateButton({
    Name = "Say Hello",
    Callback = function()
        UI:Notify({
            Title = "Hello!",
            Content = "UI Library is working successfully!",
            Duration = 3
        })
    end
})

MainTab:CreateButton({
    Name = "Test Button",
    Callback = function()
        print("Test button clicked!")
    end
})

ComponentsTab:CreateSection("Slider Examples")

local healthSlider = ComponentsTab:CreateSlider({
    Name = "Health",
    Range = {0, 100},
    CurrentValue = 75,
    Suffix = " HP",
    Callback = function(value)
        print("Health value:", value)
    end
})

local speedSlider = ComponentsTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100},
    CurrentValue = 16,
    Suffix = " WS",
    Callback = function(value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

ComponentsTab:CreateSection("Dropdown Examples")

ComponentsTab:CreateDropdown({
    CurrentOption = {"Option 1"},
    Options = {"Option 1", "Option 2", "Option 3", "Option 4"},
    Callback = function(selectedOption)
        UI:Notify({
            Title = "Selection Made",
            Content = "Selected: " .. selectedOption,
            Duration = 2
        })
    end
})

ComponentsTab:CreateDropdown({
    CurrentOption = {"Easy"},
    Options = {"Easy", "Medium", "Hard", "Expert"},
    Callback = function(difficulty)
        print("Difficulty level:", difficulty)
    end
})

ComponentsTab:CreateSection("More Buttons")

ComponentsTab:CreateButton({
    Name = "Increase Jump Power",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
            UI:Notify({
                Title = "Success!",
                Content = "Jump Power increased to 100",
                Duration = 2
            })
        end
    end
})

ComponentsTab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        end
    end
})

SettingsTab:CreateSection("Appearance Settings")

SettingsTab:CreateSlider({
    Name = "UI Transparency",
    Range = {0, 1},
    CurrentValue = 0,
    Suffix = "",
    Callback = function(value)
        Window.MainFrame.BackgroundTransparency = value
    end
})

SettingsTab:CreateSection("System Settings")

SettingsTab:CreateButton({
    Name = "Reload UI",
    Callback = function()
        Window.ScreenGui:Destroy()
        wait(1)
        loadstring(game:HttpGet("your-url-here"))()
    end
})

SettingsTab:CreateButton({
    Name = "Clear Console",
    Callback = function()
        UI:Notify({
            Title = "Cleared",
            Content = "Console cleared",
            Duration = 2
        })
    end
})

SettingsTab:CreateDropdown({
    CurrentOption = {"English"},
    Options = {"English", "Español", "Français", "Deutsch"},
    Callback = function(language)
        UI:Notify({
            Title = "Language Changed",
            Content = "New language: " .. language,
            Duration = 3
        })
    end
})

UI:Notify({
    Title = "UI Loaded!",
    Content = "All components are ready and usable.",
    Duration = 4
})
