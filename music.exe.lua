
local musicId = "rbxassetid://1837403780"
local volume =  100

function playMusic()
    local music = Instance.new("Sound", game)
    music.SoundId = musicId
    music.Volume = volume
    music:Play()

    music.Ended:Connect(function()
        wait(200) 
    end)
end

playMusic()
