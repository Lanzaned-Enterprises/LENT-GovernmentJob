QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("panicbutton" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local job = Player.Player.PlayerData.job
    if isAllowedPanic(job.name) then
        print("Panic Button")
        TriggerClientEvent("ps-dispatch:client:officerdown", source)
    end
end)

QBCore.Functions.CreateUseableItem("mdt" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local job = Player.PlayerData.job
    if not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] and not Player.PlayerData.metadata["ishandcuffed"] then
        if isAllowedMDT(job.name) then  
            TriggerClientEvent("LENT:POLICE:MDT", source)
        end
    end
end)

function isAllowedPanic(job)
    for k, v in pairs(Config.AllowedPanic) do
        if job == v then
            return true
        end
    end
    return false
end

function isAllowedMDT(job)
    for k, v in pairs(Config.AllowedMDT) do
        if job == v then
            return true
        end
    end
    return false
end
 