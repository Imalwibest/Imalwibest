
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                                                      Alwi Hub | Visa Live di le Louvre")
local tab = window:CreateTab("Main") 


tab:CreateButton("Teleport To Shop", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-439.914673, 3.44662499, -410.925995, 0.0394068658, -9.28205246e-09, 0.999223232, 2.66414517e-08, 1, 8.23859558e-09, -0.999223232, 2.62960995e-08, 0.0394068658))
end) 


tab:CreateButton("UGC 1", function()
local args = {
    [1] = {
        [1] = {
            [1] = "\1",
            [2] = "\20\167w6?\207@\173\168\11\215\138\146\152\192\140",
            [3] = {
                [1] = "PurchaseItem",
                [2] = 17441652023,
                [3] = 0
            }
        },
        [2] = "\16"
    }
}

game:GetService("ReplicatedStorage"):FindFirstChild("remnantsofsiren_bridgenet2@1.0.1").dataRemoteEvent:FireServer(unpack(args))
end) 
tab:CreateButton("UGC 2", function()
local args = {
    [1] = {
        [1] = {
            [1] = "\1",
            [2] = "<Z\145\n\210\163Mt\148MN\252k`\140\203",
            [3] = {
                [1] = "PurchaseItem",
                [2] = 17417992825,
                [3] = 0
            }
        },
        [2] = "\16"
    }
}

game:GetService("ReplicatedStorage"):FindFirstChild("remnantsofsiren_bridgenet2@1.0.1").dataRemoteEvent:FireServer(unpack(args))
end) 
tab:CreateButton("UGC 3", function()
local args = {
    [1] = {
        [1] = {
            [1] = "\1",
            [2] = "\2$\28>\147\162M\21\172\31[\19E\219\229*",
            [3] = {
                [1] = "PurchaseItem",
                [2] = 17453200157,
                [3] = 0
            }
        },
        [2] = "\16"
    }
}

game:GetService("ReplicatedStorage"):FindFirstChild("remnantsofsiren_bridgenet2@1.0.1").dataRemoteEvent:FireServer(unpack(args))           
end) 

tab:CreateButton("UGC 4", function()
local args = {
    [1] = {
        [1] = {
            [1] = "\1",
            [2] = "\26\173\228\244\1427B\184\173cJ\2\181\17\178\234",
            [3] = {
                [1] = "PurchaseItem",
                [2] = 17611549814,
                [3] = 0
            }
        },
        [2] = "\16"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("remnantsofsiren_bridgenet2@1.0.1"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end) 
