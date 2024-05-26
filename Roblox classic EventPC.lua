local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Roblox The Classic Script", "Sentinel")
local Tab = Window:NewTab("Universal Script")
local Section = Tab:NewSection("The classic")
-- 1
Section:NewButton("The Classic", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/TheClassic", true))()
end) 
Section:NewButton("Teleport The classic", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(17427651911, player)
end
end) 
-- 2
local Section = Tab:NewSection("Bedwars")
local Section = Tab:NewSection("Tix Esp")
Section:NewButton("Bedwars", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicBedWars", true))()
end)
local Section = Tab:NewSection("Peguin Event For token")
Section:NewButton("VapeV4 And flyjump", "?", function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
    if InfiniteJumpEnabled then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)


loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end) 
Section:NewButton("Teleport To Bedwars", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(6872265039, player)
end
end) 
-- 3

local Section = Tab:NewSection("Arsenal")
Section:NewButton("Arsenal", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicArsenal", true))()
end) 

Section:NewButton("Teleport To Arsenal", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(286090429, player)
end
end) 

-- 4
local Section = Tab:NewSection("Bee Swarm Sim")
Section:NewButton("Bee Swarm Sim", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicBeeSwarm", true))()
end) 

Section:NewButton("Teleport Bee Swarm Sim", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(1537690962, player)
end
end) 

-- 5
local Section = Tab:NewSection("Dress To Impress")
Section:NewButton("Dress To Impress", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicDressToImpress", true))()
end) 

Section:NewButton("Teleport Dress To Impress ", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(14056754882, player)
end
end) 

-- 6
local Section = Tab:NewSection("A Dusty Trip Classic")
Section:NewButton("A Dusty Trip Classic", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicAdustyTrip", true))()
end) 
Section:NewButton("Teleport A Dusty Trio classic", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(16389395869, player)
end
end)
-- 7
local Section = Tab:NewSection("LiveTopia")
Section:NewButton("LiveTopia Classic", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicLivetopia", true))()
end) 
Section:NewButton("Teleport LiveTopia Classic", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(6737970321, player)
end                                  
end)


-- 8
local Section = Tab:NewSection("GunFight")
Section:NewButton("GunFight script 1", "?", function()
loadstring(game:HttpGet('https://github.com/ToraScript/Script/blob/main/ClassicGunfight'))()
end)
Section:NewButton("GunFight script 2", "?", function()
loadstring(game:HttpGet(('https://pastefy.app/FL5mxhtj/raw'),true))()
end) 
Section:NewButton("Teleport GunFight", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(14518422161, player)
end
end)

-- 9
local Section = Tab:NewSection("Classic ClipIt")
Section:NewButton("Classic ClipIt", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicClipIt", true))()
end) 
Section:NewButton("Teleport Classic ClipIt", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(11765402359, player)
end
end) 

-- 10
local Section = Tab:NewSection("Classic Toilet Tower")
Section:NewButton("Classic Toilet Tower", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicToiletTower", true))()
end) 
Section:NewButton("Teleport Classic Toilet Tower", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Telepor(13775256536, player)
end
end) 

-- 11
local Section = Tab:NewSection("Restaurant Tycoon")
Section:NewButton("Restaurant Tycoon", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicRestaurant", true))()
end) 
Section:NewButton("Teleport Restaurant Tycoon", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(3398014311, player)
end
end) 

-- 12
local Section = Tab:NewSection("Classic Driving Empire")
Section:NewButton("Classic Driving Empire", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicDrivingEmpire", true))()
end) 
Section:NewButton("Teleport Classic Driving Empire", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(3351674303, player)
end
end) 

-- 13
local Section = Tab:NewSection("Dragon Adventure")
Section:NewButton("Dragon Adventure!", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicDragon", true))()
end) 
Section:NewButton("Teleport Dragon Adventure! ", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(3475397644, player)
end
end) 

-- 14
local Section = Tab:NewSection("Adopt me")
Section:NewButton("Adopt me", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicAdoptMe", true))()
end) 
Section:NewButton("Adopt me script 2", "?", function()
loadstring(game:HttpGet(('https://pastefy.app/JLMg6KtF/raw'),true))()
end) 
Section:NewButton("Teleport Adopt Me", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(920587237, player)
end
end) 


-- 15
local Section = Tab:NewSection("Blade ball")
Section:NewButton("Blade Ball", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicBladeBall", true))()
end) 

Section:NewButton("Teleport Blade ball", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(13772394625, player)
end
end) 

-- 16
local Section = Tab:NewSection("TTD")
Section:NewButton("Teleport The Tower defense sim", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/ClassicTowerDefense", true))()
end) 
Section:NewButton("Teleport The Tower defense sim", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(3260590327, player)
end
end) 

local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Universal script")
Section:NewButton("Nofog", "?", function()
    if game.Lighting then
        game.Lighting.FogEnd = 100000
        for _, v in pairs(game.Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    end
end)

Section:NewButton("Full bright", "?", function()
game.Lighting.Brightness = 4
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
    game.Lighting.ClockTime = 12
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
end) 
Section:NewButton("AntiAFK", "?", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk";
    Text = "Turn On"; 
    Duration = 3;
})

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end)

local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("Alwi/byeveryone")
local Section = Tab:NewSection("Update Add all game! and more!")
Section:NewButton("Console", "?", function()
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)

Section:NewButton("My discord", "?", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 

Section:NewButton("Teleport The classic", "?", function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
if player then
    TeleportService:Teleport(17427651911, player)
end
end) 
