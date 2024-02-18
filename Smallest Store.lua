local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("Alwi Hub | Smallest Store")
local tab = window:CreateTab("Main") 
local tabs = window:CreateTab("Teleport") 
local w = window:CreateTab("Others") 
tab:CreateButton("Goto Map5", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6104.82764, 274.268341, -1202.30713, 0.994328022, -2.24032402e-08, -0.106357045, 2.06277768e-08, 1, -1.77934982e-08, 0.106357045, 1.54986637e-08, 0.994328022)
end)

tab:CreateToggle("Farm Coin",false,function(FarmCoin) 
_G.FarmCoin == true do
while _G.FarmCoin == true do
  wait() 
   game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.LogRideService.RF.RequestRideStart:InvokeServer()
end
                 
tab:CreateButton("AntiAFK", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk";
    Text = "Turn On"; 
    Duration = 30;
})

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end)

tabs:CreateButton("Console", function() 
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)

tabs:CreateButton("AntiLag", function() 
local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = 0
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(w:GetDescendants()) do
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted  then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.Graphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end
for i = 1,#l:GetChildren() do
    e=l:GetChildren()[i]
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
w.DescendantAdded:Connect(function(v)
    wait() 
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.ShirtGraphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end)
end)


tabs:CreateToggle("Hide Player", function(Fu) 
        _G.Fu = Fu
while _G.Fu and  task.wait() do

for i,v in pairs(game.Players:GetPlayers()) do
if v.Name ~= game.Players.LocalPlayer.Name and v.Character then
v.Character:Destroy()
end
end
end
end) 


w:CreateButton("Join My discord", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 


game.StarterGui:SetCore("SendNotification", {
    Title = "Alwi hub | Smallest Store";
    Text = "Thank You for executor My script"; 
    Duration = 20;
})



