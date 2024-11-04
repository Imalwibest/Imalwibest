local cloneref = cloneref or function(...) return ... end -- protect variabel
local function playNotificationSound()
    local soundService = cloneref(game:GetService("SoundService")) 
    local notificationSound = cloneref(Instance.new("Sound")) 
    
    notificationSound.SoundId = "rbxassetid://8745692251"
    notificationSound.Volume = 0.5
    notificationSound.Parent = soundService

    notificationSound:Play()
end

local function sendNotification(title, message)
    cloneref(game:GetService("StarterGui")):SetCore("SendNotification", {
        Title = title,
        Text = message,
        Icon = "http://www.roblox.com/asset/?id=8904334671",
        Duration = 5,
    })
end

local adonisFound = false

local function checkForAdonis()
    for _, v in pairs(game:GetDescendants()) do
        if adonisFound then return end
        if string.find(v.Name:upper(), "ADONIS") or (v:IsA("ImageButton") and v.Image == "rbxassetid://357249130") then
            adonisFound = true
            sendNotification("Alwi hub Adonis Finder", "Adonis finder detected Try using !buyitem or !buyasset")
playNotificationSound()
        end
    end

    for _, d in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if adonisFound then return end
        if d:IsA("RemoteEvent") and d:FindFirstChild("__FUNCTION") then
            adonisFound = true
            sendNotification("Alwi Hub Adonis Finder", "Adonis finder detected Try using !buyitem or !buyasset")
playNotificationSound()
        end
    end
end

task.spawn(checkForAdonis)
