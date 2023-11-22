QBCore = exports['qb-core']:GetCoreObject()

-- [[ Start of Config ]] --
Config = {}
Config.ArmoryWhitelist = {}
Config.WhitelistedVehicles = {}
-- [[ ^^ Do not edit unless you know what you're doing ^^ ]] --

Config.GlobalSettings = {
    ['MenuName'] = "LENT-GovernmentJob",
    ['MenuIcon'] = "fa-solid fa-car",
    ['EnableStationBlips'] = true,
    ['Fuel'] = "cdn-fuel",
    ['MaxSpikes'] = 5,
    ['HandCuffs'] = "handcuffs",
    ['LicenseRank'] = 4,
    ['MaxZoneSize'] = 30.0,
    ['Phone'] = 'qb', -- WIP
    ['Evidence'] = 'r14', -- default, r14
    ['MenuExport'] = 'qb-menu', -- qb
}

Config.Job = {
    ['Military'] = "military",
    ['FederalBureau'] = "fib",
    ['AffairsAgency'] = "iaa",
    ['DOJ'] = "upd",
    ['StatePolice'] = "sasp",
    ['Police'] = "police",
    ['Sheriff'] = "bcso",
    ['Corrections'] = "doc",
    ['FireDepartment'] = "ambulance",
}

Config.UnitblipSettings = {
    ["VehicleBlipSize"] = 1.2,
    ["DOJColor"] = 7,
    ["SASPColor"] = 40,
    ["LSPDColor"] = 38,
    ["BCSOColor"] = 47,
    ["DOCColor"] = 52,
    ["SAFDColor"] = 6,
    
    ["FIBColor"] = 67,
    ["IAAColor"] = 67,
    ["MilitaryColor"] = 81,

    ["FallBackBlip"] = 8,
}

Config.PoliceJobs = { 'military', 'fib', 'iaa', 'upd', 'sasp', 'police', 'bcso', 'doc' }
Config.AmbulanceJobs = { 'ambulance' }

-- [[ Objects ]] --
Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = true},
    ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

-- [[ Helicopter ]]
Config.Helicopters = {
    `b412`,
    `as365`,
    `as350`,
    `polmav`,
}

-- [[ Parking Locations ]] --
Config.ParkingLocations = {
    [700] = { ["Coords"] = vector3(1879.26, 3689.9, 33.54) }, -- Sandy Shores
    [701] = { ["Coords"] = vector3(1882.09, 3691.66, 33.54) }, -- Sandy Shores
    [702] = { ["Coords"] = vector3(1874.55, 3705.64, 33.55) }, -- Sandy Shores
    [703] = { ["Coords"] = vector3(1871.44, 3703.76, 33.54) }, -- Sandy Shores
    [704] = { ["Coords"] = vector3(1877.75, 3707.19, 33.55) }, -- Sandy Shores
    -- LSPD
    [600] = { ["Coords"] = vector3(426.11, -976.57, 25.73) }, -- MRPD
    [601] = { ["Coords"] = vector3(426.24, -979.28, 25.73) }, -- MRPD
    [602] = { ["Coords"] = vector3(426.32, -982.14, 25.73) }, -- MRPD
    [603] = { ["Coords"] = vector3(426.41, -984.99, 25.73) }, -- MRPD
    [604] = { ["Coords"] = vector3(426.41, -987.78, 25.73) }, -- MRPD
    [605] = { ["Coords"] = vector3(425.98, -990.73, 25.73) }, -- MRPD
    -- Davis
    [706] = { ["Coords"] = vector3(356.17, -1584.98, 29.29) }, -- Davis Sheriff
    [707] = { ["Coords"] = vector3(357.83, -1582.9, 29.29) }, -- Davis Sheriff
    [705] = { ["Coords"] = vector3(359.97, -1580.72, 29.29) }, -- Davis Sheriff
}

-- [[ Locations ]] --
Config.Locations = {
    ["impound"] = {
        [1] = vector3(455.96, -1017.17, 28.4), -- Sandy Shores
        [2] = vector3(-436.14, 5982.63, 31.34), -- Davis
    },
    ["evidence"] = {
        [100] = vector3(814.09, -1298.38, 19.85), -- La Messa

        [600] = vector3(473.4, -1006.11, 34.22), ---Mission Row
        [601] = vector3(-1628.3, -1026.84, 13.16), -- Dell Perro

        [700] = vector3(1828.35, 3659.84, 30.31), -- Sandy Shores
        [701] = vector3(1857.18, 3690.29, 29.82), -- Sandy Shores
        [702] = vector3(1824.21, 3659.03, 30.31), -- Sandy Shores
        [703] = vector3(1823.17, 3663.37, 30.31), -- Sandy Shores
        [704] = vector3(379.21, -1597.37, 25.36), -- Davis Sheriff
        [705] = vector3(375.38, -1594.19, 25.36), -- Davis Sheriff
        [706] = vector3(373.74, -1597.06, 25.36), -- Davis Sheriff
        [707] = vector3(376.58, -1598.19, 25.36), -- Davis Sheriff

        [800] = vector3(1651.31, 4880.92, 45.52), -- Grapeseed

        [900] = vector3(1547.74, 827.49, 82.13), -- San Andreas Highway Patrol

        [1000] = vector3(387.32, 798.88, 187.46), -- FIB Sub Station
    },
}

-- [[ Armory ]] --
Config.Armory = {
    ['military'] = {
        label = "Military Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [2] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 2,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [3] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [4] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [5] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [6] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [7] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [10] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_GLOCK19GEN4_FLSH_01", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 10,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [11] = {
                name = "weapon_m110",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
    
                    }
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [12] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 12,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [13] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 13,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [14] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 14,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [15] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 15,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [16] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [17] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades =  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [18] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [19] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [20] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 20,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26}
            },
            [21] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['fib'] = {
        label = "Federal Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 150,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "ifaks",
                amount = 200,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [12] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        { component = "COMPONENT_GLOCK19GEN4_CLIP_02", label = "Extended Magazine" },
                        { component = "COMPONENT_GLOCK19GEN4_FLSH_01", label = "Flashlight" },
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_m110",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                    },
                },
                type = "weapon",
                slot = 13,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 14,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 15,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [18] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "dnatestkit",
                amount = 5,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "drugtestkit",
                amount = 5,
                price = 0,
                info = {},
                type = "item",
                slot = 20,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['iaa'] = {
        label = "Affairs Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 150,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "ifaks",
                amount = 200,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [12] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        { component = "COMPONENT_GLOCK19GEN4_CLIP_02", label = "Extended Magazine" },
                        { component = "COMPONENT_GLOCK19GEN4_FLSH_01", label = "Flashlight" },
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_m110",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                    },
                },
                type = "weapon",
                slot = 13,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 14,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 15,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [18] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "dnatestkit",
                amount = 5,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "drugtestkit",
                amount = 5,
                price = 0,
                info = {},
                type = "item",
                slot = 20,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['upd'] = {
        label = "San Andreas Unified Law Enforcement Agency",
        slots = 100,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [29] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_ar15",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "weapon_remington",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "weapon_mk14",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM", label = "Scope"},
                        {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    }
                },
                type = "weapon",
                slot = 15,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "12guage_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 29,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [26] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [27] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 26,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [28] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 27,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [30] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 30,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        },
    },
    ['sasp'] = {
        label = "State Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [29] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_m110",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        { component = "COMPONENT_SCAR_BODY_02", label = "Black Frame" },
                        { component = "COMPONENT_SCAR_CLIP_03", label = "Black Clip" },
                    }
                },
                type = "weapon",
                slot = 13,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "weapon_remington",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "weapon_mk14",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM", label = "Scope"},
                        {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    }
                },
                type = "weapon",
                slot = 15,
                authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "12guage_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 29,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [26] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [27] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 26,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [28] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 27,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [30] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 30,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['police'] = {
        label = "Police Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [29] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_ar15",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "weapon_remington",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "weapon_mk14",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM", label = "Scope"},
                        {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    }
                },
                type = "weapon",
                slot = 15,
                authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "12guage_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 29,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [26] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [27] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 26,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [28] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 27,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [30] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 30,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['bcso'] = {
        label = "Sheriff's Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [29] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_ar15",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "weapon_remington",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "weapon_mk14",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM", label = "Scope"},
                        {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    }
                },
                type = "weapon",
                slot = 15,
                authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "12guage_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 29,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [26] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [27] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 26,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [28] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 27,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [30] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 30,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['doc'] = {
        label = "Corrections Armory",
        slots = 30,
        items = {
            [1] = {
                name = "weapon_nightstick",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 1,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [2] = {
                name = "weapon_flashlight",
                amount = 1,
                price = 0,
                info = {},
                type = "weapon",
                slot = 2,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [3] = {
                name = "handcuffs",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [4] = {
                name = "empty_evidence_bag",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [5] = {
                name = "radio",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [6] = {
                name = "mdt",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [7] = {
                name = "panicbutton",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [29] = {
                name = "ifaks",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [8] = {
                name = "heavyarmor",
                amount = 10,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [10] = {
                name = "weapon_stungun",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                },
                type = "weapon",
                slot = 11,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [11] = {
                name = "weapon_glock19gen4",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 12,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [13] = {
                name = "weapon_ar15",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [14] = {
                name = "weapon_remington",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    }
                },
                type = "weapon",
                slot = 14,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [15] = {
                name = "weapon_mk14",
                amount = 1,
                price = 0,
                info = {
                    serie = "",
                    attachments = {
                        {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                        {component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM", label = "Scope"},
                        {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    }
                },
                type = "weapon",
                slot = 15,
                authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [16] = {
                name = "taserammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [17] = {
                name = "9mm_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [19] = {
                name = "556_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 18,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [20] = {
                name = "12guage_ammo",
                amount = 50,
                price = 0,
                info = {},
                type = "item",
                slot = 19,
                authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [21] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 29,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [22] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 21,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [23] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 22,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [24] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 23,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [25] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 24,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [26] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 25,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [27] = {
                name = "fingerprintreader",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 26,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [28] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 27,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
            [30] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 30,
                authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
            },
        }
    },
    ['ambulance'] = {
        label = "Fire Department Lockers",
        slots = 30,
        items = {
            [1] = {
                name = "mdt",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 1,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [2] = {
                name = "panicbutton",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 2,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [3] = {
                name = "radio",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 3,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [4] = {
                name = "bandage",
                price = 0,
                amount = 50,
                info = {},
                type = "item",
                slot = 4,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [5] = {
                name = "painkillers",
                price = 0,
                amount = 50,
                info = {},
                type = "item",
                slot = 5,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [6] = {
                name = "firstaid",
                price = 0,
                amount = 50,
                info = {},
                type = "item",
                slot = 6,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [7] = {
                name = "weapon_flashlight",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 7,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [8] = {
                name = "weapon_fireextinguisher",
                price = 0,
                amount = 1,
                info = {},
                type = "item",
                slot = 8,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [9] = {
                name = "badge",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 9,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [10] = {
                name = "nikon",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 10,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [11] = {
                name = "gsrtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 11,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [12] = {
                name = "dnatestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 12,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [13] = {
                name = "drugtestkit",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 13,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [14] = {
                name = "breathalyzer",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 14,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [15] = {
                name = "accesstool",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 15,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [16] = {
                name = "sdcard",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 16,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
            [17] = {
                name = "bodycam",
                amount = 1,
                price = 0,
                info = {},
                type = "item",
                slot = 17,
                authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 }
            },
        }
    },
}


-- [[ Ammo Labels ]] --
Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_PISTOL_FMJ"] = "Rare Bullet...? Investigate more...",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Large caliber bullet",
}

function IsAllowedPoliceJob(job)
    for _, v in pairs(Config.PoliceJobs) do
        if job == v then
            return true
        end
    end
    return false
end

function IsAllowedAmbulanceJob(job)
    for _, v in pairs(Config.AmbulanceJobs) do
        if job == v then
            return true
        end
    end
    return false
end