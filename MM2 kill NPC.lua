local Players = game:GetService("Players")

local player = Players.LocalPlayer
local client = player.Character.HumanoidRootPart

local function goToPart(part)
    client.CFrame = part.CFrame + Vector3.new(0, 2, 0)
end

local function toggleTeleport(bool)
    if bool then
        spawn(function()
            while bool do
                for _, v in ipairs(game:GetService("Workspace").AllNPC:GetDescendants()) do
                    if v:IsA("Part") then
                        goToPart(v)
                        v.Transparency = 1
                        v.CanCollide = false
                        v.Anchored = false
                    end
                end
                wait(0.9)
            end
        end)
    end
end

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("              Alwi Hub | MM2 kill NPC")
local tab = window:CreateTab("Main")

local teleportEnabled = false

tab:CreateToggle("Auto kill NPC", false, toggleTeleport)

local function autoUseTools(bool)
    if bool then
        getgenv().firetools = true
        spawn(function()
            while wait() and firetools do
                pcall(function()
                    local Tool = player.Backpack:FindFirstChildWhichIsA("Tool")
                    if Tool and not player.Character:FindFirstChildWhichIsA("Tool") then
                        player.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(Tool)
                    end
                    if player.Character:FindFirstChildWhichIsA("Tool") then
                        player.Character:FindFirstChildWhichIsA("Tool"):Activate()
                    end
                end)
            end
        end)
    else
        getgenv().firetools = false
    end
end

tab:CreateToggle("Auto Use Tools in Inventory", false, autoUseTools)


tab:CreateButton("AntiAFK", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "AntiAfk";
    Text = "Turn On"; 
    Duration = 10;
})

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Credit";
    Text = "Ikura Script Modify by Alwi hub"; 
    Duration = 10;
})
