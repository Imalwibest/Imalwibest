local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                                         ALWI HUB | Ball Tag Auto Claim UGC! ")
local tabs = window:CreateTab("Main") 
tabs:CreateToggle("Auto Claim UGC QUEST 2",false,function(nega) 
_G.gay = nega
while _G.gay == true do
     wait() 
local args = {
    [1] = 15685228896
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimUGC"):FireServer(unpack(args))
end
end) 


tabs:CreateToggle("Auto Claim UGC QUEST 1",false,function(kys) 
_G.gay = kys
while _G.gay == true do
    wait() 
local args = {
    [1] = 15676593548
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimUGC"):FireServer(unpack(args))
end
end) 

tabs:CreateButton("AntiAFK", function()
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
