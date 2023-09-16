local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Hit My Balls", HidePremium = false, IntroText = "Made By Faker", SaveConfig = true, ConfigFolder = "Blade Ball"})

local Tab = Window:MakeTab({
	Name = "Main!",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "HyB Community"
})

Tab:AddButton({
	Name = "AutoParry/Click this then go check console",
	Callback = function()
      		print("Magic in my balls")
  	end    
})

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



runService.Heartbeat:Connect(function()
    checkBallDistance()
end)
