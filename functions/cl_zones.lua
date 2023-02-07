AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteZones()
    end
end)

local ZoneSpawned = false 
local ZoneCreated = {}

local hasCreatedPolyZones = false
local Poly = {
    -- [[ San Andreas Highway Patrol ]] -- 
    ["SAHPEvidence"] = {
        ["name"] = "SAHPEvidence",
        ["coords"] = vector3(1548.49, 827.46, 82.13),
        ["height"] = 5.2, ["width"] = 3.0, ["heading"] = 330, ["debug"] = false,
        ["minZ"] = 80.33,
        ["maxZ"] = 84.33,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = "sasp", -- < Job required to use target
    },
    ["SAHPWeapons"] = {
        ["name"] = "SAHPWeapons",
        ["coords"] = vector3(1552.26, 841.63, 77.66),
        ["height"] = 0.6, ["width"] = 8.2, ["heading"] = 330, ["debug"] = false,
        ["minZ"] = 76.66,
        ["maxZ"] = 79.96,
        ["type"] = "client", ["event"] = "qb-sasp:client:openArmoury",
        ["icon"] = "fa-solid fa-gun", ["label"] = "Armory",
        ["job"] = "sasp", -- < Job required to use target
    },

    -- [[ Los Santos Police Department ]] --
    ["LSPDArmoryMRPD"] = {
        ["name"] = "LSPDArmoryMRPD",
        ["coords"] = vector3(484.06, -994.08, 30.69),
        ["height"] = 1.8, ["width"] = 8.0, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 28.49,
        ["maxZ"] = 32.49,
        ["type"] = "client", ["event"] = "qb-police:client:openArmoury",
        ["icon"] = "fa-solid fa-gun", ["label"] = "Open Armory",
        ["job"] = "police", -- < Job required to use target
    },

    -- [[ Sandy Shores Sheriffs Office ]] --
    ["SandyShoresArmory"] = {
        ["name"] = "SandyShoresArmory",
        ["coords"] = vector3(1865.15, 3692.71, 34.58),
        ["height"] = 5.15, ["width"] = 1, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 36.03,
        ["type"] = "client", ["event"] = "qb-bcso:client:openArmoury",
        ["icon"] = "fa-solid fa-gun", ["label"] = "Open Armory",
        ["job"] = "bcso", -- < Job required to use target
    },
    ["SandyShoresDuty"] = {
        ["name"] = "SandyShoresDuty",
        ["coords"] = vector3(1849.85, 3692.12, 34.58),
        ["height"] = 1.0, ["width"] = 0.6, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 34.98,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:ToggleDuty",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Go On/Off Duty",
        ["job"] = "bcso", -- < Job required to use target
    },
    ["SandyShoresEvidence"] = {
        ["name"] = "SandyShoresEvidence",
        ["coords"] = vector3(1870.63, 3701.15, 34.58),
        ["height"] = 2.0, ["width"] = 0.6, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 35.78,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = "bcso", -- < Job required to use target
    },
    ["SandyShoresFingerprint"] = {
        ["name"] = "SandyShoresFingerprint",
        ["coords"] = vector3(1867.03, 3701.73, 34.58),
        ["height"] = 1.05, ["width"] = 0.6, ["heading"] = 42, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 35.23,
        ["type"] = "client", ["event"] = "qb-police:client:scanFingerPrint",
        ["icon"] = "fa-solid fa-fingerprint", ["label"] = "Scan Fingerprint",
        ["job"] = "bcso", -- < Job required to use target
    },
    ["SandyShoresPersonalStash"] = {
        ["name"] = "SandyShoresPersonalStash",
        ["coords"] = vector3(1869.03, 3704.12, 34.58),
        ["height"] = 2.0, ["width"] = 1.0, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 35.98,
        ["type"] = "client", ["event"] = "qb-police:client:openStash",
        ["icon"] = "fa-solid fa-dungeon", ["label"] = "Open Personal Stash",
        ["job"] = "bcso", -- < Job required to use target
    },
    ["SandyShoresTrash"] = {
        ["name"] = "SandyShoresTrash",
        ["coords"] = vector3(1868.44, 3691.99, 34.58),
        ["height"] = 1.0, ["width"] = 1.6, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 30.58,
        ["maxZ"] = 34.58,
        ["type"] = "client", ["event"] = "qb-police:client:openTrash",
        ["icon"] = "fa-solid fa-trash", ["label"] = "Open Trash",
        ["job"] = "bcso", -- < Job required to use target
    },

    -- [[ San Andreas Fire Department ]] --
    ["GrapeseedDutyLocation"] = {
        ["name"] = "GrapeseedDutyLocation",
        ["coords"] = vector3(1773.02, 4604.87, 37.72),
        ["height"] = 0.4, ["width"] = 0.5, ["heading"] = 315, ["debug"] = false,
        ["minZ"] = 36.72,
        ["maxZ"] = 38.32,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:ToggleEMSDuty",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Go On/Off Duty",
        ["job"] = "ambulance", -- < Job required to use target
    },
    ["GrapeseedArmoryLocation"] = {
        ["name"] = "GrapeseedArmoryLocation",
        ["coords"] = vector3(1782.86, 4616.59, 37.72),
        ["height"] = 0.8, ["width"] = 3.4, ["heading"] = 5, ["debug"] = false,
        ["minZ"] = 36.72,
        ["maxZ"] = 38.92,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:EMSArmory",
        ["icon"] = "fa-solid fa-pill", ["label"] = "Open Armory",
        ["job"] = "ambulance", -- < Job required to use target
    },
}

-- [[ PolyZones ]] --
CreateThread(function()
    if not hasCreatedPolyZones then
        for k, v in pairs(Poly) do
            if ZoneSpawned then
                return
            end
    
            for k, v in pairs(Poly) do
                if not ZoneCreated[k] then
                    ZoneCreated[k] = {}
                end
    
                ZoneCreated[k] = exports['qb-target']:AddBoxZone(v["name"], v["coords"], v["height"], v["width"], { 
                    name = v["name"],
                    heading = v["heading"],
                    debugPoly = v["debug"],
                    minZ = v["minZ"],
                    maxZ = v["maxZ"],
                }, { 
                    options = { 
                        {
                            type = v["type"],
                            event = v["event"],
                            icon = v["icon"],
                            label = v["label"], 
                            job = v["job"],
                        },
                    },
                    distance = v["distance"]
                })  
                print("Created: " .. k)
            end
    
            ZoneSpawned = true
        end
    end
end)

function DeleteZones()
    if ZoneSpawned then
        for k, v in pairs(ZoneCreated) do
            print("Deleted: " .. k .. " Removing: " .. v["name"])
            exports['qb-target']:RemoveZone(k)
            exports['qb-target']:RemoveZone(v["name"])
        end
    end
end