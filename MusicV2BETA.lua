local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | MusicTestV2")
local tab = window:CreateTab("Main")
local tabs = window:CreateTab("Properties")
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
local volume = 100
local musicPlaying = false
local currentMusic = nil

-- select music
tab:CreateDropdown("Select Music", musicIds, function(option)
    currentMusic = Instance.new("Sound")
    currentMusic.SoundId = option
    currentMusic.Volume = volume / 100
    currentMusic.Looped = true
    currentMusic.Parent = game.Workspace
end)


-- Button Playing Music To playing
tab:CreateButton("Play Music", function()
    if currentMusic then
        currentMusic:Play()
        musicPlaying = true
    else
        print("Please select a music first.")
    end
end)

-- Button To Stop Playing music
tab:CreateButton("Stop Music", function()
    if currentMusic then
        currentMusic:Stop()
        musicPlaying = false
    end
end)

-- change into volume
tab:CreateSlider("Volume", 0, 100, volume, function(value)
    volume = value
    if currentMusic then
        currentMusic.Volume = volume / 100
    end
end)

-- stop the music
currentMusic.Ended:Connect(function()
    if musicPlaying then
        currentMusic:Play()
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "MusicV2[Beta]";
    Text = "Script Wass Open source You Can modify yourself!"; 
    Duration = 5;
})
 
