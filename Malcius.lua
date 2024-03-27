
local k = "Window"
local y = "SimpleSpy2"
local z = "TurtleSpyGUI"
local w = "SimpleSpy3"
local x = "RemoteSpy"
local s = game.Players.LocalPlayer

local scT = Instance.new("ScreenGui")
local scTFrame = Instance.new("Frame")
local ExCTextBox = Instance.new("TextBox")
local jogLabel = Instance.new("TextLabel")

local player = game.Players.LocalPlayer

local ExC = Instance.new("ScreenGui")
ExC.Name = "Secret"
ExC.Parent = player.PlayerGui

local ExCTextBox = Instance.new("TextBox")
ExCTextBox.Size = UDim2.new(0, 170, 0, 47)
ExCTextBox.Position = UDim2.new(0, 327, 0, 183)
ExCTextBox.BackgroundTransparency = 0.5
ExCTextBox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)  
ExCTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)  
ExCTextBox.Text = "Put ID Here"
ExCTextBox.Font = Enum.Font.SourceSans
ExCTextBox.TextSize = 18
ExCTextBox.Parent = ExC

local function executeRemote()
    local args = {
    [1] = tonumber(ExCTextBox.Text),
}

game:GetService("ReplicatedStorage"):WaitForChild("Orion"):WaitForChild("node_modules"):WaitForChild("@supersocial"):WaitForChild("netwire"):WaitForChild("NetWire"):WaitForChild("Remotes"):WaitForChild("UGCService"):WaitForChild("RF"):WaitForChild("PurchaseUGC"):InvokeServer(unpack(args))
end

ExCTextBox.FocusLost:Connect(executeRemote)

local jog = Instance.new("ScreenGui")
jog.Name = "Secret"
jog.Parent = player.PlayerGui

local jogLabel = Instance.new("TextLabel")
jogLabel.Text = "PUT UGC ID BELOW"
jogLabel.Size = UDim2.new(1, 0, 1, 0)
jogLabel.Position = UDim2.new(0, 2, 0, -7)
jogLabel.TextColor3 = Color3.new(1, 1, 1)
jogLabel.BackgroundTransparency = 1
jogLabel.Parent = jog

game:GetService("CoreGui").DescendantAdded:Connect(function(descendant)
    if descendant.Name == "WizardLibrary" or descendant.Name == k or descendant.Name == y or descendant.Name == z or descendant.Name == w or descendant.Name == x then
        s:Kick("Nope. If you execute this again, I'm going to remove you. It's recorded on my Discord log. Thank you.")
    end
end)
