QBCore = exports['qb-core']:GetCoreObject()

-- [[ Start of Config ]] --
Config = {}
Config.ArmoryWhitelist = {}
Config.WhitelistedVehicles = {}
-- [[ ^^ Do not edit unless you know what you're doing ^^ ]] --

-- [[ Menu Settings ]] --
Config.MenuName = "LENT-GovernmentJob"
Config.IconName = "fa-solid fa-car"

-- [[ Objects ]] --
Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}
Config.MaxSpikes = 5

-- [[ Standalone Settings ]] -- 
Config.HandCuffItem = 'handcuffs'
Config.LicenseRank = 4
Config.Plate = "UPD " .. math.random(1111, 9999)

-- [[ Job Permissions ]] --
Config.AllowedPIT = { "upd", "sasp", "police", "bcso" }
Config.AllowedPanic = { "upd", "sasp", "police", "bcso", "doc", "ambulance" }
Config.AllowedMDT = { "upd", "sasp", "police", "bcso", "doc", "ambulance" }

-- [[ Helicopter ]]
Config.PoliceHelicopter = "b412"

-- [[ Parking Locations ]] --
Config.ParkingLocations = {
    [1] = { ["Coords"] = vector3(461.62, -1019.62, 28.09) },
    [2] = { ["Coords"] = vector3(462.49, -1015.56, 28.07) },
    [3] = { ["Coords"] = vector3(1548.2, 802.51, 77.01) },
}

-- [[ Locations ]] --
Config.Locations = {
    ["impound"] = {
        [1] = vector4(436.25, -975.88, 25.7, 89.05), ---Mission Row
        -- [70] = vector4(1872.26, 3687.6, 33.66, 1.26), -- Sandy Shores
    },
    ["evidence"] = {
        [1] = vector3(472.52, -991.22, 26.27), ---Mission Row
        [70] = vector3(1857.18, 3690.29, 29.82), -- Sandy Shores
        [90] = vector3(1547.74, 827.49, 82.13), -- San Andreas Highway Patrol
    },
}

-- [[ Armory ]] --
Config.SASPArmory = {
    label = "Highway Armory",
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
        [8] = {
            name = "heavyarmor",
            amount = 10,
            price = 0,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [9] = {
            name = "sasp_badge",
            amount = 1,
            price = 0,
            info = {},
            type = "item",
            slot = 9,
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
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [11] = {
            name = "weapon_glock17",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [12] = {
            name = "weapon_mp9",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "Scope"},
                }
            },
            type = "weapon",
            slot = 12,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
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
        [18] = {
            name = "9mm_smg_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [19] = {
            name = "556_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 19,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [20] = {
            name = "12guage_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
    }
}

Config.LSPDArmory = {
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
        [8] = {
            name = "heavyarmor",
            amount = 10,
            price = 0,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [9] = {
            name = "police_badge",
            amount = 1,
            price = 0,
            info = {},
            type = "item",
            slot = 9,
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
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [11] = {
            name = "weapon_glock17",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [12] = {
            name = "weapon_mp9",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "Scope"},
                }
            },
            type = "weapon",
            slot = 12,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
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
        [18] = {
            name = "9mm_smg_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [19] = {
            name = "556_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 19,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [20] = {
            name = "12guage_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
    }
}

Config.BCSOArmory = {
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
        [8] = {
            name = "heavyarmor",
            amount = 10,
            price = 0,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [9] = {
            name = "sheriff_badge",
            amount = 1,
            price = 0,
            info = {},
            type = "item",
            slot = 9,
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
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [11] = {
            name = "weapon_glock17",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [12] = {
            name = "weapon_mp9",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "Scope"},
                }
            },
            type = "weapon",
            slot = 12,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
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
        [18] = {
            name = "9mm_smg_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [19] = {
            name = "556_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 19,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [20] = {
            name = "12guage_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
    }
}

Config.DOCArmory = {
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
        [8] = {
            name = "heavyarmor",
            amount = 10,
            price = 0,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [9] = {
            name = "doc_badge",
            amount = 1,
            price = 0,
            info = {},
            type = "item",
            slot = 9,
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
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [11] = {
            name = "weapon_glock17",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [12] = {
            name = "weapon_mp9",
            amount = 1,
            price = 0,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "Scope"},
                }
            },
            type = "weapon",
            slot = 12,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
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
        [18] = {
            name = "9mm_smg_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [19] = {
            name = "556_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 19,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
        [20] = {
            name = "12guage_ammo",
            amount = 50,
            price = 0,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17}
        },
    }
}

Config.SAFDArmory = {
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
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [2] = {
            name = "panicbutton",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [3] = {
            name = "radio",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [4] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [5] = {
            name = "painkillers",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [6] = {
            name = "firstaid",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [7] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
        [8] = {
            name = "weapon_fireextinguisher",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
        },
    }
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

-- [[ Security Camera's ]] --
Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", coords = vector3(257.45, 210.07, 109.08), r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", coords = vector3(232.86, 221.46, 107.83), r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", coords = vector3(252.27, 225.52, 103.99), r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", coords = vector3(-53.1433, -1746.714, 31.546), r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", coords = vector3(-718.153, -909.211, 21.49), r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", coords = vector3(23.885, -1342.441, 31.672), r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", coords = vector3(1151.93, -320.389, 71.33), r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", coords = vector3(383.402, 328.915, 105.541), r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", coords = vector3(-1832.057, 789.389, 140.436), r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", coords = vector3(-3046.749, 592.491, 9.808), r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", coords = vector3(-3246.489, 1010.408, 14.705), r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", coords = vector3(539.773, 2664.904, 44.056), r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", coords = vector3(2673.579, 3281.265, 57.541), r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", coords = vector3(1966.24, 3749.545, 34.143), r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", coords = vector3(1729.522, 6419.87, 37.262), r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", coords = vector3(309.341, -281.439, 55.88), r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", coords = vector3(144.871, -1043.044, 31.017), r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", coords = vector3(-355.7643, -52.506, 50.746), r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", coords = vector3(-1214.226, -335.86, 39.515), r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", coords = vector3(-2958.885, 478.983, 17.406), r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", coords = vector3(-102.939, 6467.668, 33.424), r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", coords = vector3(-163.75, 6323.45, 33.424), r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Jewelery CAM#1", coords = vector3(-627.54, -239.74, 40.33), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Jewelery CAM#2", coords = vector3(-627.51, -229.51, 40.24), r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Jewelery CAM#3", coords = vector3(-620.3, -224.31, 40.23), r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Jewelery CAM#4", coords = vector3(-622.57, -236.3, 40.31), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    },
}

-- [[ Duty Logs ]] --
Config.SASP_WEBHOOK = "https://ptb.discord.com/api/webhooks/1032996031023042560/fHNYrlQU0j6T9QhXOHhx1UdckYGjWIqlKjNJF8x8a6dkpnJZuJe_S5VFXNQv4IPUXPhI"
Config.SASP_USERNAME = "San Andreas State Police Serivces | Duty Notification"
Config.SASP_TITLE = "SASP | Duty Notification"
Config.SASP_IMAGE = "https://cdn.discordapp.com/attachments/962840666545750046/1032999579051896953/unknown.png"

Config.LSPD_WEBHOOK = "https://ptb.discord.com/api/webhooks/1032996031023042560/fHNYrlQU0j6T9QhXOHhx1UdckYGjWIqlKjNJF8x8a6dkpnJZuJe_S5VFXNQv4IPUXPhI"
Config.LSPD_USERNAME = "San Andreas State Police Serivces | Duty Notification"
Config.LSPD_TITLE = "LSPD | Duty Notification"
Config.LSPD_IMAGE = "https://cdn.discordapp.com/attachments/962840666545750046/1033012795744211004/unknown.png"

Config.BCSO_WEBHOOK = "https://ptb.discord.com/api/webhooks/1032996031023042560/fHNYrlQU0j6T9QhXOHhx1UdckYGjWIqlKjNJF8x8a6dkpnJZuJe_S5VFXNQv4IPUXPhI"
Config.BCSO_USERNAME = "San Andreas State Police Serivces | Duty Notification"
Config.BCSO_TITLE = "BCSO | Duty Notification"
Config.BCSO_IMAGE = "https://cdn.discordapp.com/attachments/962840666545750046/1033013036149116928/unknown.png"

Config.DOC_WEBHOOK = "https://ptb.discord.com/api/webhooks/1032996031023042560/fHNYrlQU0j6T9QhXOHhx1UdckYGjWIqlKjNJF8x8a6dkpnJZuJe_S5VFXNQv4IPUXPhI"
Config.DOC_USERNAME = "San Andreas State Police Serivces | Duty Notification"
Config.DOC_TITLE = "DOC | Duty Notification"
Config.DOC_IMAGE = "https://cdn.discordapp.com/attachments/962840666545750046/1033012796121677844/unknown.png"

-- [[ Discord Configuration ]] --
Config.DISCORD_WEBHOOK = ""
Config.DISCORD_NAME = "LENT - GovernmentJobs"
Config.DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/1026175982509506650/1026176123928842270/Lanzaned.png"
