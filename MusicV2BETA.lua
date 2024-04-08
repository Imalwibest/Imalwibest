-- ui libary 
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | MusicTestV2")
local tab = window:CreateTab("Main")
local tabs = window:CreateTab("Button Play") 
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

-- toggle main play and stop 
tabs:Search()
local musicToggle = tabs:CreateToggle("HR - EEYUH", false, function(state)
    local musicId = "rbxassetid://16190782181" 
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("kirkiimad - i love (tiktok version)", false, function(state)
    local musicId = "rbxassetid://15689439571"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("FNAF 2 Song", false, function(state)
    local musicId = "rbxassetid://6913550990"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("A Heart Worth Saving", false, function(state)
    local musicId = "rbxassetid://1836807218"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("We Could Be Kings (a)", false, function(state)
    local musicId = "rbxassetid://1840030788"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("Parry Gripp - Taco Bot 3000", false, function(state)
    local musicId = "rbxassetid://9245552700"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("WRLD - Hang Up (feat. Savoi)", false, function(state)
    local musicId = "WRLD - Hang Up (feat. Savoi)"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("Night Out", false, function(state)
    local musicId = "rbxassetid://6703926669"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("VIP Me (a)", false, function(state)
    local musicId = "rbxassetid://1839920066"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("Tranical Endl", false, function(state)
    local musicId = "rbxassetid://1837984979"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("Wherever You Are (a)", false, function(state)
    local musicId = "rbxassetid://6872126938"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

local musicToggle = tabs:CreateToggle("LaserGun_10", false, function(state)
    local musicId = "rbxassetid://1843324953"
    local volume = 100

    if state then
        if not currentMusic then
            currentMusic = Instance.new("Sound", game)
            currentMusic.SoundId = musicId
            currentMusic.Volume = volume
            currentMusic:Play()
        end
        musicPlaying = true
    else
        if currentMusic then
            currentMusic:Stop()
            currentMusic = nil
        end
        musicPlaying = false
    end
end)

-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "MusicV2[Beta]";
    Text = "Script Wass Open source You Can modify yourself!"; 
    Duration = 5;
})
