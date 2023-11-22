local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("panicbutton" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local job = Player.PlayerData.job
    if isAllowedPanic(job.name) then
        if (IsAllowedPoliceJob(job.name)) then
            TriggerClientEvent("ps-dispatch:client:officerdown", source)
        elseif (IsAllowedAmbulanceJob(job.name)) then
            TriggerClientEvent("ps-dispatch:client:emsdown", source)
        end
    end
end)

QBCore.Functions.CreateUseableItem("mdt" , function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local job = Player.PlayerData.job
    if IsAllowedPoliceJob(job.name) or IsAllowedAmbulanceJob(job.name) then
        if not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] and not Player.PlayerData.metadata["ishandcuffed"] then
            TriggerClientEvent("LENT-GovernmentJob:Client:MDT", source)
        end
    end
end)

QBCore.Functions.CreateUseableItem(Config.GlobalSettings['HandCuffs'], function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player.Functions.GetItemByName(Config.GlobalSettings['HandCuffs']) then return end
    TriggerClientEvent("police:client:CuffPlayerSoft", src)
end)

QBCore.Functions.CreateUseableItem("moneybag", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName("moneybag") or not item.info or item.info == "" or Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] or Player.PlayerData.job.name == Config.Job['FireDepartment'] or Player.PlayerData.job.name == Config.Job['FederalBureau'] or Player.PlayerData.job.name == Config.Job['AffairsAgency'] or Player.PlayerData.job.name == Config.Job['Military'] or not Player.Functions.RemoveItem("moneybag", 1, item.slot) then return end
    Player.Functions.AddMoney("cash", tonumber(item.info.cash), "used-moneybag")
end)
