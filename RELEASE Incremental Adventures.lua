local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("ALWI HUB | RELEASE Incremental Adventures")
local tab = window:CreateTab("Main")
local tabs = window:CreateTab("Others")

tab:CreateToggle("Auto Get smile",false,function(kys) 
_G.Stfu = kys
while _G.Stfu == true do
    wait() 
local args = {
    [1] = "Slime"
}

game:GetService("ReplicatedStorage").World1.Remotes.SlimeInteracted:FireServer(unpack(args))
end
end) 

tab:CreateButton("spammer smile",function() 
for sex = 1,100 do
_G.fuck = true
while _G.fuck == true do
     wait() 
local args = {
    [1] = "Slime"
}

game:GetService("ReplicatedStorage").World1.Remotes.SlimeInteracted:FireServer(unpack(args))
end
end
end) 
        
tab:CreateButton("Stop spammer smile",function() 
for sex = 1,100 do
_G.fuck = false
while _G.fuck == true do
     wait() 
local args = {
    [1] = "Slime"
}

game:GetService("ReplicatedStorage").World1.Remotes.SlimeInteracted:FireServer(unpack(args))
end
end
end) 

tab:CreateToggle("Auto Upgrade Smile",false,function(nega) 
_G.Skid = nega
while _G.Skid == true do
     wait() 
local args = {
    [1] = "MaxBuy"
}

game:GetService("ReplicatedStorage"):WaitForChild("World1"):WaitForChild("Remotes"):WaitForChild("SlimeUpgradeEvent"):FireServer(unpack(args))            
end  
end) 

tab:CreateToggle("Auto Upgrade Exp",false,function(getalife) 
_G.Skid2 = getalife
while _G.Skid2 == true do
     wait() 
local args = {
    [1] = "MaxBuy"
}

game:GetService("ReplicatedStorage"):WaitForChild("World1"):WaitForChild("Remotes"):WaitForChild("XpUpgradeEvent"):FireServer(unpack(args))
end  
end) 


tab:CreateButton("AntiAFK", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk V1";
    Text = "Turn On"; 
    Duration = 30;
})


local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())
end)
end)

-- just for auto claim for ugc
tabs:CreateToggle("Auto But UGC when compelete",false,function(value)
_G.Getalife = true
while _G.Getalife == true do
    task.wait(2) 
game:GetService("ReplicatedStorage"):WaitForChild("World1"):WaitForChild("Remotes"):WaitForChild("ClaimUGC"):FireServer()
end) 
    
-- credit by ikura thanks you arigato
-- Define variables with default values
local ClickingSpeed = 0
local x, y, m = 55, 65.5, 1
local loopActive = false

-- Auto-close error function
tabs:CreateToggle("Auto Close Error",false,function(value)
    loopActive = value
    spawn(function()
        while loopActive do
            local pp = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt")
            if pp and pp.AlertContents and pp.AlertContents.Footer and pp.AlertContents.Footer.Buttons and not pp.AlertContents.Footer.Buttons:FindFirstChild("2") then
                if pp.AlertContents.Footer.Buttons:FindFirstChild("1") then
                    local b1 = pp.AlertContents.Footer.Buttons[1].AbsolutePosition
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, true, game, 1)
                    wait()
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, false, game, 1)
                end
            end
            wait()
        end
    end)
end)

-- Auto-buy function
tabs:CreateToggle("Auto Buy",false,function(value)
    loopActive = value
    spawn(function()
        while loopActive do 
            if game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt:FindFirstChild("AlertContents") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents:FindFirstChild("Footer") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer:FindFirstChild("Buttons") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons:FindFirstChild("2") and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent and
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel") and tonumber(
                game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2]:FindFirstChild("ButtonContent").ButtonMiddleContent:FindFirstChildOfClass("TextLabel").Text) <= tonumber(m) then

                local pos = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator.Prompt.AlertContents.Footer.Buttons[2].AbsolutePosition
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + tonumber(x), pos.Y + tonumber(y), 0, true, game, 1)
                wait()
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + tonumber(x), pos.Y + tonumber(y), 0, false, game, 1)
                wait(ClickingSpeed)
            else
                wait()
            end
        end
    end)
end)
