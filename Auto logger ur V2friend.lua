local queueteleport = queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if queueteleport then
    spawn(function()
        pcall(function()
            queueteleport("loadstring(game:HttpGet(''))()")
           loadstring(game:HttpGet(''))()
        end)
    end)
end
