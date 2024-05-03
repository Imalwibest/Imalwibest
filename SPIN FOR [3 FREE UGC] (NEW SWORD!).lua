local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                                                                   ALWI HUB | SPIN FOR [3 FREE UGC] (NEW SWORD!)")
local tab = window:CreateTab("Main")
local tabs = window:CreateTab("Misc")
local w = window:CreateTab("info/credit")

tab:CreateToggle("Auto spin",false,function(hi) 
_G.HiMyRylu = hi
while _G.HiMyRylu == true do
    wait() 
game:GetService("ReplicatedStorage"):WaitForChild("SpinnerContents"):WaitForChild("RemoteFunction"):InvokeServer()
end
end)
tab:CreateButton("spammer spin", function()
while wait(0.1) do
game:GetService("ReplicatedStorage"):WaitForChild("SpinnerContents"):WaitForChild("RemoteFunction"):InvokeServer()
end
end) 

tab:CreateButton("Redeem Code", function()
local codes = {"SPINS10", "SPINS20"}  

local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Code_Check")

for _, code in ipairs(codes) do
    remotes:FireServer(code)
end
end) 
tab:CreateButton("Buy Product Gamepass Free", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/wynerdV2.lua",true))()
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
tabs:CreateToggle("[If you win the spin] Auto Sword Bat",false,function(claimV3) 
_G.Getalife = claimV3
while _G.Getalife == true do
    task.wait(2) 
local args = {
    [1] = "Sword"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Claim"):FireServer(unpack(args))
end
end) 

tabs:CreateToggle("[If you win the spin] Auto Claim Black Crown",false,function(claim) 
_G.Getalife = claim
while _G.Getalife == true do
    task.wait(2) 
local args = {
    [1] = "Black"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Claim"):FireServer(unpack(args))
end
end) 
    

tabs:CreateToggle("[If you win the spin] Auto Claim Blue Crown",false,function(skidtokys) 
_G.wannaskid = skidtokys
while _G.wannaskid == true do
    task.wait(2) 
local args = {
    [1] = "Blue"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Claim"):FireServer(unpack(args))
end
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

w:CreateToggle("Hide Player",false,function(Fu) 
        _G.Fu = Fu
while _G.Fu and  task.wait() do

for i,v in pairs(game.Players:GetPlayers()) do
if v.Name ~= game.Players.LocalPlayer.Name and v.Character then
v.Character:Destroy()
end
end
end
end) 

w:CreateButton("Console", function() 
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)

w:CreateButton("Join My discord", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 

game.StarterGui:SetCore("SendNotification", {
    Title = "Alwi Hub | SPIN FOR UGC";
    Text = "Click the ugc before spin"; 
    Duration = 5;
})
wait() 
game.StarterGui:SetCore("SendNotification", {
    Title = "You need Join Group why? ";
    Text = "For 2x luck lol xd"; 
    Duration = 6;
})
wait() 
game.StarterGui:SetCore("SendNotification", {
    Title = "This script open source";
    Text = "script by made byeveryone [Alwi]"; 
    Duration = 8;
})
