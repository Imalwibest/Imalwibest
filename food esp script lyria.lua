

local itemNames = {
    "Taco", "Chicken Leg", "Poison Cake", "Cake", "Sandwich", "Chocolate Milk", 
    "Medkit", "Strange Drink", "Bloxy Cola", "Hot Dog", "Cherry Pie", 
    "Chocolate Bunny", "Ice Cream", "Pizza", "Energy Bar", "Health Potion"
}

local itemsFolder = game:GetService("Workspace"):FindFirstChild("Items")
local createdESP = {}

local function removeAllESP()
    for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
        if gui:IsA("BillboardGui") and gui.Name == "ItemESP" then
            pcall(function()
                gui:Destroy()
            end)
        end
    end

    for _, part in ipairs(game:GetService("Workspace"):GetChildren()) do
        if part:IsA("BasePart") and part:FindFirstChild("ItemHighlight") then
            pcall(function()
                part.ItemHighlight:Destroy()
            end)
        end
    end

    createdESP = {}
end

local function createESP(item)
    if not table.find(itemNames, item.Name) then return end
    if createdESP[item] then return end

    local part = item:IsA("BasePart") and item or item:FindFirstChildWhichIsA("BasePart", true)
    if not part then return end

    pcall(function()
        local billboardGui = Instance.new("BillboardGui", game:GetService("CoreGui"))
        billboardGui.Name = "ItemESP"
        billboardGui.AlwaysOnTop = true
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.Adornee = part

        local textLabel = Instance.new("TextLabel", billboardGui)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = item.Name
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextSize = 14
        textLabel.Font = Enum.Font.SourceSansBold

        local highlight = Instance.new("Highlight")
        highlight.Name = "ItemHighlight"
        highlight.Parent = part
        highlight.FillColor = Color3.fromRGB(0, 255, 0)
        highlight.FillTransparency = 0.25
        highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
        highlight.OutlineTransparency = 0.5
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

        createdESP[item] = true
    end)
end

local function checkForRemovedItems()
    for item, _ in pairs(createdESP) do
        pcall(function()
            if not item:IsDescendantOf(itemsFolder) or not item.Parent then
                if item:IsA("BasePart") and item:FindFirstChild("ItemHighlight") then
                    item.ItemHighlight:Destroy()
                end
                for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
                    if gui:IsA("BillboardGui") and gui.Adornee == item then
                        gui:Destroy()
                    end
                end
                createdESP[item] = nil
            end
        end)
    end
end

local function handleItems()
    if not getgenv().FoodItems then
        removeAllESP()
    else
        if itemsFolder then
            for _, item in ipairs(itemsFolder:GetChildren()) do
                if table.find(itemNames, item.Name) then
                    createESP(item)
                end
            end

            itemsFolder.ChildAdded:Connect(function(child)
                if getgenv().FoodItems and table.find(itemNames, child.Name) then
                    createESP(child)
                end
            end)
        end
    end
end

task.spawn(function()
    local lastFoodItemsState = getgenv().FoodItems

    while true do
        if getgenv().FoodItems ~= lastFoodItemsState then
            lastFoodItemsState = getgenv().FoodItems
            handleItems()
        end
        
        if getgenv().FoodItems then
            handleItems()
            checkForRemovedItems()
        end

        task.wait(0.5)
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    handleItems()
end)

handleItems()
