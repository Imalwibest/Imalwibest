local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Auto exc completely success";
    Text = "You know Alwi is love furry :3"; 
    Duration = 30;
})

_G.AutoExecutorPublicSources = true
while _G.AutoExecutorPublicSources == true do
    wait() 
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RE"):WaitForChild("FriendInvite"):FireServer()
wait() 
game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.BubbleService.RE.Clicked:FireServer()
wait() 
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RE"):WaitForChild("ClaimQuest"):FireServer()
end



