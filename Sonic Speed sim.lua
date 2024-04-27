local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                                         ALWI HUB | Sonic Simulator Free UGC)
local tab = window:CreateTab("Main")
tab:CreateButton("Goto Event", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-745.615906, 7.0711689, -15089.8271, -0.771730185, -2.88349984e-05, -0.635950089, -7.28238501e-06, 1, -3.65043779e-05, 0.635950089, -2.35402968e-05, -0.771730185))
end) 

tab:CreateButton("Goto Area sIncrement", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(1356.27344, 2174.16333, -11815.2988, -0.31502974, 1.15221665e-05, 0.949082017, -2.78406242e-06, 1, -1.30644457e-05, -0.949082017, -6.75798947e-06, -0.31502974))
end) 

tab:CreateToggle("Auto Increment",false,function(wife) 
_G.OwO = wife
while _G.OwO == true do
while task.wait () do
local args = {
    [1] = "IncrementPlayerData",
    [2] = {
        ["max"] = 5,
        ["dataPath"] = {
            [1] = "HeldObjects"
        },
        ["delta"] = 1,
        ["dataKey"] = "ParamountDumbells"
    }
}

game:GetService("ReplicatedStorage").Knit.Services.MapStateService.RE.OnStateAction:FireServer(unpack(args))
end
end) 

tab:CreateButton("Goto Claim UGC [WHEN QUEST IS DONE]", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(1141.39465, 2175.41748, -11684.8535, -0.932385087, -2.80364588e-06, -0.361466914, -2.7095391e-06, 1, -7.67185782e-07, 0.361466914, 2.64096286e-07, -0.932385087))
end) 
