local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi is gay.lua")
local tabs = window:CreateTab("Secret Exe.lua") 

tabs:CreateToggle("Kill all", false, function(isEnabled) 
    _G.KillAllEnabled = isEnabled
    if _G.KillAllEnabled then
        while _G.KillAllEnabled do
            for _, player in ipairs(game.Players:GetPlayers()) do
                local args = {
                    [1] = {
                        [1] = game.Players.LocalPlayer
                    },
                    [2] = player,
                    [3] = player.Character.Humanoid,
                    [4] = 999
                }
                game:GetService("ReplicatedStorage").Remotes.DamagePlayer:FireServer(unpack(args))
                wait() 
            end
        end
    end
end) 

tabs:CreateButton("Kill all 1x", function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        local args = {
            [1] = {
                [1] = game.Players.LocalPlayer
            },
            [2] = player,
            [3] = player.Character.Humanoid,
            [4] = 999
        }
        game:GetService("ReplicatedStorage").Remotes.DamagePlayer:FireServer(unpack(args))
    end
end) 

tabs:CreateToggle("Open Create FAST", false, function(isEnabled) 
    _G.OpenCreateEnabled = isEnabled
    spawn(function()
        while _G.OpenCreateEnabled do
            wait() 
            for i, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    fireproximityprompt(descendant)
                end
            end
        end
    end)
end)

tabs:CreateToggle("inf money", false, function(isEnabled) 
    _G.InfMoneyEnabled = isEnabled
    if _G.InfMoneyEnabled then
        while _G.InfMoneyEnabled do
            wait() 
            local args = {
                [1] = "UGC"
            }
            game:GetService("ReplicatedStorage").Remotes.ClaimDailyQuest:FireServer(unpack(args))
        end
    end
end)
