local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                           ALWI HUB | Evade [Beta]")
local IloveAlwi = window:CreateTab("Main")
local Rylu = window:CreateTab("Misc")
local w = window:CreateTab("Info")

IloveAlwi:CreateButton("Respawn", function() 
wait(2) 
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end) 

IloveAlwi:CreateToggle("Auto Respawn",false,function(RE) 
_G.Spawn = RE 
while _G.Spawn == true do
    task.wait(2)
game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end
end) 

IloveAlwi:CreateButton("Full bright", function() 
    Game.Lighting.Brightness = 4
    Game.Lighting.FogEnd = 100000
    Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
    Lighting.FogColor = Color3.fromRGB(255,255,255)
end)

IloveAlwi:CreateToggle("Toggle Character Movement",false,function(state)
_G.Speed = state
while _G.Speed == true do
        task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 5
end
end) 

