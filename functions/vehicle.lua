RegisterNetEvent('LENT-GovernmentJob:Function:SpawnEMSVehicle', function(data)
    local veh = data.vehicle
    local coords = data.coords

    local vehicleCode = veh
    
    if not IsModelInCdimage(vehicleCode) then 
        return 
    end
    
    RequestModel(vehicleCode)
    
    while not HasModelLoaded(vehicleCode) do
        Wait(10)
    end

    local vehicle = CreateVehicle(vehicleCode, coords.x, coords.y, coords.z-1, coords.w, true, false) -- Spawns a networked vehicle on your current coords

    if Vehicle.VehicleSettings[vehicleCode] ~= nil then
        if Vehicle.VehicleSettings[vehicleCode].extras ~= nil then
            QBCore.Shared.SetDefaultVehicleExtras(vehicle, Vehicle.VehicleSettings[vehicleCode].extras)
        end
        if Vehicle.VehicleSettings[vehicleCode].livery ~= nil then
            SetVehicleLivery(vehicle, Vehicle.VehicleSettings[vehicleCode].livery)
        end
    end

    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleDirtLevel(vehicle, 0.0)

    exports['cdn-fuel']:SetFuel(vehicle, 100.0)

    SetModelAsNoLongerNeeded(vehicleCode) -- removes model from game memory as we no longer need it
end)