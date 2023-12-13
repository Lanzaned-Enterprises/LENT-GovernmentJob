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

-- QBCore.Functions.CreateUseableItem(Config.GlobalSettings['HandCuffs'], function(source)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     if not Player.Functions.GetItemByName(Config.GlobalSettings['HandCuffs']) then return end
--     if not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] and not Player.PlayerData.metadata["ishandcuffed"] then
--         if IsAllowedPoliceJob(Player.PlayerData.job.name) then
--             TriggerClientEvent('police:client:CuffPlayer', src)
--         else
--             TriggerClientEvent("police:client:CuffPlayerSoft", src)
--         end
--     end
-- end)

QBCore.Functions.CreateUseableItem("moneybag", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName("moneybag") or not item.info or item.info == "" or IsAllowedPoliceJob(Player.PlayerData.job.name) or not Player.Functions.RemoveItem("moneybag", 1, item.slot) then return end
    Player.Functions.AddMoney("cash", tonumber(item.info.cash), "used-moneybag")
end)


QBCore.Functions.CreateUseableItem("handcuffs", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName("handcuffs") then return end
    TriggerClientEvent('police:client:CuffPlayer', src, 'handcuffs')
end)

QBCore.Functions.CreateUseableItem("zipties", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName("zipties") then return end
    TriggerClientEvent('police:client:CuffPlayer', src, 'zipties')
end)


QBCore.Functions.CreateUseableItem(Config.CuffKeyItem , function(source, item)
    TriggerClientEvent("police:client:UnCuffPlayer", source, item.name, source)
end)

QBCore.Functions.CreateUseableItem(Config.CutTieItem , function(source, item)
    TriggerClientEvent("police:client:UnCuffPlayer", source, item.name, source)
end)

QBCore.Functions.CreateUseableItem(Config.CutCuffItem , function(source, item)
    TriggerClientEvent('police:client:useCuffCutter', source, item.name)
end)

QBCore.Functions.CreateUseableItem('leogps', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName('leogps') then return end
    if not Player.PlayerData.metadata["isdead"] and not Player.PlayerData.metadata["inlaststand"] and not Player.PlayerData.metadata["ishandcuffed"] then
        if IsAllowedPoliceJob(Player.PlayerData.job.name) or IsAllowedAmbulanceJob(Player.PlayerData.job.name) then
            TriggerClientEvent('police:client:UseGPS', src)
        end
    end
end)