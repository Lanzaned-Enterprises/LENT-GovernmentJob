-- [[ QBCore ]]
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Events ]] --
RegisterNetEvent('LENT-GovernmentJob:Server:UpdatePlate', function(netID, oldPlate, newPlate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local veh = NetworkGetEntityFromNetworkId(netID)
    
    SetVehicleNumberPlateText(veh, newPlate)
    Wait(1000)
    TriggerClientEvent('LENT-GovernmentJob:Client:SetKeys', src)
    TriggerClientEvent('QBCore:Notify', src , "New license plate: " ..newPlate, 'success')
end)