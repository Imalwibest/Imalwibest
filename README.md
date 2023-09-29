local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local = Library.CreateLib("[FREE UGC] 💥Stairs Of MADNESS!", "Sentinel")
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("Credit Alwi Hub")
local Section = Tab:NewSection("My discord")
Section:NewButton("Discord", "?", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "Thx For join";
    Text = "In your Clipboard!"; -- what the text says (ofc)
    Duration = 9999;
})

setclipboard(tostring("https://discord.gg/p2x9e5QxQh"))
end)

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto farm")
Section:NewKeybind("Closed/Open", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

Section:NewToggle("ToggleText", "ToggleInfo", function(state)
    if state then
        _G.Enabled = true

while _G.Enabled == true do
   wait()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21.7531967, 588.971069, -69.0947189, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end
    else
        _G.Enabled = false

while _G.Enabled == false do
   wait()
   
end
    end
end)

local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Local Player")
Section:NewButton("AntiAfkV2", "?", function()

    print("Clicked")
end)

Section:NewButton("Antiafk", "?", function()
game:GetService("Players").LocalPlayer.Idled:connect(function() game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
    print("Clicked")
end)

Section:NewButton("Infinite yield", "?", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    print("Clicked")
end)

Section:NewTextBox("Character speed", "Type in a number to make the speed u want", function(txt)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)

Section:NewSlider("Speed", "Yo", 500, 0, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

Section:NewTextBox("Character speed", "Type in a number to make the speed u want", function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

Section:NewSlider("Jump", "Yo", 500, 0, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
