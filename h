setclipboard("https://discord.gg/vscePW7v")
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

if true then
    if getgenv().AlwiHub["AntiAFK"] then
        player.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end

    if true then
        if getgenv().AlwiHub["Auto Candy"] then
            task.spawn(function()
                while task.wait(getgenv().AlwiHub["Delay"]) do
                    local character = player.Character or player.CharacterAdded:Wait()
                    local visitedCoins = {}
                    local parts = {}

                    for _, v in workspace.Candy:GetChildren() do
                        if v.Name == "Part" and v:IsA("BasePart") and not visitedCoins[v] then
                            table.insert(parts, v)
                        end
                    end

                    -- Randomize the parts array
                    for i = #parts, 2, -1 do
                        local j = math.random(1, i)
                        parts[i], parts[j] = parts[j], parts[i]
                    end

                    for _, v in ipairs(parts) do
                        character:SetPrimaryPartCFrame(v.CFrame)
                        visitedCoins[v] = true
                    end
                end
            end)
        end

        if true then
            if getgenv().AlwiHub["Auto Multi Candy Increase"] then
                task.spawn(function()
                    while task.wait(getgenv().AlwiHub["Delay Multi Candy Increase"]) do
                        game:GetService("ReplicatedStorage").Events.BuyHalloweenItem:FireServer(
                            "1Rebirth", 1
                        )
                    end
                end)
            end
        end
    end
end
