
local VAI = {
    [15295503917] = "Teddy Bear",
    [15295504436] = "Guest Doll",
    [15295504094] = "Noob Doll",
    [15295503718] = "Train",
    [15295504278] = "Jack in the Box"
}

local function searchModel(model)
    if model:IsA("Model") and model.Name == "Envelope" then
        wait(0.1)
        local WI = model:FindFirstChild("WishImage", true)
        if WI and WI:IsA("ImageLabel") then
            local assetId = tonumber(WI.Image:match("rbxassetid://(%d+)"))
            if VAI[assetId] then
                game.Workspace.Gameplay.Workshop.WishTaker.WishTakerStand.WishTakerRemotes.TakeWishEvent:FireServer(VAI[assetId])
            end
        end
    end
end

game.Workspace.DescendantAdded:Connect(searchModel)

game.Players.LocalPlayer.Idled:Connect(function()
    local VU = game:GetService("VirtualUser")
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)

local HRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
HRP.CFrame = CFrame.new(813, 48, -1391)

Notification = Instance.new("BindableFunction")
function Notification.OnInvoke(response)
    if response == "Execute" then     
loadstring(game:HttpGet('https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Elfautomail.lua'))()
    end
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Alwi Hub"; 
    Duration = math.huge;  
    Button1 = "Yes"; 
    Callback = Notification,
    Text = "Hey This scripts work one place! if no work serverhop"
})

task.wait(0.0777)

