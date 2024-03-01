local RunService = game:GetService("RunService")
local players = game:GetService("Players")
local plr = players.LocalPlayer
local AntiFlingFunction = nil

AntiFlingFunction = RunService.Stepped:Connect(function()
	for i,p in pairs(players:GetPlayers()) do
		task.spawn(function()
			if p ~= plr and p.Character then
				for i,v in pairs(p.Character:GetChildren()) do
					pcall(function()
						if v:IsA("BasePart") then
							v.CanCollide = false
							v.Velocity = Vector3.new(0,0,0)
							v.RotVelocity = Vector3.new(0,0,0)
							v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
							v.Massless = true
						elseif v:IsA("Accessory") then
							v.Handle.CanCollide = false
							v.Handle.Velocity = Vector3.new(0,0,0)
							v.RotVelocity = Vector3.new(0,0,0)
							v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
							v.Massless = true
						end
					end)
				end
			end
		end)
	end
end)

repeat task.wait() until _G.AntiFlingToggled == false
AntiFlingFunction:Disconnect()
