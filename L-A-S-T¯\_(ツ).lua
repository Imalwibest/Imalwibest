local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                               Alwi Hub | LAST TO LEAVE [BETA]")
local tab = window:CreateTab("Main") 
local tabs = window:CreateTab("Misc") 
local w = window:CreateTab("Main") 
tab:CreateToggle("Freeze",false,function(LMAO) 
for _, player in pairs(game.Players:GetPlayers()) do
            local character = player.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Anchored = LMAO
                    end
                end
            end
        end
end) 

tab:CreateButton("Fling All [Beta]", function() 
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Skid-fling")))()
end) 

tab:CreateButton("Safe Zone", function() 
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-0.7110104560852051, 662.5797119140625, -3.298123598098755)) 
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

w:CreateButton("Console", function() 
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)
w:CreateButton("Join My discord", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 

game.StarterGui:SetCore("SendNotification", {
    Title = "Alwi hub | Last to leave [Beta]";
    Text = "Thank You For executor my script"; 
    Duration = 15;
})


local newBrick = Instance.new("Part") 
newBrick.Size = Vector3.new(10, 0, 10)  
newBrick.Anchored = true  
newBrick.Transparency = 0.4
local newCFrame = CFrame.new(Vector3.new(-0.7270021438598633, 655.8128051757812, -3.2815213203430176)) 
newCFrame = newCFrame * CFrame.Angles(0, math.rad(90), 0) 
newBrick.CFrame = newCFrame
newBrick.Parent = workspace
local workspace = game:GetService("Workspace")
