local args = {
    [1] = {
        ["UNCOMMON"] = {
            [1] = "DOG"
        },
        ["PercentType"] = "Portal",
        ["Price"] = -10000000000,
        ["MYTHICAL"] = {
            [1] = "COW"
        },
        ["GUI"] = "Portal",
        ["COMMON"] = {
            [1] = "CAT"
        },
        ["RandomEggPart"] = workspace.Portal.Portal.HumanoidRootPart,
        ["EPIC"] = {
            [1] = "AXOLOTL"
        },
        ["VisibleAt"] = 25,
        ["RARE"] = {
            [1] = "CAPYBARA"
        },
        ["LEGENDARY"] = {
            [1] = "TURTLE"
        }
    },
    [2] = 1
}

game:GetService("ReplicatedStorage").Events.PetEvents.HatchEgg:InvokeServer(unpack(args))

game.StarterGui:SetCore("SendNotification", {
    Title = "Alwi hub | Donate Mania";
    Text = "Thank You for executor My script"; 
    Duration = 20;
})


