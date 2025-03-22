--// Get necessary Roblox services
getrenv().HttpService = cloneref(game:GetService("HttpService")) 
getrenv().TeleportService = cloneref(game:GetService("TeleportService")) 
getrenv().Players = cloneref(game:GetService("Players")) 
getrenv().LocalPlayer = Players.LocalPlayer
getrenv().UserInputService = cloneref(game:GetService("UserInputService")) 

--// Get the current game's PlaceId
local PlaceId = game.PlaceId

--// Determine which HTTP request function to use (compatible with various executors)
local http_request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
if not http_request then 
    warn("Executor does not support HTTP requests.") 
    return 
end

--// Create a ScreenGui and parent it to CoreGui so it appears on the player's screen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

--// Create the main frame for the UI and position/size it
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)  -- Center pivot
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)   -- Center of screen
MainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)         -- 40% width, 50% height
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

--// Make the main frame draggable using delta-based movement
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

--// Create the Title section (includes a background, icon, and text)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 0.1 * MainFrame.AbsoluteSize.Y) -- 10% of MainFrame's height (fixed height using AbsoluteSize.Y)
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.BorderSizePixel = 2
TitleLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
--// Add leading spaces in the text to offset text (if needed) – here we later use an icon and adjust position via UIPadding
TitleLabel.Text = "              Alwi Hub | Server Browser V.1.0"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left -- Align text to the left

--// Add an ImageLabel as the icon on the left side of the TitleLabel
local Icon = Instance.new("ImageLabel")
Icon.Parent = TitleLabel
Icon.Size = UDim2.new(0, 30, 0, 25)          -- Set the size of the icon
Icon.Position = UDim2.new(0, 5, 0.5, -15)     -- Position the icon near the left edge, vertically centered
Icon.Image = "rbxassetid://92639750101948"      -- Replace with your desired image asset ID
Icon.BackgroundTransparency = 1

--// Create the Header Frame for column headers and position it just below the title
local HeaderFrame = Instance.new("Frame")
HeaderFrame.Parent = MainFrame
HeaderFrame.Position = UDim2.new(0, 0, 0, TitleLabel.Size.Y.Offset)
HeaderFrame.Size = UDim2.new(1, 0, 0, 0.07 * MainFrame.AbsoluteSize.Y) -- 7% of MainFrame's height
HeaderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HeaderFrame.BorderSizePixel = 2
HeaderFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

--// Define the headers and their width ratios for a table layout
local Headers = {"Server Id", "Ping", "Players", "Join"}
local HeaderWidths = {0.55, 0.15, 0.15, 0.15}

--// Create header labels based on the above definitions
for i, text in ipairs(Headers) do
    local Label = Instance.new("TextLabel")
    Label.Parent = HeaderFrame
    Label.Size = UDim2.new(HeaderWidths[i], 0, 1, 0)
    --// Calculate the x-position based on the cumulative widths of previous headers
    local posX = 0
    for j = 1, i - 1 do
        posX = posX + HeaderWidths[j]
    end
    Label.Position = UDim2.new(posX, 0, 0, 0)
    Label.Text = text
    Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Label.BorderSizePixel = 1
    Label.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
end

--// Create a scrolling frame to list servers; its CanvasSize will adjust automatically
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.Position = UDim2.new(0, 0, 0, TitleLabel.Size.Y.Offset + HeaderFrame.Size.Y.Offset)
ScrollFrame.Size = UDim2.new(1, 0, 1, - (TitleLabel.Size.Y.Offset + HeaderFrame.Size.Y.Offset + 0.12 * MainFrame.AbsoluteSize.Y))
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

--// Add a UIListLayout to automatically arrange the server entries in the scroll frame
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

--// Create a Button Frame at the bottom for Refresh and Close actions
local ButtonFrame = Instance.new("Frame")
ButtonFrame.Parent = MainFrame
ButtonFrame.AnchorPoint = Vector2.new(0, 1)
ButtonFrame.Position = UDim2.new(0, 0, 1, 0)
ButtonFrame.Size = UDim2.new(1, 0, 0, 0.12 * MainFrame.AbsoluteSize.Y) -- 12% of MainFrame's height
ButtonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ButtonFrame.BorderSizePixel = 2
ButtonFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

--// Create buttons for Refresh and Close, storing them in a table for later use
local ButtonNames = {"Refresh", "Close"}
local ButtonActions = {}
for i, name in ipairs(ButtonNames) do
    local Button = Instance.new("TextButton")
    Button.Parent = ButtonFrame
    Button.Size = UDim2.new(1 / #ButtonNames, 0, 1, 0)
    Button.Position = UDim2.new((i - 1) / #ButtonNames, 0, 0, 0)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.BorderSizePixel = 2
    Button.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextScaled = true
    Button.Font = Enum.Font.SourceSansBold
    ButtonActions[name] = Button
end

--// Function to fetch the server list from the Roblox API
local function FetchServers()
    --// Clear existing entries in the scroll frame
    for _, child in pairs(ScrollFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end

    local url = "https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?limit=10&sortOrder=Desc"
    local response

    --// Attempt to make the HTTP request safely
    local success, err = pcall(function()
        response = http_request({ Url = url, Method = "GET" })
    end)
    if not success or not response or not response.Body then
        warn("Failed to fetch servers:", err)
        return
    end

    --// Parse the JSON response from the API
    local data
    success, err = pcall(function()
        data = HttpService:JSONDecode(response.Body)
    end)
    if not success or not data or not data.data then
        warn("Invalid server data:", err)
        return
    end

    --// Create UI entries for each server
    for _, server in pairs(data.data) do
        local ServerFrame = Instance.new("Frame")
        ServerFrame.Parent = ScrollFrame
        ServerFrame.Size = UDim2.new(1, 0, 0, 30)
        ServerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ServerFrame.BorderSizePixel = 1
        ServerFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

        --// Data array for the server: id, ping (if available), and player count
        local InfoArray = {
            server.id,
            (server.ping and tostring(server.ping)) or "N/A",
            server.playing .. "/" .. server.maxPlayers
        }

        --// Create a label for each piece of server info
        for i, text in ipairs(InfoArray) do
            local Label = Instance.new("TextLabel")
            Label.Parent = ServerFrame
            Label.Size = UDim2.new(HeaderWidths[i], 0, 1, 0)
            local posX = 0
            for j = 1, i - 1 do
                posX = posX + HeaderWidths[j]
            end
            Label.Position = UDim2.new(posX, 0, 0, 0)
            Label.Text = text
            Label.TextColor3 = Color3.new(1, 1, 1)
            Label.TextScaled = true
            Label.Font = Enum.Font.SourceSans
            Label.BackgroundTransparency = 1
        end

        --// Create a "Join" button for the server in the last column
        local joinButton = Instance.new("TextButton")
        joinButton.Parent = ServerFrame
        joinButton.Size = UDim2.new(HeaderWidths[4], 0, 1, 0)
        local posX = 0
        for j = 1, 3 do
            posX = posX + HeaderWidths[j]
        end
        joinButton.Position = UDim2.new(posX, 0, 0, 0)
        joinButton.Text = "Join"
        joinButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        joinButton.BorderSizePixel = 1
        joinButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
        joinButton.TextColor3 = Color3.new(1, 1, 1)
        joinButton.TextScaled = true
        joinButton.Font = Enum.Font.SourceSansBold

        --// Connect the Join button to teleport the player to the selected server
        joinButton.MouseButton1Click:Connect(function()
            TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
        end)
    end
end

--// Connect the Refresh and Close buttons to their actions
ButtonActions["Refresh"].MouseButton1Click:Connect(FetchServers)
ButtonActions["Close"].MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

--// Initial call to populate the server list
FetchServers()
