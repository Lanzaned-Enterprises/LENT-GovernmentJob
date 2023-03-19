-- [[ QBCore Function ]] --
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Events ]] --
RegisterNetEvent('LENT-GovernmentJob:Client:SelectVehicle', function()
    local Job = QBCore.Functions.GetPlayerData().job.name
    local CurrentGarage = 0
    local pos = GetEntityCoords(PlayerPedId())

    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    for k, v in pairs(CoordsList.Coords[QBCore.Functions.GetPlayerData().job.name]) do
        if #(pos - v) < 5 then
            CurrentGarage = k
        end
    end 

    if Job == Config.Job["DOJ"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['doj'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['doj'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesDOJ[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    elseif Job == Config.Job["StatePolice"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['sasp'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['sasp'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesSASP[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    elseif Job == Config.Job["Police"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['police'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['police'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesLSPD[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    elseif Job == Config.Job["Sheriff"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['bcso'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['bcso'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesBCSO[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    elseif Job == Config.Job["Corrections"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['doc'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['doc'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesDOC[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    elseif Job == Config.Job["FireDepartment"] then
        local CurrentGarage = CurrentGarage
        local pos = GetEntityCoords(PlayerPedId())
        local takeLoc = CoordsList.Coords['safd'][CurrentGarage]

        if not takeLoc then return end

        if #(pos - takeLoc) <= 10.0 then
            local ChooseRandomCoord = CoordsList.RandomSpawns['safd'][CurrentGarage]
            local RandomizedCoord = (ChooseRandomCoord[math.random(#ChooseRandomCoord)])

            local AuthorizedVehicles = Vehicles.AuthorizedVehiclesSAFD[QBCore.Functions.GetPlayerData().job.grade.level]
            for veh, label in pairs(AuthorizedVehicles) do
                vehicleMenu[#vehicleMenu + 1] = {
                    header = label,
                    params = {
                        event = "LENT-GovernmentJob:Client:SpawnSelectedVehicle",
                        args = {
                            vehicle = veh,
                            coords = RandomizedCoord
                        }
                    }
                }
            end
        end
    end

    vehicleMenu[#vehicleMenu + 1] = {
        header = "Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }

    exports['LENT-Menu']:openMenu(vehicleMenu)
end)

-- [ Spawn Vehicle Event ]
RegisterNetEvent("LENT-GovernmentJob:Client:SpawnSelectedVehicle", function(data)
    local coords = data.coords
    local dataVehicle = data.vehicle

    local vehicleCode = dataVehicle
    
    if not IsModelInCdimage(vehicleCode) then 
        return 
    end
    
    RequestModel(vehicleCode)
    
    while not HasModelLoaded(vehicleCode) do
        Wait(10)
    end

    local MyPed = PlayerPedId()
    local plate = Config.Plate

    local vehicle = CreateVehicle(vehicleCode, coords.x, coords.y, coords.z-1, coords.w, true, false) -- Spawns a networked vehicle on your current coords

    SetVehicleNumberPlateText(vehicle, plate)

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

    Wait(500)

    TriggerEvent("LENT-GovernmentJob:Client:SetPatrolPlate")
end)

RegisterNetEvent('LENT-GovernmentJob:Client:StoreVehicle', function()
    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local vehicleClass = GetVehicleClass(vehicle)

    for k, v in pairs(Config.ParkingLocations) do
        if #(plyCoords - v["Coords"]) <= 10.0 then
            if vehicleClass == 18 then
                QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
            end
        end
    end
end)

RegisterNetEvent('LENT-GovernmentJob:Client:SetPatrolPlate', function()
    local nearByVehicle = lib.getNearbyVehicles(GetEntityCoords(PlayerPedId()), 0.3, true)
    
    if nearByVehicle[1] then 
        local vehicle = nearByVehicle[1].vehicle
        local oldPlate = GetVehicleNumberPlateText(vehicle):gsub('[%p%c%s]', '')
        local plateChangerInput = lib.inputDialog("UPD Plate Changer", {
            {
                type = 'input', 
                label = "Plate", 
                description = "min 3, max 8 characters", 
                icon = {
                    'fa', 
                    'clapperboard'
                }
            }
        })
        if not plateChangerInput then return end
        
        local newPlate = string.upper(plateChangerInput[1]:gsub('[%p%c%s]', ''))
        
        if #newPlate >= 3 and #newPlate <= 8 then 
            TriggerServerEvent('LENT-GovernmentJob:Server:UpdatePlate', NetworkGetNetworkIdFromEntity(vehicle), oldPlate, newPlate)
        else
            lib.notify({title = "Max 8 Min 3 characters", type = 'error'})
        end
    else
        lib.notify({title = "Sit in the driver\'s seat of the car", type = 'error'})
    end
end)

RegisterNetEvent("LENT-GovernmentJob:Client:SetKeys", function()
    local nearByVehicle = lib.getNearbyVehicles(GetEntityCoords(PlayerPedId()), 0.3, true)

    if nearByVehicle[1] then
        local vehicle = nearByVehicle[1].vehicle
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    end
end)