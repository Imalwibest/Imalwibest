local lp = game:GetService("Players").LocalPlayer

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end
    elseif strl == "me" then
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found,v)
            end
        end
    else
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == strl or v.DisplayName:lower():sub(1, #String) == strl then
                table.insert(Found,v)
            end
        end
    end
    return Found
end

local h = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

h.Name = "h"
h.Parent = game:GetService("CoreGui")
h.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = h
Main.Active = true
Main.Draggable = true
Main.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.Size = UDim2.new(0, 300, 0, 150)
Main.Image = "rbxassetid://16336200609"

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(0, 90, 0)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(1, 0, 0, 30)

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.295454562, 0)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "Fling GUI"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

TextBox.Parent = Main
TextBox.BackgroundColor3 = Color3.fromRGB(0, 99, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.05, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.9, 0, 0.3, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Input username or display"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 255, 20)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(0, 99, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.1, 0, 0.7, 0)
TextButton.Size = UDim2.new(0.8, 0, 0.2, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Fling player"
TextButton.TextColor3 = Color3.fromRGB(0, 255, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextButton.MouseButton1Click:Connect(function()
    local Target = gplr(TextBox.Text)
    if Target[1] then
        Target = Target[1]
     
     local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

local LocalPlayer = Services.Players.LocalPlayer

   local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 1 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 1 then
               if Detected == false then
             
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)

        local BV = Instance.new("BodyVelocity")
        BV.Name = "Xxx"
        BV.Parent = lp
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
     
        local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(20000,20000,20000)
        Thrust.Name = "YeetForce"
        repeat
            lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
            Thrust.Location = Target.Character.HumanoidRootPart.Position
            game:GetService("RunService").Heartbeat:wait()
        until not Target.Character:FindFirstChild("Head")
    else
        
    end
end)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 36, 0, 37)
closeButton.Position = UDim2.new(0.5, 113, 0.5, -74)
closeButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = Main
closeButton.MouseButton1Click:Connect(function()
h:Destroy()
end)

while wait(1) do
if game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 then
local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})


local LocalPlayer = Services.Players.LocalPlayer

local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 1 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 1 then
               if Detected == false then
             
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = true
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = true
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)
end
end
