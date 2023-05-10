local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("panicbutton" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local job = Player.PlayerData.job
    if isAllowedPanic(job.name) then
        if (job.name == Config.Job['DOJ'] or job.name == Config.Job['StatePolice'] or job.name == Config.Job['Police'] or job.name == Config.Job['Sheriff'] or job.name == Config.Job['Corrections'] or job.name == Config.Job['FederalBureau'] or job.name == Config.Job['AffairsAgency'] or job.name == Config.Job['Military']) then
            TriggerClientEvent("ps-dispatch:client:officerdown", source)
        elseif (job.name == Config.Job['FireDepartment']) then
            TriggerClientEvent("ps-dispatch:client:emsdown", source)
        end
    end
end)

QBCore.Functions.CreateUseableItem("mdt" , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local job = Player.PlayerData.job
    if isAllowedMDT(job.name) then
        -- if job.name == Config.Job['DOJ'] or job.name == Config.Job['StatePolice'] or job.name == Config.Job['Police'] or job.name == Config.Job['Sheriff'] or job.name == Config.Job['Corrections'] or job.name == Config.Job['FederalBureau'] or job.name == Config.Job['AffairsAgency'] or job.name == Config.Job['Military'] then
            if not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] and not Player.PlayerData.metadata["ishandcuffed"] then
                TriggerClientEvent("LENT-GovernmentJob:Client:MDT", source)
            end
        -- end
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