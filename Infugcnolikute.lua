loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/AutoClaimUGC.lua"))()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-546.763672, 148.205139, -11211.0283, 0.988771915, -0.125903726, 0.0804882646, -1.93564431e-09, 0.538625777, 0.842545092, -0.149432629, -0.833084941, 0.532578051)
wait(3) 
local args = {
    [1] = "UGCLimited"
}

game:GetService("ReplicatedStorage"):WaitForChild("SpecsaversRewardComms"):WaitForChild("RE"):WaitForChild("PlayerRewardObtained"):FireServer(unpack(args))
wait(8) 
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
