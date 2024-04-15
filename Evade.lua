local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()

local window = Lib:CreateWindow("ALWI HUB | Evade [Beta]")
local IloveAlwi = window:CreateTab("Main")
local Rylu = window:CreateTab("Misc")
local w = window:CreateTab("Info")

IloveAlwi:CreateButton("Respawn", function() 
    wait(2) 
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end) 

IloveAlwi:CreateToggle("Auto Respawn", false, function(RE) 
    _G.Spawn = RE 
    while _G.Spawn == true do
        task.wait() 
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
    end
end) 

IloveAlwi:CreateButton("Full bright", function() 
    game.Lighting.Brightness = 4
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
    game.Lighting.ClockTime = 12
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
end)

local RunService = game:GetService("RunService")
local hb = RunService.Heartbeat

local tpwalking = false
local tpSpeed = 1
local jumpPower = 50
local player = game.Players.LocalPlayer
local chr = player.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

IloveAlwi:CreateButton("NoFog", function() 
    if game.Lighting then
        game.Lighting.FogEnd = 100000
        for i, v in pairs(game.Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    end
end) 

IloveAlwi:CreateToggle("TP Walking", false, function(value)
    tpwalking = value
    while tpwalking and chr and hum and hum.Parent do
        local success, err = pcall(function()
            local delta = hb:Wait()
            if hum.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(hum.MoveDirection * tpSpeed * delta)
            end
        end)
        if not success then
            warn("Error in TP Walking: " .. err)
        end
    end
end)

IloveAlwi:CreateSlider("Speed", 1, 100, function(value)
    tpSpeed = value
end)

IloveAlwi:CreateToggle("Adjust Jump Power", false, function(value)
    if value then
        if hum then
            hum.JumpPower = jumpPower
        end
    else
        if hum then
            hum.JumpPower = 50
        end
    end
end)

IloveAlwi:CreateSlider("Jump Power", 50, 200, function(value)
    jumpPower = value
    if hum then
        hum.JumpPower = jumpPower
    end
end)
