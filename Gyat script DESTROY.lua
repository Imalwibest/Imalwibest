local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Infinix.lib%20Remade.lua"))()
local window = library:CreateWindow("Alwi is gay.lua")
local tab = window:CreateTab("Weapon") 
local tabs = window:CreateTab("Target") 
local w = window:CreateTab("Misc") 
getgenv().money = false
getgenv().wins = false
getgenv().killAll = false
getgenv().money3 = false
local plr = game.Players.LocalPlayer
local weapons = game.ReplicatedStorage.Weapons
local target = nil

local function kill(player)
    local args = {
        [1] = {},
        [2] = player,
        [3] = player.Character.Humanoid,
        [4] = 9e9
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DamagePlayer"):FireServer(unpack(args))
end

local weaponList = {}
for _, v in pairs(weapons:GetDescendants()) do
    if v:IsA("Model") and (v.Parent.Name == "Common" or v.Parent.Name == "Epic" or v.Parent.Name == "Legendary" or v.Parent.Name == "Unknown") then
        table.insert(weaponList, v.Name)
    end
end

local selectedWeapon = nil
tab:CreateDropdown("Unlock Weapon", weaponList, function(name)
    selectedWeapon = name
end)

tab:CreateButton("Unlock Selected Weapon", function()
    if selectedWeapon then
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnlockWeapon"):FireServer(selectedWeapon)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Alwi hub Notice!",
            Text = "Unlocked weapon: " .. selectedWeapon,
            Duration = 3
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Alwi hub Notice!",
            Text = "Select a weapon to unlock",
            Duration = 5
        })
    end
end)

tab:CreateButton("Unlock All Weapons", function()
    for _, weaponName in ipairs(weaponList) do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnlockWeapon"):FireServer(weaponName)
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Alwi hub Notice!",
        Text = "Unlocked all weapons",
        Duration = 3
    })
end)

tab:CreateToggle("Money Farm V1", false, function(bool) 
    getgenv().money = bool
    while getgenv().money do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimDailyQuest"):FireServer()
        wait()
    end
end)

tab:CreateToggle("Money Farm V2", false, function(money4) 
    getgenv().money3 = money4
    while getgenv().money and task.wait() do
local args = {
                [1] = "UGC"
            }
            game:GetService("ReplicatedStorage").Remotes.ClaimDailyQuest:FireServer(unpack(args))
end
end) 
local function createESP()
    local Holder = Instance.new("Folder", game.CoreGui)
    Holder.Name = "ESP"

    local Box = Instance.new("BoxHandleAdornment")
    Box.Name = "nilBox"
    Box.Size = Vector3.new(4, 7, 4)
    Box.Transparency = 0.7
    Box.ZIndex = 0
    Box.AlwaysOnTop = true
    Box.Visible = true

    local NameTag = Instance.new("BillboardGui")
    NameTag.Name = "nilNameTag"
    NameTag.Enabled = false
    NameTag.Size = UDim2.new(0, 200, 0, 50)
    NameTag.AlwaysOnTop = true
    NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
    local Tag = Instance.new("TextLabel", NameTag)
    Tag.Name = "Tag"
    Tag.BackgroundTransparency = 1
    Tag.Position = UDim2.new(0, -50, 0, 0)
    Tag.Size = UDim2.new(0, 300, 0, 20)
    Tag.TextSize = 20
    Tag.TextStrokeColor3 = Color3.new(0, 0, 0)
    Tag.TextStrokeTransparency = 0.4
    Tag.Text = "nil"
    Tag.Font = Enum.Font.SourceSansBold
    Tag.TextScaled = false

    local LoadCharacter = function(v)
        repeat wait() until v.Character ~= nil
        v.Character:WaitForChild("Humanoid")
        local vHolder = Holder:FindFirstChild(v.Name)
        vHolder:ClearAllChildren()
        local b = Box:Clone()
        b.Name = v.Name .. "Box"
        b.Adornee = v.Character
        b.Parent = vHolder
        local t = NameTag:Clone()
        t.Name = v.Name .. "NameTag"
        t.Enabled = true
        t.Parent = vHolder
        t.Adornee = v.Character:WaitForChild("Head", 5)
        if not t.Adornee then
            return UnloadCharacter(v)
        end
        t.Tag.Text = v.Name

        local hue = 0
        local UpdateColor
        UpdateColor = function()
            hue = (hue + 1) % 360  -- Increment hue value (0 to 359)
            local rgb = Color3.fromHSV(hue / 360, 1, 1)  
            b.Color3 = rgb
            t.Tag.TextColor3 = rgb
            wait(0.05)  
            UpdateColor()
        end
        spawn(UpdateColor)
    end

    local UnloadCharacter = function(v)
        local vHolder = Holder:FindFirstChild(v.Name)
        if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
            vHolder:ClearAllChildren()
        end
    end

    local LoadPlayer = function(v)
        local vHolder = Instance.new("Folder", Holder)
        vHolder.Name = v.Name
        v.CharacterAdded:Connect(function()
            pcall(LoadCharacter, v)
        end)
        v.CharacterRemoving:Connect(function()
            pcall(UnloadCharacter, v)
        end)
        v.Changed:Connect(function(prop)
            if prop == "TeamColor" then
                UnloadCharacter(v)
                wait()
                LoadCharacter(v)
            end
        end)
        LoadCharacter(v)
    end

    local UnloadPlayer = function(v)
        UnloadCharacter(v)
        local vHolder = Holder:FindFirstChild(v.Name)
        if vHolder then
            vHolder:Destroy()
        end
    end

    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        spawn(function() pcall(LoadPlayer, v) end)
    end

    game:GetService("Players").PlayerAdded:Connect(function(v)
        pcall(LoadPlayer, v)
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(v)
        pcall(UnloadPlayer, v)
    end)

    game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
end

tab:CreateToggle("ESP PLAYER", false, function(esp)
    if esp then
        createESP()
    else
        local espFolder = game.CoreGui:FindFirstChild("ESP")
        if espFolder then
            espFolder:Destroy()
        end
    end
end)

tabs:CreateSlider("WalkSpeed", 10, 1000, function(value)
    plr.Character.Humanoid.WalkSpeed = value
end)

local playerNames = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

tabs:CreateDropdown("Target", playerNames, function(selectedName)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name == selectedName then
            target = player
            break
        end
    end
end)

tabs:CreateButton("Kill Target", function()
    if target ~= nil then
        if plr.Team and plr.Team ~= "" then
            kill(target)
            game.StarterGui:SetCore("SendNotification", {
                Title = "Alwi hub Notice!",
                Text = "Killed target: " .. target.Name,
                Duration = 3
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Alwi hub Notice!",
                Text = "You need to be in the game",
                Duration = 5
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Alwi hub Notice!",
            Text = "Select a target",
            Duration = 5
        })
    end
end)

tabs:CreateToggle("Auto Kill All", false, function(killall) 
    getgenv().killAll = killall
    while getgenv().killAll do
        if plr.Team and plr.Team ~= "" then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= plr then
                    kill(player)
                end
            end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Alwi hub Notice!",
                Text = "You need to be in the game",
                Duration = 5
            })
            getgenv().killAll = false
        end
        wait()
    end
end)


w:CreateButton("AntiLag", function() 
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

w:CreateButton("Click To credit", function() 
game.StarterGui:SetCore("SendNotification", {
        Title = "Credit to alwi";
        Text = "enjoy script?";
        Duration = 5;
    })
end)

