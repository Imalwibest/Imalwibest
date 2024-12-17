-->
if getgenv().AlwiHubRunning then
    getgenv().AlwiHubRunning = false
    print("AlwiHub script stopped.")
    return
end

getgenv().AlwiHubRunning = true
print("AlwiHub script is now running...")

local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

if getgenv().AlwiHub["AntiAFK"] then
    task.spawn(function()
        while getgenv().AlwiHubRunning and getgenv().AlwiHub["AntiAFK"] do
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end

if getgenv().AlwiHub["Auto Candy"] then
    task.spawn(function()
        while getgenv().AlwiHubRunning and getgenv().AlwiHub["Auto Candy"] do
            local character = player.Character or player.CharacterAdded:Wait()
            local parts = {}

         
            for _, v in workspace.Candy:GetChildren() do
                if v.Name == "Part" and v:IsA("BasePart") then
                    table.insert(parts, v)
                end
            end

            
            for i = #parts, 2, -1 do
                local j = math.random(1, i)
                parts[i], parts[j] = parts[j], parts[i]
            end

            for _, v in ipairs(parts) do
                if not getgenv().AlwiHubRunning or not getgenv().AlwiHub["Auto Candy"] then break end
                character:SetPrimaryPartCFrame(v.CFrame)
                task.wait(getgenv().AlwiHub["Delay"]) 
            end
        end
    end)
end

if getgenv().AlwiHub["Auto Multi Candy Increase"] then
    task.spawn(function()
        while getgenv().AlwiHubRunning and getgenv().AlwiHub["Auto Multi Candy Increase"] do
            ReplicatedStorage.Events.BuyHalloweenItem:FireServer("1Rebirth", 1)
            task.wait(getgenv().AlwiHub["Delay Multi Candy Increase"]) -- Controlled delay
        end
    end)
end
