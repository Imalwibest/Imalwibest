local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

while wait() do
game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.BubbleService.RE.Clicked:FireServer()

game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.5.1"].knit.Services.SpinService.RF.Spin:InvokeServer() 

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RE"):WaitForChild("FriendInvite"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RE"):WaitForChild("ClaimQuest"):FireServer()
wait() 
end
