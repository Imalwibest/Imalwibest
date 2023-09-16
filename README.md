local Library =loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))() 
 local Window = Library.CreateLib("ALWI HUB V.1", "BloodTheme") 
 local Tab = Window:NewTab("[Credit]") 
 local Section = Tab:NewSection("ALWI#3737") 
 local Section = Tab:NewSection("I From Indonesia")
Section:NewToggle("ToggleText", "ToggleInfo", function(state)
    if state then
        local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
local ballsFolder = workspace:WaitForChild("Balls")

print("Script successfully ran.")

local function onCharacterAdded(newCharacter)
    character = newCharacter
end

player.CharacterAdded:Connect(onCharacterAdded)

local focusedBall = nil  

local function chooseNewFocusedBall()
    local balls = ballsFolder:GetChildren()
    focusedBall = nil
    for _, ball in ipairs(balls) do
        if ball:GetAttribute("realBall") == true then
            focusedBall = ball
            break
        end
    end
end

chooseNewFocusedBall()

local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
    local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
    local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
    
    if velocityTowardsPlayer <= 0 then
        return math.huge
    end
    
    local distanceToBeCovered = distanceToPlayer - 30
    return distanceToBeCovered / velocityTowardsPlayer
end

local BASE_THRESHOLD = 0.15
local VELOCITY_SCALING_FACTOR = 0.002

local function getDynamicThreshold(ballVelocityMagnitude)
    local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
    return math.max(0.12, adjustedThreshold)
end

local function checkBallDistance()
    if not character:FindFirstChild("Highlight") then return end
    local charPos = character.PrimaryPart.Position
    local charVel = character.PrimaryPart.Velocity

    if focusedBall and not focusedBall.Parent then
        chooseNewFocusedBall()
    end

    if not focusedBall then return end

    local ball = focusedBall
    local distanceToPlayer = (ball.Position - charPos).Magnitude

    if distanceToPlayer < 10 then
        parryButtonPress:Fire()
        return
    end

    local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
    local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)

    if timeToImpact < dynamicThreshold then
        parryButtonPress:Fire()
    end
end

    else
        local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local parryButtonPress = replicatedStorage.Remotes.ParryButtonPress
local ballsFolder = workspace:WaitForChild("Balls")

print("Script successfully ran.")

local function onCharacterAdded(newCharacter)
    character = newCharacter
end

player.CharacterAdded:Connect(onCharacterAdded)

local focusedBall = nil  

local function chooseNewFocusedBall()
    local balls = ballsFolder:GetChildren()
    focusedBall = nil
    for _, ball in ipairs(balls) do
        if ball:GetAttribute("realBall") == true then
            focusedBall = ball
            break
        end
    end
end

chooseNewFocusedBall()

local function timeUntilImpact(ballVelocity, distanceToPlayer, playerVelocity)
    local directionToPlayer = (character.HumanoidRootPart.Position - focusedBall.Position).Unit
    local velocityTowardsPlayer = ballVelocity:Dot(directionToPlayer) - playerVelocity:Dot(directionToPlayer)
    
    if velocityTowardsPlayer <= 0 then
        return math.huge
    end
    
    local distanceToBeCovered = distanceToPlayer - 30
    return distanceToBeCovered / velocityTowardsPlayer
end

local BASE_THRESHOLD = 0.15
local VELOCITY_SCALING_FACTOR = 0.002

local function getDynamicThreshold(ballVelocityMagnitude)
    local adjustedThreshold = BASE_THRESHOLD - (ballVelocityMagnitude * VELOCITY_SCALING_FACTOR)
    return math.max(0.12, adjustedThreshold)
end

local function checkBallDistance()
    if not character:FindFirstChild("Highlight") then return end
    local charPos = character.PrimaryPart.Position
    local charVel = character.PrimaryPart.Velocity

    if focusedBall and not focusedBall.Parent then
        chooseNewFocusedBall()
    end

    if not focusedBall then return end

    local ball = focusedBall
    local distanceToPlayer = (ball.Position - charPos).Magnitude

    if distanceToPlayer < 10 then
        parryButtonPress:Fire()
        return
    end

    local timeToImpact = timeUntilImpact(ball.Velocity, distanceToPlayer, charVel)
    local dynamicThreshold = getDynamicThreshold(ball.Velocity.Magnitude)

    if timeToImpact < dynamicThreshold then
        parryButtonPress:Fire()
    end
end

    end
end)

Section:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

Section:NewButton("?", "?", function()
    print("Clicked")
end)