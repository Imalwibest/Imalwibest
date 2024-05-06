local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                         ALWI HUB | S.F.S.T") 
local tab = window:CreateTab("Main")
local tabs = window:CreateTab("Misc")
local w = window:CreateTab("info/credit")

tab:CreateButton("Sword Aura [Troll🤓]", function()
local range = 9999999999

local player = game:GetService("Players").LocalPlayer

game:GetService("RunService").RenderStepped:Connect(function()
    local p = game.Players:GetPlayers()
    for i = 2, #p do local v = p[i].Character
        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
                for i,v in next, v:GetChildren() do
                    if v:IsA("BasePart") then
                        firetouchinterest(tool.Handle,v,0)
                        firetouchinterest(tool.Handle,v,1)
                    end
                end
            end
        end
    end
end)
end) 

tab:CreateToggle("Auto Spin",false,function(claim) 
    _G.Boykisser = claim
    while _G.Boykisser == true do
        wait() 
        game:GetService("ReplicatedStorage"):WaitForChild("RequestRoll"):InvokeServer()
    end
end)

tab:CreateToggle("Auto FF",false,function(sex) 
    _G.rylumysex = sex
    while _G.rylumysex == true do
        wait() 
        game:GetService("ReplicatedStorage"):WaitForChild("ActivateForcefield"):FireServer()
    end
end) 

tab:CreateToggle("Freeze",false,function(LMAO) 
    for _, player in pairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = LMAO
                end
            end
        end
    end
end) 

tab:CreateButton("Buy product Gamepass [Free]", function()
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
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

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


