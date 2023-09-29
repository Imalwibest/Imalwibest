local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local = Library.CreateLib("[FREE UGC] 💥Stairs Of MADNESS!", "Sentinel")
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("Credit Alwi Hub")
Section:NewButton("Discord", "?", function()

    print("Clicked")
end)

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto farm")
Section:NewKeybind("Closed/Open", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

