local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | Mine Race simulator")
local tab = window:CreateTab("Main") 
local tabs = window:CreateTab("Teleport") 
local w = window:CreateTab("Teleport") 
tab:CreateToggle("Infinite gems",false,function(Imagine) 
local args = {
    [1] = "Settings.Update",
    [2] = "AutoMine",
    [3] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))


_G.Mine = Imagine
while _G.Mine == true do
   wait()
   local args = {
    [1] = "Quarry.ReachedSection",
    [2] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end
end) 

tab:CreateButton("Spammer gems", function()
_G.Spammer = true
while _G.Spammer == true do
     wait() 
local args = {
    [1] = "Quarry.ReachedSection",
    [2] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end
end)

tab:CreateButton("Stop spammer gems", function()
_G.Spammer = false
while _G.Spammer == true do
     wait() 
local args = {
    [1] = "Quarry.ReachedSection",
    [2] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end
end) 

tab:CreateButton("Delete gems Pop", function()
local path = game:GetService("Players").LocalPlayer.PlayerGui.Effects
if path then path:Destroy() end
end) 

tab:CreateButton("AntiAFK", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk";
    Text = "Turn On"; 
    Duration = 30;
})

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end)

tabs:CreateButton("World 2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(127.379501, 20.3213367, 173.227768, 0.877974212, -3.02595531e-08, -0.478707939, 3.53993634e-08, 1, 1.71331427e-09, 0.478707939, -1.84502031e-08, 0.877974212)
end)

tabs:CreateButton("World 3", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(299.3255, 19.2410488, 56.464241, -0.155082434, -2.39877558e-08, -0.987901509, -3.31593668e-08, 1, -1.90761114e-08, 0.987901509, 2.97998195e-08, -0.155082434)
end) 

tabs:CreateButton("World 4", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.41246, 18.4624977, -242.676102, 0.879781663, -2.83151969e-09, 0.475378007, -1.02773856e-09, 1, 7.85838861e-09, -0.475378007, -7.40223038e-09, 0.879781663)
end)


tabs:CreateButton("World 5", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8.40800667, 16.2501469, -33.9341393, -0.806985676, 1.07968248e-07, -0.590571046, 5.14486018e-08, 1, 1.12518158e-07, 0.590571046, 6.04164896e-08, -0.806985676)
end)


tabs:CreateButton("World 6", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8.40800667, 16.2501469, -33.9341393, -0.806985676, 1.07968248e-07, -0.590571046, 5.14486018e-08, 1, 1.12518158e-07, 0.590571046, 6.04164896e-08, -0.806985676)
end) 

tabs:CreateButton("World 7", function()
game.Players.LocalPlayer.Character.HumanoidRootPargame.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(127.379501, 20.3213367, 173.227768, 0.877974212, -3.02595531e-08, -0.478707939, 3.53993634e-08, 1, 1.71331427e-09, 0.478707939, -1.84502031e-08, 0.877974212)
end)

w:CreateButton("Join My discord", function()

end) 


game.StarterGui:SetCore("SendNotification", {
    Title = "Alwi hub | Mine Race Sim 💎 [FREE UGC] V.1.1";
    Text = "Thank You for executor My script"; -- what the text says (ofc)
    Duration = 20;
})



