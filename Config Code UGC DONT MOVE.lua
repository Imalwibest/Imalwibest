game.StarterGui:SetCore("SendNotification", {
        Title = "NOTIVE!";
        Text = "All code Sucess Redeem all Please wait!";
        Duration = 5;
    })


local codes = {
    "JessizadaForCodesOf1m", 
    "IloveYoucode", 
    "CodesForYous2", 
    "novosugcschegando", 
    "LowPoints", 
    "HoodDarkness", 
    "codeinvideo",
    "RedLongHair", 
    "CinnamorollHat", 
    "BowandBunnyEars",
    "HappyEaster",
    "WinkingFace",
    "EarterBunnyHair",
    "BlackBunnyHair",
    "BunnyBackpack",
    "CosmicSet",
    "BunnyHair",
    "EasterItems",
    "DontMove",
    "CatHat",
    "CatBackpack",
    "CandyHair",
    "ILOVEHAIRS",
    "PinkFace",
    "FreeHairs",
    "CuteFacewithBlush",
    "BlackHairPoints",
    "CosmicHalo",
    "BellionDominus",
    "PinkBag",
    "SpikeHeart",
    "NEWHAIRNOW",
    "SakuraSword",
    "ChocolateHair",
    "600K GROUP!",
    "ALWAYS AFKING!",
    "MAGMA DOMINUS",
    "VERIFIED SET!",
    "DOMINUS",
    "SHININGHAIRS",
    "SNOOPYS UGC",
    "MORE CODES!",
    "POTION SET!",
    "NOBODY MOVE!",
    "50K POINTS!",
    "TROLL",
    "PurpleThornDominus",
    "DarkThornDominus",
    "DarkThornHelm",
    "300kforyou",
    "FreeNow",
    "FrogBackpack",
    "MadrugadaRoblox",
    "StrawberryFace",
    "PandaBag",
    "ThornDominus300K", 
    "SaturdayPoints", 
    "DarkPink", 
    "Bigcode", 
    "Newcodeforyouty"
}

local function claimCode(code)
    local args = {code}
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CodesService"):WaitForChild("RE"):WaitForChild("Claim"):FireServer(unpack(args))
end

for _, code in ipairs(codes) do
    claimCode(code)
    wait(1) 
end
