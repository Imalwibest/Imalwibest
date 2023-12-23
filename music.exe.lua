local musicId = "rbxassetid://1837403780"
local volume = math.huge

function playMusic()
    local music = Instance.new("Sound", game)
    music.SoundId = musicId
    music.Volume = volume
    music:Play()

    music.Ended:Connect(function()
        wait(math.huge) 
    end)
end

playMusic()
