-- if u open this link is mean you wanna skid LFMAOO
if not game:IsLoaded() then game.Loaded:Wait() end
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                                                          Alwi is gay.lua")
local tabs = window:CreateTab("Secret Exe.lua") 

tabs:CreateToggle("Kill all", false, function(nigger) 
    _G.Sexy = nigger
_G.Sexy == true do
for _, v in ipairs(game.Players:GetChildren()) do
local args = {
    [1] = {
        [1] = game.Players.LocalPlayer
    },
    [2] = v,
    [3] = v.Character.Humanoid,
    [4] = 999
}

game:GetService("ReplicatedStorage").Remotes.DamagePlayer:FireServer(unpack(args))
wait() 
end
end
end) 


tabs:CreateButton("Kill all 1x", function()
for _, v in ipairs(game.Players:GetChildren()) do
local args = {
    [1] = {
        [1] = game.Players.LocalPlayer
    },
    [2] = v,
    [3] = v.Character.Humanoid,
    [4] = 999
}

game:GetService("ReplicatedStorage").Remotes.DamagePlayer:FireServer(unpack(args))
end
end) 


tabs:CreateToggle("inf money", false, function(OMG) 
_G.Skid = OMG
while _G.Skid == true do
wait() 
local args = {
    [1] = "UGC"
}

game:GetService("ReplicatedStorage").Remotes.ClaimDailyQuest:FireServer(unpack(args))
end
end) 
