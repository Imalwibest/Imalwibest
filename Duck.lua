--> Alwi Hub Hello duck.DuckCollectCollision.CFrame
local function playNotificationSound()
    local soundService = game:GetService("SoundService")
    local notificationSound = Instance.new("Sound")
    
    notificationSound.SoundId = "rbxassetid://8745692251"
    notificationSound.Volume = 0.5
    notificationSound.Parent = soundService

    notificationSound:Play()
end

local function sendNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3,
    })
end

for i = 1, 50 do
    local duck = game:GetService("Workspace").VansNew.ArisaQuest.ArisaQuestDucks["Scav_Duck" .. string.format("%02d", i)]
    if duck and duck:FindFirstChild("DuckCollectCollision") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = duck.DuckCollectCollision.CFrame
        wait(0.1)
    end
end

playNotificationSound()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-170, 3, 14)))
sendNotification("Alwi Hub Nituve", "If duck didn't collect executor again", 3)

setclipboard("https://discord.gg/UzcCfYky")
sendNotification("Alwi Hub Notive", "You have been sent the Discord link in clipboard", 3)
