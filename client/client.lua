QBCore = exports['qb-core']:GetCoreObject()

-- [[ Functions ]] --
local function IsArmoryWhitelist()
    local retval = false

    if QBCore.Functions.GetPlayerData().job.name == 'police' then
        retval = true
    end
    return retval
end

-- [[ Ped Spawner Menu Call ]] --
RegisterNetEvent("LENT:TAKE:VEHICLE:POLICE", function()
    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    local AuthorizedVehicles = Config.AuthorizedVehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(AuthorizedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = label,
            params = {
                event = "LENT:POLICE:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                }
            }
        }
    end

    vehicleMenu[#vehicleMenu + 1] = {
        header = "Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }

    exports['qb-menu']:openMenu(vehicleMenu)
end)

-- [[ Base Resource Events ]] -- 
RegisterNetEvent("LENT:POLICE:MDT", function()
    TriggerServerEvent('mdt:server:openMDT')    
end)

RegisterNetEvent("LENT:POLICE:GRAB:VEHICLE", function(data)
    local veh = data.vehicle

    exports["qb-menu"]:openMenu({
        {
            header = Config.MenuName,
            icon = Config.Iconname,
            isMenuHeader = true,
        },
        {
            header = "Parking Lot #1",
            params = {
                event = "LENT:GRAB:POLICE:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(449.42, -1025.22, 28.58, 6.51),
                },
            },
        },
        {
            header = "Parking Lot #2",
            params = {
                event = "LENT:GRAB:POLICE:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(446.29, -1025.52, 28.64, 6.99),
                },
            },
        },
        {
            header = "Parking Lot #3",
            params = {
                event = "LENT:GRAB:POLICE:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(442.78, -1025.67, 28.71, 5.72),
                },
            },
        },
        {
            header = "Parking Lot #4",
            params = {
                event = "LENT:GRAB:POLICE:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(439.33, -1026.26, 28.77, 1.59),
                },
            },
        },
        {
            header = "Parking Lot #5",
            params = {
                event = "LENT:GRAB:POLICE:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(435.3, -1026.62, 28.85, 359.81),
                },
            },
        },
    })
end)

RegisterNetEvent("LENT:GRAB:POLICE:VEHICLE", function(data)
    local coords = data.coords
    local dataVehicle = data.vehicle

    local vehicleCode = dataVehicle
    
    if not IsModelInCdimage(vehicleCode) then 
        return 
    end
    
    RequestModel(vehicleCode)
    
    while not HasModelLoaded(vehicleCode) do
        Citizen.Wait(10)
    end

    local MyPed = PlayerPedId()
    local plate = Config.Plate

    local vehicle = CreateVehicle(vehicleCode, coords.x, coords.y, coords.z-1, coords.w, true, false) -- Spawns a networked vehicle on your current coords

    SetVehicleNumberPlateText(vehicle, plate)
    if Config.VehicleSettings[vehicle] ~= nil then
        if Config.VehicleSettings[vehicle].extras ~= nil then
			QBCore.Shared.SetDefaultVehicleExtras(vehicle, Config.VehicleSettings[vehicle].extras)
            -- SetVehicleExtra(vehicle, extraId, disable)
		end
		if Config.VehicleSettings[vehicle].livery ~= nil then
			SetVehicleLivery(veh, Config.VehicleSettings[vehicle].livery)
		end
    end
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleDirtLevel(vehicle, 0.0)

    exports['LegacyFuel']:SetFuel(vehicle, 100.0)

    SetModelAsNoLongerNeeded(vehicleCode) -- removes model from game memory as we no longer need it    
end)