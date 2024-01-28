local Library =loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Alwi hub | Bakugon Brawl", "Serpent")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto win")
Section:NewToggle("Auto Hit", "?", function(Hit)
 _G.Hit = Hit
while _G.Hit == true do
    wait(0.1) 
local args = {
    [1] = "GiveSpinRewards",
    [2] = {
        [1] = 1,
        [2] = 1
    }
}

game:GetService("ReplicatedStorage").F.RF:InvokeServer(unpack(args)) 
end
    end) 

Section:NewToggle("Auto Hit", "?", function(su)
 _G.Pet = su
while _G.Pet == true do
    wait(0.3) 
local args = {
    [1] = "GiveSpinRewards",
    [2] = {
        [1] = 1,
        [2] = 7
    }
}

game:GetService("ReplicatedStorage").F.RF:InvokeServer(unpack(args)) 
end
    end) 

Section:NewButton("Antiafk", "ButtonInfo", function() 
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk V1";
    Text = "Turn On"; 
    Duration = 30;
})


local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end)


Section:NewButton("Place Quest For UGC", "?", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3750.63062, 320.412964, 919.258545, -0.662545383, -7.39856887e-09, 0.749021769, -1.32066177e-10, 1, 9.76082326e-09, -0.749021769, 6.36806785e-09, -0.662545383)
end) 
Section:NewButton("Go play UGC FOR QUEST", "?", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4001, 332.82251, 1032.03894, 0.0294349212, 4.48116602e-08, -0.999566674, -1.92111815e-09, 1, 4.4774513e-08, 0.999566674, 6.02351502e-10, 0.0294349212) 
end) 

local Tab = Window:NewTab("Info/Credit")
local Section = Tab:NewSection("Develepor Alwi hub")
local Section = Tab:NewSection("Discord user : alwi3726")
local Section = Tab:NewSection("Join my discord for more update and ugc!")

Section:NewButton("Discord Link", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 

Section:NewButton("Console", "?", function()
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)

Section:NewKeybind("Closed/Open", "Click again LoL", Enum.KeyCode.E, function()
	Library:ToggleUI()
end)


