local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local LocPlayer = game.Players.LocalPlayer
local chr = LocPlayer.Character
local hum = chr.Humanoid
local root = chr.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local number = math.huge
local offset = Vector3.new(20,0,0)
local enemys = nil
local game_id = game.PlaceId
local RaidID = 14842883897
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local code = {
	"iluvchesthero",
	"swords4life",
	"opshieldsgg",
	"chestmaster3000",
	"superchest8888",
	"jackpotchest6666",
	"tysm88all"
}

local enabled = false
local filluseteamcolor = false
local outlineuseteamcolor = false
local fillcolor = Color3.new(0, 0, 0)
local outlinecolor = Color3.new(1, 1, 1)
local filltrans = 0
local outlinetrans = 0
local uselocalplayer = false

--local holder = game.CoreGui:FindFirstChild("NPC_ESPHolder") or Instance.new("Folder")
--[[if holder.Name == "Folder" then
    holder.Name = "NPC_ESPHolder"
    holder.Parent = workspace
end

if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end
]]

if enabled == true then 
    enabled = false
    enabled = true
end

local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'Start_Attack' then
        enemys = Args[1]
end
	return namecall(self, ...) 
end)

local function workspaceChildren(str,func)
for _,v in pairs(str:GetChildren()) do
    func(v)
  end
end

local function stopMoving(str)
    str.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
end

local function ClaimUGC(str)
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Buy_UGC"]:InvokeServer(str)
end

local function ChestLVL(str)
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ShopService"]["RF"]["Claim_Fund"]:InvokeServer("ChestLv",str)
end

local function PeakChest()
workspaceChildren(workspace["ThePeak"]["Peak_Chest"]["RootPart"]["Attachment"],function(v)
	if v:IsA("ProximityPrompt") then
		fireproximityprompt(v)
	end
end)
end

local function text(str,func)
	func(str.Text)
end

local function TextArray(str,time,func)
	func(str.Text,time.Text)
end

local Settings = {
    Height = LocPlayer:GetAttribute("Atk_Range"),
    Height1 = LocPlayer:GetAttribute("Atk_Range"),
    distance = 10,
    enemyd = -10
}

local method = {
    Top = false,
    Under = false,
    Behind = true,
    Teleport = true
}

--workspace["DungeonFolder"]:FindFirstChild("16")["Enemy_Folder"]["Epic_10"]

local function Teleport(target)
if method.Teleport == true then
        if method.Top == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,Settings.Height,0)
        elseif method.Under == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,-Settings.Height1,0)
        elseif method.Behind == true then
            LocPlayer.Character.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0,0,Settings.distance)
        end
elseif method.Teleport == false then
        if method.Top == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(-90),0,0) + Vector3.new(0,Settings.Height,0)}):Play()
        elseif method.Under == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,Settings.Height1,0)}):Play()
        elseif method.Behind == true then
            TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0),{CFrame = target.CFrame * CFrame.new(0,0,Settings.distance)}):Play()
        end
    end
end

local function sell()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Sell_Equipment"]:InvokeServer()
end

local function equip()
    game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Change_Equipment"]:InvokeServer()
end

local function AttackDummy(str)
	local args = {
    [1] = {
        [1] = workspace["NPCs"]["Targets"]["Target"]
    }
}

game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer(unpack(args))
end

local function NpcCFrame(str)
local rotatedOffset = offset:rotate(Vector3.new(0,math.rad(LocPlayer.Character.HumanoidRootPart.Orientation.Y),0))
        local newPosition = LocPlayer.Character.HumanoidRootPart.Position + rotatedOffset

        local lookVector = (newPosition - LocPlayer.Character.HumanoidRootPart.Position).unit
        local orientation = Vector3.new(lookVector.x,0,lookVector.z).unit
        local angle = math.atan2(orientation.z,orientation.x)
        str:SetPrimaryPartCFrame(CFrame.new(newPosition) * CFrame.Angles(0,angle,0))
end

local function SafeNPC(str)
str.HumanoidRootPart.CFrame = LocPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,Settings.enemyd)
end

local function listenToChildrenChanges()
workspaceChildren(workspace["DungeonFolder"],function(v)
   workspaceChildren(v["Enemy_Folder"],function(minion)
	if minion:IsA("Model") and minion:FindFirstChild("Humanoid") or minion:FindFirstChild("HumanoidRootPart") then
            minion.HumanoidRootPart:GetPropertyChangedSignal("Position"):Connect(function()
                minion.Humanoid.WalkSpeed = 0
            end)
        end
    end)
    end)
end

listenToChildrenChanges()

local function Calculate(str)
    return #str["Enemy_Folder"]:GetChildren()
end

local function CalculateRandom(str)
    return #str["Enemy_Folder"]:GetChildren()[math.random(1,#str["Enemy_Folder"]:GetChildren())]
end

local UGC_ID = {}

if game_id ~= RaidID then
OrionLib:AddTable(game:GetService("ReplicatedStorage").UGCFolder,UGC_ID)
end

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Dungeon",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Gacha",
Icon = "rbxassetid://",
PremiumOnly = false
})

local AT4 = Window:MakeTab({
Name = "Upgrades",
Icon = "rbxassetid://",
PremiumOnly = false
})

local chest = AT4:AddSection({
Name = "CHEST UPGRADER"
})

local wing = AT4:AddSection({
Name = "WINGS UPGRADER"
})

local AT5 = Window:MakeTab({
Name = "Chest",
Icon = "rbxassetid://",
PremiumOnly = false
})

local D = Window:MakeTab({
Name = "Config",
Icon = "rbxassetid://",
PremiumOnly = false
})

local AA = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "NPC Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Teleport Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})

--[[local T6 = Window:MakeTab({
Name = "X-RAY Settings",
Icon = "rbxassetid://",
PremiumOnly = false
})
]]

T5:AddSlider({
  Name = "OnTop Distance",
  Min = 0,
  Max = 100,
  Default = Settings.Height,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.Height = Value
  end    
})

T5:AddSlider({
  Name = "Under Distance",
  Min = 0,
  Max = 100,
  Default = Settings.Height1,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.Height1 = Value
  end    
})

T5:AddSlider({
  Name = "Behind Distance",
  Min = 0,
  Max = 100,
  Default = Settings.distance,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "Distance",
  Callback = function(Value)
     Settings.distance = Value
  end    
})

T5:AddToggle({
Name = "OnTop Teleport",
Default = method.Top,
Callback = function(Value)
        method.Top = Value
end})

T5:AddToggle({
Name = "Under Teleport",
Default = method.Under,
Callback = function(Value)
        method.Under = Value
end})

T5:AddToggle({
Name = "Behind Teleport",
Default = method.Behind,
Callback = function(Value)
        method.Behind = Value
end})

T5:AddToggle({
Name = "Teleport Method",
Default = method.Teleport,
Callback = function(Value)
        method.Teleport = Value
end})

--[[
local enabled = true
local filluseteamcolor = false
local outlineuseteamcolor = false
local fillcolor = Color3.new(0, 0, 0)
local outlinecolor = Color3.new(1, 1, 1)
local filltrans = 0
local outlinetrans = 0
local uselocalplayer = false
]]

--[[T6:AddToggle({
  Name = "Enable X-RAY (Enemy Only)",
  Default = false,
  Callback = function(Value)
     enabled = Value
  end    
})

T6:AddColorpicker({
  Name = "Fill Color",
  Default = Color3.fromRGB(0,0,0),
  Callback = function(Value)
      fillcolor = Value
  end  
})

T6:AddColorpicker({
  Name = "Outline Color",
  Default = Color3.fromRGB(1,1,1),
  Callback = function(Value)
      outlinecolor = Value
  end  
})

T6:AddSlider({
  Name = "Fill Transparency",
  Min = 0,
  Max = 1,
  Default = 0,
  Color = Color3.fromRGB(255,255,255),
  Increment = 0.1,
  ValueName = "Transparency",
  Callback = function(Value)
     filltrans = Value
  end    
})

T6:AddSlider({
  Name = "Outline Transparency",
  Min = 0,
  Max = 1,
  Default = 0,
  Color = Color3.fromRGB(255,255,255),
  Increment = 0.1,
  ValueName = "Transparency",
  Callback = function(Value)
     outlinetrans = Value
  end    
})

T5:AddToggle({
Name = "Start Teleport",
Default = false,
Callback = function(Value)
_G.StartTP = Value
      while wait() do
        if _G.StartTP == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                Teleport(c.HumanoidRootPart)
            end)
          end)
      end
end    
})
]]

D:AddButton({
Name = "Infinite Damage",
Callback = function()
      LocPlayer:SetAttribute("atk",number)
  end    
})

--[[D:AddButton({
Name = "Infinite Range",
Callback = function()
      LocPlayer:SetAttribute("Atk_Range",number)
  end    
})
]]

D:AddButton({
Name = "Infinite all",
Callback = function()
      LocPlayer:SetAttribute("combo",number)
      LocPlayer:SetAttribute("counter",number)
      LocPlayer:SetAttribute("crit",number)
      LocPlayer:SetAttribute("defense",number)
      LocPlayer:SetAttribute("dodge",number)
      LocPlayer:SetAttribute("lifesteal",number)
  end    
})

--[[T2:AddTextbox({
  Name = "Dungeon Level (1-60)",
  Default = "1",
  TextDisappear = true,
  Callback = function(Value)
      _G.DungeonLevel = Value
  end  
})
]]

T2:AddToggle({
Name = "Enter Dungeon",
Default = false,
Callback = function(Value)
_G.dngn = Value
      while wait(1) do
        if _G.dngn == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["DungeonService"]["RF"]["Enter_Level"]:InvokeServer(LocPlayer:GetAttribute("DungeonLevel"))
      end
  end})

local function KillEnemy(str,full)
if #str["Enemy_Folder"]:GetChildren() == 1 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full})
elseif #str["Enemy_Folder"]:GetChildren() == 2 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 3 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 4 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 5 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 6 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 7 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 8 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 9 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full,full})
elseif #str["Enemy_Folder"]:GetChildren() == 10 then
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({full,full,full,full,full,full,full,full,full,full})
end
end

T1:AddToggle({
Name = "Auto Kill V1",
Default = false,
Callback = function(Value)
_G.InsKill = Value
      while wait() do
        if _G.InsKill == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                if game_id == RaidID then
			game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RaidFightService"]["RF"]["Start_AttackBoss"]:InvokeServer()
		else
			game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer({c,c,c,c,c,c,c,c,c,c})
		end
            end)
          end)
      end
end    
})

T1:AddToggle({
Name = "Auto Kill V2",
Default = false,
Callback = function(Value)
_G.Killmf = Value
      while wait() do
        if _G.Killmf == false then break end
	   if game_id == RaidID then
		game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RaidFightService"]["RF"]["Start_AttackBoss"]:InvokeServer()
	   else
		game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["FightSystemService"]["RF"]["Start_Attack"]:InvokeServer(enemys)
	 end
      end
  end})

AT5:AddToggle({
Name = "Open Chest [ Non-Auto ] [ V1 ]",
Default = false,
Callback = function(Value)
_G.oc = Value
      while wait() do
        if _G.oc == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Open_Chest"]:InvokeServer()
        LocPlayer:SetAttribute("chest_wait",0)
        LocPlayer:SetAttribute("chest_cd",0)
      end
  end})

AT5:AddToggle({
Name = "Open Chest [ V2 ] [ Recommended ]",
Default = false,
Callback = function(Value)
if Value then
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RE"]["Show_Chest"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Start_Auto_Chest"]:InvokeServer()
else
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RE"]["Hide_Chest"]:FireServer()
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Stop_Auto_Chest"]:InvokeServer()
end
end})

chest:AddSlider({
    Name = "Number of Fast Pass Uses",
    Min = 0,
    Max = 20,
    Default = 1,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Consume",
    Callback = function(Value)
      _G.FPC = Value
   end    
})

chest:AddToggle({
Name = "Upgrade Chest Level",
Default = false,
Callback = function(Value)
_G.clvl = Value
      while wait() do
        if _G.clvl == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Chest_Upgrade"]:InvokeServer()
      end
  end})

chest:AddToggle({
Name = "Use Fast Pass",
Default = false,
Callback = function(Value)
_G.fp = Value
      while wait() do
        if _G.fp == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ChestManagerService"]["RF"]["Speed_Chest"]:InvokeServer(_G.FPC)
      end
  end})

wing:AddToggle({
Name = "Upgrade Wings",
Default = false,
Callback = function(Value)
_G.uw = Value
      while wait() do
        if _G.uw == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["WingsService"]["RF"]["UpgradeWings"]:InvokeServer()
      end
  end})

T1:AddToggle({
Name = "Claim Gifts",
Default = false,
Callback = function(Value)
_G.Gitf = Value
      while wait() do
        if _G.Gitf == false then break end
        for i = 1, 12 do
    game:GetService("ReplicatedStorage").Packages.Knit.Services.RewardService.RF.ClaimOnlineReward:InvokeServer(i)
          end
      end
  end})

T1:AddToggle({
Name = "Claim Task",
Default = false,
Callback = function(Value)
_G.ct = Value
      while wait() do
        if _G.ct == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TaskService"]["RF"]["Claim_TaskReward"]:InvokeServer()
      end
  end})

T1:AddToggle({
Name = "Teleport To Enemy",
Default = false,
Callback = function(Value)
_G.tte = Value
      while wait() do
        if _G.tte == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                Teleport(c.HumanoidRootPart)
            end)
          end)
      end
end    
})

--[[T4:AddToggle({
Name = "Bring Asshole V1 [Testing]",
Default = false,
Callback = function(Value)
_G.bringAsshole1 = Value
      while wait() do
        if _G.bringAsshole1 == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                NpcCFrame(c)
            end)
          end)
      end
end    
})
]]

T4:AddTextbox({
  Name = "Bring Distance",
  Default = Settings.enemyd,
  TextDisappear = false,
  Callback = function(Value)
     Settings.enemyd = Value
   end  
})

T4:AddToggle({
Name = "Bring Enemy",
Default = false,
Callback = function(Value)
_G.bringAsshole2 = Value
      while wait() do
        if _G.bringAsshole2 == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                SafeNPC(c)
            end)
          end)
      end
end    
})

T4:AddToggle({
Name = "Freeze NPC",
Default = false,
Callback = function(Value)
_G.Freeze = Value
      while wait() do
        if _G.Freeze == false then break end
        workspaceChildren(workspace["DungeonFolder"],function(v)
            workspaceChildren(v["Enemy_Folder"],function(c)
                c.Humanoid.WalkSpeed = 0
            end)
          end)
      end
end    
})

T3:AddToggle({
Name = "Gacha Mount [ Gems ]",
Default = false,
Callback = function(Value)
_G.gm = Value
      while wait() do
        if _G.gm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MountService"]["RF"]["Normal_Gacha_Mount"]:InvokeServer("Gem")
      end
  end})

T3:AddToggle({
Name = "Gacha Mount [ Coins ]",
Default = false,
Callback = function(Value)
_G.gm = Value
      while wait() do
        if _G.gm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["MountService"]["RF"]["Normal_Gacha_Mount"]:InvokeServer("Coin")
      end
  end})

local ugc = AA:AddSection({
Name = "UGC"
})

local levelrew = AA:AddSection({
Name = "CHEST LEVEL REWARD"
})

local peakc = AA:AddSection({
Name = "PEAK CHEST"
})

local raid = AA:AddSection({
Name = "RAID"
})

local rc = AA:AddSection({
Name = "REDEEM CODE"
})

if game_id ~= RaidID then
ugc:AddDropdown({
   Name = "Select UGC ID",
   Default = UGC_ID[1],
   Options = UGC_ID,
   Callback = function(Value)
      _G.UGC = Value
   end    
})

ugc:AddButton({
Name = "Buy UGC",
Callback = function()
      ClaimUGC(tonumber(_G.UGC))
  end    
})
end

levelrew:AddButton({
Name = "Claim Chest Level Reward",
Callback = function()
      for array = 1,40 do
	ChestLVL(array)
      end
  end    
})

peakc:AddButton({
Name = "Claim Peak Chest",
Callback = function()
      PeakChest()
  end    
})

rc:AddButton({
Name = "Redeem All Code",
Callback = function()
      for array = 1,#code do
	game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["CheckCode"]:InvokeServer(code[array])
      end
  end    
})

local RaidTimer = raid:AddParagraph("RAID TIMER","--:--")
raid:AddButton({
Name = "Start Raid",
Callback = function()
     text(workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["Title"],function(str)
		if str:find("Opens") then
		   OrionLib:MakeNotification({Name = "RAID ENDED!",Content = "You have to wait until the raid reopens.",Image = "rbxassetid://",Time = 5})
		else
		   game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RaidService"]["RF"]["Go_Raid"]:InvokeServer()
		end
     end)
  end    
})

workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["Title"]:GetPropertyChangedSignal("Text"):Connect(function()
TextArray(workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["Title"],workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["TimeLabel"],function(str,array)
	if str:lower() == "raid ends in:" or str:lower() == "raid ends in: " then
		OrionLib:MakeNotification({Name = "RAID HAS STARTED!",Content = "Raid has opened! LET'S KILL THE BOSS TO GET THE RAID TOKEN! ( Raid ends in: " .. tostring(array) .. " )",Image = "rbxassetid://",Time = 5})
	end
end)
end)

RunService.RenderStepped:Connect(function()
	text(workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["TimeLabel"],function(str)
		text(workspace["Raid"]["HitBox"]["Attachment"]["RaidBoard"]["Title"],function(o)
			RaidTimer:Set(tostring(o) .. " " .. tostring(str),"")
		end)
	end)
end)

--[[
RunService.RenderStepped:Connect(function()
    task.wait()
    workspaceChildren(workspace["DungeonFolder"],function(v)
         workspaceChildren(v["Enemy_Folder"],function(npc)
           if npc:IsA("Model") then
            local chr = npc:FindFirstChild("Humanoid")
            if chr then
                local esp = Instance.new("Highlight")
                esp.Name = npc.Name
                esp.Parent = npc
                esp.FillColor = fillcolor 
                esp.OutlineColor = outlinecolor    
                esp.FillTransparency = filltrans
                esp.OutlineTransparency = outlinetrans
                esp.Adornee = chr.Parent
                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		if enabled == false then
                   esp:Destroy()
		end
            end
        end
    end)
end)
end)
]]

workspaceChildren(workspace["DungeonFolder"],function(v)
    workspaceChildren(v["Enemy_Folder"],function(c)
        c.ChildAdded:Connect(listenToChildrenChanges)
        c.ChildRemoved:Connect(listenToChildrenChanges)
    end)
end)
