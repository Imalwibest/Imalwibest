local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local messageLabel = Instance.new("TextLabel")
local deestoryButton = Instance.new("TextButton")
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
messageLabel.Text = "We've disconnected. Feel free to check out Alwi Hub > Reblues > Chelpus. [Reminder: true]"
messageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
messageLabel.TextScaled = true
messageLabel.BackgroundTransparency = 1
messageLabel.Parent = frame

deestoryButton.Size = UDim2.new(0.45, 0, 0.2, 0)
deestoryButton.Position = UDim2.new(0.05, 0, 0.7, 0)
deestoryButton.Text = "[Deestory UI]"
deestoryButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
deestoryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deestoryButton.Parent = frame
deestoryButton.MouseButton1Click:Connect(function()
    print("Deestory UI button clicked!")
    screenGui:Destroy()
end)

discordButton.Size = UDim2.new(0.45, 0, 0.2, 0)
discordButton.Position = UDim2.new(0.5, 0, 0.7, 0)
discordButton.Text = "[Support Discord]"
discordButton.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Parent = frame
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/cpXUTmMXXd") 
    print("Discord link copied to clipboard!")
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
