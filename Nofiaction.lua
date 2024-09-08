-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Frame (Notification Background)
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0.3, 0, 0.08, 0)
frame.Position = UDim2.new(0.65, 0, 0.8, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 201, 201)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.2
frame.ClipsDescendants = true

-- Add UIStroke (white border)
local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 4

-- Make the frame rounded
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.2, 0)
uiCorner.Parent = frame

-- Create the TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = frame
textLabel.Size = UDim2.new(0.75, 0, 1, 0)
textLabel.Position = UDim2.new(0.15, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Message"
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.GothamBold

-- Add an Image (Icon)
local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = frame
imageLabel.Size = UDim2.new(0.1, 0, 0.7, 0)
imageLabel.Position = UDim2.new(0.85, 0, 0.15, 0)
imageLabel.BackgroundTransparency = 1

-- TweenService for Animating the Notification
local TweenService = game:GetService("TweenService")

-- Create tweens for sliding the notification
local slideInTween = TweenService:Create(frame, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.65, 0, 0.8, 0)})
local slideOutTween = TweenService:Create(frame, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.65, 0, 1.2, 0)})

-- Function to show the notification
local function showNotification(messageType, messageText)
    local color, iconId = Color3.fromRGB(0, 201, 201), "rbxassetid://0"
    
    if messageType == "error" then
        color, iconId = Color3.fromRGB(255, 0, 0), "rbxassetid://INSERT_RED_CIRCLE_ICON_ID"
    elseif messageType == "info" then
        color, iconId = Color3.fromRGB(0, 0, 255), "rbxassetid://INSERT_SPEECH_BUBBLE_ICON_ID"
    elseif messageType == "warning" then
        color, iconId = Color3.fromRGB(255, 255, 0), "rbxassetid://INSERT_WARNING_ICON_ID"
    elseif messageType == "success" then
        color, iconId = Color3.fromRGB(0, 255, 0), "rbxassetid://INSERT_HEART_ICON_ID"
    end
    
    frame.BackgroundColor3 = color
    imageLabel.Image = iconId
    textLabel.Text = messageText
    
    frame.Position = UDim2.new(1.1, 0, 0.8, 0)
    slideInTween:Play()
    
    wait(5)
    slideOutTween:Play()
end

-- Example usage
-- showNotification("error", "An error occurred!")
-- wait(3)
-- showNotification("info", "Here is some information.")
-- wait(3)
-- showNotification("warning", "This is a warning!")
-- wait(3)
-- showNotification("success", "Operation successful!")
