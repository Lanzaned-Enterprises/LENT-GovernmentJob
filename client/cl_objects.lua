-- Variables
local ObjectList = {}
local spikemodel = `P_ld_stinger_s`
local ClosestSpike = nil

-- Functions
local function GetClosestPoliceObject()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil

    for id, _ in pairs(ObjectList) do
        local dist2 = #(pos - ObjectList[id].coords)
        if current then
            if dist2 < dist then
                current = id
                dist = dist2
            end
        else
            dist = dist2
            current = id
        end
    end
    return current, dist
end

function GetClosestSpike()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil

    for id, _ in pairs(SpawnedSpikes) do
        if current then
            if #(pos - vector3(SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z)) < dist then
                current = id
            end
        else
            dist = #(pos - vector3(SpawnedSpikes[id].coords.x, SpawnedSpikes[id].coords.y, SpawnedSpikes[id].coords.z))
            current = id
        end
    end
    ClosestSpike = current
end

local function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events
RegisterNetEvent('police:client:spawnCone', function()
    QBCore.Functions.Progressbar("spawn_object", Lang:t("progressbar.place_object"), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "cone")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:spawnBarrier', function()
    QBCore.Functions.Progressbar("spawn_object", Lang:t("progressbar.place_object"), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "barrier")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:spawnRoadSign', function()
    QBCore.Functions.Progressbar("spawn_object", Lang:t("progressbar.place_object"), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "roadsign")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:spawnTent', function()
    QBCore.Functions.Progressbar("spawn_object", Lang:t("progressbar.place_object"), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "tent")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:spawnLight', function()
    QBCore.Functions.Progressbar("spawn_object", Lang:t("progressbar.place_object"), 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@narcotics@trash",
        anim = "drop_front",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        TriggerServerEvent("police:server:spawnObject", "light")
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "anim@narcotics@trash", "drop_front", 1.0)
        QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
    end)
end)

RegisterNetEvent('police:client:deleteObject', function()
    local objectId, dist = GetClosestPoliceObject()
    if dist < 5.0 then
        QBCore.Functions.Progressbar("remove_object", Lang:t('progressbar.remove_object'), 2500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
            anim = "plant_floor",
            flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
            TriggerServerEvent("police:server:deleteObject", objectId)
        end, function() -- Cancel
            StopAnimTask(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@thermal_charge@", "plant_floor", 1.0)
            QBCore.Functions.Notify(Lang:t("error.canceled"), "error")
        end)
    end
end)

RegisterNetEvent('police:client:removeObject', function(objectId)
    NetworkRequestControlOfEntity(ObjectList[objectId].object)
    DeleteObject(ObjectList[objectId].object)
    ObjectList[objectId] = nil
end)

RegisterNetEvent('police:client:spawnObject', function(objectId, type, player)
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
    local heading = GetEntityHeading(GetPlayerPed(GetPlayerFromServerId(player)))
    local forward = GetEntityForwardVector(PlayerPedId())
    local x, y, z = table.unpack(coords + forward * 0.5)
    local spawnedObj = CreateObject(Config.Objects[type].model, x, y, z, true, false, false)
    PlaceObjectOnGroundProperly(spawnedObj)
    SetEntityHeading(spawnedObj, heading)
    FreezeEntityPosition(spawnedObj, Config.Objects[type].freeze)
    SetEntityInvincible(spawnedObj, true)
    ObjectList[objectId] = {
        id = objectId,
        object = spawnedObj,
        coords = vector3(x, y, z - 0.3),
    }
end)

local hasCreatedSpeedZone = false
RegisterNetEvent('LENT-GovernmentJob:Client:Radial:CreateSpeedZone', function()
    if not hasCreatedSpeedZone then
        Zone = AddSpeedZoneForCoord(GetEntityCoords(PlayerPedId()), Config.GlobalSettings['MaxZoneSize'], 0.0, false)
        Area = AddBlipForRadius(GetEntityCoords(PlayerPedId()), Config.GlobalSettings['MaxZoneSize'])
        SetBlipAlpha(Area, 100)
        QBCore.Functions.Notify('You have succesfully stopped traffic!', 'success', 2500)
        hasCreatedSpeedZone = true
    elseif hasCreatedSpeedZone then
        RemoveSpeedZone(Zone)
        RemoveBlip(Area)
        Zone = nil
        QBCore.Functions.Notify('You have allowed traffic to flow!', 'success', 2500)
    end
end)

RegisterNetEvent('LENT-GovernmentJob:Client:CreateSpeedZone', function(ZoneSize)
    if not hasCreatedSpeedZone then
        Zone = AddSpeedZoneForCoord(GetEntityCoords(PlayerPedId()), ZoneSize, 0.0, false)
        Area = AddBlipForRadius(GetEntityCoords(PlayerPedId()), ZoneSize)
        SetBlipAlpha(Area, 100)
        QBCore.Functions.Notify('You have succesfully stopped traffic!', 'success', 2500)
        hasCreatedSpeedZone = true
    elseif hasCreatedSpeedZone then
        RemoveSpeedZone(Zone)
        RemoveBlip(Area)
        Zone = nil
        QBCore.Functions.Notify('You have allowed traffic to flow!', 'success', 2500)
    end
end)

--Spike Strip Spawn Event
local SpawnedSpikes = {}
local hasPlacedSpikes = false
RegisterNetEvent('LENT-GovernmentJob:Client:SpawnSpikeStrips', function()
    if not hasPlacedSpikes then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            QBCore.Functions.Notify('Can\'t set spikes while in a vehicle!', 'error')
            return
        end

        local SpawnCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()) , 0.0, 2.0, 0.0)

        for a = 1, Config.GlobalSettings['MaxSpikes'] do
            local Spike = CreateObject(GetHashKey('P_ld_stinger_s'), SpawnCoords.x, SpawnCoords.y, SpawnCoords.z, 1, 1, 1)
            local NetID = NetworkGetNetworkIdFromEntity(Spike)

            SetNetworkIdExistsOnAllMachines(NetID, true)
            SetNetworkIdCanMigrate(NetID, false)
            SetEntityHeading(Spike, GetEntityHeading(GetPlayerPed(PlayerId()) ))
            PlaceObjectOnGroundProperly(Spike)
            FreezeEntityPosition(Spike, true)

            SpawnCoords = GetOffsetFromEntityInWorldCoords(Spike, 0.0, 4.0, 0.0)

            table.insert(SpawnedSpikes, NetID)
        end
        
        hasPlacedSpikes = true
    else
        return
    end
end)

RegisterNetEvent('police:client:SpawnSpikeStrip', function(length)
    if not hasPlacedSpikes then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            QBCore.Functions.Notify('Can\'t set spikes while in a vehicle!', 'error')
            return
        end

        local SpawnCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()) , 0.0, 2.0, 0.0)

        for a = 1, length do
            local Spike = CreateObject(GetHashKey('P_ld_stinger_s'), SpawnCoords.x, SpawnCoords.y, SpawnCoords.z, 1, 1, 1)
            local NetID = NetworkGetNetworkIdFromEntity(Spike)

            SetNetworkIdExistsOnAllMachines(NetID, true)
            SetNetworkIdCanMigrate(NetID, false)
            SetEntityHeading(Spike, GetEntityHeading(GetPlayerPed(PlayerId()) ))
            PlaceObjectOnGroundProperly(Spike)
            FreezeEntityPosition(Spike, true)

            SpawnCoords = GetOffsetFromEntityInWorldCoords(Spike, 0.0, 4.0, 0.0)

            table.insert(SpawnedSpikes, NetID)
        end
        
        hasPlacedSpikes = true
    else
        return
    end
end)

--Spike Strip Delete Event
RegisterNetEvent("LENT-GovernmentJob:Client:RemoveSpikes", function()
    for a = 1, #SpawnedSpikes do
        local Spike = NetworkGetEntityFromNetworkId(SpawnedSpikes[a])
        DeleteEntity(Spike)
    end
    QBCore.Functions.Notify('Spikes Strips Removed!', 'success')
    SpawnedSpikes = {}
    hasPlacedSpikes = false
end)

--Spike Strip Tire Popping
CreateThread(function()
    while true do
        Wait(25)

        if IsPedInAnyVehicle(PlayerPedId() , false) then
            local Vehicle = GetVehiclePedIsIn(PlayerPedId() , false)

            if GetPedInVehicleSeat(Vehicle, -1) == PlayerPedId()  then
                local VehiclePos = GetEntityCoords(Vehicle, false)
                local Spike = GetClosestObjectOfType(VehiclePos.x, VehiclePos.y, VehiclePos.z, 2.0, GetHashKey('P_ld_stinger_s'), 1, 1, 1)

                if Spike ~= 0 then
                    local Tires = {
                        {bone = 'wheel_lf', index = 0},
                        {bone = 'wheel_rf', index = 1},
                        {bone = 'wheel_lm', index = 2},
                        {bone = 'wheel_rm', index = 3},
                        {bone = 'wheel_lr', index = 4},
                        {bone = 'wheel_rr', index = 5}
                    }
        
                    for a = 1, #Tires do
                        local TirePos = GetWorldPositionOfEntityBone(Vehicle, GetEntityBoneIndexByName(Vehicle, Tires[a].bone))
                        local Spike = GetClosestObjectOfType(TirePos.x, TirePos.y, TirePos.z, 2.0, GetHashKey('P_ld_stinger_s'), 1, 1, 1)
                        local SpikePos = GetEntityCoords(Spike, false)
                        local Distance = Vdist(TirePos.x, TirePos.y, TirePos.z, SpikePos.x, SpikePos.y, SpikePos.z)
            
                        if Distance < 1.8 then
                            if not IsVehicleTyreBurst(Vehicle, Tires[a].index, true) or IsVehicleTyreBurst(Vehicle, Tires[a].index, false) then
                                SetVehicleTyreBurst(Vehicle, Tires[a].index, false, 1000.0)
                            end
                        end
                    end
                end
            end
        end
    end
end)