-- h

local VirtualUser = game:GetService("VirtualUser")

if getgenv().AlwiHub["AntiAFK"] then
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

while getgenv().AlwiHub["Auto Candy"] and task.wait(getgenv().AlwiHub["Delay"]) do
    player = game.Players.LocalPlayer
    character = player.Character or player.CharacterAdded:Wait()
    visitedCoins = {}
    parts = {}

    for _, v in workspace.Candy:GetChildren() do
        if v.Name == "Part" and v:IsA("BasePart") and not visitedCoins[v] then
            table.insert(parts, v)
        end
    end

    for i = #parts, 2, -1 do
        j = math.random(1, i)
        parts[i], parts[j] = parts[j], parts[i]
    end

    for _, v in ipairs(parts) do
        character:SetPrimaryPartCFrame(v.CFrame)
        visitedCoins[v] = true
    end
end

if getgenv().AlwiHub["Auto Multi Candy Increase"] then
    task.spawn(function()
        while task.wait(getgenv().AlwiHub["Delay Multi Candy Increase"]) do
            game:GetService("ReplicatedStorage").Events.BuyHalloweenItem:FireServer("1Rebirth", 1)
        end
    end)
end
