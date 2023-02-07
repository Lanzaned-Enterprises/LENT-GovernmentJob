-- [[ Ped Spawner Menu Call ]] --
RegisterNetEvent("LENT:TAKE:VEHICLE:SASP", function()
    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    local AuthorizedVehicles = Vehicles.AuthorizedVehiclesSASP[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(AuthorizedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = label,
            params = {
                event = "LENT:SASP:GRAB:VEHICLE",
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

RegisterNetEvent("LENT:SASP:GRAB:VEHICLE", function(data)
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
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1551.37, 807.68, 77.01, 188.91),
                },
            },
        },
        {
            header = "Parking Lot #2",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1553.42, 811.84, 77.06, 183.76),
                },
            },
        },
        {
            header = "Parking Lot #3",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1555.84, 817.3, 77.14, 187.66),
                },
            },
        },
        {
            header = "Parking Lot #4",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1558.49, 821.55, 77.14, 192.73),
                },
            },
        },
    })
end)

-- [[ Ped Spawner Menu Call ]] --
RegisterNetEvent("LENT:TAKE:VEHICLE:POLICE", function()
    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    local AuthorizedVehicles = Vehicles.AuthorizedVehiclesLSPD[QBCore.Functions.GetPlayerData().job.grade.level]
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
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(449.42, -1025.22, 28.58, 6.51),
                },
            },
        },
        {
            header = "Parking Lot #2",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(446.29, -1025.52, 28.64, 6.99),
                },
            },
        },
        {
            header = "Parking Lot #3",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(442.78, -1025.67, 28.71, 5.72),
                },
            },
        },
        {
            header = "Parking Lot #4",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(439.33, -1026.26, 28.77, 1.59),
                },
            },
        },
        {
            header = "Parking Lot #5",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(435.3, -1026.62, 28.85, 359.81),
                },
            },
        },
    })
end)

-- [[ Ped Spawner Menu Call ]] --
RegisterNetEvent("LENT-GovernmentJob:Client:BCSO:SelectVehicle", function()
    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    local AuthorizedVehicles = Vehicles.AuthorizedVehiclesBCSO[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(AuthorizedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = label,
            params = {
                event = "LENT-GovernmentJob:Client:BCSO:SelectParking",
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

RegisterNetEvent("LENT-GovernmentJob:Client:BCSO:SelectParking", function(data)
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
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1854.66, 3675.72, 33.73, 212.96),
                },
            },
        },
        {
            header = "Parking Lot #2",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1851.17, 3673.06, 33.74, 214.41),
                },
            },
        },
        {
            header = "Parking Lot #3",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(1847.68, 3671.89, 33.7, 214.54),
                },
            },
        },
    })
end)

RegisterNetEvent('LENT-GovernmentJob:Client:BCSO:Paleto:SelectVehicle', function()
    local vehicleMenu = {
        {
            header = Config.MenuName,
            icon = Config.IconName,
            isMenuHeader = true,
        }
    }

    local AuthorizedVehicles = Vehicles.AuthorizedVehiclesBCSO[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(AuthorizedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = label,
            params = {
                event = "LENT-GovernmentJob:Client:BCSO:Paleto:SelectParking",
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

RegisterNetEvent('LENT-GovernmentJob:Client:BCSO:Paleto:SelectParking', function(data)
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
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(-454.77, 6001.9, 31.34, 86.79),
                },
            },
        },
        {
            header = "Parking Lot #2",
            params = {
                event = "LENT:GRAB:VEHICLE",
                args = {
                    vehicle = veh,
                    coords = vector4(-451.52, 5998.22, 31.34, 89.13),
                },
            },
        },
    })
end)

RegisterNetEvent('LENT-GovernmentJob:Client:SpawnEMSVehicle:Grapeseed', function()
    local vehicleMenu = {
        {
            header = "Lieutenant - R. Green",
            icon = "fa-solid fa-truck-medical",
            isMenuHeader = true,
        }
    }

    local ChosenCoords = CoordsList.Coords["GrapeseedFD"]
    local SpawnCoords = (ChosenCoords[math.random(#ChosenCoords)])

    local AuthorizedVehicles = Vehicles.AuthorizedVehiclesSAFD[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(AuthorizedVehicles) do
        vehicleMenu[#vehicleMenu + 1] = {
            header = label,
            params = {
                event = "LENT-GovernmentJob:Function:SpawnEMSVehicle",
                args = {
                    vehicle = veh,
                    coords = SpawnCoords
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

    exports['LENT-Menu']:openMenu(vehicleMenu)
end)


-- [[ Vehicle Data ]] --
RegisterNetEvent("LENT:GRAB:VEHICLE", function(data)
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
end)

-- [[ Parking Thread ]] --
CreateThread(function()
    while true do
        Wait(0)
        for k, v in pairs(Config.ParkingLocations) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local vehicleClass = GetVehicleClass(vehicle)
		    local VehicleDistance = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)

            if VehicleDistance <= 5.0 and vehicleClass == 18 then
                exports['qb-core']:DrawText('[E] - Park vehicle', 'right')
                if IsControlJustReleased(0, 51) then
                    if vehicleClass == 18 then
                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                        exports['qb-core']:HideText()
                    end
                end
            end
        end
    end
end)