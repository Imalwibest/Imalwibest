-- the code is extremely messy because something in the code editor fucked it up all at once and for some reason removed indents in some parts of the code while kept indents in some other parts of the code LOL
local LOAD_TIME = tick()
local queueonteleport = queue_on_teleport or queueonteleport
local setclipboard = toclipboard or setrbxclipboard or setclipboard
local clonefunction = clonefunc or clonefunction
local hookfunction =
    hookfunc or replacecclosure or detourfunction or replacefunc or replacefunction or replaceclosure or detour_function or
        hookfunction
local setthreadidentity = set_thread_identity or setthreadcaps or setthreadidentity
local firetouchinterests = fire_touch_interests or firetouchinterests
local getnamecallmethod = get_namecall_method or getnamecallmethod
local setnamecallmethod = set_namecall_method or setnamecallmethod
local restorefunction = restorefunction or restoreclosure or restorefunc

-- // cloneref function for exploits that dont support it
local a = Instance.new("Part")
for b, c in pairs(getreg()) do
    if type(c) == "table" and #c then
        if rawget(c, "__mode") == "kvs" then
            for d, e in pairs(c) do
                if e == a then
                    getgenv().InstanceList = c;
                    break
                end
            end
        end
    end
end
local f = {}
function f.invalidate(g)
    if not InstanceList then
        return
    end
    for b, c in pairs(InstanceList) do
        if c == g then
            InstanceList[b] = nil;
            return g
        end
    end
end
if not cloneref then
    getgenv().cloneref = f.invalidate
end

getrenv().Visit = cloneref(game:GetService("Visit"))
getrenv().MarketplaceService = cloneref(game:GetService("MarketplaceService")) -- // theres a reason why thats referenced in the roblox environment
getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
getrenv().HttpService = cloneref(game:GetService("HttpService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local RunService = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local Players = cloneref(game:GetService("Players"))
local NetworkClient = cloneref(game:GetService("NetworkClient"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
local Lighting = cloneref(game:GetService("Lighting"))
local AssetService = cloneref(game:GetService("AssetService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local NetworkSettings = settings().Network
local UserGameSettings = UserSettings():GetService("UserGameSettings")
getrenv().getgenv = clonefunction(getgenv)

local message = Instance.new("Message")
message.Text = "loading wyvern"
message.Name =
    "ðŸ’‹â€  ð“ð“˜ð“–ð“–ð“â€€! ð“—ð“ð“’ð“š  â€ðŸ’‹"
message.Parent = CoreGui

task.wait(0.25)

getgenv().stealth_call = function(script)
    getrenv()._set = clonefunction(setthreadidentity)
    local old
    old = hookmetamethod(game, "__index", function(a, b)
        task.spawn(function()
            _set(7)
            task.wait(0.1)
            local went, error = pcall(function()
                loadstring(script)()
            end)
            print(went, error)
            if went then
                local check = Instance.new("LocalScript")
                check.Parent = Visit
            end
        end)
        hookmetamethod(game, "__index", old)
        return old(a, b)
    end)
end

local function touch(x)
    x = x:FindFirstAncestorWhichIsA("Part")
    if x then
        if firetouchinterest then
            task.spawn(function()
                firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 1)
                wait()
                firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 0)
            end)
        end
        x.CFrame = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
    end
end

for i, v in pairs(game.RobloxReplicatedStorage:GetDescendants()) do
    pcall(function()
        v:Destroy()
    end)
end

task.spawn(function()
    local discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Config%20wynerdV2.lua"))()
    local win = discord:Window("Wyvern 1.269.3 - Redblue skided by Alwi hub")
    local serv = win:Server("Wyvern", "http://www.roblox.com/asset/?id=6031075938")
    local main = serv:Channel("Home")
    main:Label("\nThank you for using Wyvern!\nThe #2 UGC Games Penetration Testing Tool! (mine is still better)")
    main:Label("Check out the other Discord channels to see our available tools!")
    main:Seperator()
    -- main:Label("\n\nPlanned:\n- The Explorer you see at the left side of your screen\n- Move some stuff that doesn't belong in their category\n- More features\n- New techniques to get free UGC items from games")
    main:Button("something was here but was removed", function()
        pcall(function()
            setclipboard("something was here but got removed")
        end)
    end)
    main:Toggle("Anti Kick (Client)", false, function(bool)
        if bool == "true" then
            local kick;
            kick = hookmetamethod(game, "__namecall", function(obj, ...)
                local args = {...}
                local method = getnamecallmethod()
                if method == "Kick" then
                    if args[1] then
                        discord:Notification("Kick Attempt", "There was an attempt to kick player from client.", "Okay.")
                    end
                    return nil
                end
                return kick(obj, unpack(args))
            end)
        end
    end)
    main:Seperator()
    main:Button("Update Logs", function()
        discord:Notification("Updates", "...", "Okay!")
    end)
    main:Button("Credits", function()
        discord:Notification("Credits", "i forgot, will be putting soon", "Okay!")
    end)
    local ugc = serv:Channel("UGC Limiteds")
    ugc:Label("Looking for Remote Bruteforcing? Check out #Remotes!")
    ugc:Seperator()
    ugc:Label(
        "\nThis will auto purchase any limited that gets prompted!\nThis is recommended to use in the rolimons game.\n")
    ugc:Label("With this, you can get #1 serials of web UGC item drops!")
    ugc:Toggle("Auto Purchaser", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local idempotencyKey = t[5]
                            local purchaseAuthToken = t[6]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            local productId = info.ProductId
                            local price = info.PriceInRobux
                            local collectibleItemId = info.CollectibleItemId
                            local collectibleProductId = info.CollectibleProductId
                            print("Double checking if we got the right info...")
                            print("PurchaseAuthToken: " .. purchaseAuthToken)
                            print("IdempotencyKey: " .. idempotencyKey)
                            print("CollectibleItemId: " .. collectibleItemId)
                            print("CollectibleProductId: " .. collectibleProductId)
                            print("ProductId (SHOULD BE 0): " .. productId)
                            print("Price: " .. price)
                            print("-------------------------------------------------------")
                            warn("FIRST PURCHASE ATTEMPT")
                            for i, v in pairs(MarketplaceService:PerformPurchase(Enum.InfoType.Asset, productId, price,
                                tostring(game:GetService("HttpService"):GenerateGUID(false)), true, collectibleItemId,
                                collectibleProductId, idempotencyKey, tostring(purchaseAuthToken))) do
                                print(i, v)
                            end
                            local endTime = tick()
                            local duration = endTime - startTime
                            print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
                            input.press(Enum.KeyCode.F9)
                        end)
                end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)

    ugc:Toggle("Auto Purchaser V2 (BETA)", false, function(bool)
        if bool then
            discord:Notification("Waiting", "Waiting for any free UGC item to be prompted...", "Okay!")
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
                        function(...)
                            discord:Notification("Prompt Detected",
                                "If this is a UGC item, this script will attempt purchase. Please check console.",
                                "Okay!")
                            local startTime = tick()
                            t = {...}
                            local assetId = t[2]
                            local info = MarketplaceService:GetProductInfo(assetId)
                            pcall(function()
                                local starttickxd = tick()
                                local data = '{"collectibleItemId":"' .. tostring(info.CollectibleItemId) ..
                                     '","collectibleProductId":"' .. tostring(info.CollectibleProductId) ..
                                     '","expectedCurrency":1,"expectedPrice":' .. tostring(info.PriceInRobux) ..
                                     ',"idempotencyKey":"' ..
                                     tostring(game:GetService("HttpService"):GenerateGUID(false)) ..
                                     '","expectedSellerId":' .. tostring(info.Creator.Id) .. ',"expectedSellerType":"' ..
                                     tostring(info.Creator.CreatorType) ..
                                     '","expectedPurchaserType":"User","expectedPurchaserId":' ..
                                     tostring(game.Players.LocalPlayer.UserId) .. '}'
                                print(data)
                                -- setclipboard(data)
                                _post("https://apis.roblox.com/marketplace-sales/v1/item/" .. tostring(info.CollectibleItemId) .."/purchase-item", data);
                                wait();
                                local endTime = tick()
                                local duration = endTime - startTime
                                print("Bought Item! Took " .. tostring(duration) .. " seconds")
                            end)
                        end)
                    end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
        else
            getgenv().promptpurchaserequestedv2:Disconnect()
            discord:Notification("Stopped", "Stopped waiting for any free UGC item to be prompted...", "Okay!")
        end
    end)
    ugc:Button("Teleport to Rolimons UGC Game", function()
        TeleportService:Teleport(14056754882, Players.LocalPlayer)
    end)
    ugc:Seperator()
    ugc:Label("\nFake Prompts! (Requested by @atellie)\nPrank people that you got an item!\n")
    ugc:Label("This prompts a UGC item but buying it will error.")
    ugc:Textbox("Enter the Id of the item you wanna prompt!", "Enter a UGC Item Id...", true, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            local info = MarketplaceService:GetProductInfo(tt)
            local CollectibleProductId = info.CollectibleProductId
            local CollectibleItemId = info.CollectibleItemId
            local Price = info.PriceInRobux
            getrenv()._set = clonefunction(setthreadidentity)
            local old
            old = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7)
                    task.wait()
                    -- MarketplaceService:PromptCollectiblesPurchase(Players.LocalPlayer, tt, CollectibleItemId, '', CollectibleProductId, Price)
                    MarketplaceService:PromptPurchase(Players.LocalPlayer, tt)
                end)
                hookmetamethod(game, "__index", old)
                return old(a, b)
            end)
            task.wait(0.2)
            pcall(function()
                Visit:FindFirstChild("LocalScript"):Destroy()
            end)
        else
            discord:Notification("Error", "You must enter an Item ID.", "Okay!")
        end
    end)
    getrenv()._set = clonefunction(setthreadidentity);
    local function _post(url, data)
        local s, e = pcall(function()
            local old1;
            old1 = hookmetamethod(game, "__index", function(a, b)
                task.spawn(function()
                    _set(7);
                    task.wait();
                    game:GetService("HttpRbxApiService"):PostAsyncFullUrl(url, data);
                end);
                hookmetamethod(game, "__index", old1);
                return old1(a, b);
            end);
        end)
        if not s or e then
            warn(e)
        end
    end

    ugc:Seperator()
    ugc:Label(
        "\nUwU Sniper, Created by Redblue, this is like the good ol' days\ni miss xolo and mewt\nno prompt needed and basically instant \n")
    local snipeid = 123456789
    ugc:Textbox("Enter the Id of the item you Want Snipe!", "Enter a UGC Item Id...", false, function(t)
        snipeid = tonumber(t)
    end)
    local snpespeed = 0.15
    ugc:Textbox("Enter the Speed of the Sniper!", "Enter a Speed...", false, function(t)
        snpespeed = tonumber(t)
    end)
    local buylimit = 1
    local amountbought = 0
    ugc:Textbox("Enter the Buy Limit!", "Enter a Limit...", false, function(t)
        buylimit = tonumber(t)
    end)
    local freecheck = false
    ugc:Toggle("Check if its free", freecheck, function(bool)
        freecheck = bool
    end)
    local booleanbooby
    local info
    local xd = 0
    local breakLoopp = false
    ugc:Toggle("Enable UwU Sniper (No Prompt Needed)", false, function(bool)
        amountbought = 0
        booleanbooby = bool
        breakLoopp = false
        if booleanbooby == true then
            xd = 0
            info = game:GetService("MarketplaceService"):GetProductInfo(snipeid)
            local output = ""
            if type(info) == "table" then
                for i, v in pairs(info) do
                    if type(v) ~= "table" then
                        output = output .. tostring(i) .. ": " .. tostring(v) .. "\n"
                    end
                    if type(v) == "table" then
                        for x, d in pairs(v) do
                            output = output .. tostring(x) .. ": " .. tostring(d) .. "\n"

                        end
                    end
                end
            end
            discord:Notification("Wyvern Sniper Started!", "Information Grabbed:\n" .. tostring(output), "Close!")
        end
        while booleanbooby == true and not breakLoopp do
            info = game:GetService("MarketplaceService"):GetProductInfo(snipeid)
            pcall(function()
                xd = xd + 1
                print("Sniping! Checks: " .. tostring(xd))
                if info.IsForSale == true then
                    local starttickxd = tick()
                    local data = '{"collectibleItemId":"' .. tostring(info.CollectibleItemId) ..
                                     '","collectibleProductId":"' .. tostring(info.CollectibleProductId) ..
                                     '","expectedCurrency":1,"expectedPrice":' .. tostring(info.PriceInRobux) ..
                                     ',"idempotencyKey":"' ..
                                     tostring(game:GetService("HttpService"):GenerateGUID(false)) ..
                                     '","expectedSellerId":' .. tostring(info.Creator.Id) .. ',"expectedSellerType":"' ..
                                     tostring(info.Creator.CreatorType) ..
                                     '","expectedPurchaserType":"User","expectedPurchaserId":' ..
                                     tostring(game.Players.LocalPlayer.UserId) .. '}'
                    print(data)
                    -- setclipboard(data)
                    if freecheck == true then
                        if info.PriceInRobux == 0 then
                            _post("https://apis.roblox.com/marketplace-sales/v1/item/" ..
                                      tostring(info.CollectibleItemId) .. "/purchase-item", data);
                            amountbought = amountbought + 1
                        end
                    else
                        _post(
                            "https://apis.roblox.com/marketplace-sales/v1/item/" .. tostring(info.CollectibleItemId) ..
                                "/purchase-item", data);
                        amountbought = amountbought + 1
                    end
                    wait();
                    local endtickxd = tick()
                    local durationxd =  endtickxd- starttickxd
                    print("Bought Item! Took " .. tostring(durationxd) .. " seconds")
                    task.wait(1);
                end
            end)
            if amountbought >= buylimit then
                breakLoopp = true
            end
            task.wait(snpespeed)
        end
    end)
    local remotes = serv:Channel("Remotes")
    remotes:Label(
        "\nFires all remotes in the game as an attempt to prompt the item.\nWarning: This can be risky and can fire a decoy remote!\n")
    remotes:Textbox("UGC Limited Item ID", "Enter Item ID that you wanna be included in the arguments...", false,
        function(t)
            local tt = tonumber(t)
            if type(tt) == "number" then
                getgenv().limitedidforfiringremotewithwyvern = tt
                discord:Notification("Success",
                    "The script now remembers that the Item ID you want is " .. tostring(tt) .. "!", "Okay!")
            else
                discord:Notification("Error", "That's... not an Item ID.", "Okay!")
            end
        end)
    remotes:Dropdown("Remote Arguments...",
        {"No Arguments/Blank", "LocalPlayer", "Your Username", "UGC Item ID", "UGC Item ID, LocalPlayer",
         "LocalPlayer, UGC Item ID", "'UGC' as a string", "UGC Item ID, 'true' boolean", "'true' boolean",
         "literal lua code to prompt item", "loadstring prompt item"}, function(x)
            if not getgenv().limitedidforfiringremotewithwyvern then
                discord:Notification("Error",
                    "You must put a Limited Item ID at the first textbox before firing... Or just set it to blank if you're using this not for the purpose of UGC hunting.",
                    "Okay!")
            else
                local id = getgenv().limitedidforfiringremotewithwyvern
                local fire = function(args)
                    local count = 0
                    for i, v in pairs(game:GetDescendants()) do
                        if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                            count = count + 1
                            task.spawn(function()
                                v:FireServer(args)
                            end)
                        elseif v:IsA("RemoteFunction") then
                            count = count + 1
                            task.spawn(function()
                                v:InvokeServer(args)
                            end)
                        end
                    end
                    discord:Notification("Success", "Fired " .. count .. " RemoteEvents and RemoteFunctions!", "Okay!")
                end
                local _fire = function(args, args2)
                    local count = 0
                    for i, v in pairs(game:GetDescendants()) do
                        if v:IsA("RemoteEvent") or v:IsA("UnreliableRemoteEvent") then
                            count = count + 1
                            task.spawn(function()
                                v:FireServer(args, args2)
                            end)
                            pcall(function()
                                v:FireServer(args, args2)
                            end)
                        elseif v:IsA("RemoteFunction") then
                            count = count + 1
                            task.spawn(function()
                                v:InvokeServer(args, args2)
                            end)
                        end
                    end
                    discord:Notification("Success", "Fired " .. count .. " RemoteEvents and RemoteFunctions", "Okay!")
                end
                if x == "No Arguments/Blank" then
                    fire(" ")
                elseif x == "LocalPlayer" then
                    fire(game.Players.LocalPlayer)
                elseif x == "Your Username" then
                    fire(tostring(game.Players.LocalPlayer))
                elseif x == "UGC Item ID" then
                    fire(id)
                elseif x == "UGC Item ID, LocalPlayer" then
                    _fire(id, game.Players.LocalPlayer)
                elseif x == "LocalPlayer, UGC Item ID" then
                    _fire(game.Players.LocalPlayer, id)
                elseif x == "'UGC' as a string" then
                    fire("UGC")
                elseif x == "UGC Item ID, 'true' boolean" then
                    _fire(id, true)
                elseif x == "'true' boolean" then
                    fire(true)
                elseif x == "literal lua code to prompt item" then
                    fire('game:GetService("MarketplaceService"):PromptPurchase(game.Players.' ..
                             tostring(game.Players.LocalPlayer) .. ', ' .. tostring(id) .. ')')
                elseif x == "loadstring prompt item" then
                    fire('loadstring(`game:GetService("MarketplaceService"):PromptPurchase(game.Players.' ..
                             tostring(game.Players.LocalPlayer) .. ', ' .. tostring(id) .. ')`)()')
                end
            end
        end)
    remotes:Seperator()
    remotes:Label(
        "\nThis will block client communication with the server.\nUseful for bypassing clientsided anticheats!\n")
    remotes:Toggle("Block All RemoteEvents and RemoteFunctions", false, function(bool)
        if bool then
            local Methods = {"FireServer", "fireserver", "InvokeServer", "invokeserver", "Fire", "fire", "Invoke",
                             "invoke"}

            getgenv().Toggleblock = true
            local OldNameCall = nil
            OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(...)
                local Self = ...
                if table.find(Methods, getnamecallmethod()) then
                    if Toggle and Self then
                        return
                    end
                end
                return OldNameCall(...)
            end))
        else
            getgenv().Toggleblock = false
        end
    end)
    remotes:Seperator()
    remotes:Button("Print All Remotes (Includes Path)", function()
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                print("RemoteEvent: " .. v:GetFullName())
            elseif v:IsA("RemoteFunction") then
                print("RemoteFunction: " .. v:GetFullName())
            elseif v:IsA("UnreliableRemoteEvent") then
                print("UnreliableRemoteEvent: " .. v:GetFullName())
            end
        end
        discord:Notification("Success", "Check console by clicking F9 or typing '/console' in the chat.", "Okay!")
        local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
        input.press(Enum.KeyCode.F9)
    end)
    local games = serv:Channel("Games")
    local antikickonteleport = false
    games:Toggle("Inject Anti Kick on Teleport", false, function(bool)
        if bool then
            antikickonteleport = true
        else
            antikickonteleport = false
        end
    end)
    games:Label("\nBelow is a list of subplaces of this game.\nChoose the one that you want to be teleported into!")
    local places = {}
    local placeids = {}
    local pp = AssetService:GetGamePlacesAsync()
    while true do
        for _, place in pp:GetCurrentPage() do
            table.insert(places, place.Name)
            table.insert(placeids, place.PlaceId)
        end
        if pp.IsFinished then
            break
        end
        pp:AdvanceToNextPageAsync()
    end
    games:Dropdown("Subplace/Hidden Games List", places, function(x)
        local index = nil
        for i, name in ipairs(places) do
            if name == x then
                index = i
                break
            end
        end

        if index then
            local placeId = placeids[index]
            discord:Notification("Teleporting", "Teleporting to...\n" .. x .. "\nGame ID: " .. placeId, "Okay!")
            if antikickonteleport then
                pcall(function()
                    queueonteleport(
                        'local kick; kick = hookmetamethod(game, "__namecall", function(obj, ...) local args = {...} local method = getnamecallmethod() if method == "Kick" then if args[1] then print("...") end return nil end return kick(obj, unpack(args)) end)')
                end)
                TeleportService:Teleport(placeId, Players.LocalPlayer)
            else
                TeleportService:Teleport(placeId, Players.LocalPlayer)
            end
        else
            discord:Notification("Error", "Place not found... Well this shouldn't have happened. WTF.", "Okay!")
        end
    end)
    games:Label("If you only see the main game, no other subplaces found.")
    games:Seperator()
    games:Textbox("Pause gameplay for a specified amount of time.",
        "How long do you want to pause the game for? (In seconds)", true, function(t)
            local tt = tonumber(t)
            if type(tt) == "number" then
                Players.LocalPlayer.GameplayPaused = true
                task.wait()
                Players.LocalPlayer.GameplayPaused = false
                task.wait()
                Players.LocalPlayer.GameplayPaused = true
                task.wait(tt)
                Players.LocalPlayer.GameplayPaused = false
            else
                discord:Notification("Error", "You must enter a number. (In seconds)", "Okay!")
            end
        end)
    games:Label("Pausing the gameplay will overlay everything,\nEvery UI becomes unclickable.")
    games:Seperator()
    games:Toggle("Force Full Bright Lighting", false, function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end)
    games:Button("Teleport to Smallest Server", function()
        local gameapi = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = gameapi .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
            return HttpService:JSONDecode(Raw)
        end
        local Server, Next;
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server
        discord:Notification("Teleporting", "Teleporting to...\n" .. game.PlaceId .. "\nJob ID: " .. Server.id, "Okay!")
        if antikickonteleport then
            pcall(function()
                queueonteleport(
                    'local kick; kick = hookmetamethod(game, "__namecall", function(obj, ...) local args = {...} local method = getnamecallmethod() if method == "Kick" then if args[1] then print("...") end return nil end return kick(obj, unpack(args)) end)')
            end)
            TeleportService:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
        end
    end)
    games:Button("Force Close Roblox App", function()
        game:Shutdown()
    end)
    games:Label("Current Game's Place ID:\n" .. game.PlaceId)
    games:Label("Current Game's Universe ID:\n" .. game.GameId)
    games:Label("Current Game's Job ID: \n" .. game.JobId)
    local players = serv:Channel("Players")
    players:Label("\nUses SetLocalPlayerInfo() to change your info!")
    players:Textbox("Spoof as player with User ID (Client)", "Enter your new User ID...", false, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            local name = Players:GetNameFromUserIdAsync(tt)
            Players:SetLocalPlayerInfo(tt, name, name, Enum.MembershipType.Premium, false)
            discord:Notification("Success", "You are now " .. name .. "! (" .. tt .. ")", "Okay!")
        else
            discord:Notification("Failed", "Please put a correct User ID.", "Okay!")
        end
    end)
    players:Button("Spoof yourself as the Game Owner", function()
        local name = Players:GetNameFromUserIdAsync(tonumber(game.CreatorId))
        Players:SetLocalPlayerInfo(game.CreatorId, name, name, Enum.MembershipType.Premium, false)
        discord:Notification("Success", "You are now " .. name .. "! (" .. game.CreatorId .. ")", "Okay!")
    end)
    players:Seperator()
    players:Toggle("Auto Hide Other Players", false, function(bool)
        if bool then
            local usernames = {}
            while task.wait(0.1) do
                local players = Players:GetPlayers()
                local localPlayer = Players.LocalPlayer
                local cusernames = {}
                for _, player in ipairs(players) do
                    if player ~= localPlayer then
                        table.insert(cusernames, player.Name)
                        if not usernames[player.Name] then
                            usernames[player.Name] = true
                        end
                    end
                end
                for username, _ in pairs(usernames) do
                    if not table.find(cusernames, username) then
                        usernames[username] = nil
                    end
                end
                local models = game.Workspace:GetChildren()
                for _, model in ipairs(models) do
                    if model:IsA("Model") then
                        if usernames[model.Name] then
                            model:Destroy()
                        end
                    end
                end
                if Visit:FindFirstChild("Part") then
                    break
                end
            end
        else
            local kill = Instance.new("Part")
            kill.Parent = Visit
            task.wait(0.2)
            kill:Destroy()
        end
    end)
    players:Toggle("Show Hidden GUIs of LocalPlayer", false, function(bool)
        if bool then
            guis = {}
            for i, v in pairs(Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui"):GetDescendants()) do
                if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and not v.Visible then
                    v.Visible = true
                    if not FindInTable(guis, v) then
                        table.insert(guis, v)
                    end
                end
            end
        elseif not bool then
            for i, v in pairs(guis) do
                v.Visible = false
            end
            guis = {}
        end
    end)
    players:Toggle("Anti AFK", false, function(bool)
        if bool then
            Players.LocalPlayer.Idled:connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end)
    local signal
    players:Seperator()
    players:Button("Create Waypoint at Current Position", function()
        if not Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            discord:Notification("Failure", "HumanoidRootPart is missing from character", "Okay!")
            return
        end
        getgenv().pos = Players.LocalPlayer.Character.HumanoidRootPart.Position
        discord:Notification("Success", "Created waypoint at " .. tostring(getgenv().pos), "Okay!")
        if getgenv().addeduis then
            return
        else
            players:Button("Teleport to Saved Waypoint", function()
                Players.LocalPlayer.Character:MoveTo(getgenv().pos)
            end)
            players:Button("Set Spawnpoint to Saved Waypoint", function()
                signal = Players.LocalPlayer.CharacterAdded:Connect(function()
                    Players.LocalPlayer.Character:MoveTo(getgenv().pos)
                end)
                players:Button("Delete Spawnpoint at Saved Waypoint", function()
                    signal:Disconnect()
                end)
            end)
            players:Button("Delete Saved Waypoint", function()
                getgenv().pos = nil
            end)
        end
        getgenv().addeduis = true
    end)
    local network = serv:Channel("Network")
    network:Label("\nThis can bypass rate limits when firing remotes!")
    network:Textbox("KBPS Limit", "Type a big number to have no limit...", true, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            NetworkClient:SetOutgoingKBPSLimit(tt)
            discord:Notification("Success!", "KBPS Limit has been set to " .. tostring(tt), "Okay!")
        else
            discord:Notification("Hold up!", "KBPS Limit must be a number.", "Okay!")
        end
    end)
    network:Seperator()
    network:Label("Simulates lag/delay from client -> server.")
    local drop = network:Dropdown("Delay Intensiveness", {"Normal", "Mild", "Medium", "Severe", "No Connection"},
        function(bool)
            print(bool)
            if bool == "Normal" then
                NetworkSettings.IncomingReplicationLag = 0
            elseif bool == "Mild" then
                NetworkSettings.IncomingReplicationLag = 1
            elseif bool == "Medium" then
                NetworkSettings.IncomingReplicationLag = 2
            elseif bool == "Severe" then
                NetworkSettings.IncomingReplicationLag = 3
            elseif bool == "No Connection" then
                NetworkSettings.IncomingReplicationLag = 10
            end
        end)
    network:Seperator()
    network:Button("Show Average Client -> Server Ping", function()
        discord:Notification("Average Ping", math.round(Players.LocalPlayer:GetNetworkPing() * 1000) .. "ms", "Okay!")
    end)
   
    local input = serv:Channel("Input Automations")
    input:Toggle("Auto Use Tools in Inventory", false, function(bool)
        if bool then
            local Player = Players.LocalPlayer
            getgenv().firetools = true
            spawn(function()
                while wait() and firetools do
                    pcall(function()
                        local Tool = Player.Backpack:FindFirstChildWhichIsA("Tool")
                        if not Player.Character:FindFirstChildWhichIsA("Tool") then
                            Player.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(Tool)
                        end
                        if Player.Character:FindFirstChildWhichIsA("Tool") then
                            Player.Character:FindFirstChildWhichIsA("Tool"):Activate()
                        end
                    end)
                end
            end)
        elseif not bool then
            getgenv().firetools = false
        end
    end)


    input:Toggle("Auto Grab All Dropped Tools", false, function(bool)
        if bool then
            for i, v in pairs(workspace:GetChildren()) do
                if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and v:IsA("BackpackItem") and
                    v:FindFirstChild("Handle") then
                    Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(v)
                end
            end
            if getgenv().connected then
                getgenv().connected:Disconnect()
            end
            getgenv().connected = workspace.ChildAdded:Connect(function(child)
                if Players.LocalPlayer.Character:FindFirstChild("Humanoid") and child:IsA("BackpackItem") and
                    child:FindFirstChild("Handle") then
                    Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(child)
                end
            end)
        elseif not bool then
            if getgenv().connected then
                getgenv().connected:Disconnect()
            end
        end
    end)
    input:Toggle("Infinite ProximityPrompt Range", false, function(bool)
        if bool then
            ProximityPromptService.MaxPromptsVisible = math.huge
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.MaxActivationDistance = math.huge
                end
            end
        elseif not bool then
            ProximityPromptService.MaxPromptsVisible = 16
            for i, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.MaxActivationDistance = 10
                end
            end
        end
    end)
    input:Toggle("Instant ProximityPrompt", false, function(bool)
        local promptsignal = nil
        if bool then
            promptsignal = nil
            task.wait()
            promptsignal = ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
                pcall(function()
                    fireproximityprompt(prompt)
                end)
            end)
        elseif not bool then
            if promptsignal ~= nil then
                promptsignal:Disconnect()
                promptsignal = nil
            end
        end
    end)
    input:Button("Equip All Tools", function()
        for i, v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = Players.LocalPlayer.Character
            end
        end
    end)
    input:Button("Force Drop Tool", function()
        for i, v in pairs(Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = workspace
            end
        end
    end)
    input:Seperator()
    input:Button("Fire All ClickDetectors", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                v.MaxActivationDistance = math.huge
                pcall(function()
                    fireclickdetector(v)
                end)
            end
        end
    end)
    input:Button("Fire All TouchInterests", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                touch(v)
            end
        end
    end)
    input:Button("Fire All ProximityPrompts", function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                pcall(function()
                    fireproximityprompt(v)
                end)
            end
        end
    end)
    local purchase = serv:Channel("Purchase Exploits")
    local x_x = HttpService:JSONDecode(game:HttpGet(
        "https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" .. game.GameId .. "&page=1"))
    local dnames = {}
    local dproductIds = {}
    if type(x_x.DeveloperProducts) == "nil" then
        table.insert(dnames, " ")
    end

    pcall(function()

        local currentPage = 1

        repeat
            local response = game:HttpGet(
                "https://apis.roblox.com/developer-products/v1/developer-products/list?universeId=" ..
                    tostring(game.GameId) .. "&page=" .. tostring(currentPage))
            local decodedResponse = HttpService:JSONDecode(response)
            local developerProducts = decodedResponse.DeveloperProducts
            print("Page " .. currentPage .. ":")
            for _, developerProduct in pairs(developerProducts) do
                table.insert(dnames, developerProduct.Name)
                table.insert(dproductIds, developerProduct.ProductId)
            end
            currentPage = currentPage + 1
            local final = decodedResponse.FinalPage
        until final

    end)
    purchase:Label("Fake Purchaser!\nThis tricks server that you bought a DevProduct!")
    purchase:Label("Only works in some games...")
    purchase:Label("Loop starts when the button to fire is pressed")
    purchase:Toggle("Loop Purchases (Rejoin To Stop)", false, function(bool)
        if bool then
            getgenv().wyvernlooppurchases = true
        else
            getgenv().wyvernlooppurchases = false
            local killswitch = Instance.new("Script")
            killswitch.Parent = Visit
        end
    end)
    local index
    purchase:Dropdown("Below is a list of all DevProducts in this game!", dnames, function(x)
        index = nil
        for i, name in ipairs(dnames) do
            if name == x then
                index = i
                break
            end
        end
    end)

    purchase:Label("If nothing shows above, no DevProducts found.")
    purchase:Button("Fire Selected Dev Product!", function()
        if index then
            local product = dproductIds[index]
            pcall(function()
                stealth_call(
                    'if getgenv().wyvernlooppurchases then while task.wait() do if Visit:FindFirstChild("Script") then break end MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                        product ..
                        ', true) end else MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                        product .. ', true) end')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptProductPurchaseFinished.",
                    "Okay!")
            else
                discord:Notification("Success",
                    "Fired PromptProductPurchaseFinished signal to server with productId: " .. tostring(product),
                    "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "Something went wrong but I don't know what.", "Okay!")
        end
    end)
    purchase:Button("Fire All Dev Products", function()
        getrenv()._set = clonefunction(setthreadidentity)
        local starttickcc = tick()
        for i, product in pairs(dproductIds) do
            task.spawn(function()
                pcall(function()
                    stealth_call(
                        'if getgenv().wyvernlooppurchases then while task.wait() do if Visit:FindFirstChild("Script") then break end MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                            product ..
                            ', true) end else MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, ' ..
                            product .. ', true) end')
                end)
            end)
            task.wait()
        end
        local endtickcc = tick()
        local durationxd = endtickcc - starttickcc
        discord:Notification("Attempt", "Fired All Dev Products! Took ".. tostring(durationxd)  .. " Seconds!", "Okay!")
    end)
    purchase:Seperator()
    purchase:Label("Pretty much the same as the one above but for gamepass")
    local wyverngamepass = game.HttpService:JSONDecode(game:HttpGet(
        "https://games.roblox.com/v1/games/" .. game.GameId .. "/game-passes?limit=100&sortOrder=1"))
    local gnames = {}
    local gproductIds = {}
    for i, v in pairs(wyverngamepass.data) do
        table.insert(gnames, v.name)
        table.insert(gproductIds, v.id)
    end
    local gamepass
    purchase:Dropdown("Below is a list of all GamePass in this game!", gnames, function(x)
        for i, name in ipairs(gnames) do
            if name == x then
                gamepass = gproductIds[i]
                break
            end
        end

    end)
    purchase:Label("If nothing shows above, no GamePass found.")
    purchase:Button("Fire Selected Gamepass", function()
        if gamepass then
            pcall(function()
                stealth_call('MarketplaceService:SignalPromptGamePassPurchaseFinished(game.Players.LocalPlayer, ' ..
                                 tostring(gamepass) .. ', true)')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptGamePassPurchaseFinished.",
                    "Okay!")
            else
                discord:Notification("Success",
                    "Fired PromptProductGamePassPurchaseFinished signal to server with productId: " ..
                        tostring(gamepass), "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "Something went wrong but I don't know what.", "Okay!")
        end
    end)
    purchase:Seperator()
    purchase:Label("Signals to server that an item purchase failed.")
    purchase:Label("This can trick servers to reprompt an item!")
    local returnvalprompt = false
    purchase:Toggle("Item Purchase Success Return Value", returnvalprompt, function(bool)
        returnvalprompt = bool
    end)
    purchase:Textbox("Item ID of the UGC item", "Enter the Item ID...", false, function(t)
        local tt = tonumber(t)
        if type(tt) == "number" then
            pcall(function()
                stealth_call('MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, ' .. tt ..
                                 ', false) MarketplaceService:SignalPromptPurchaseFinished(game.Players.LocalPlayer, ' ..
                                 tt .. ', ' .. tostring(returnvalprompt) ')')
            end)
            task.wait(0.2)
            if not Visit:FindFirstChild("LocalScript") then
                discord:Notification("Error", "Your executor blocked function SignalPromptPurchaseFinished.", "Okay!")
            else
                discord:Notification("Success",
                    "Fired signal PromptPurchaseFinished with bool false and productId: " .. tostring(tt), "Okay!")
                Visit:FindFirstChild("LocalScript"):Destroy()
            end
        else
            discord:Notification("Error", "That's... Not an Item ID.", "Okay!")
        end
    end)
    purchase:Seperator()
    local serv2 = win:Server("Explorer", "")
    local explorer = serv2:Channel("work in progress")
    explorer:Label("will add stupid roblox env explorer soon")
    main:Label("                            Wyvern loaded in " ..
                   string.format("%s seconds.", string.format("%.2f", tostring(tick() - LOAD_TIME))))
    pcall(function()
        message:Destroy()
    end)
end)


if not game:IsLoaded() then game.Loaded:Wait() end
local options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
local Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="MADE BY:",
    Text="galactichypernova",
    Button1="Okay!",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost,
    httpGetAsync,
    (typeof(syn_backup)=='table' and syn_backup.request)
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
local savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[game.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest, ChatMain, MessagePostedEvent
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
    SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    ChatMain=ChatScript:WaitForChild("ChatMain")
	for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
	    if typeof(Event) == "Instance" then
	        MessagePostedEvent = Event
	    end
	end

else
	ChatScript = cGame.CoreGui.RobloxGui.Modules.Server.ClientChat.ChatScript
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6,
	["CopyAuthCookieFromBrowserToEngine"]=nil,
	["ReturnToJavaScript"]=nil,
	["EmitHybridEvent"]=nil
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil,
        ["PromptThirdPartyPurchase"]=nil,
        ["PromptRobloxPurchase"]=nil,
        ["PromptNativePurchaseWithLocalPlayer"]=nil,
        ["PromptNativePurchase"]=nil,
        ["PromptCollectiblesPurchase"]=nil,
        ["PrepareCollectiblesPurchase"]=nil,
        ["ReportAssetSale"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]="",
	["Call"]=3,
	["MakeRequest"]=nil,
	["Subscribe"]=nil
    },
    ["HttpService"]={
        ["RequestInternal"]=1,
	["GetSecret"]=nil
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2,
	["HttpGetAsync"]="",
	["HttpPostAsync"]=""
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    },
    ["OpenCloudService"]={
	["HttpRequestAsync"]={},
	["InvokeAsync"]={}
    },
    ["ScriptContext"]={
	["AddCoreScriptLocal"]=nil
    },
    ["VideoCaptureService"]={
        ["GetCameraDevices"]={}
    },
    ["CaptureService"]={
	["DeleteCapture"]=nil,
	["PromptSaveCapturesToGallery"]=nil,
	["PromptShareCapture"]=nil,
	["RetrieveCaptures"]={},
	["SaveCaptureToExternalStorage"]=nil,
	["SaveScreenshotCapture"]=nil
    },
    ["SafetyService"]={
    	["TakeScreenshot"]=0
    },
    ["LoginService"]={
	["PromptLogin"]=nil,
	["Logout"]=nil
    },
    ["PermissionsService"]={
	["SetPermissions"]=nil
    }
}
local c
local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				pcall(function()
					local old7
					old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
					    if options.MaliciousNamecalls.Enabled then
	                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
	                        return not checkcaller() and old7(...)or nil
	                    end
	                    return old7(...)
					end)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		if not options.ChatBan.Enabled then
			return old13(...)
		end
		if self==MessagePostedEvent then
			return options.Output("MessagePosted usage was attempted. Attempt denied.")
		end
		return old13(...)
	end)
	if ChatBar then
		old12=hookfunction(ChatBar.CaptureFocus,function(...)
			if options.ChatBan.Enabled and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not c then
						StarterGui:SetCore("SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
							Button1="Okay!",
							Duration=15
						})
						StarterGui:SetCore("SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
						setclipboard(getcallingscript():GetFullName())
							StarterGui:SetCore("SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						c="e"
					end
				end
				return
			end
			return old12(...)
		end)
	end
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		if options.GUIDetection and args[1]==Content and typeof(args[2])=="table" then
			return options.Output("GUI detection attempted. Attempt denied.")
		end
		return old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,500)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		if options.AntiKick and args[1]==LocalPlayer then
			return options.Output("Attempt to kick player denied.")
		end
		return old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
		if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
			return options.Output("Script attempted to access the bank. Attempt denied.")
		end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			pcall(function()
				local old6
				old6=hookfunction(v,function(...)
					local args={...}
					if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
						options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
						if options.AntiLog.Payback and not is_sirhurt_closure then
							args[1].Method="DELETE"
						else
							args[1].Url="https://google.com"
						end
						return old6(unpack(args))
					end
					if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
						options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
						return 
					end 
					if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
						options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
						return 
					end
					return old6(...)
				end)
			end)
		end
	end
        pcall(function()
	local oldHttpPost
	oldHttpPost = hookfunction(game.HttpPost, function (...)
		local args = {...}
		options.Output("HttpPost request attempted. Attempt denied.")
		return
	end)
        end)
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
local a
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...) or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
				options.Output("Script attempted to access the bank. Attempt denied.")
				return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			local outerProp = rawget(savedProps,self)
			local prop = rawget(outerProp,b)
			if not checkcaller() and outerProp and prop and rawget(options,"BasicAntiCheatBypass") then
				return prop
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end
if options.Error then
    for i,v in next,getconnections(cGame:GetService("ScriptContext").Error) do
	v:Disable()
    end
end
if options.Message then
    for i,v in next,getconnections(cGame:GetService("LogService").MessageOut) do
	v:Disable()
    end
end
if options.AntiIdle then
    for i,v in next,getconnections(LocalPlayer.Idled) do
	v:Disable()
    end
end

if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().Guardian then return end
getgenv().options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
getgenv().Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="By galactichypernova",
    Text="With love <3",
    Button1="<3",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
getgenv().savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[cGame.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
end
ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local ChatMain=ChatScript:WaitForChild("ChatMain")
local MessagePostedEvent
for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
    if typeof(Event) == "Instance" then
        MessagePostedEvent = Event
    end
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]=2
    },
    ["HttpService"]={
        ["RequestInternal"]=1
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    }
}
if cGame:GetService("VideoCaptureService") then
    namecall["VideoCaptureService"]={
        ["GetCameraDevices"]=1
    }
end

local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				local old7
				old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
				    if options.MaliciousNamecalls.Enabled then
                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                        return not checkcaller() and old7(...)or nil
                    end
                    return old7(...)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		return not options.ChatBan.Enabled and old13(...) or self==MessagePostedEvent and options.Output("MessagePosted usage was attempted. Attempt denied.") or old13(...)
	end)
	old12=hookfunction(ChatBar.CaptureFocus,function(...)
		if options.ChatBan.Enabled and options.ChatBan.Slash then
			options.Output("Chat focus capture as local player was attempted. Attempt denied.")
			if getcallingscript()~=ChatScript then
				if not rawget(getgenv(),"c") then
					StarterGui:SetCore("SendNotification",{
						Title="WARNING!",
						Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
						Button1="Okay!",
						Duration=15
					})
					StarterGui:SetCore("SendNotification",{
						Title="What to do",
						Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
						Button1="Okay!",
						Duration=15
					})
					if getcallingscript() then
					setclipboard(getcallingscript():GetFullName())
						StarterGui:SetCore("SendNotification",{
							Title="Copied to clipboard",
							Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
							Button1="Okay!",
							Duration=15
						})
					end
					rawset(getgenv(),"c","e")
				end
			end
			return
		end
		return old12(...)
	end)
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		return options.GUIDetection and (args[1]==Content and typeof(args[2])=="table" and options.Output("GUI detection attempted. Attempt denied.")) or old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,550)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		return options.AntiKick and (args[1]==LocalPlayer and options.Output("Attempt to kick player denied.")) or old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
                if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
                        return options.Output("Script attempted to access the bank. Attempt denied.")
                end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			local old6
			old6=hookfunction(v,function(...)
				local args={...}
				if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
					options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
					if options.AntiLog.Payback and not is_sirhurt_closure then
						args[1].Method="DELETE"
					else
						args[1].Url="https://google.com"
					end
					return old6(unpack(args))
				end
				if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
					options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
					return 
				end
				if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
					options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
					return 
				end
				return old6(...)
			end)
		end
	end
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not getgenv().a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						getgenv().a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...)or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
                                options.Output("Script attempted to access the bank. Attempt denied.")
                                return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			if not checkcaller() and rawget(savedProps,self) and rawget(rawget(savedProps,self),b) and rawget(options,"BasicAntiCheatBypass") then
				return rawget(rawget(savedProps,self),b)
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end
if options.Error then
    for i,v in next,getconnections(cGame:GetService("ScriptContext").Error) do
	v:Disable()
    end
end
if options.Message then
    for i,v in next,getconnections(cGame:GetService("LogService").MessageOut) do
	v:Disable()
    end
end
if options.AntiIdle then
    for i,v in next,getconnections(LocalPlayer.Idled) do
	v:Disable()
    end
end


if not game:IsLoaded() then game.Loaded:Wait() end
local options={
    MaliciousNamecalls={
        Enabled=true,
        ShowNamecall=true
    },
    ChatBan={
        Enabled=true,
        Slash=true,
	NewChat=true
    },
    PetSim={
        Enabled=true,
        ShowUser=true,
        Bank=true,
        Mail=true
    },
    PetSim99=true,
    MiningSim=true,
    AntiLog={
        Enabled=true,
        ShowInfo=true,
        ShowDestination=true,
        Payback=true
    },
    AutoJoin={
        Enabled=true,
        ShowServer=true
    },
    BeeSwarm=true,
    Require=true,
    AntiKick=true,
    BasicAntiCheatBypass=true,
    MemoryDetections=true,
    GUIDetection=true,
    GroupBypass=true,
    ClearTrace=true,
    Error=true,
    Message=true,
    AntiIdle=true,
    AntiApi={
	Enabled=true,
	ShowEndpoint=true
    },
    Output=warn --Change to your prefered output option (print,warn,printconsole,rconsoleprint,rconsolewarn,etc)
}
local Guardian={
    SetAll=function(a)
        for i, v in next,options do
            if typeof(v)=="table" then
                for i2 in next,v do
                    options[i][i2]=a
                end
            else
                options[i]=a
            end
        end
    end
}
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="Guardian has been activated",
    Text="Guardian is now protecting you in the background",
    Button1="Okay!",
    Duration=8
})
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title="MADE BY:",
    Text="galactichypernova",
    Button1="Okay!",
    Duration=8
})
if not hookmetamethod or not hookfunction then
    task.spawn(function()error("Your executor does not support a core function needed for this script. Expect detections and poor security")end)
end
if not getproperties then
    task.spawn(function()error("Your executor does not support getproperties, so the basic anti cheat bypass sadly won't work for you. However, everything else should.")end)
end
local hrequest,execlosure=
{
    (typeof(syn)=='table'and syn.request),
    (typeof(http)=='table'and http.request),
    (typeof(fluxus)=='table'and fluxus.request),
    request,
    http_request~=request and http_request, 
    HttpPost,
    httpGetAsync,
    (typeof(syn_backup)=='table' and syn_backup.request)
},is_synapse_function or isexecutorclosure or iskrnlclosure or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or checkclosure
local savedProps={}
local cGame=cloneref(game)
local Players=cGame:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local Char=(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
local rd=math.random
local strFind=clonefunction(string.find)
local strMatch=clonefunction(string.match)
local StarterGui,Stats,Content=cGame:GetService("StarterGui"),cGame:GetService("Stats"),cGame:GetService("ContentProvider")
local tr,hiv,bank=cGame.PlaceId==9551640993 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConfirmTrade") or nil,cGame.PlaceId==1537690962 and cGame:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ConstructHiveCellFromEgg") or nil--[[game.PlaceId==6284583030 and workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("invite to bank")]]
local bank99 = cGame.PlaceId == 8737899170 and cGame.ReplicatedStorage.Network["Mailbox: Send"] or nil
local ChatBar,ChatScript,SayMessageRequest, ChatMain, MessagePostedEvent
if cGame:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
    ChatBar = LocalPlayer.PlayerGui:WaitForChild("Chat"):WaitForChild("Frame").ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    ChatScript = LocalPlayer.PlayerScripts:WaitForChild("ChatScript")
    SayMessageRequest = cGame:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    ChatMain=ChatScript:WaitForChild("ChatMain")
	for _, Event in next, debug.getupvalues(require(ChatMain).MessagePosted.fire) do
	    if typeof(Event) == "Instance" then
	        MessagePostedEvent = Event
	    end
	end

else
	ChatScript = cGame.CoreGui.RobloxGui.Modules.Server.ClientChat.ChatScript
end
local namecall={
    ["BrowserService"]={
        ["OpenBrowserWindow"]=1,
        ["ExecuteJavaScript"]=2,
	["SendCommand"]=3,
	["OpenNativeOverlay"]=4,
	["CloseBrowserWindow"]=5,
	["OpenWeChatAuthWindow"]=6,
	["CopyAuthCookieFromBrowserToEngine"]=nil,
	["ReturnToJavaScript"]=nil,
	["EmitHybridEvent"]=nil
    },
    ["MarketplaceService"]={
        ["PerformPurchase"]=nil,
	["PerformPurchaseV2"]=nil,
        ["GetRobuxBalance"]=0,
	["PromptGamePassPurchase"]=nil,
	["PromptPurchase"]=nil,
	["PromptBundlePurchase"]=nil,
	["PromptProductPurchase"]=nil,
	["PromptSubscriptionPurchase"]=nil,
        ["PromptThirdPartyPurchase"]=nil,
        ["PromptRobloxPurchase"]=nil,
        ["PromptNativePurchaseWithLocalPlayer"]=nil,
        ["PromptNativePurchase"]=nil,
        ["PromptCollectiblesPurchase"]=nil,
        ["PrepareCollectiblesPurchase"]=nil,
        ["ReportAssetSale"]=nil
    },
    ["MessageBusService"]={
        ["Publish"]=1,
        ["GetMessageId"]="",
	["Call"]=3,
	["MakeRequest"]=nil,
	["Subscribe"]=nil
    },
    ["HttpService"]={
        ["RequestInternal"]=1,
	["GetSecret"]=nil
    },
    ["GuiService"]={
        ["OpenBrowserWindow"]=1,
	["OpenNativeOverlay"]=2,
	["SetPurchasePromptIsShown"]=3
    },
    ["DataModel"]={
        ["OpenVideosFolder"]=1,
        ["OpenScreenshotsFolder"]=2,
	["HttpGetAsync"]="",
	["HttpPostAsync"]=""
    },
    ["RbxAnalyticsService"]={
        ["GetClientId"]=1
    },
    ["Players"]={
        ["ReportAbuse"]=1
    },
    ["HttpRbxApiService"]={
        ["GetAsync"]=1,
	["GetAsyncFullUrl"]=2,
	["GetDocumentationUrl"]=3,
	["PostAsync"]=4,
	["PostAsyncFullUrl"]=5,
	["RequestAsync"]=6,
	["RequestLimitedAsync"]=7
    },
    ["OpenCloudService"]={
	["HttpRequestAsync"]={},
	["InvokeAsync"]={}
    },
    ["ScriptContext"]={
	["AddCoreScriptLocal"]=nil
    },
    ["VideoCaptureService"]={
        ["GetCameraDevices"]={}
    },
    ["CaptureService"]={
	["DeleteCapture"]=nil,
	["PromptSaveCapturesToGallery"]=nil,
	["PromptShareCapture"]=nil,
	["RetrieveCaptures"]={},
	["SaveCaptureToExternalStorage"]=nil,
	["SaveScreenshotCapture"]=nil
    },
    ["SafetyService"]={
    	["TakeScreenshot"]=0
    },
    ["LoginService"]={
	["PromptLogin"]=nil,
	["Logout"]=nil
    },
    ["PermissionsService"]={
	["SetPermissions"]=nil
    }
}
local c
local old1,old2,old3,old4,old5,old8,old9,old10,old11,old12,old13,old14,old15,old16
if hookfunction then
	old5=hookfunction(getrenv().gcinfo,function(...)
		return options.MemoryDetections and rd(1500,2500) or old5(...)
	end)
	if not is_sirhurt_closure then
		for i,v in next,namecall do
			for i2,v2 in next,v do
				pcall(function()
					local old7
					old7=hookfunction(i=="DataModel" and cGame[i2] or cGame[i][i2],function(...)
					    if options.MaliciousNamecalls.Enabled then
	                        options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
	                        return not checkcaller() and old7(...)or nil
	                    end
	                    return old7(...)
					end)
				end)
			end
		end
	end
	old13=hookfunction(Instance.new("BindableEvent").Fire,function(...)
		return not options.ChatBan.Enabled and old13(...) or self==MessagePostedEvent and options.Output("MessagePosted usage was attempted. Attempt denied.") or old13(...)
	end)
	if ChatBar then
		old12=hookfunction(ChatBar.CaptureFocus,function(...)
			if options.ChatBan.Enabled and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not c then
						StarterGui:SetCore("SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript():GetFullName(),
							Button1="Okay!",
							Duration=15
						})
						StarterGui:SetCore("SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
						setclipboard(getcallingscript():GetFullName())
							StarterGui:SetCore("SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						c="e"
					end
				end
				return
			end
			return old12(...)
		end)
	end
	old8=hookfunction(Content.PreloadAsync,function(...)
		local args={...}
		return options.GUIDetection and (args[1]==Content and typeof(args[2])=="table" and options.Output("GUI detection attempted. Attempt denied.")) or old8(...) 
	end)
	old9=hookfunction(Stats.GetTotalMemoryUsageMb,function(...)
		local args={...}
		return options.MemoryDetections and (args[1]==Stats and rd(400,550)) or old9(...)
	end)
	old10=hookfunction(cGame.Players.LocalPlayer.Kick,function(...)
		local args={...}
		return options.AntiKick and (args[1]==LocalPlayer and options.Output("Attempt to kick player denied.")) or old10(...) 
	end)
	local oldd,oldd2
	oldd=hookfunction(Instance.new("RemoteEvent").FireServer,newcclosure(function(self,...)
		if options.ChatBan.Enabled and self==SayMessageRequest and getcallingscript()~=ChatMain then
			return options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr then
				return options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
			end
		end
		return oldd(self,...)
	end))
	if cGame.GameId==2316994223 then
    	local oldPet
    	oldPet=hookfunction(require(cGame:GetService("ReplicatedStorage").Library.Client.Network).Invoke,function(self,...)
    	    if options.PetSim.Enabled and checkcaller() then
    	        local args={...}
                if self=="Invite To Bank" and options.PetSim.Bank then
                    for i,v in next,args do print(i,v)end
        			task.spawn(function()
        				options.Output(("Script attempted to give user%saccess to your bank. Attempt denied."):format(options.PetSim.ShowUser and " named ".. Players:GetNameFromUserIdAsync(args[2]).." (ID: "..args[2]..") " or " "))
        			end)
        			return
                end
                if self=="Send Mail" and options.PetSim.Mail then
                    for i,v in next,args do print(i,v)end
                    task.spawn(function()
                        options.Output(("Script attempted to send mail to a user%s. Attempt denied."):format(options.PetSim.ShowUser and " named ".. args[1]["Recipient"].." (ID: "..Players:GetUserIdFromNameAsync(args[1]["Recipient"])..") " or ""))
                    end)
                    return
                end
    	    end
            return oldPet(self,...)
        end)
    	    end
	oldd2=hookfunction(Instance.new("RemoteFunction").InvokeServer,newcclosure(function(self,...)
		if cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv then
			return options.Output("Script attempted to place a basic bee egg, potentially for a fake dupe. Attempt denied.")
		end
		if cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and checkcaller() then
			return options.Output("Script attempted to access the bank. Attempt denied.")
		end
		return oldd2(self,...)
	end))
	function ToString(tbl,level)
		local tabString = "\t"
		local tblString = "{\n"..tabString:rep(level)
		local newLineString = ",\n"..tabString:rep(level)
		for key,value in pairs(tbl) do 
			if type(value) == "table" then 
				tblString = tblString  .. key .. "=" .. ToString(value,level+1)
			else
				tblString = tblString  .. key .. "= " .. tostring(value):gsub("\n","") .. newLineString
			end
		end
		return tblString..("\n%s}"):format(tabString:rep(level))
	end
	for i,v in next,hrequest do
		if v then
			pcall(function()
				local old6
				old6=hookfunction(v,function(...)
					local args={...}
					if (strFind(args[1].Url,"webhook") or strFind(args[1].Url,"websec")) and options.AntiLog.Enabled then
						options.Output(("Script attempted to log info%s. Attempt denied. %s\n%s"):format(options.AntiLog.ShowDestination and " at "..args[1].Url or "",options.AntiLog.ShowInfo and "\nLogged info:\n"     ..(args[1].Body and ToString(cGame:GetService("HttpService"):JSONDecode(args[1].Body),1)or "None")or "",options.AntiLog.Payback and not is_sirhurt_closure and "Webhook was deleted." or ""))
						if options.AntiLog.Payback and not is_sirhurt_closure then
							args[1].Method="DELETE"
						else
							args[1].Url="https://google.com"
						end
						return old6(unpack(args))
					end
					if strFind(args[1].Url,"rpc") and options.AutoJoin.Enabled then
						options.Output(("Script attempted to auto join %s. Attempt denied."):format(options.AutoJoin.ShowServer and (args[1].Body and "https://discord.gg/"..cGame:GetService("HttpService"):JSONDecode(args[1].Body).args.code or "nil") or "a server")) 
						return 
					end 
					if strMatch(args[1].Url,"%l+%.roblox%.com/v%d/") and options.AntiApi.Enabled then
						options.Output(("Script attempted to access the API%s. Attempt denied."):format(options.AntiApi.ShowEndpoint and " at "..args[1].Url or ""))
						return 
					end
					return old6(...)
				end)
			end)
		end
	end
        pcall(function()
	local oldHttpPost
	oldHttpPost = hookfunction(game.HttpPost, function (...)
		local args = {...}
		options.Output("HttpPost request attempted. Attempt denied.")
		return
	end)
        end)
	old16=hookfunction(Instance.new("TextChannel").SendAsync,newcclosure(function(self,...) 
		if options.ChatBan.NewChat then
			options.Output("New chat system message request attempted to fire. Attempt denied.")
			return
		end
		return old16(self,...)
	end))
	--[[old3=hookfunction(getrenv().debug.info,function(self,params,...)
		return options.Require and (self==2 and type(params)=="string" and old3(4,params,...)) or old3(...)
	end)]]
	--old4=hookmetamethod(Vector3.new(),"__index",newcclosure(function(self,b,...)
	--    return options.BasicAntiCheatBypass and not table.find({LocalPlayer.PlayerScripts.PlayerModule.ControlModule,LocalPlayer.PlayerScripts.RbxCharacterSounds},getcallingscript()) and b:lower()=="magnitude" and (old4(self,b,...)<=savedProps.WalkSpeed and old4(self,b,...) or rd(0,savedProps.WalkSpeed)) or old4(self,b,...)
	--end),false)
	old14=hookfunction(LocalPlayer.IsInGroup,function(...)
		local args={...}
		return options.GroupBypass and (args[1]==LocalPlayer and typeof(args[2])=="number" and args[2]>0 and true) or old14(...)
	end)
	--[[old15=hookfunction(LocalPlayer.DistanceFromCharacter,function(...)
		local args={...}
		return not checkcaller() and (options.BasicAntiCheatBypass and (args[1]==LocalPlayer and typeof(args[2])=="Vector3" and (old15(...)<savedProps.WalkSpeed and old15(...) or rd(0,savedProps.WalkSpeed)))) or old15(...)
	end)]]
end
local a
if hookmetamethod then
	old1=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
		local args={...}
		local method=string.upper(string.sub(getnamecallmethod(),1,1))..string.sub(getnamecallmethod(),2,#getnamecallmethod())
		if options.ChatBan.Enabled then
			if method=="FireServer" and self==SayMessageRequest and getcallingscript()~=ChatMain then
				options.Output("SayMessageRequest remote event attempted to fire. Attempt denied.")
				return
			elseif method=="SendAsync" and self.ClassName=="TextChannel" and options.ChatBan.NewChat then
				options.Output("New chat system message request attempted to fire. Attempt denied.")
				return
			elseif method=="CaptureFocus" and self==ChatBar and options.ChatBan.Slash then
				options.Output("Chat focus capture as local player was attempted. Attempt denied.")
				if getcallingscript()~=ChatScript then
					if not a then
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="WARNING!",
							Text="There is an attempt to force you to chat in game."..getcallingscript().GetFullName(getcallingscript()),
							Button1="Okay!",
							Duration=15
						})
						StarterGui.SetCore(StarterGui,"SendNotification",{
							Title="What to do",
							Text="If it is due to a script, rejoin and do not execute it again. Otherwise, go there (through dex) and disable/delete it.",
							Button1="Okay!",
							Duration=15
						})
						if getcallingscript() then
							setclipboard(getcallingscript().GetFullName(getcallingscript()))
							StarterGui.SetCore(StarterGui,"SendNotification",{
								Title="Copied to clipboard",
								Text="The path has also been copied to clipboard so you won't lose it in case this warning is gone too fast.",
								Button1="Okay!",
								Duration=15
							})
						end
						a="e"
					end
				end
				return
			elseif method=="Fire" and self==MessagePostedEvent then
				options.Output("MessagePosted usage was attempted. Attempt denied.")
				return
			end
		end
		if namecall[self.ClassName] and 
		namecall[self.ClassName][method] and options.MaliciousNamecalls.Enabled
		then
			options.Output(("Malicious namecall%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..self.GetFullName(self)..":"..method or ""))
			return not checkcaller() and old1(...)or nil
		end
		--[[if not checkcaller() and method=="DistanceFromCharacter" and self==LocalPlayer and typeof(args[1])=="Vector3" and options.BasicAntiCheatBypass then
			return old1(self,...)<savedProps.WalkSpeed and old1(self,...) or rd(0,savedProps.WalkSpeed)
		end]]
		if self==LocalPlayer and method=="Kick" and options.AntiKick then
			options.Output("Attempt to kick player denied.")
			return
		end
		if self==Stats and method=="GetTotalMemoryUsageMb" and options.MemoryDetections then
			return rd(400,550)
		end
		if self==Content and method=="PreloadAsync" and typeof(args[1])=="table"and  options.GUIDetection then
			return
		end
		if self==LocalPlayer and method=="IsInGroup" and typeof(args[1])=="number" and args[1]>0 and options.GroupBypass then
			return true
		end
		if checkcaller() then
			if cGame.PlaceId==9551640993 and options.MiningSim and self==tr and method=="FireServer" then
				options.Output("Script attempted to confirm a potentially rigged/scam trade. Attempt denied.")
				return
			--[[elseif cGame.PlaceId==6284583030 and options.PetSim and self==bank and method=="InvokeServer" then
				local args={...}
				task.spawn(function()
					options.Output(("Script attempted to give user named %s (ID: %s) access to your bank. Attempt denied."):format(Players:GetNameFromUserIdAsync(args[1][2]),args[1][2]))
				end)
				return ]]
			elseif cGame.PlaceId==1537690962 and options.BeeSwarm and self==hiv and method=="InvokeServer" then
				options.Output("Script attempted to place a basic bee egg, potentially a fake dupe. Attempt denied.")
				return
			elseif cGame.PlaceId==8737899170 and options.PetSim99 and self==bank99 and method=="InvokeServer" then
				options.Output("Script attempted to access the bank. Attempt denied.")
				return
			end
		end
		return old1(self,...)
	end))
	if getproperties then
		repeat task.wait()until #Char:GetChildren()>0
		for i,v in next,Char:GetChildren() do
			savedProps[v]={}
			for i2,v2 in next,getproperties(v) do
				if typeof(v2)~="Vector3" and typeof(v2)~="CFrame" then
					savedProps[v][i2]=v2
				end
			end
		end
		old2=hookmetamethod(game,"__index",newcclosure(function(self,b,...)
			if not checkcaller() and rawget(savedProps,self) and rawget(rawget(savedProps,self),b) and rawget(options,"BasicAntiCheatBypass") then
				return rawget(rawget(savedProps,self),b)
			end
			return old2(self,b,...)
		end))
	end
end
if is_sirhurt_closure then
    local namecallSirhurt=(function()
        local actual={}
        for i,v in next,namecall do
            for i2,v2 in next,v do
                table.insert(actual,i.."."..i2)
            end
        end
        return actual
    end)()
    for i,v in next, namecallSirhurt do
        local oldSir
        oldSir=hookfunction(v:split(".")[1]=="DataModel" and cGame[v:split(".")[2]] or cGame[v:split(".")[1]][v:split(".")[2]],function(...)
            if options.MaliciousNamecalls.Enabled then
                options.Output(("Malicious function%s attempted execution. Attempt denied."):format(options.MaliciousNamecalls.ShowNamecall and " game."..(i~="DataModeL"and i.."."..i2) or i2 or "")) 
                return not checkcaller() and oldSir(...)or nil
            end
            return oldSir(...)
        end)
    end
    
end

if options.ClearTrace then
    for i,v in next,getgc()do
        if typeof(v)=="function" and execlosure(v) then
            v=nil
        end
    end
end
