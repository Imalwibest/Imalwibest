-- Made By Byeveryone/alwi#3737 This source script For rejoin after kicked or lost connection join my discord https://discord.com/invite/RmKR5STDnG

local function alwi()
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
            spawn(FallbackTeleport)
        end)

        if #d:GetChildren() > 0 then
            spawn(FallbackTeleport)
        end
    else
        warn("RobloxPromptGui or promptOverlay not found.")
    end
end

local function ikura(plr)
    if plr == game.Players.LocalPlayer then
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end

game.Players.LocalPlayer.CharacterRemoving:Connect(alwi)
game.Players.PlayerRemoving:Connect(ikura)
spawn(rylu)
