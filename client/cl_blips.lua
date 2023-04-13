if Config.GlobalSettings['EnableStationBlips'] then
    local BlipSpawned = false
    local SpawnedBlips = {}

    local StationBlips = {
        ["prison"] = { ['blipName'] = "Boolingbrooke Penitentiary", ['blipId'] = 285, ['blipColor'] = 0, ['coords'] = vector3(1851.22, 2604.53, 45.63) },

        ['PaletoBaySheriff'] = { ['blipName'] = "Sheriff's Office", ['blipId'] = 60, ['blipColor'] = 28, ['coords'] = vector3(-439.19, 6020.69, 31.49) },
        ['SandyShoresSheriff'] = { ['blipName'] = "Sheriff's Office", ['blipId'] = 60, ['blipColor'] = 28, ['coords'] = vector3(1857.02, 3680.63, 33.96) },
        ['DavisSheriff'] = { ['blipName'] = "Sheriff's Office", ['blipId'] = 60, ['blipColor'] = 28, ['coords'] = vector3(395.53, -1599.63, 29.29) },
        ['GrapeseedSheriff'] = { ['blipName'] = "Sheriff's Office", ['blipId'] = 60, ['blipColor'] = 28, ['coords'] = vector3(1653.94, 4882.97, 42.16) },
        ['LaMesaHighway'] = { ['blipName'] = "Highway Station", ['blipId'] = 60, ['blipColor'] = 39, ['coords'] = vector3(818.04, -1290.06, 26.3) },
        ['MissionRowPD'] = { ['blipName'] = "Police Station", ['blipId'] = 60, ['blipColor'] = 29, ['coords'] = vector3(427.48, -981.43, 30.71) },
        ['VespucciPD'] = { ['blipName'] = "Police Station", ['blipId'] = 60, ['blipColor'] = 29, ['coords'] = vector3(640.48, 1.25, 82.79) },
        ['VineWoodPD'] = { ['blipName'] = "Police Station", ['blipId'] = 60, ['blipColor'] = 29, ['coords'] = vector3(-1095.11, -807.91, 19.3) },
        ['PoliceHQ'] = { ['blipName'] = "Police Headquarters", ['blipId'] = 60, ['blipColor'] = 29, ['coords'] = vector3(-557.25, -141.91, 38.43) },
        ['NOOSE'] = { ['blipName'] = "NOOSE Building", ['blipId'] = 60, ['blipColor'] = 3, ['coords'] = vector3(2518.42, -384.06, 93.14) },
        ['NOOSELSIA'] = { ['blipName'] = "NOOSE LSIA Building", ['blipId'] = 60, ['blipColor'] = 3, ['coords'] = vector3(-893.42, -2402.32, 14.02) },
        ['FIB'] = { ['blipName'] = "FIB Building", ['blipId'] = 210, ['blipColor'] = 63, ['coords'] = vector3(104.89, -744.65, 45.75) },
        ['IAA'] = { ['blipName'] = "IAA Building", ['blipId'] = 76, ['blipColor'] = 32, ['coords'] = vector3(103.46, -659.48, 45.09) },

        ['CentralLosSantos'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(317.92, -1376.92, 31.93) },
        ['PillboxHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(298.56, -584.59, 43.26) },
        ['MountZonah'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(-476.0, -358.65, 34.04) },
        ['StFiarceHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(1153.14, -1526.75, 34.84) },
        ['PortolaTrinityHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(-943.22, -338.84, 38.98) },
        ['EclipseMedicalTower'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(-677.28, 308.08, 83.08) },
        -- ['SandyShoresHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(1840.34, 3670.99, 34.07) },
        ['SandyShoresHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(1678.86, 3656.63, 35.35) },
        ['PaletoBayHospital'] = { ['blipName'] = "Hospital", ['blipId'] = 61, ['blipColor'] = 2, ['coords'] = vector3(-245.63, 6332.59, 32.49) },

        ['Morgue'] = { ['blipName'] = "Morgue", ['blipId'] = 525, ['blipColor'] = 2, ['coords'] = vector3(233.78, -1387.67, 30.55) },

        ['FireStation1'] = { ['blipName'] = "Fire Headquarters", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(-635.31, -121.7, 39.02) },
        -- ['FireStation2'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(1696.13, 3583.06, 35.58) },
        ['FireStation2'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(1790.7, 4592.0, 37.71) },
        ['FireStation3'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(-388.94, 6126.64, 31.48) },
        ['FireStation4'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(-2111.46, 2836.07, 32.81) },
        ['FireStation5'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(-1068.29, -2379.99, 14.04) },
        ['FireStation6'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(218.37, -1636.2, 29.32) },
        ['FireStation7'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(1183.31, -1461.65, 34.89) },
        ['FireStation8'] = { ['blipName'] = "Fire Station", ['blipId'] = 60, ['blipColor'] = 1, ['coords'] = vector3(-1175.27, -1773.64, 3.85) },
    }

    -- [[ When the resource stops delete all the peds ]] -- 
    AddEventHandler('onResourceStop', function(resourceName)
        if GetCurrentResourceName() == resourceName then
            removeBlip()
        end
    end)


    CreateThread(function()
        if not BlipSpawned then
            CreateBlips()
            BlipSpawned = true
        end
    end)

    function CreateBlips()
        for blip, _ in pairs(StationBlips) do
            local CreatedBlip = AddBlipForCoord(StationBlips[blip]["coords"]["x"], StationBlips[blip]["coords"]["y"], StationBlips[blip]["coords"]["z"])
            SetBlipSprite(CreatedBlip, StationBlips[blip]["blipId"])
            SetBlipDisplay(CreatedBlip, 2)
            SetBlipScale(CreatedBlip, 0.8)
            SetBlipColour(CreatedBlip, StationBlips[blip]["blipColor"])
            SetBlipAlpha(CreatedBlip, 256)
            SetBlipAsShortRange(CreatedBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(StationBlips[blip]["blipName"])
            EndTextCommandSetBlipName(CreatedBlip)
            table.insert(SpawnedBlips, CreatedBlip)
        end
    end

    function removeBlip()
        for i, CreatedBlip in pairs(SpawnedBlips) do
            RemoveBlip(CreatedBlip)
        end
    end
end