local UI = loadstring(game:HttpGet("https://github.com/deadhoes/ApexUI/blob/main/ApexUI.lua"))()

local Window = UI:CreateWindow({
    Name = "Basic Window"
})

local MainTab = Window:CreateTab("Main")

MainTab:CreateButton({
    Name = "Hello World",
    Callback = function()
        print("Hello World!")
    end
})

MainTab:CreateSlider({
    Name = "Value",
    Range = {1, 10},
    CurrentValue = 5,
    Callback = function(value)
        print("New value:", value)
    end
})

MainTab:CreateDropdown({
    CurrentOption = {"One"},
    Options = {"One", "Two", "Three"},
    Callback = function(option)
        print("Selected:", option)
    end
})

UI:Notify({
    Title = "Started",
    Content = "Basic window is ready!",
    Duration = 3
})
