local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
 local window = library.CreateLib("Alwi hub | Ragdoll Engine Brawl", "Serpent") 
 local main = window:NewTab("Sword") 
 local section = main:NewSection("Auto Play ") 
 local main1 = window:NewTab("Misc") 
 local section1 = main1:NewSection("Local Player")
 local plr = game.Players.LocalPlayer 
  
 local oldmt  
 oldmt = hookmetamethod(game, "__index", function(self, index) 
     if index == ("WalkSpeed" or "JumpPower") then 
         return 16 
     end  
     return oldmt(self, index) 
 end) 
  
 local function getclosestplayer(range) 
     local closest = nil  
     local maxdist = math.huge  
     for i,v in pairs(game.Players:GetPlayers()) do  
         if v ~= plr and v.Character and (not v.Character:FindFirstChild("ForceField")) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 then  
             local mag = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude 
             if mag < maxdist and mag < range then  
                 maxdist = mag  
                 closest = v  
             end  
         end  
     end  
     return closest  
 end  
  
 
  
 game:GetService("RunService").RenderStepped:Connect(function() 
 if ora and plr.Character:FindFirstChildOfClass("Tool") then 
 for i,v in pairs(getclosestplayer(qtr).Character:GetChildren()) do  
 if v:IsA("BasePart") then  
 plr.Character:FindFirstChildOfClass("Tool"):Activate() 
 firetouchinterest(plr.Character:FindFirstChildOfClass("Tool").Handle, v, 0) 
 wait() 
 firetouchinterest(plr.Character:FindFirstChildOfClass("Tool").Handle, v, 1) 
 end  
 end  
 end  
 end) 
  
 
  
 
 section:NewToggle("Hitbox Extender", "", function(c) 
     d = c  
     while d and task.wait() do  
         pcall(function() 
             for i,v in pairs(game.Players:GetPlayers()) do  
                 if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then  
                 v.Character.HumanoidRootPart.Size = Vector3.new(pir, pir, pir) 
                 v.Character.HumanoidRootPart.Transparency = .8 
                 end  
             end 
         end)  
     end  
 end) 
  
 section:NewSlider("Hitbox Size", "", 1, 25, function(pqor) 
 pir = pqor  
 end) 

section:NewTextBox("Hitbox Expander", "?", function(pqor)
pir = pqor  
end)  

local section = main:NewSection("hitbox 25 - 26") 

 section:NewToggle("AFK Farm Kills", "", function(a) 
     b = a  
     while b and task.wait() do  
         pcall(function() 
         for i,v in pairs(plr.Character:GetDescendants()) do  
             if v:IsA("BasePart") and v.CanCollide then  
                 v.CanCollide = false  
             end  
         end  
         plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0) 
         plr.Character:FindFirstChildOfClass("Tool"):Activate() 
         if getclosestplayer(99e99) == nil then  
         game:GetService("TweenService"):Create(plr.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear), {CFrame = CFrame.new(0, 4, -0)}):Play() 
         else  
         game:GetService("TweenService"):Create(plr.Character.HumanoidRootPart, TweenInfo.new((getclosestplayer(99e99).Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude / 50, Enum.EasingStyle.Linear), {CFrame = getclosestplayer(99e99).Character.HumanoidRootPart.CFrame + getclosestplayer(99e99).Character.HumanoidRootPart.CFrame.lookVector * -2}):Play() 
         end 
         end) 
     end  
 end) 
  

section:NewToggle("Anti Ragdoll TweenTp", "?", function(v) 
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
    if InfiniteJumpEnabled then
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    end
end)
                  
_G.Spin = v
while _G.Spin == true do
    wait() 
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
    end) 

local section = main:NewSection("If not work anti Ragdoll click again") 


section:NewButton("Auto Click", "?", function()
--// Setting \\--
local range = 999999999
 
--// Variable \\--
local player = game:GetService("Players").LocalPlayer
 
--// Script \\--
game:GetService("RunService").RenderStepped:Connect(function()
    local p = game.Players:GetPlayers()
    for i = 2, #p do local v = p[i].Character
        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
                for i,v in next, v:GetChildren() do
                    if v:IsA("BasePart") then
                        firetouchinterest(tool.Handle,v,0)
                        firetouchinterest(tool.Handle,v,1)
                    end
                end
            end
        end
    end
end)
end)

local section = main:NewSection("if you get kick rejoin again") 

 section1:NewSlider("WalkSpeed", "", 500, 16, function(oirq) 
 plr.Character.Humanoid.WalkSpeed = oirq  
 end) 
  
 section1:NewSlider("JumpPower", "", 500, 50, function(roe) 
 plr.Character.Humanoid.JumpPower = roe  
 end) 
  

Notification = Instance.new("BindableFunction")
function Notification.OnInvoke(response)
    if response == "Execute" then     
loadstring(game:HttpGet('https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/music.exe.lua'))()
    end
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Alwi Hub [Beta]"; 
    Duration = math.huge;  
    Button1 = "Yes"; 
    Callback = Notification,
    Text = "this still beta if u get kick rejoin"
})

task.wait(0.0777)