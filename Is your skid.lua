local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local basePartNames = {
    "Low-Poly Gold Coin",
    "Low-Poly Gold Coin1",
    "Low-Poly Gold Coin2",
    "Low-Poly Gold Coin3",
    "Low-Poly Gold Coin4",
    "Low-Poly Gold Coin5",
    "Low-Poly Gold Coin6",
    "Low-Poly Gold Coin7",
    "Low-Poly Gold Coin8",
    "Low-Poly Gold Coin9",
    "Low-Poly Gold Coin10"
}

local function bringPartsToPlayer()
    local parts = game.Workspace:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") and table.find(basePartNames, part.Name) then
            part.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3, 0)
            wait(0.1)
        end
    end
end

local function teleportToPosition(x, y, z)
    if character and humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

wait(10)

teleportToPosition(-239.234528, -4.55422115, 80.5513077)
wait(3)
bringPartsToPlayer()

teleportToPosition(-239.216583, -4.53916168, 60.3398972)
wait(3)
bringPartsToPlayer()

teleportToPosition(-238.621292, -4.15457821, 25.7049236)
wait(3)
bringPartsToPlayer()

game:GetService("TeleportService"):Teleport(game.PlaceId, player)
