local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/UI-th%20Library%20v0.1.2"))()
local window = Lib:CreateWindow("                             ALWI HUB | Tower Moster INF COINS!")
local tab = window:CreateTab("Main")
local w = window:CreateTab("Credit/info") 
tab:CreateToggle("Auto Spin",false,function(cuminsidemerylu) 
_G.ImLoveRylu = cuminsidemerylu
while _G.ImLoveRylu == true do
       spawn(function() 
            wait() 
game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ClaimDailySpin"):FireServer()
end) 
end
end) 


tab:CreateButton("Buy product Inf spina 💀💀💀💀", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/wynerdV2.lua",true))()
end) 


w:CreateButton("Console", function() 
    game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
end)
w:CreateButton("Join My discord", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Discord%20sex%20mom%20cum"))()
end) 

w:CreateButton("Click For credit", function()
game.StarterGui:SetCore("SendNotification", {
    Title = "Credit To Alwi";
    Text = "Enjoy Script?"; 
    Duration = 5;
})

end) 

game.StarterGui:SetCore("SendNotification", {
    Title = "♥️♥️♥️♥️";
    Text = "Thanks You for executor my script"; 
    Duration = 5;
})
