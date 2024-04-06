local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | MusicTestV2")
local tab = window:CreateTab("Main")
tab:Search()

-- music id you can add id from here
local musicIds = {
    "rbxassetid://16190782181",
    "rbxassetid://15689439571",
    "rbxassetid://6913550990",
    "rbxassetid://1836807218",
    "rbxassetid://1840030788",
    "rbxassetid://5410084188",
    "rbxassetid://9245552700",
    "rbxassetid://6703926669",
    "rbxassetid://1843324953",
    "rbxassetid://6872126938",
    "rbxassetid://1837984979",
    "rbxassetid://1838028467",
    "rbxassetid://1839920066"
}
local volume = 100 -- Set initial volume to 100
local musicPlaying = false
local currentMusic = nil

-- select music
local musicDropdown = tab:CreateDropdown("Select Music", musicIds, function(option)
    if currentMusic then
        currentMusic:Destroy()
    end
    currentMusic = Instance.new("Sound")
    currentMusic.SoundId = option
    currentMusic.Volume = volume / 100 -- Set volume based on 100 scale
    currentMusic.Looped = true
    currentMusic.Parent = game.Workspace
end)

-- Button Playing Music To playing
local playButton = tab:CreateButton("Play Music", function()
    if currentMusic then
        currentMusic:Play()
        musicPlaying = true
    else
        print("Please select a music first.")
    end
end)

-- Button To Stop Playing music
local stopButton = tab:CreateButton("Stop Music", function()
    if currentMusic then
        currentMusic:Stop()
        musicPlaying = false
    end
end)

-- Pause/Resume button
local pauseResumeButton = tab:CreateButton("Pause/Resume", function()
    if currentMusic then
        if musicPlaying then
            currentMusic:Pause()
            musicPlaying = false
        else
            currentMusic:Resume()
            musicPlaying = true
        end
    end
end)

-- Mute/Unmute button
local muteUnmuteButton = tab:CreateButton("Mute/Unmute", function()
    if currentMusic then
        currentMusic.Volume = currentMusic.Volume == 0 and volume / 100 or 0
    end
end)

-- change into volume
local volumeSlider = tab:CreateSlider("Volume", 0, 100, volume, function(value)
    volume = value
    if currentMusic then
        currentMusic.Volume = volume / 100 -- Set volume based on 100 scale
    end
end)

-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "MusicV2[Beta]";
    Text = "Script Wass Open source You Can modify yourself!"; 
    Duration = 5;
})
