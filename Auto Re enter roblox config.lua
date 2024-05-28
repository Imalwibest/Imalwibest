-- Made By Byeveryone/alwi#3737 This source script For rejoin after kicked or lost connection join my discord https://discord.com/invite/RmKR5STDnG

local function ikura()
    local g = game
    pcall(function()
        g:GetService("TeleportService"):TeleportToPlaceInstance(g.PlaceId, g.JobId, g.Players.LocalPlayer)
    end)
end

local function rylu()
    local s, d = pcall(function()
        return game:GetService("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay")
    end)

    if s then
        d.DescendantAdded:Connect(function()
            spawn(ikura)
        end)

        if #d:GetChildren() > 0 then
            spawn(ikura)
        end
    else
        warn("RobloxPromptGui or promptOverlay not found.")
    end
end

local function alwi(plr)
    if plr == game.Players.LocalPlayer then
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end

game.Players.LocalPlayer.CharacterRemoving:Connect(ikura)
game.Players.PlayerRemoving:Connect(alwi)
spawn(rylu)
