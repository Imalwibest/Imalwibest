-- Made By Byeveryone/alwi#3737 This source script For rejoin after kicked or lost connection join my discord https://discord.com/invite/RmKR5STDnG
local function Rejoin()
    pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end)
end

local function RejoinIfPrompt()
    local success, Dir = pcall(function()
        return game:GetService("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay")
    end)

    if success then
        Dir.DescendantAdded:Connect(function()
            spawn(Rejoin)
        end)

        if #Dir:GetChildren() > 0 then
            spawn(Rejoin)
        end
    else
        warn("RobloxPromptGui or promptOverlay not found.")
    end
end

local function HandlePlayerRemoving(plr)
    if plr == game.Players.LocalPlayer then
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
end

game.Players.LocalPlayer.CharacterRemoving:Connect(Rejoin)
game.Players.PlayerRemoving:Connect(HandlePlayerRemoving)
spawn(RejoinIfPrompt)
