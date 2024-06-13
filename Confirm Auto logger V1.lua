local queueteleport = queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
if queueteleport then
    spawn(function()
        pcall(function()
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Imalwibest/Imalwibest/main/Auto%20executor%20logger.luaV1'))()")
        end)
    end)
end
