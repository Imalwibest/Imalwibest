local function loadScript(choice)
    local success = false
    if choice == "Mobile/Android" then
        success = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Classic%20Event%20Roblox.lua", true))()
        end)
    elseif choice == "Emulator/PC" then
        success = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Roblox%20classic%20EventPC.lua", true))()
        end)
    else
        print("Invalid choice.")
    end
    
    if success then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Script Loaded Successfully";
            Text = "The selected script has been loaded successfully."; 
            Duration = 5;
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Script Load Failed";
            Text = "The selected script failed to load. Please try again later."; 
            Duration = 5;
        })
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
toggleButton.TextColor3 = Color3.new(1, 0, 0) 
toggleButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() 
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Local furry :3";
    Text = "Please Use Executor Fluxus! Report Owner script no work"; 
    Duration = 10;
    Button1 = "Yes";
})
