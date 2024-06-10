getgenv().Config = {
    miscfeatures = false
}


local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | Lego Obby Fun")
local tabs = window:CreateTab("Main") 

tabs:CreateToggle("Auto Farm", false, function(state)
    task.spawn(function()
        Config.miscfeatures = state
        while true do
            if not Config.miscfeatures then return end
            local NotFound = false
            if state then
                getgenv().firetools = true
                spawn(function()
                    local Player = game.Players.LocalPlayer
                    while getgenv().firetools do
                        pcall(function()
                            local Tool = Player.Backpack:FindFirstChildWhichIsA("Tool")
                            if Tool and not Player.Character:FindFirstChildWhichIsA("Tool") then
                                Player.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(Tool)
                            end
                            if Player.Character:FindFirstChildWhichIsA("Tool") then
                                Player.Character:FindFirstChildWhichIsA("Tool"):Activate()
                            end
                        end)
                        wait(0.1)
                    end
                end)
            else
                getgenv().firetools = false
            end

            local player = game.Players.LocalPlayer
            local character = player.Character

            local parts = game.Workspace:GetDescendants()
            for _, part in ipairs(parts) do
                if part:IsA("BasePart") and part.Name == "Crate" then
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    character:SetPrimaryPartCFrame(part.CFrame + Vector3.new(0, 4, 0)) -- Adjust the Vector3.new(6, 4, 0) to set the desired offset
                    NotFound = true
                end
            end

            if not NotFound then
                game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-77.1903229, 421.690125, 570.752075, 0.0178226512, -2.48920706e-08, 0.999841154, 9.75325953e-09, 1, 2.47221674e-08, -0.999841154, 9.31109589e-09, 0.0178226512))
                wait(1)
                spawn(function()
                    for i, descendant in ipairs(workspace:GetDescendants()) do
                        if descendant:IsA("ProximityPrompt") then
                            fireproximityprompt(descendant, 20)
                        end
                    end
                end)
                task.wait(.2)
            end
            task.wait(.2)
        end
        task.wait(.2)
    end)
    task.wait(.2)
end)

tabs:CreateToggle("Auto Roll", false, function(NEGA) 
_G.Mywife = NEGA
while _G.Mywife == true do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("StatEvents"):WaitForChild("Roll"):InvokeServer()
wait() 
end
end) 

tabs:CreateToggle("Auto Collect Coin", false, function(value)
    if value then
        getgenv().autoCollect = true
        spawn(function()
            local Player = game.Players.LocalPlayer
            local character = Player.Character
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local parts = game.Workspace:GetDescendants()

            while getgenv().autoCollect do
                pcall(function()
                    for _, part in ipairs(parts) do
                        if part:IsA("BasePart") and part.Name == "Coin" then
                            part.CFrame = CFrame.new(humanoidRootPart.Position)
                        end
                    end
                end)
                wait() 
            end
        end)
    else
        getgenv().autoCollect = false
    end
end)

tabs:CreateButton("AntiAFK", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk";
    Text = "Turn On"; 
    Duration = 10;
})

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end) 

tabs:CreateButton("Zone End", function()

end) 
