local function loadScript(choice)
    if choice == "Mobile/Android" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Classic%20Event%20Roblox.lua", true))()
    elseif choice == "Emulator/PC" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Roblox%20classic%20EventPC.lua", true))()
    else
        print("Invalid choice.")
    end
end


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.BorderSizePixel = 5
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Text = "Select Device"
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.TextSize = 24
title.Parent = frame

local mobileButton = Instance.new("TextButton")
mobileButton.Text = "Mobile/Android"
mobileButton.Size = UDim2.new(0.8, 0, 0.2, 0)
mobileButton.Position = UDim2.new(0.1, 0, 0.3, 0)
mobileButton.Parent = frame
mobileButton.MouseButton1Click:Connect(function()
    loadScript("Mobile/Android")
    screenGui:Destroy() 
end)

local pcButton = Instance.new("TextButton")
pcButton.Text = "Emulator/PC"
pcButton.Size = UDim2.new(0.8, 0, 0.2, 0)
pcButton.Position = UDim2.new(0.1, 0, 0.6, 0)
pcButton.Parent = frame
pcButton.MouseButton1Click:Connect(function()
    loadScript("Emulator/PC")
    screenGui:Destroy() 
end)

local toggleButton = Instance.new("TextButton")
toggleButton.Text = "X"
toggleButton.Size = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.Position = UDim2.new(0.9, 0, 0, 0)
toggleButton.Parent = frame
toggleButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() 
end)
