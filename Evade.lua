local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
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
end) 

IloveAlwi:CreateButton("Full bright", function() 
Lighting.FogEnd = 100000
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("Atmosphere") then
			v:Destroy()
		end
    end
 end) 


IloveAlwi:CreateSlider("Speed", 0, 1000, function(Vall) 
pcall(function()
    local Character = Player.Character;
    Character.Humanoid.WalkSpeed = Vall
   end)
end) 

IloveAlwi:CreateSlider("JumpPower", 0, 1000, function(Val) 
pcall(function()
    local Character = Player.Character;
    Character.Humanoid.JumpHeight = Val;
   end)
end)
  
