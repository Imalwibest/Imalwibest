local start = os.clock()

--Why you stalk me code, I'm bad I know.
local BackDesign = "http://www.roblox.com/asset/?id=13398032599"
local Shadow = "http://www.roblox.com/asset/?id=13398032599"
local DotDesc = "http://www.roblox.com/asset/?id=13398032599"
local InfLogo = "http://www.roblox.com/asset/?id=13398032599"
local SearchI = "http://www.roblox.com/asset/?id=13398032599"
local ColorIcon = "http://www.roblox.com/asset/?id=13398032599"
local CProvider = game:GetService("ContentProvider")
CProvider:PreloadAsync({
    BackDesign, Shadow, DotDesc, InfLogo, SearchI, ColorIcon
})

if ToDels_ then
for i, v in pairs(ToDels_) do
pcall(function()
    v:Destroy()
    end)
end
end

getgenv().ToDels_ = {}
-- GUI's
local gui = script.Parent

-- defining Services
local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

local RunService = game:GetService("RunService")

-- Player
local players = game:GetService("Players")
local Players = game:GetService("Players")
local lplayer = players.LocalPlayer
local lhum = lplayer.Character:FindFirstChildWhichIsA("Humanoid")
local lhump = lplayer.Character:FindFirstChild("HumanoidRootPart")

local Mouse = lplayer:GetMouse()

local mouse = lplayer:GetMouse()

-- defining CoreGui
if RunService:IsStudio() then
-- In Studio we use PlayerGui Instead of CoreGui
CoreGui = player:WaitForChild("PlayerGui")
else
-- If its executed in a game then we use CoreGui (no lacking perms)
    CoreGui = game.CoreGui
end

local Lib = {}

getgenv().GetFullName = function (Instances)
local charset = {}

for i = 48, 57 do
table.insert(charset, string.char(i))
end

for i = 65, 90 do
table.insert(charset, string.char(i))
end

for i = 97, 122 do
table.insert(charset, string.char(i))
end

local RPath = Instances:GetFullName()
local SPath = string.split(RPath, ".")
local NewStr = "game"
local LCheck = false

pcall(function()
    for Index, Value in pairs(SPath) do
    local SChar = false
    for Index2 = 1, string.len(Value) do
    local Char = Value:sub(Index2, Index2)
    if not table.find(charset, Char) then
    SChar = true
    break
    end
    end
    if Index == 1 then
    if pcall(game.GetService, game, Value) then
    NewStr = NewStr .. ":GetService(\""
    NewStr = NewStr .. Value
    NewStr = NewStr .. "\")"
    else
        NewStr = Value
    end
    else
        if tonumber(Value:sub(1, 1)) == nil and not SChar then
    if not LCheck then
    NewStr = NewStr .. "." .. Value
    else
        NewStr = NewStr .. "\"]." .. Value
    LCheck = false
    end
    else
        LCheck = true
    NewStr = NewStr .. "[\"" .. Value
    if Index == #SPath or SChar then
    NewStr = NewStr .. "\"]"
    end
    end
    end
    end
    end)

return NewStr
end

function Lib:InvertColor(gui)
function invertColor(c)
return Color3.fromRGB(1 - c.R, 1 - c.G, 1 - c.B) --This is wrong, see comments for solution by @Scarious
end
gui.BackgroundColor3 = invertColor(o.BackgroundColor3)
end

function Lib:Iterate(callback,times,delay)
local iterates = 0
for i = times, 1, -1 do
if delay > 0 or delay == true then wait(delay) end
pcall(callback)
iterates = iterates + 1
end
return iterates
end

function Lib:FindInstance(text)
local found
local text = text
pcall(function() if typeof(text) == "Instance" then text = text.Name end end)
for i, v in pairs(game:GetDescendants()) do
if v.Name == text then
found = v
end
if found == nil then
if (string.sub(string.lower(v.Name),1,string.len(text))) == string.lower(text) then
found = v
end
end
end
return found
end

function Lib:GetPath(obj, asInstance)
local obj = obj
local Obj = Lib:FindInstance(obj)
Obj = GetFullName(Obj)
if not asInstance then
return Obj
else
    return loadstring('return '..Obj)()
end
end

function Lib:Childrens(parent,prnt)
local Child = {}
for i, v in pairs(parent:GetChildrens()) do
table.insert(Child,v)
if prnt then
print(i,v)
end
end
return Child
end

function Lib:ReturnPlayer(text)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if (string.sub(string.lower(v.Name),1,string.len(text))) == string.lower(text) then
text = v
return text
end
end
end

function Lib:Randomized()
local length = math.random(10,20)
local array = {}
for i = 1, length do
array[i] = string.char(math.random(32, 126))
end
return table.concat(array)
end

function Lib:UICorner(instance,num)
local UIC = Instance.new("UICorner")
local num = num or 8
UIC.CornerRadius = UDim.new(0, num)
UIC.Parent = instance
return UIC
end

function Lib:UIPad(instance,num,a,b,c)
local UIP = Instance.new("UIPadding")
UIP.Parent = instance
return UIP
end

function Lib:UIList(instance,num,align)
local UIL = Instance.new("UIListLayout")
local align = align or "Center"
UIL.Padding = UDim.new(0,num)
UIL.HorizontalAlignment = align
UIL.SortOrder = "LayoutOrder"
UIL.Parent = instance
return UIL
end

function Lib:Shine(instance,duration)

end

local Ts = game:GetService("TweenService")

local Warning_ = "http://www.roblox.com/asset/?id=3192540038"

local Success_ = "http://www.roblox.com/asset/?id=279548030"

local Error_ = "http://www.roblox.com/asset/?id=2022095309"

local ScreenGuis = Instance.new("ScreenGui")

table.insert(ToDels_,ScreenGuis)

local Frame_ = Instance.new("Frame")

local List = Instance.new("UIListLayout",Frame_)

local Icon_ = Instance.new("ImageLabel")

CProvider:PreloadAsync({
    Success_,Warning_,Error_
})

function Lib:Notification(types, name, content,time)
task.spawn(function()
    local notification = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local bottomFrame = Instance.new("Frame")
    local bottomFrame_UICorner = Instance.new("UICorner")
    local time = time or 4
    local notificationName = Instance.new("TextLabel")
    local notificationContent = Instance.new("TextLabel")
    local Icon = Instance.new("ImageLabel")

    ScreenGuis.Parent = game:GetService("CoreGui")
    ScreenGuis.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ScreenGuis.Enabled = true

    Frame_.AnchorPoint = Vector2.new(0.5,0.5)
    Frame_.Position = UDim2.new(0.88,0,0.5,0)
    Frame_.Size = UDim2.new(1,0,1.09,0)
    Frame_.BackgroundTransparency = 1
    Frame_.Parent = ScreenGuis

    Lib:UIList(Frame_,4,"Center")

    notification.Name = "notification"
    notification.Parent = Frame_
    notification.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    notification.BorderSizePixel = 0
    notification.AnchorPoint = Vector2.new(0.5,0.5)
    notification.Position = UDim2.new(0.5, 0, 0, 0)
    notification.Size = UDim2.new(0, 363, 0, 72)
    notification.ZIndex = 10

    Lib:UICorner(notification,3)

    bottomFrame.Name = "bottomFrame"
    bottomFrame.Parent = notification
    bottomFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    bottomFrame.BorderSizePixel = 0
    bottomFrame.Position = UDim2.new(0, 0, 0.665449977, 0)
    bottomFrame.Size = UDim2.new(0, 362, 0, 24)
    bottomFrame.ZIndex = 10

    bottomFrame_UICorner.CornerRadius = UDim.new(0, 3)
    bottomFrame_UICorner.Parent = bottomFrame

    notificationName.Name = "notificationName"
    notificationName.Parent = notification
    notificationName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    notificationName.BackgroundTransparency = 1.000
    notificationName.Position = UDim2.new(0.140495867, 0, 0.0985915512, 0)
    notificationName.Size = UDim2.new(0, 300, 0, 17)
    notificationName.Font = Enum.Font.GothamBold
    notificationName.Text = tostring(name)
    notificationName.TextScaled = true
    notificationName.TextColor3 = Color3.fromRGB(255, 255, 255)
    notificationName.TextSize = 13.000
    notificationName.TextXAlignment = Enum.TextXAlignment.Left
    notificationName.TextYAlignment = Enum.TextYAlignment.Top
    notificationName.ZIndex = 10

    notificationContent.Name = "notificationContent"
    notificationContent.Parent = notification
    notificationContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    notificationContent.BackgroundTransparency = 1.000
    notificationContent.Position = UDim2.new(0.140495867, 0, 0.309663534, 0)
    notificationContent.Size = UDim2.new(0, 312, 0, 26)
    notificationContent.Font = Enum.Font.Gotham
    notificationContent.Text = tostring(content)
    notificationContent.TextScaled = Scaler
    notificationContent.TextColor3 = Color3.fromRGB(150, 150, 150)
    notificationContent.TextSize = 13.000
    notificationContent.TextXAlignment = Enum.TextXAlignment.Left
    notificationContent.ZIndex = 10

    local typer = tostring(types)
    local types = string.lower(typer)

    if types == "warning" or types == "warn" then
    Icon.Name = "warningIcon"
    Icon.Parent = notification
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0.0192837473, 0, 0.0985912755, 0)
    Icon.Size = UDim2.new(0, 38, 0, 40)
    Icon.Image = Warning_
    elseif types == "success" or types == "check" then
    Icon.Name = "SuccessIcon"
    Icon.Parent = notification
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0.0192837473, 0, 0.0985912755, 0)
    Icon.Size = UDim2.new(0, 38, 0, 38)
    Icon.Image = Success_
    elseif types == "error" or types == "fail" then
    Icon.Name = "SuccessIcon"
    Icon.Parent = notification
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0.0302837473, 0, 0.1085912755, 0)
    Icon.Size = UDim2.new(0, 33, 0, 33)
    Icon.Image = Error_
    end

    local TweenInfo = TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)

    local Tween_ = Ts:Create(notification, TweenInfo, {
        Position = UDim2.new(0.5, 0, 0.005, 0)})
    local Tweened_ = Ts:Create(notification, TweenInfo, {
        Position = UDim2.new(0.5, 0, -0.15, 0)})

    Tween_:Play()
    delay(time,function()
        Tweened_:Play()
        wait(0.5)
        notification:Destroy()
        end)

    end)
end

local CloseUI = Instance.new("ImageButton")
function Lib:CreateWindow(name,desc)
local ScreenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local tabPreview = Instance.new("Frame")
local topBar = Instance.new("Frame")
local TelligencesLib = Instance.new("TextLabel")
local Hubname = Instance.new("TextLabel")
local tabList = Instance.new("ScrollingFrame")
local name = name or "InfiniX Lib"
local desc = desc or "Mole"
mainFrame.Active = true

table.insert(ToDels_,ScreenGui)
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = CoreGui

ScreenGui.Enabled = true

local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local toDrag = topBar
local gui = mainFrame

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (20); -- // The speed of the UI darg.
function Update(dt)
if not (startPos) then return end;
if not (dragging) and (lastGoalPos) then
gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
return
end;

local delta = (lastMousePos - UserInputService:GetMouseLocation())
local xGoal = (startPos.X.Offset - delta.X);
local yGoal = (startPos.Y.Offset - delta.Y);
lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

toDrag.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = gui.Position
    lastMousePos = UserInputService:GetMouseLocation()

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
        dragging = false
        end
        end)
    end
    end)

toDrag.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    dragInput = input
    end
    end)

runService.Heartbeat:Connect(Update)

local Screen_Gui = Instance.new("ScreenGui")
local Background = Instance.new("TextLabel")
local Draggablebtn = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local BlackPart = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

table.insert(ToDels_,Screen_Gui)
--Properties:
Screen_Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Screen_Gui.Enabled = false
Screen_Gui.Parent = game:GetService("CoreGui")

Background.Name = "Background"
Background.Active = true
Background.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Background.Position = UDim2.new(0,0,0.25,0)
Background.Size = UDim2.new(1,0,0.75,0)
Background.Font = Enum.Font.SourceSans
Background.Text = ""
Background.TextColor3 = Color3.fromRGB(0, 0, 0)
Background.TextSize = 14.000
Background.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Background.Parent = Draggablebtn

Draggablebtn.Name = "RedPart"
Draggablebtn.Active = true
Draggablebtn.BackgroundColor3 = Color3.fromRGB(70, 26, 165)
Draggablebtn.Size = UDim2.new(0.05,0,0.1,0)
Draggablebtn.Font = Enum.Font.SourceSans
Draggablebtn.Text = ""
Draggablebtn.AnchorPoint = Vector2.new(0.5,0.5)
Draggablebtn.Position = UDim2.new(0.5,0,0.5,0)
Draggablebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
Draggablebtn.TextSize = 14.000
Draggablebtn.Parent = Screen_Gui

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Draggablebtn

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Background

BlackPart.Name = "BlackPart"
BlackPart.Active = true
BlackPart.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
BlackPart.Position = UDim2.new(0.05, 0, 0.3, 0)
BlackPart.Size = UDim2.new(0.9,0,0.65,0)
BlackPart.Font = Enum.Font.SourceSans
BlackPart.Text = "Open"
BlackPart.ZIndex = 2
BlackPart.TextColor3 = Color3.fromRGB(255,255,255)
BlackPart.TextSize = 14.000
BlackPart.Parent = Draggablebtn

BlackPart.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = true
    Screen_Gui.Enabled = false
    end)

UICorner_3.CornerRadius = UDim.new(0,10)
UICorner_3.Parent = BlackPart

-- Scripts:
local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local gui = Draggablebtn

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (20); -- // The speed of the UI darg.
function Update(dt)
if not (startPos) then return end;
if not (dragging) and (lastGoalPos) then
gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
return
end;

local delta = (lastMousePos - UserInputService:GetMouseLocation())
local xGoal = (startPos.X.Offset - delta.X);
local yGoal = (startPos.Y.Offset - delta.Y);
lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = gui.Position
    lastMousePos = UserInputService:GetMouseLocation()

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
        dragging = false
        end
        end)
    end
    end)

gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    dragInput = input
    end
    end)

runService.Heartbeat:Connect(Update)

CloseUI.BackgroundColor3 = Color3.fromRGB(50,50,50)
CloseUI.BackgroundTransparency = 0
CloseUI.Active = true
CloseUI.Size = UDim2.new(0.04,0,0.8,0)
CloseUI.Position = UDim2.new(0.945,0,0.1,0)
CloseUI.BorderSizePixel = 0
CloseUI.SizeConstraint = "RelativeXY"
CloseUI.ZIndex = 2
CloseUI.Parent = topBar
CloseUI.Image = InfLogo

Lib:UICorner(CloseUI,10)

function Cloth()
ScreenGui.Enabled = false
Screen_Gui.Enabled = true
end

CloseUI.MouseButton1Click:Connect(Cloth)

mainFrame.Name = "mainFrame"
mainFrame.Parent = ScreenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Position = UDim2.new(0.5,0,0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5,0.5)
mainFrame.Size = UDim2.new(0.36, 0, 0.54,0)
mainFrame.ZIndex = 1

Lib:UICorner(mainFrame,4)
Lib:UICorner(mainBar,4)

tabPreview.Name = "tabPreview"
tabPreview.Parent = mainFrame
tabPreview.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabPreview.Position = UDim2.new(0.304744512, 0, 0.0834914595, 0)
tabPreview.Size = UDim2.new(0, 0, 0, 0)

Lib:UICorner(tabPreview,4)

topBar.Name = "topBar"
topBar.Parent = mainFrame
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
topBar.Size = UDim2.new(1, 0, 0.085, 0)

Lib:UICorner(topBar,4)

TelligencesLib.Name = "TelligencesLib"
TelligencesLib.Parent = topBar
TelligencesLib.BackgroundColor3 = Color3.fromRGB(0,0,0)
TelligencesLib.BackgroundTransparency = 0.5
TelligencesLib.Position = UDim2.new(0.0164233577, 0, 0.1, 0)
TelligencesLib.Size = UDim2.new(0.18, 0, 0.8,0)
TelligencesLib.Font = Enum.Font.Gotham
TelligencesLib.Text = name
TelligencesLib.TextColor3 = Color3.fromRGB(255, 255, 255)
TelligencesLib.TextSize = 14.000
TelligencesLib.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TelligencesLib.TextXAlignment = Enum.TextXAlignment.Center

Lib:UICorner(TelligencesLib,8)

local LengthName = #name
local Totals = -0.7/LengthName

Hubname.Name = "Hubname"
Hubname.Parent = topBar
Hubname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hubname.BackgroundTransparency = 1.000
Hubname.Position = UDim2.new(Totals+0.225, 0, 0, 0)
Hubname.Size = UDim2.new(0.5,0,1,0)
Hubname.Font = Enum.Font.Gotham
Hubname.Text = ""
Hubname.TextColor3 = Color3.fromRGB(213, 213, 213)
Hubname.TextSize = 11.000
Hubname.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Hubname.TextWrapped = true
Hubname.TextXAlignment = Enum.TextXAlignment.Left

tabList.Name = "tabList"
tabList.Parent = mainFrame
tabList.Active = true
tabList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabList.BorderSizePixel = 0
tabList.Position = UDim2.new(0.030, 0, 0.085, 0)
tabList.Size = UDim2.new(0.15, 0, 0.9, 0)
tabList.ScrollBarThickness = 0
tabList.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
tabList.CanvasSize = UDim2.new(0,0,0,0)

tabCorner = Lib:UICorner(tabList,4)
tabCanvas = Lib:UIList(tabList,6)

local UIPadA = Lib:UIPad(tabList)
UIPadA.PaddingTop = UDim.new(0,4)

local Tab = {}
local visibles = {}

local tabsCreated = 0

function Tab:CreateTab(name, clicked)
local tabBtn = Instance.new("TextButton")
local inTab = Instance.new("ScrollingFrame")
local designA = Instance.new("TextLabel")
local clicked = clicked or function() end
local UIGradient = Instance.new("UIGradient")

tabList.CanvasSize = UDim2.new(0,0,0,tabCanvas.AbsoluteContentSize.Y+tabCanvas.Padding.Offset+38)

tabsCreated = tabsCreated + 1

tabBtn.AutoButtonColor = false
tabBtn.Name = "inBtn"
tabBtn.Parent = tabList
tabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tabBtn.Position = UDim2.new(0, 0, 0, 0)
tabBtn.Size = UDim2.new(0.9, 0, 0.4, 0)
tabBtn.Selectable = false
tabBtn.Font = Enum.Font.Gotham
tabBtn.Text = tostring(name)
tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
tabBtn.TextSize = 8.000
tabBtn.TextWrapped = true
tabBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(tabBtn,4)

designA.Active = false
designA.Name = "designA"
designA.Parent = tabBtn
designA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
designA.BackgroundTransparency = 1
designA.Position = UDim2.new(0, 0, 0, 0)
designA.Size = UDim2.new(1, 0, 1, 0)
designA.Font = Enum.Font.Gotham
designA.Text = tostring(name)
designA.TextScaled = false
designA.TextWrapped = true
designA.TextColor3 = Color3.fromRGB(255, 255, 255)
designA.TextSize = 9.000

Lib:UICorner(designA,4)

inTab.Name = "inTab"
inTab.Parent = mainFrame
inTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inTab.BorderSizePixel = 0
inTab.Position = UDim2.new(0.2, 0, 0.085, 0)
inTab.Size = UDim2.new(0.77, 0, 0.9, 0)
inTab.CanvasSize = UDim2.new(0,0,0,0)
inTab.ScrollBarThickness = 0
local inTabCanvas = Lib:UIList(inTab,8)
bigChunk = 10
--[[
inTab.ChildAdded:Connect(function(child)
    if not string.find(child.ClassName,"UI") then
    inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)
    end
    end)
    ]]

if tabsCreated >= 2 then
inTab.Visible = false
end

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)), ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
UIGradient.Rotation = 15
UIGradient.Parent = tabBtn

table.insert(visibles,inTab)

local UIPadA = Lib:UIPad(inTab)
UIPadA.PaddingTop = UDim.new(0,8)

local function tabClick()
for i, vis in pairs(visibles) do
for i, v in pairs(vis:GetDescendants()) do
if not string.find(v.ClassName,"UI") and not string.find(v.Name,"Exceptionally") and not v.Name == "Drop$down" then
v.Visible = false
end
end
vis.Visible = false
end
for i, v in pairs(inTab:GetDescendants()) do
if not string.find(v.ClassName,"UI") and not v.Name == "Drop$down" then
v.Visible = true
end
end
inTab.Visible = true
end

tabBtn.MouseButton1Click:Connect(tabClick)
tabBtn.MouseButton1Click:Connect(clicked)

local Tabs = {}

function Tabs:Search(clicked)
local Search = Instance.new("ImageLabel")
local SearchText = Instance.new("TextBox")

Search.Name = "Searchers"
Search.Parent = inTab
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.Position = UDim2.new(0.327964872, 0, 0.471172959, 0)
Search.Size = UDim2.new(0.98,0,0.10,0)
Search.Image = SearchI
Search.ScaleType = Enum.ScaleType.Crop
Search.SizeConstraint = "RelativeXX"

SearchText.Name = "SearchText"
SearchText.Parent = Search
SearchText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchText.BackgroundTransparency = 1.000
SearchText.Position = UDim2.new(-0.00131772459, 0, -0.0144930333, 0)
SearchText.Size = UDim2.new(0.98, 0, 1, 0)
SearchText.Font = Enum.Font.Gotham
SearchText.PlaceholderText = "Search..."
SearchText.Text = ""
SearchText.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchText.TextSize = 13.000
SearchText.ClearTextOnFocus = false
SearchText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
SearchText.TextWrapped = true

local function UpSearch()
local search = string.lower(SearchText.Text)
for i, v in pairs(inTab:GetChildren()) do
if not string.find(string.lower(v.ClassName),"ui") then
if search ~= "" then
local item = string.lower(v.Name)
if string.find(item, search) then
if v.Name == "DropSdown" then
v.Visible = true
end
else
    if v.Name ~= "Searchers" then
v.Visible = false
end
end
else
if v.Name ~= "Drop$down" then
    v.Visible = true
end
end
end
end
pcall(clicked)
end

SearchText.Changed:Connect(UpSearch)
end
----
function Tabs:CreateColor(name,clicked,descr)
local name = name or "Button"
local clicked = clicked or function() end
local UIGradient = Instance.new("UIGradient")
local UIGradients = Instance.new("UIGradient")
local designA = Instance.new("TextLabel")
local inBtn = Instance.new("TextButton")

inBtn.AutoButtonColor = false
inBtn.Name = name
inBtn.Parent = inTab
inBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inBtn.BorderSizePixel = 0
inBtn.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
inBtn.Size = UDim2.new(0.98,0, 0.10, 0)
inBtn.Selectable = false
inBtn.Font = Enum.Font.Gotham
inBtn.Text = tostring(name)
inBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
inBtn.TextSize = 11.000
inBtn.TextWrapped = true
inBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(inBtn,6)

designA.Active = false
designA.Name = "designA"
designA.Parent = inBtn
designA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
designA.BackgroundTransparency = 1
designA.Position = UDim2.new(0, 0, 0, 0)
designA.Size = UDim2.new(0.98, 0, 1, 0)
designA.Font = Enum.Font.Gotham
designA.Text = tostring(name)
designA.TextWrapped = true
designA.TextColor3 = Color3.fromRGB(255, 255, 255)
designA.TextSize = 11.000

Lib:UICorner(designA,4)

-- Gui to Lua
-- Version: 3.2

-- Instances:
local StrokeColor = Instance.new("TextLabel")
local Showcasers = Instance.new("TextLabel")
local Picker = Instance.new("ImageLabel")

--Properties:
StrokeColor.Name = "StrokeColor"
StrokeColor.Parent = inBtn
StrokeColor.BorderSizePixel = 0
StrokeColor.Text = ""
StrokeColor.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StrokeColor.Position = UDim2.new(0.825, 0, 0.125, 0)
StrokeColor.Size = UDim2.new(0.15, 0, 0.75, 0)
StrokeColor.Font = Enum.Font.SourceSans
StrokeColor.TextColor3 = Color3.fromRGB(0, 0, 0)
StrokeColor.TextSize = 14.000

Showcasers.Name = "Showcaser"
Showcasers.Parent = StrokeColor
Showcasers.BorderSizePixel = 0
Showcasers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Showcasers.Position = UDim2.new(0.1025, 0, 0.1025, 0)
Showcasers.Size = UDim2.new(0.8, 0, 0.8, 0)
Showcasers.Font = Enum.Font.SourceSans
Showcasers.Text = ""
Showcasers.TextColor3 = Color3.fromRGB(0, 0, 0)
Showcasers.TextSize = 14.000

Picker.Name = "Picker"
Picker.Parent = inBtn
Picker.Image = ColorIcon
Picker.Position = UDim2.new(0.075, 0, 0.15, 0)
Picker.Size = UDim2.new(0.065, 0, 0.65, 0)
Picker.BackgroundTransparency = 0.95
   
if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(-0.0125,0,0.075,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = inBtn

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0, 325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            clicked(inBtn)
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

-- Gui to Lua



-- Version: 3.2


-- Instances:
local CurrentColor
local function clickeds()
for i, v in pairs(game:GetDescendants()) do
if v.Name == "ColorPicker" and v:IsA("ScreenGui") then
v:Destroy()
end
end
local Frame = Instance.new("Frame")
local Background = Instance.new("ImageLabel")
local Background_2 = Instance.new("ImageLabel")
local RGB = Instance.new("ImageLabel")
local Marker = Instance.new("Frame")
local Preview = Instance.new("ImageLabel")
local Value = Instance.new("ImageLabel")
local Marker_2 = Instance.new("Frame")
local Info = Instance.new("Frame")
local Apply = Instance.new("TextButton")
local Background_3 = Instance.new("ImageLabel")
local Background_4 = Instance.new("ImageLabel")
local Background_5 = Instance.new("ImageLabel")
local Background_6 = Instance.new("ImageLabel")

--Properties:

Frame.Parent = ScreenGui
Frame.Active = true
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0.175, 0, 0.125, 0)
Frame.ZIndex = 2
Frame.SizeConstraint = Enum.SizeConstraint.RelativeXX

Background.Name = "Background"
Background.Parent = Frame
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 1.000
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.ZIndex = 4
Background.Image = "rbxassetid://399416860"
Background.ImageColor3 = Color3.fromRGB(60, 60, 60)
Background.ScaleType = Enum.ScaleType.Slice
Background.SliceCenter = Rect.new(10, 10, 90, 90)

Background_2.Name = "Background"
Background_2.Parent = Background
Background_2.AnchorPoint = Vector2.new(0.5, 0.5)
Background_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background_2.BackgroundTransparency = 1.000
Background_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Background_2.Size = UDim2.new(1, 4, 1, 4)
Background_2.ZIndex = 3
Background_2.Image = "rbxassetid://399416860"
Background_2.ImageColor3 = Color3.fromRGB(40, 40, 40)
Background_2.ScaleType = Enum.ScaleType.Slice
Background_2.SliceCenter = Rect.new(10, 10, 90, 90)

RGB.Name = "RGB"
RGB.Parent = Frame
RGB.AnchorPoint = Vector2.new(0.5, 0)
RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RGB.BorderColor3 = Color3.fromRGB(40, 40, 40)
RGB.BorderSizePixel = 2
RGB.Position = UDim2.new(0.400000006, 0, 0.100000001, 0)
RGB.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
RGB.ZIndex = 4
RGB.Image = "rbxassetid://1433361550"
RGB.SliceCenter = Rect.new(10, 10, 90, 90)

Marker.Name = "Marker"
Marker.Parent = RGB
Marker.AnchorPoint = Vector2.new(0.5, 0.5)
Marker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Marker.BorderColor3 = Color3.fromRGB(0, 0, 0)
Marker.BorderSizePixel = 2
Marker.Position = UDim2.new(0.5, 0, 1, 0)
Marker.Size = UDim2.new(0, 4, 0, 4)
Marker.ZIndex = 5

Preview.Name = "Preview"
Preview.Parent = Frame
Preview.AnchorPoint = Vector2.new(0.5, 0)
Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Preview.BorderColor3 = Color3.fromRGB(40, 40, 40)
Preview.BorderSizePixel = 2
Preview.Position = UDim2.new(0.5, 0, 0.800000012, 0)
Preview.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
Preview.ZIndex = 4
Preview.SliceCenter = Rect.new(10, 10, 90, 90)

Value.Name = "Value"
Value.Parent = Frame
Value.AnchorPoint = Vector2.new(0.5, 0)
Value.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Value.BorderColor3 = Color3.fromRGB(40, 40, 40)
Value.BorderSizePixel = 2
Value.Position = UDim2.new(0.850000024, 0, 0.100000001, 0)
Value.Size = UDim2.new(0.100000001, 0, 0.600000024, 0)
Value.ZIndex = 4
Value.Image = "rbxassetid://359311684"
Value.SliceCenter = Rect.new(10, 10, 90, 90)

Marker_2.Name = "Marker"
Marker_2.Parent = Value
Marker_2.AnchorPoint = Vector2.new(0.5, 0.5)
Marker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Marker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Marker_2.BorderSizePixel = 2
Marker_2.Position = UDim2.new(0.5, 0, 0, 0)
Marker_2.Size = UDim2.new(1, 4, 0, 2)
Marker_2.ZIndex = 5

Info.Name = "Info"
Info.Parent = Frame
Info.AnchorPoint = Vector2.new(0.5, 0)
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.Position = UDim2.new(0.5, 0, 1.03699994, 0)
Info.Size = UDim2.new(1, 0, 0.296299994, 0)

Apply.Name = "Apply"
Apply.Parent = Info
Apply.AnchorPoint = Vector2.new(0.5, 0.5)
Apply.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Apply.BackgroundTransparency = 1.000
Apply.Position = UDim2.new(0.5, 0, 0.5, 0)
Apply.Size = UDim2.new(0.5, 0, 0.5, 0)
Apply.ZIndex = 7
Apply.Font = Enum.Font.SourceSansBold
Apply.Text = "APPLY"
Apply.TextColor3 = Color3.fromRGB(255, 255, 255)
Apply.TextScaled = true
Apply.TextSize = 14.000
Apply.TextWrapped = true

Background_3.Name = "Background"
Background_3.Parent = Apply
Background_3.AnchorPoint = Vector2.new(0.5, 0.5)
Background_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background_3.BackgroundTransparency = 1.000
Background_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Background_3.Size = UDim2.new(1, 0, 1, 0)
Background_3.ZIndex = 6
Background_3.Image = "rbxassetid://1233531182"
Background_3.ImageColor3 = Color3.fromRGB(51, 191, 51)
Background_3.ScaleType = Enum.ScaleType.Slice
Background_3.SliceCenter = Rect.new(210, 210, 210, 210)

Background_4.Name = "Background"
Background_4.Parent = Background_3
Background_4.AnchorPoint = Vector2.new(0.5, 0.5)
Background_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background_4.BackgroundTransparency = 1.000
Background_4.Position = UDim2.new(0.5, 0, 0.5, 0)
Background_4.Size = UDim2.new(1, 4, 1, 4)
Background_4.ZIndex = 5
Background_4.Image = "rbxassetid://1233531182"
Background_4.ImageColor3 = Color3.fromRGB(17, 67, 17)
Background_4.ScaleType = Enum.ScaleType.Slice
Background_4.SliceCenter = Rect.new(210, 210, 210, 210)

Background_5.Name = "Background"
Background_5.Parent = Info
Background_5.AnchorPoint = Vector2.new(0.5, 0.5)
Background_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background_5.BackgroundTransparency = 1.000
Background_5.Position = UDim2.new(0.5, 0, 0.5, 0)
Background_5.Size = UDim2.new(1, 0, 1, 0)
Background_5.ZIndex = 4
Background_5.Image = "rbxassetid://399416860"
Background_5.ImageColor3 = Color3.fromRGB(60, 60, 60)
Background_5.ScaleType = Enum.ScaleType.Slice
Background_5.SliceCenter = Rect.new(10, 10, 90, 90)

Background_6.Name = "Background"
Background_6.Parent = Background_5
Background_6.AnchorPoint = Vector2.new(0.5, 0.5)
Background_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background_6.BackgroundTransparency = 1.000
Background_6.Position = UDim2.new(0.5, 0, 0.5, 0)
Background_6.Size = UDim2.new(1, 4, 1, 4)
Background_6.ZIndex = 3
Background_6.Image = "rbxassetid://399416860"
Background_6.ImageColor3 = Color3.fromRGB(40, 40, 40)
Background_6.ScaleType = Enum.ScaleType.Slice
Background_6.SliceCenter = Rect.new(10, 10, 90, 90)

-- Scripts:
local script = Frame

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local rgb = RGB
local value = Value
local preview = Preview

local selectedColor = Color3.fromHSV(1,1,1)
local colorData = {
    1,1,1
}

local mouse1down = false

local function setColor(hue,sat,val)
colorData = {
    hue or colorData[1],sat or colorData[2],val or colorData[3]}
selectedColor = Color3.fromHSV(colorData[1],colorData[2],colorData[3])
preview.BackgroundColor3 = selectedColor
CurrentColor = selectedColor
value.ImageColor3 = Color3.fromHSV(colorData[1],colorData[2],1)
end

local function inBounds(frame)
local x,y = mouse.X - frame.AbsolutePosition.X,mouse.Y - frame.AbsolutePosition.Y
local maxX,maxY = frame.AbsoluteSize.X,frame.AbsoluteSize.Y
if x >= 0 and y >= 0 and x <= maxX and y <= maxY then
return x/maxX,y/maxY
end
end

local function updateRGB()
if mouse1down then
local x,y = inBounds(rgb)
if x and y then
Marker.Position = UDim2.new(x,0,y,0)
setColor(1 - x,1 - y)
end

local x,y = inBounds(value)
if x and y then
Marker_2.Position = UDim2.new(0.5,0,y,0)
setColor(nil,nil,1 - y)
end
end
end

mouse.Move:connect(updateRGB)

Frame.InputBegan:Connect(function()mouse1down = true end)
Frame.InputEnded:Connect(function()mouse1down = false end)

Apply.MouseButton1Click:Connect(function()
    pcall(function ()
        Showcasers.BackgroundColor3 = CurrentColor
        clicked(preview.BackgroundColor3)
        Frame:Destroy()
        end)
    end)
end

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)),
    ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
}
UIGradient.Rotation = 15
UIGradient.Offset = Vector2.new(-0.225,0)
UIGradient.Parent = inBtn

local TweenInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

local toHover = {
    BackgroundColor3 = Color3.fromRGB(200, 200, 200),
    Size = UDim2.new(0.99,0,0.125,0)
}

local toLeave = {
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    Size = UDim2.new(0.98,0,0.10,0)
}

local onHover = TweenService:Create(inBtn, TweenInfo, toHover)
local onLeave = TweenService:Create(inBtn, TweenInfo, toLeave)

local function hover()
onHover:Play()
end

local function leave()
onLeave:Play()
end

local function click()
leave()
pcall(function()
    clickeds()
    end)
end

local btn = inBtn

function button_click()

local normal_size = UDim2.new(0.98,0,0.10,0)
local bigger_size = UDim2.new(0.99,0,0.15,0)

local normal_position = btn.Position
local corrected_position = btn.Position - UDim2.new(0.017, 0, 0.008, 0)

btn:TweenSizeAndPosition(bigger_size, corrected_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
wait(0.2)
btn:TweenSizeAndPosition(normal_size, normal_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
end

btn.MouseButton1Click:Connect(button_click)

inBtn.MouseEnter:Connect(hover)
inBtn.MouseLeave:Connect(leave)
inBtn.InputBegan:Connect(hover)
inBtn.InputEnded:Connect(leave)
inBtn.MouseButton1Click:Connect(click)
inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

local Ft = {}

function Ft:GetInstance()
local Instances = {
    inBtn;
    designA;
}
return Instances
end

function Ft:Exe()
pcall(function()
    clicked(CurrentColor)
    end)
end

function Ft:GetState()

return nil
end

function Ft:SetState(State)

return nil
end

return Ft
end
----
function Tabs:CreateButton(name,clicked,descr)
local name = name or "Button"
local clicked = clicked or function() end
local UIGradient = Instance.new("UIGradient")
local UIGradients = Instance.new("UIGradient")
local designA = Instance.new("TextLabel")
local inBtn = Instance.new("TextButton")

inBtn.AutoButtonColor = false
inBtn.Name = name
inBtn.Parent = inTab
inBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inBtn.BorderSizePixel = 0
inBtn.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
inBtn.Size = UDim2.new(0.98, 0, 0.10, 0)
inBtn.Selectable = false
inBtn.Font = Enum.Font.Gotham
inBtn.Text = tostring(name)
inBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
inBtn.TextSize = 11.000
inBtn.TextWrapped = true
inBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(inBtn,6)

designA.Active = false
designA.Name = "designA"
designA.Parent = inBtn
designA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
designA.BackgroundTransparency = 1
designA.Position = UDim2.new(0, 0, 0, 0)
designA.Size = UDim2.new(0.98, 0, 1, 0)
designA.Font = Enum.Font.Gotham
designA.Text = tostring(name)
designA.TextWrapped = true
designA.TextColor3 = Color3.fromRGB(255, 255, 255)
designA.TextSize = 11.000

Lib:UICorner(designA,4)

if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(-0.0125,0,0.075,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = inBtn

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0, 325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            clicked(inBtn)
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)),
    ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
}
UIGradient.Rotation = 15
UIGradient.Offset = Vector2.new(-0.225,0)
UIGradient.Parent = inBtn

local TweenInfo = TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

local toHover = {
    BackgroundColor3 = Color3.fromRGB(200, 200, 200),
    Size = UDim2.new(0.99,0,0.125,0)
}

local toLeave = {
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    Size = UDim2.new(0.98,0,0.10,0)
}

local onHover = TweenService:Create(inBtn, TweenInfo, toHover)
local onLeave = TweenService:Create(inBtn, TweenInfo, toLeave)

local function hover()
onHover:Play()
end

local function leave()
onLeave:Play()
end

local function click()
leave()
pcall(function()
    clicked(inBtn)
    end)
end

local btn = inBtn

function button_click()

local normal_size = UDim2.new(0.98,0,0.10,0)
local bigger_size = UDim2.new(0.99,0,0.15,0)

local normal_position = btn.Position
local corrected_position = btn.Position - UDim2.new(0.017, 0, 0.008, 0)

btn:TweenSizeAndPosition(bigger_size, corrected_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
wait(0.2)
btn:TweenSizeAndPosition(normal_size, normal_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
end

btn.MouseButton1Click:Connect(button_click)

inBtn.MouseEnter:Connect(hover)
inBtn.MouseLeave:Connect(leave)
inBtn.InputBegan:Connect(hover)
inBtn.InputEnded:Connect(leave)
inBtn.MouseButton1Click:Connect(click)
inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

local Ft = {}

function Ft:GetInstance()
local Instances = {
    inBtn;
    designA;
}
return Instances
end

function Ft:Exe()
pcall(function()
    clicked(inBtn)
    end)
end

function Ft:GetState()

return nil
end

function Ft:SetState(State)

return nil
end

return Ft
end

function Tabs:CreateToggle(name,state,clicked,descr)
local name = name or "Toggle"
local clicked = clicked or function() end
local inBtn = Instance.new("TextButton")
local box = Instance.new("TextButton")
local highlight = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local UIGradients = Instance.new("UIGradient")
local designA = Instance.new("TextLabel")
local state = state or false

inBtn.AutoButtonColor = false
inBtn.Name = name
inBtn.Parent = inTab
inBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inBtn.BorderSizePixel = 0
inBtn.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
inBtn.Size = UDim2.new(0.98, 0, 0.10, 0)
inBtn.Font = Enum.Font.Gotham
inBtn.Text = tostring(name)
inBtn.TextWrapped = true
inBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
inBtn.TextSize = 11.000
inBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(inBtn,6)

designA.Active = false
designA.Name = "designA"
designA.Parent = inBtn
designA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
designA.BackgroundTransparency = 1
designA.Position = UDim2.new(0, 0, 0, 0)
designA.Size = UDim2.new(0.98, 0, 1, 0)
designA.Font = Enum.Font.Gotham
designA.Text = tostring(name)
designA.TextWrapped = true
designA.TextColor3 = Color3.fromRGB(255, 255, 255)
designA.TextSize = 11.000

Lib:UICorner(designA,4)

box.Active = false
box.AutoButtonColor = false
box.Name = "box"
box.Parent = inBtn
box.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
box.BorderSizePixel = 0
box.Position = UDim2.new(0.915, 0, 0.08, 0)
box.Size = UDim2.new(0.07,0,0.65,0)
box.Font = Enum.Font.Gotham
box.Text = ""
box.TextWrapped = true
box.TextColor3 = Color3.fromRGB(255, 255, 255)

Lib:UICorner(box,20)

highlight.Active = false
highlight.AutoButtonColor = false
highlight.Name = "highlight"
highlight.Parent = inBtn
highlight.BackgroundColor3 = Color3.fromRGB(25,125,25)
highlight.BorderSizePixel = 0
highlight.Position = UDim2.new(0.928, 0, 0.19, 0)
highlight.Size = UDim2.new(0.045, 0, 0.4, 0)
highlight.Font = Enum.Font.Gotham
highlight.Text = ""
highlight.TextWrapped = true
highlight.TextColor3 = Color3.fromRGB(255, 255, 255)

Lib:UICorner(highlight,25)

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)),
    ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
}
UIGradient.Rotation = 15
UIGradient.Offset = Vector2.new(-0.225,0)
UIGradient.Parent = inBtn

local TweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

local toOpen = {
    BackgroundColor3 = Color3.fromRGB(25,255,25),
}

local toClose = {
    BackgroundColor3 = Color3.fromRGB(75,18,18),
}

local toHover = {
    BackgroundColor3 = Color3.fromRGB(200, 200, 200),
    Size = UDim2.new(0.99,0,0.125,0)
}

local toLeave = {
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    Size = UDim2.new(0.98,0,0.10,0)
}

local onHover = TweenService:Create(inBtn, TweenInfo, toHover)
local onLeave = TweenService:Create(inBtn, TweenInfo, toLeave)
local onOpen = TweenService:Create(highlight, TweenInfo, toOpen)
local onClose = TweenService:Create(highlight, TweenInfo, toClose)

local function highlighter()
if state then
onOpen:Play()
else
    onClose:Play()
end
end

highlighter()

local function hover()
onHover:Play()
end

local function leave()
onLeave:Play()
end

local function click()
leave()
state = not state
highlighter()

pcall(function()
    clicked(state)
    end)
end

function button_click()

local normal_size = UDim2.new(0.98,0,0.10,0)
local bigger_size = UDim2.new(0.99,0,0.125,0)

local normal_position = inBtn.Position
local corrected_position = inBtn.Position - UDim2.new(0.017, 0, 0.008, 0)

inBtn:TweenSizeAndPosition(bigger_size, corrected_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
wait(0.2)
inBtn:TweenSizeAndPosition(normal_size, normal_position, Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25, true)
end

inBtn.MouseButton1Click:Connect(button_click)

inBtn.MouseEnter:Connect(hover)
inBtn.MouseLeave:Connect(leave)
inBtn.InputBegan:Connect(hover)
inBtn.InputEnded:Connect(leave)
inBtn.MouseButton1Click:Connect(click)
inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(-0.0125,0,0.075,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = inBtn

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0, 325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            clicked(state)
            highlighter()
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

local Ft = {}

function Ft:GetInstance()
local Instances = {
    inBtn;
    box;
    highlight;
    UIGradient;
    UIGradients;
    designA;
}
return Instances
end

function Ft:Exe()
highlighter()
pcall(function()
    clicked(state)
    end)
end

function Ft:GetState()
return state
end

function Ft:SetState(State)
state = State
highlighter()
return nil
end

return Ft

end

function Tabs:CreateSlider(name,min,max,sliding,whilst,descr)

local inBtn = Instance.new("TextButton")
local sliderLabel = Instance.new("TextLabel")
local sliderFrame = Instance.new("TextButton")
local sliderPoint = Instance.new("TextButton")
local sliderValue = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local name = name or "Slider"
local min = min or "0"
local max = max or "100"
local Whilst = whilst or false

inBtn.AutoButtonColor = false
inBtn.Name = name
inBtn.Parent = inTab
inBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inBtn.BorderSizePixel = 0
inBtn.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
inBtn.Size = UDim2.new(0.98, 0, 0.10, 0)
inBtn.Font = Enum.Font.Gotham
inBtn.Text = tostring(name)
inBtn.TextWrapped = true
inBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
inBtn.TextSize = 11.000
inBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(inBtn,6)

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)),
    ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
}
UIGradient.Rotation = 15
UIGradient.Offset = Vector2.new(-0.225,0)
UIGradient.Parent = inBtn

sliderLabel.Name = "sliderLabel"
sliderLabel.Parent = sliderFrame
sliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Position = UDim2.new(0.0306098592, 0, -2, 0)
sliderLabel.Size = UDim2.new(0.92, 0, 1.5, 0)
sliderLabel.Font = Enum.Font.Gotham
sliderLabel.Text = tostring(name)
sliderLabel.TextColor3 = Color3.fromRGB(213, 213, 213)
sliderLabel.TextSize = 11.000
sliderLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.TextWrapped = false
sliderLabel.TextXAlignment = Enum.TextXAlignment.Left

sliderFrame.Name = "sliderFrame"
sliderFrame.Parent = inBtn
sliderFrame.Text = ""
sliderFrame.BackgroundColor3 = Color3.fromRGB(136, 116, 177)
sliderFrame.Position = UDim2.new(0.09, 0, 0.625, 0)
sliderFrame.Size = UDim2.new(0.88, 0, 0.225, 0)

Lib:UICorner(sliderFrame,4)

sliderPoint.Active = true
sliderPoint.Name = "sliderPoint"
sliderPoint.Parent = sliderFrame
sliderPoint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderPoint.BorderSizePixel = 0
sliderPoint.Position = UDim2.new(0.126344085, 0, -0.45, 0)
sliderPoint.Size = UDim2.new(0.03, 0, 2, 0)
sliderPoint.Font = Enum.Font.SourceSans
sliderPoint.Text = ""
sliderPoint.TextColor3 = Color3.fromRGB(0, 0, 0)
sliderPoint.TextSize = 14.000

Lib:UICorner(sliderPoint,3)

sliderValue.Name = "sliderValue"
sliderValue.Parent = sliderFrame
sliderValue.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
sliderValue.BackgroundTransparency = 1
sliderValue.BorderSizePixel = 0
sliderValue.Position = UDim2.new(0.79, 0, -2, 0)
sliderValue.Size = UDim2.new(0.3, 0, 1.5, 0)
sliderValue.Font = Enum.Font.SourceSans
sliderValue.Text = min.." / "..max
sliderValue.TextWrapped = false
sliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
sliderValue.TextSize = 13.000

Lib:UICorner(sliderValue,2)

if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(-0.0125,0,0.075,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = inBtn

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0,325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            sliding(math.floor(value))
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

local down = false
local value = min or max

sliderFrame.MouseButton1Down:connect(function()
    down = true
    RunService.RenderStepped:Connect(function()
        if Whilst and down then
        pcall(sliding, math.floor(value))
        end
        end)

    while down and RunService.RenderStepped:wait() do
    percentage = math.clamp(((mouse.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X), 0, 1)
    sliderPoint:TweenPosition(UDim2.new(percentage, 0, -0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.05)
    value = (percentage * (max - min)) + min
    sliderValue.Text = string.format("%d / %d", value, max)
    end
    end)

sliderPoint.MouseButton1Down:connect(function()
    down = true
    RunService.RenderStepped:Connect(function()
        if Whilst and down then
        pcall(sliding, math.floor(value))
        end
        end)

    while down and RunService.RenderStepped:wait() do
    percentage = math.clamp(((mouse.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X), 0, 1)
    sliderPoint:TweenPosition(UDim2.new(percentage, 0, -0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.05)
    value = (percentage * (max - min)) + min
    sliderValue.Text = string.format("%d / %d", value, max)
    end
    end)

Mouse.Button1Up:connect(function()
    if down == true then
    down = false
    end
    end)

local InputBeggar
InputBeggar = UserInputService.InputBegan:Connect(function(input)
    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
        if down == true then
        task.spawn(function()
            pcall(sliding, math.floor(value))
            end)
        down = false
        end
        end
        end)
    end)
inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

local Ft = {}

function Ft:GetInstance()
local Instances = {
    inBtn;
    sliderLabel;
    sliderFrame;
    sliderPoint;
    sliderValue;
    UIGradient;
}
return Instances
end

function Ft:Exe()
task.spawn(function()
    pcall(sliding, math.floor(value))
    end)
end

function Ft:GetState()
return value
end

function Ft:SetState(State)
value = math.clamp(State,min,max)
return nil
end

return Ft

end

function Tabs:CreateTextbox(label,callback,descr)
bigChunk = bigChunk + 1.8

local UICorner = Instance.new("UICorner")
local idkframe = Instance.new("TextBox")
local bottomframe = Instance.new("Frame")
local executeBtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local clearBtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local main = Instance.new("Frame")
local label = label or "Input"
local callback = callback or function() end

main.Name = label
main.Parent = inTab
main.BorderSizePixel = 0
main.BackgroundTransparency = 1
main.BackgroundColor3 = Color3.fromRGB(40,255,40)
main.Position = UDim2.new(0, 0, 0, 0)
main.Size = UDim2.new(0.98,0,0.22,0)
main.SizeConstraint = "RelativeXX"

UICorner.Parent = main

idkframe.Name = "idkframe"
idkframe.Parent = main
idkframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
idkframe.BorderSizePixel = 1
idkframe.BorderColor3 = Color3.fromRGB(70,26,165)
idkframe.Text = ""
idkframe.PlaceholderText = label
idkframe.TextColor3 = Color3.fromRGB(255,255,255)
idkframe.Position = UDim2.new(0, 0, 0, 0)
idkframe.Size = UDim2.new(1,0, 0.55, 0)
idkframe.ClearTextOnFocus = false

bottomframe.Name = "bottomframe"
bottomframe.Parent = idkframe
bottomframe.BackgroundTransparency = 0
bottomframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bottomframe.BorderSizePixel = 0
bottomframe.Position = UDim2.new(0, 0, 1, 0)
bottomframe.Size = UDim2.new(1,0, 0.85,0)

executeBtn.Name = "executeBtn"
executeBtn.Parent = bottomframe
executeBtn.BackgroundColor3 = Color3.fromRGB(112, 0, 168)
executeBtn.Position = UDim2.new(0.8, 0, 0.161290318, 0)
executeBtn.Size = UDim2.new(0.17,0, 0.7,0)
executeBtn.Font = Enum.Font.GothamBlack
executeBtn.Text = "Execute"
executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
executeBtn.TextSize = 11.000

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = executeBtn

clearBtn.Name = "clearBtn"
clearBtn.Parent = bottomframe
clearBtn.BackgroundColor3 = Color3.fromRGB(112, 0, 168)
clearBtn.Position = UDim2.new(0.6, 0, 0.161290318, 0)
clearBtn.Size = UDim2.new(0.17, 0, 0.7,0)
clearBtn.Font = Enum.Font.GothamBlack
clearBtn.Text = "Clear"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.TextSize = 11.000

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = clearBtn

if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(0.015,0,0.025,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = bottomframe

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0, 325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            callback(idkframe.Text)
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)), ColorSequenceKeypoint.new(0.001, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
UIGradient.Offset = Vector2.new(-0.225, 0)
UIGradient.Rotation = 15
UIGradient.Parent = bottomframe

clearBtn.MouseButton1Click:Connect(function()
    idkframe.Text = ""
    end)
executeBtn.MouseButton1Click:Connect(function()
    pcall(function()
        callback(idkframe.Text)
        end)
    end)
inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

local Ft = {}

function Ft:GetInstance()
local Instances = {
    UICorner;
    idkframe;
    bottomframe;
    executeBtn;
    UICorner_2;
    clearBtn;
    UICorner_3;
    UIGradient;
    main;
}
return Instances
end

function Ft:Exe()
pcall(function()
    callback(idkframe.Text)
    end)
end

function Ft:GetState()
return idkframe.Text
end

function Ft:SetState(State)
idkframe.Text = tostring(State)
return nil
end

return Ft

end

function Tabs:CreateDropdown(name,options,callback,descr)

local main = Instance.new("Frame")
local labela = Instance.new("TextLabel")
local labelb = Instance.new("TextLabel")
local stfuCorner = Instance.new("UICorner")
local stfu2 = Instance.new("UIGradient")
local bakaButton = Instance.new("TextButton")
local dropdown = Instance.new("Frame")
local options = options or {
    "Table"
}

table.insert(ToDels_,Screen_Gui)

main.Name = name
main.Parent = inTab
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.Position = UDim2.new(0.39731285, 0, 0.234726697, 0)
main.Size = UDim2.new(0.98,0,0.10,0)
main.SizeConstraint = "RelativeXX"

stfuCorner.CornerRadius = UDim.new(0, 6)
stfuCorner.Name = "stfuCorner"
stfuCorner.Parent = main

stfu2.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)), ColorSequenceKeypoint.new(0.001, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
stfu2.Offset = Vector2.new(-0.225,0)
stfu2.Rotation = 15
stfu2.Name = "stfu2"
stfu2.Parent = main

labela.Name = "inBtn"
labela.Parent = main
labela.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
labela.BackgroundTransparency = 1
labela.Position = UDim2.new(0.075, 0, 0.0136783719, 0)
labela.Size = UDim2.new(0.825, 0, 1, 0)
labela.Selectable = false
labela.Font = Enum.Font.Gotham
labela.Text = tostring(name)
labela.TextColor3 = Color3.fromRGB(255, 255, 255)
labela.TextSize = 11.000
labela.TextWrapped = true

labelb.Visible = false
labelb.Name = "inBtn"
labelb.Parent = main
labelb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
labelb.BackgroundTransparency = 1
labelb.Position = UDim2.new(0.075, 0, 0.1, 0)
labelb.Size = UDim2.new(0.825, 0, 0.2, 0)
labelb.Selectable = false
labelb.Font = Enum.Font.Gotham
labelb.Text = "Chosen:"
labelb.TextColor3 = Color3.fromRGB(125, 125, 125)
labelb.TextSize = 11.000
labelb.TextWrapped = true

bakaButton.Name = "bakaButton"
bakaButton.Parent = main
bakaButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bakaButton.BackgroundTransparency = 0.85
bakaButton.Position = UDim2.new(0.9, 0, 0, 0)
bakaButton.Size = UDim2.new(0.1, 0, 1, 0)
bakaButton.Font = Enum.Font.GothamBold
bakaButton.Text = ">"
bakaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bakaButton.TextSize = 17.000
bakaButton.TextWrapped = true

Lib:UICorner(bakaButton,4)

dropdown.Name = "Drop$down"
dropdown.Parent = inTab
dropdown.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
dropdown.BorderSizePixel = 0
dropdown.Visible = false
dropdown.Position = UDim2.new(0.000820050074, 0, 0.974373996, 0)
dropdown.Size = UDim2.new(0.95, 0, 0, 0)
dropdown.SizeConstraint = "RelativeXX"
local ddSize = 0

Lib:UICorner(dropdown,8)

local currentsi

if descr then
local des = Instance.new("ImageButton")
des.ImageTransparency = 0.6
des.BackgroundTransparency = 1
des.Position = UDim2.new(-0.0125,0,0.075,0)
des.Image = DotDesc
des.Size = UDim2.new(0,30,0,30)
des.Parent = main

local function Description()
local ScreenGuia = Instance.new("ScreenGui")
local mainFrameBaka = Instance.new("Frame")
local downBarBaka = Instance.new("Frame")
local savebtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local discardbtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local cancelbtn = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local header = Instance.new("TextLabel")

table.insert(ToDels_,ScreenGuia)
ScreenGuia.Parent = CoreGui

mainFrameBaka.Name = "mainFrameBaka"
mainFrameBaka.Parent = ScreenGuia
mainFrameBaka.BorderSizePixel = 0
mainFrameBaka.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
mainFrameBaka.Position = UDim2.new(0.353102177, 0, 0.395498395, 0)
mainFrameBaka.Size = UDim2.new(0.281021923, 0, 0.2009646, 0)
mainFrameBaka.ZIndex = math.huge

downBarBaka.Name = "downBarBaka"
downBarBaka.BorderSizePixel = 0
downBarBaka.Parent = mainFrameBaka
downBarBaka.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
downBarBaka.BorderSizePixel = 0
downBarBaka.Position = UDim2.new(0, 0, 0.676467121, 0)
downBarBaka.Size = UDim2.new(0.999999821, 0, 0.323533386, 0)
downBarBaka.ZIndex = math.huge

if descr[1] ~= nil or false then
cancelbtn.Name = "cancelbtn"
cancelbtn.Parent = downBarBaka
cancelbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
cancelbtn.BackgroundTransparency = 1.000
cancelbtn.BorderSizePixel = 0
cancelbtn.Position = UDim2.new(0.0323353596, 0, 0, 0)
cancelbtn.Size = UDim2.new(0, 54, 0, 39)
cancelbtn.Font = Enum.Font.GothamSemibold
cancelbtn.Text = "Cancel"
cancelbtn.TextColor3 = Color3.fromRGB(0, 132, 255)
cancelbtn.TextSize = 12.000
cancelbtn.ZIndex = math.huge

local function descs()
descr[1](ScreenGuia,cancelbtn)
end
cancelbtn.MouseButton1Click:Connect(descs)

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = cancelbtn
else
    mainFrameBaka:Destroy()
end

if descr[2] ~= nil or false then
discardbtn.Name = "discardbtn"
discardbtn.Parent = downBarBaka
discardbtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
discardbtn.BackgroundTransparency = 1.000
discardbtn.BorderSizePixel = 0
discardbtn.Position = UDim2.new(0.562711895, 0, 0, 0)
discardbtn.Size = UDim2.new(0, 54, 0, 38)
discardbtn.Font = Enum.Font.GothamSemibold
discardbtn.Text = "Discard"
discardbtn.TextColor3 = Color3.fromRGB(255, 123, 125)
discardbtn.TextSize = 12.000
discardbtn.ZIndex = math.huge

local function descs()
descr[2](ScreenGuia,discardbtn)
end
discardbtn.MouseButton1Click:Connect(descs)

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = discardbtn
end

if descr[3] ~= nil or false then
savebtn.Name = "savebtn"
savebtn.Parent = downBarBaka
savebtn.BackgroundColor3 = Color3.fromRGB(26, 117, 243)
savebtn.BorderSizePixel = 0
savebtn.Position = UDim2.new(0.779088676, 0, 0.17150715, 0)
savebtn.Size = UDim2.new(0, 54, 0, 25)
savebtn.Font = Enum.Font.GothamSemibold
savebtn.Text = "Save"
savebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
savebtn.TextSize = 12.000
savebtn.ZIndex = math.huge

local function descs()
descr[3](ScreenGuia,savebtn)
end
savebtn.MouseButton1Click:Connect(descs)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = savebtn
end

if descr[4] then
title.Name = "title"
title.Parent = mainFrameBaka
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.015, 0, 0.05, 0)
title.Size = UDim2.new(0, 325, 0, 22)
title.Font = Enum.Font.GothamBold
title.Text = "string"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 13.000
title.ZIndex = math.huge
title.TextXAlignment = "Left"

descr[4](ScreenGuia,title)
end

if descr[5] then
header.Name = "header"
header.Parent = mainFrameBaka
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 1
header.BorderColor3 = Color3.fromRGB(27, 42, 53)
header.BorderSizePixel = 0
header.Position = UDim2.new(0.0519480482, 0, 0.216000021, 0)
header.Size = UDim2.new(0, 300, 0, 45)
header.Font = Enum.Font.GothamSemibold
header.Text = "string"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 11.000
header.TextWrapped = true
header.TextXAlignment = Enum.TextXAlignment.Left
header.ZIndex = math.huge

descr[5](ScreenGuia,header)
end
end

task.spawn(function()
    while not descr[6]() do wait() end
    if descr[6] then
    local UIS = game:GetService('UserInputService') --Gets the UserInputService
    UIS.InputBegan:Connect(function(input)
        local En = Enum.KeyCode
        if descr[6]() ~= En.Unknown then
        if input.KeyCode == descr[6]() then
        pcall(function()
            callback(currents)
            end)
        end
        end
        end)
    end
    end)

des.MouseButton1Click:Connect(Description)
end

local Pad = Lib:UIPad(dropdown)
Pad.PaddingTop = UDim.new(0,5)
Lib:UIList(dropdown,4)

local t = false
bakaButton.MouseButton1Click:Connect(function()
    t = not t
    if t then
    inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk+ddSize)
    dropdown.Visible = true
    bakaButton.Text = "v"
    dropdown.Name = "DropSdown"
    else
        inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk-ddSize)
    dropdown.Visible = false
    bakaButton.Text = ">"
    dropdown.Name = "Drop$down"
    end
    end)

for i, v in pairs(options) do
local dropor = Instance.new("TextButton")
local label = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

ddSize = ddSize + 48
dropdown.Size = dropdown.Size + UDim2.new(0,0,0.125,0)
dropor.AutoButtonColor = false
dropor.Name = "inBtn"
dropor.Parent = dropdown
dropor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropor.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
dropor.Size = UDim2.new(0.8, 0, 0.1, 0)
dropor.Selectable = false
dropor.Font = Enum.Font.Gotham
dropor.Text = tostring(v)
dropor.TextColor3 = Color3.fromRGB(255, 255, 255)
dropor.TextSize = 11.000
dropor.TextWrapped = true
dropor.SizeConstraint = "RelativeXX"

label.Name = "inBtn"
label.Parent = dropor
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.Position = UDim2.new(0, 0, 0, 0)
label.Size = UDim2.new(1,0,1,0)
label.Selectable = false
label.Font = Enum.Font.Gotham
label.Text = tostring(v)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 11.000
label.TextWrapped = true

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(70, 26, 165)), ColorSequenceKeypoint.new(0.001, Color3.fromRGB(31, 29, 33)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
UIGradient.Offset = Vector2.new(-0.225,0)
UIGradient.Rotation = 15
UIGradient.Parent = dropor

Lib:UICorner(dropor,4)

local function cliche()
labelb.Visible = true
pcall(function()
    currentsi = dropor.Text
    callback(dropor.Text)
    end)
labela.Text = dropor.Text
end

inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)

dropor.MouseButton1Click:Connect(cliche)
end

local Ft = {}

function Ft:GetInstance()
local Instances = {
    main;
    labela;
    labelb;
    stfuCorner;
    stfu2;
    bakaButton;
    dropdown;
}
return Instances
end

function Ft:Exe()
pcall(function()
    callback(currentsi)
    end)
end

function Ft:GetState()
return currents
end

function Ft:SetState(State)
labela.Text = tostring(State)
currents = labela
return nil
end

return Ft

end

function Tab:CreateBlank(name,clicked)
local name = name or ""
local clicked = clicked or function() end
local designA = Instance.new("TextLabel")
local inBtn = Instance.new("TextButton")

inBtn.AutoButtonColor = false
inBtn.Name = "inBtn"
inBtn.Parent = inTab
inBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inBtn.BackgroundTransparency = 0
inBtn.BorderSizePixel = 0
inBtn.Position = UDim2.new(0.10204082, 0, 0.0136783719, 0)
inBtn.Size = UDim2.new(0, 325, 0, 35)
inBtn.Selectable = false
inBtn.Font = Enum.Font.Gotham
inBtn.Text = name
inBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
inBtn.TextSize = 11.000
inBtn.TextWrapped = true
inBtn.SizeConstraint = "RelativeXX"

Lib:UICorner(inBtn,6)

designA.Active = false
designA.Name = "designA"
designA.Parent = inBtn
designA.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
designA.BackgroundTransparency = 1
designA.Position = UDim2.new(0, 0, 0, 0)
designA.Size = UDim2.new(0, 325, 0, 35)
designA.Font = Enum.Font.Gotham
designA.Text = name
designA.TextWrapped = true
designA.TextColor3 = Color3.fromRGB(255, 255, 255)
designA.TextSize = 11.000

Lib:UICorner(designA,4)

inTab.CanvasSize = UDim2.new(0,0,0,inTabCanvas.AbsoluteContentSize.Y+inTabCanvas.Padding.Offset+bigChunk)
return inBtn
end
return Tabs
end
return Tab
end
print(os.clock()-start)
return Lib
