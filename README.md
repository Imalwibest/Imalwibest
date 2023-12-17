    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison Life", "Serpent")

    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
    MainSection:NewDropdown("Give Gun", "Gives The localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)
    MainSection:NewDropdown("Gun mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.00000000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.0000000001
            module["AutoFire"] = true
        end
    end)

    -- PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
    PlayerSection:NewSlider("WalkSpeed", "Changes The WalkSpeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    PlayerSection:NewSlider("JumpPower", "Changes the JumpPower", 100, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    PlayerSection:NewButton("Tp Tools", "Gives u Tp Tools!", function()
        print("Clicked")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Click%20TP%20Tool.lua"))()
    end)
    PlayerSection:NewButton("Fly (E)", "Fly Makes U Fly Press E TO Turn On/Off", function()
        print("Clicked")
        -- FE Fly (Push E)
        loadstring(game:HttpGet(('https://pastebin.com/raw/q6S4AcxJ'),true))()
    end)
    -- Credits
    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")
    CreditsSection:NewLabel("Script: 'DarthVader#3277'")
    CreditsSection:NewLabel("UI: 'xHeptc u fucktards'")
elseif game.PlaceId == 3956818381 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Ninja Legends", "Serpent")

    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
    MainSection:NewToggle("Auto Swing", "Make your player autoswing", function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("ninjitsuGain") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    break
                end
            end
                local A_1 = "swingKatana"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1)
                wait(0.1)
        end
    end)
    MainSection:NewToggle("Auto Sell", "Make your player autosell", function(v)
        getgenv().autosell = v
        while true do
            if not getgenv().autosell then return end
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        end
    end)
    MainSection:NewButton("Unlock all islands", "Unlocks all islands", function()
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(0.3)
        end
        wait(0.4)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    end)
    MainSection:NewToggle("Auto Buy all sword", "Auto Buys all sword", function(v)
        getgenv().buyswords = v
        while true do
            if not getgenv().buyswords then return end
            local A_1 = "buyAllSwords"
            local A_2 = "Blazing Vortex Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    end)
    MainSection:NewToggle("Auto Buy all belts", "Auto Buys all Belts", function(v)
        getgenv().buybelts = v
        while true do
            if not getgenv().buybelts then return end
            local A_1 = "buyAllBelts"
            local A_2 = "Blazing Vortex Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    end)
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
    PlayerSection:NewSlider("WalkSpeed", "Changes The WalkSpeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    PlayerSection:NewSlider("JumpPower", "Changes the JumpPower", 100, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    PlayerSection:NewButton("Tp Tools", "Gives u Tp Tools!", function()
        print("Clicked")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Click%20TP%20Tool.lua"))()
    end)
    PlayerSection:NewButton("Fly (E)", "Fly Makes U Fly Press E TO Turn On/Off", function()
        print("Clicked")
        -- FE Fly (Push E)
        loadstring(game:HttpGet(('https://pastebin.com/raw/q6S4AcxJ'),true))()
    end)

    -- Settings
    local S = Window:NewTab("Settings")
    local SSection = S:NewSection("Settings")
    SSection:NewKeybind("Toggle UI", "Toggle The Ui On and off", Enum.KeyCode.LeftShift, function()
        Library:ToggleUI()
    end)

    -- Credits
    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")
    CreditsSection:NewLabel("Script: 'DarthVader#3277'")
    CreditsSection:NewLabel("UI: 'xHeptc u fucktards'")
elseif game.PlaceId == 3851622790 then
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Breaking Story", "Sentinel")


    -- GIVE ITEM
    local GiveItem  = Window:NewTab("Give Item")
    local GiveItemSection = GiveItem:NewSection("Give Item")
    GiveItemSection:NewButton("Chips", "Gives You Chips", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips")
    end)    
    GiveItemSection:NewButton("Lollipop", "Gives You Lollipop", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
    end)
    GiveItemSection:NewButton("Cola", "Gives You Cola", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
    end)
    GiveItemSection:NewButton("Apple", "Gives You Apple", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
    end)
    GiveItemSection:NewButton("Bat", "Gives You Bat", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
    end)
    GiveItemSection:NewButton("MedKit", "Gives you MedKit", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("MedKit")
    end)
    GiveItemSection:NewButton("PosionPizza", "Gives You a Bad pizza 'PosionPizza", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("EpicPizza")
    end)
    GiveItemSection:NewButton("Cookie", "Gives You Cookie", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
    end)
    GiveItemSection:NewButton("Pizza", "Gives You Pizza", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza2")
    end)
    GiveItemSection:NewButton("Key", "Gives You Key For Baseplate", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
    end)
    GiveItemSection:NewButton("Plank", " Gives You Plank", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Plank")
    end)
    GiveItemSection:NewButton("Cure", "Gives You Cure", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cure")
    end)
    GiveItemSection:NewButton("Hammer", "Gives You Hammer", function()
        print("Clicked")
        local A_1 = true
	    local A_2 = "Hammer"
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.BasementWeapon
	    Event:FireServer(A_1, A_2)
    end)
    GiveItemSection:NewButton("Teddy", "Gives You Teddy", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("TeddyBloxpin")
    end)
    GiveItemSection:NewButton("Sword", "Gives You Sword", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword")
    end)
 
    -- Teleport
    local Teleport  = Window:NewTab("Teleport")
    local TeleportSection = Teleport:NewSection("Teleport")
    TeleportSection:NewButton("Sewer", "Teleport You to Sewer", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 3, -125)
    end)
    TeleportSection:NewButton("Store", "Teleport You To Store", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121)
    end)
    TeleportSection:NewButton("Basement", "Teleport You To Basement", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71, -15, -163)
    end)
    TeleportSection:NewButton("Attic", "Teleport You to Attic", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220)
    end)
    TeleportSection:NewButton("House", "Teleport You To House", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200)
    end)
    TeleportSection:NewButton("BossRoom", "Teleport You To BossRoom", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480)
    end)
                     
    -- Roles
    local Roles  = Window:NewTab("Roles")
    local RolesSection = Roles:NewSection("Roles")
    RolesSection:NewButton("Police", "Become A Police Without Robux", function()
        local A_1 = "Gun"
	    local A_2 = true
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole
	    Event:FireServer(A_1, A_2)
    end)
    RolesSection:NewButton("Swat", "Become A Swat Without Robux", function()
        local A_1 = "SwatGun"
	    local A_2 = true
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole
	    Event:FireServer(A_1, A_2)
    end)
    
    -- Remotes
    local Remotes  = Window:NewTab("Remotes")
    local RemotesSection = Remotes:NewSection("Remotes")
    RemotesSection:NewButton("Cat", "Cat Be Your Friends", function()
        local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
	    Target:FireServer();
    end)
    RemotesSection:NewButton("Get Money", "Gives You Money'", function()
        local A_1 = game:GetService("Workspace").Money
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.FoundMoney
        Event:FireServer(A_1)
    end)
    RemotesSection:NewButton("KillEnemies", "Kills The Bad Guy", function()
        for i,v in pairs(game.Workspace.BadGuys:GetChildren()) do
            for i = 1, 50 do
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,10)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,9)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,8)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
            end
        end
    end)
    RemotesSection:NewButton("Heal", "Heals You 'Required Cat'", function()
        local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
	    Target:FireServer();
        wait(0.0001)
        for i = 1, 200 do
            wait(0.0001)
            local A_1 = "Cat"
            local Event = game:GetService("ReplicatedStorage").RemoteEvents.Energy
            Event:FireServer(A_1)
        end
    end)
    RemotesSection:NewButton("RemoveTools", "Remove Tools on your inventory", function()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v:Destroy()
            end
        end
    end)
    RemotesSection:NewButton("ToolDrop", "ToolDrop", function()
        while wait(1) do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.CanBeDropped = true
                end
            end
        end
    end)
    RemotesSection:NewButton("OpenSafe", "Opens The Safe Without Code", function()
        game.ReplicatedStorage.RemoteEvents.Safe:FireServer(game:GetService("Workspace").CodeNote.SurfaceGui.TextLabel.Text)
    end)
    RemotesSection:NewToggle("Auto Spam Door", "Auto Spam Door", function(v)
        getgenv().door = v
        while true do
            if not getgenv().door then return end
                local A_1 = "Front"
                local Event = game:GetService("ReplicatedStorage").RemoteEvents.Door
                Event:FireServer(A_1)
                wait(0.1)
        end
    end)
    RemotesSection:NewButton("Unlock Baseplate Door", "Unlocks The Baseplate Door", function()
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.UnlockDoor
        Event:FireServer()
    end)
    RemotesSection:NewButton("FullBright", "FullBright So You Can see", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
    end)
               

    -- PLAYERS
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
    PlayerSection:NewSlider("WalkSpeed", "Changes The WalkSpeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    PlayerSection:NewSlider("JumpPower", "Changes the JumpPower", 100, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    PlayerSection:NewButton("Tp Tools", "Gives u Tp Tools!", function()
        print("Clicked")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Click%20TP%20Tool.lua"))()
    end)
    PlayerSection:NewButton("Fly (E)", "Fly Makes U Fly Press E TO Turn On/Off", function()
        print("Clicked")
        -- FE Fly (Push E)
        loadstring(game:HttpGet(('https://pastebin.com/raw/q6S4AcxJ'),true))()
    end)

    -- Settings
    local S = Window:NewTab("Settings")
    local SSection = S:NewSection("Settings")
    SSection:NewKeybind("Toggle UI", "Toggle The Ui On and off", Enum.KeyCode.LeftShift, function()
        Library:ToggleUI()
    end)

    -- Credits
    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")
    CreditsSection:NewLabel("Script: 'DarthVader#3277'")
    CreditsSection:NewLabel("UI: 'xHeptc u fucktards'")
elseif game.PlaceId == 4620170611 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Breaking Story", "Serpent")


    -- GIVE ITEM
    local GiveItem  = Window:NewTab("Give Item")
    local GiveItemSection = GiveItem:NewSection("Give Item")
    GiveItemSection:NewButton("Chips", "Gives You Chips", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips")
    end)    
    GiveItemSection:NewButton("Lollipop", "Gives You Lollipop", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
    end)
    GiveItemSection:NewButton("Cola", "Gives You Cola", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
    end)
    GiveItemSection:NewButton("Apple", "Gives You Apple", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
    end)
    GiveItemSection:NewButton("Bat", "Gives You Bat", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
    end)
    GiveItemSection:NewButton("MedKit", "Gives you MedKit", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("MedKit")
    end)
    GiveItemSection:NewButton("PosionPizza", "Gives You a Bad pizza 'PosionPizza", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("EpicPizza")
    end)
    GiveItemSection:NewButton("Cookie", "Gives You Cookie", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
    end)
    GiveItemSection:NewButton("Pizza", "Gives You Pizza", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza2")
    end)
    GiveItemSection:NewButton("Key", "Gives You Key For Baseplate", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
    end)
    GiveItemSection:NewButton("Plank", " Gives You Plank", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Plank")
    end)
    GiveItemSection:NewButton("Cure", "Gives You Cure", function()
        print("Clicked")
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cure")
    end)
    GiveItemSection:NewButton("Hammer", "Gives You Hammer", function()
        print("Clicked")
        local A_1 = true
	    local A_2 = "Hammer"
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.BasementWeapon
	    Event:FireServer(A_1, A_2)
    end)
    GiveItemSection:NewButton("Teddy", "Gives You Teddy", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("TeddyBloxpin")
    end)
    GiveItemSection:NewButton("Sword", "Gives You Sword", function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword")
    end)
 
    -- Teleport
    local Teleport  = Window:NewTab("Teleport")
    local TeleportSection = Teleport:NewSection("Teleport")
    TeleportSection:NewButton("Sewer", "Teleport You to Sewer", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 3, -125)
    end)
    TeleportSection:NewButton("Store", "Teleport You To Store", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121)
    end)
    TeleportSection:NewButton("Basement", "Teleport You To Basement", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71, -15, -163)
    end)
    TeleportSection:NewButton("Attic", "Teleport You to Attic", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220)
    end)
    TeleportSection:NewButton("House", "Teleport You To House", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200)
    end)
    TeleportSection:NewButton("BossRoom", "Teleport You To BossRoom", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480)
    end)
                     
    -- Roles
    local Roles  = Window:NewTab("Roles")
    local RolesSection = Roles:NewSection("Roles")
    RolesSection:NewButton("Police", "Become A Police Without Robux", function()
        local A_1 = "Gun"
	    local A_2 = true
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole
	    Event:FireServer(A_1, A_2)
    end)
    RolesSection:NewButton("Swat", "Become A Swat Without Robux", function()
        local A_1 = "SwatGun"
	    local A_2 = true
	    local Event = game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole
	    Event:FireServer(A_1, A_2)
    end)
    
    -- Remotes
    local Remotes  = Window:NewTab("Remotes")
    local RemotesSection = Remotes:NewSection("Remotes")
    RemotesSection:NewButton("Cat", "Cat Be Your Friends", function()
        local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
	    Target:FireServer();
    end)
    RemotesSection:NewButton("Get Money", "Gives You Money'", function()
        local A_1 = game:GetService("Workspace").Money
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.FoundMoney
        Event:FireServer(A_1)
    end)
    RemotesSection:NewButton("KillEnemies", "Kills The Bad Guy", function()
        for i,v in pairs(game.Workspace.BadGuys:GetChildren()) do
            for i = 1, 50 do
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,10)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,9)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,8)
                game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
            end
        end
    end)
    RemotesSection:NewButton("Heal", "Heals You 'Required Cat'", function()
        local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
	    Target:FireServer();
        wait(0.0001)
        for i = 1, 200 do
            wait(0.0001)
            local A_1 = "Cat"
            local Event = game:GetService("ReplicatedStorage").RemoteEvents.Energy
            Event:FireServer(A_1)
        end
    end)
    RemotesSection:NewButton("RemoveTools", "Remove Tools on your inventory", function()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v:Destroy()
            end
        end
    end)
    RemotesSection:NewButton("ToolDrop", "ToolDrop", function()
        while wait(1) do
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.CanBeDropped = true
                end
            end
        end
    end)
    RemotesSection:NewButton("OpenSafe", "Opens The Safe Without Code", function()
        game.ReplicatedStorage.RemoteEvents.Safe:FireServer(game:GetService("Workspace").CodeNote.SurfaceGui.TextLabel.Text)
    end)
    RemotesSection:NewToggle("Auto Spam Door", "Auto Spam Door", function(v)
        getgenv().door = v
        while true do
            if not getgenv().door then return end
                local A_1 = "Front"
                local Event = game:GetService("ReplicatedStorage").RemoteEvents.Door
                Event:FireServer(A_1)
                wait(0.1)
        end
    end)
    RemotesSection:NewButton("Unlock Baseplate Door", "Unlocks The Baseplate Door", function()
        local Event = game:GetService("ReplicatedStorage").RemoteEvents.UnlockDoor
        Event:FireServer()
    end)
    RemotesSection:NewButton("FullBright", "FullBright So You Can see", function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
    end)
               

    -- PLAYERS
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
    PlayerSection:NewSlider("WalkSpeed", "Changes The WalkSpeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    PlayerSection:NewSlider("JumpPower", "Changes the JumpPower", 100, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    PlayerSection:NewButton("Tp Tools", "Gives u Tp Tools!", function()
        print("Clicked")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Click%20TP%20Tool.lua"))()
    end)
    PlayerSection:NewButton("Fly (E)", "Fly Makes U Fly Press E TO Turn On/Off", function()
        print("Clicked")
        -- FE Fly (Push E)
        loadstring(game:HttpGet(('https://pastebin.com/raw/q6S4AcxJ'),true))()
    end)

    -- Settings
    local S = Window:NewTab("Settings")
    local SSection = S:NewSection("Settings")
    SSection:NewKeybind("Toggle UI", "Toggle The Ui On and off", Enum.KeyCode.LeftShift, function()
        Library:ToggleUI()
    end)

    -- Credits
    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")
    CreditsSection:NewLabel("Script: 'DarthVader#3277'")
    CreditsSection:NewLabel("UI: 'xHeptc u fucktards'")
end
