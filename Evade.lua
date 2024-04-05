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
    Lighting.FogColor = Color3.fromRGB(255,255,255)
end)

IloveAlwi:CreateToggle("Toggle Character Movement",false,function(state)
    if state then
        isRunning = true
        pcall(function()
            moveCharacter()
        end)
    else
        isRunning = false
    end
end)


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local isRunning = true

local function moveCharacter()
    while isRunning do
        if humanoid.MoveDirection.Magnitude > 0 then
            pcall(function()
                character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + character.HumanoidRootPart.CFrame.LookVector
            end)
        else
            break
        end
        task.wait()
    end
end

local connection
character.ChildAdded:Connect(function(child)
    if child:IsA("Humanoid") then
        humanoid = child
        connection = humanoid.MoveDirectionChanged:Connect(moveCharacter)
    end
end)

character.ChildRemoved:Connect(function(child)
    if child:IsA("Humanoid") then
        connection:Disconnect()
    end
end)

pcall(function()
    moveCharacter()
end)
