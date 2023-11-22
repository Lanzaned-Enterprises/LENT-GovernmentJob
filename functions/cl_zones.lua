AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteZones()
    end
end)

local ZoneSpawned = false 
local ZoneCreated = {}

local hasCreatedPolyZones = false
local Poly = {
    ["UPDEvidence"] = {
        ["name"] = "UPDEvidence",
        ["coords"] = vector3(814.22, -1297.8, 19.85),
        ["height"] = 0.6, ["width"] = 3.0, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = 17.05,
        ["maxZ"] = 21.05,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    -- [[ San Andreas Highway Patrol ]] -- 
    ["SAHPEvidence"] = {
        ["name"] = "SAHPEvidence",
        ["coords"] = vector3(1548.49, 827.46, 82.13),
        ["height"] = 5.2, ["width"] = 3.0, ["heading"] = 330, ["debug"] = false,
        ["minZ"] = 80.33,
        ["maxZ"] = 84.33,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SAHPWeapons"] = {
        ["name"] = "SAHPWeapons",
        ["coords"] = vector3(1552.26, 841.63, 77.66),
        ["height"] = 0.6, ["width"] = 8.2, ["heading"] = 330, ["debug"] = false,
        ["minZ"] = 76.66,
        ["maxZ"] = 79.96,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory",
        ["icon"] = "fa-solid fa-gun", ["label"] = "Armory",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    -- [[ Los Santos Police Department ]] --
    ["MRPD:Fingerprint"] = {
        ["name"] = "MRPD:Fingerprint",
        ["coords"] = vector3(443.18, -975.46, 34.19),
        ["height"] = 0.8, ["width"] = 0.4, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = 34.14,
        ["maxZ"] = 34.79,
        ["type"] = "client", ["event"] = "qb-police:client:scanFingerPrint",
        ["icon"] = "fa-solid fa-fingerprint", ["label"] = "Scan Fingerprint",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["MRPD:Evidence"] = {
        ["name"] = "MRPD:Evidence",
        ["coords"] = vector3(473.49, -1007.62, 34.22),
        ["height"] = 5.2, ["width"] = 4.8, ["heading"] = 90, ["debug"] = false,
        ["minZ"] = 33.22,
        ["maxZ"] = 36.02,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["MRPD:Trash"] = {
        ["name"] = "MRPD:Trash",
        ["coords"] = vector3(484.63, -998.14, 25.73),
        ["height"] = 1.0, ["width"] = 0.8, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = 24.53,
        ["maxZ"] = 26.73,
        ["type"] = "client", ["event"] = "qb-police:client:openTrash",
        ["icon"] = "fa-solid fa-trash", ["label"] = "Open Trash",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["MRPD:PersonalStash"] = {
        ["name"] = "MRPD:PersonalStash",
        ["coords"] = vector3(487.4, -995.26, 25.73),
        ["height"] = 2.8, ["width"] = 1.0, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = 24.68,
        ["maxZ"] = 26.88,
        ["type"] = "client", ["event"] = "qb-police:client:openStash",
        ["icon"] = "fa-solid fa-dungeon", ["label"] = "Open Personal Stash",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    -- [[ Sandy Shores Sheriffs Office ]] --
    ["SandyShoresDuty"] = {
        ["name"] = "SandyShoresDuty",
        ["coords"] = vector3(1851.01, 3686.91, 34.22),
        ["height"] = 0.6, ["width"] = 0.6, ["heading"] = 335, ["debug"] = false,
        ["minZ"] = 30.92,
        ["maxZ"] = 34.72,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:ToggleDuty",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Go On/Off Duty",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    ["SandyShoresEvidence"] = {
        ["name"] = "SandyShoresEvidence",
        ["coords"] = vector3(1829.22, 3659.64, 30.31),
        ["height"] = 4.8, ["width"] = 0.8, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 28.51,
        ["maxZ"] = 32.51,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SandyShoresEvidence3"] = {
        ["name"] = "SandyShoresEvidence3",
        ["coords"] = vector3(1825.71, 3660.13, 30.31),
        ["height"] = 5.2, ["width"] = 1.0, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 27.91,
        ["maxZ"] = 31.91,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SandyShoresEvidence4"] = {
        ["name"] = "SandyShoresEvidence4",
        ["coords"] = vector3(1823.62, 3659.01, 30.31),
        ["height"] = 5.6, ["width"] = 1.0, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 27.91,
        ["maxZ"] = 31.91,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SandyShoresEvidence5"] = {
        ["name"] = "SandyShoresEvidence5",
        ["coords"] = vector3(1822.59, 3664.04, 30.31),
        ["height"] = 1.4, ["width"] = 2.4, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 28.31,
        ["maxZ"] = 32.31,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    ["DavisSheriffEvidence"] = {
        ["name"] = "DavisSheriffEvidence",
        ["coords"] = vector3(375.74, -1596.18, 25.36),
        ["height"] = 5.8, ["width"] = 1.4, ["heading"] = 50, ["debug"] = false,
        ["minZ"] = 22.96,
        ["maxZ"] = 26.96,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["DavisSheriffEvidence3"] = {
        ["name"] = "DavisSheriffEvidence3",
        ["coords"] = vector3(372.23, -1597.2, 25.36),
        ["height"] = 4.8, ["width"] = 1.4, ["heading"] = 50, ["debug"] = false,
        ["minZ"] = 23.56,
        ["maxZ"] = 27.56,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["DavisSheriffEvidence4"] = {
        ["name"] = "DavisSheriffEvidence4",
        ["coords"] = vector3(377.37, -1594.34, 25.36),
        ["height"] = 6.0, ["width"] = 1.0, ["heading"] = 50, ["debug"] = false,
        ["minZ"] = 23.36,
        ["maxZ"] = 27.36,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["DavisSheriffEvidence5"] = {
        ["name"] = "DavisSheriffEvidence5",
        ["coords"] = vector3(379.95, -1598.82, 25.36),
        ["height"] = 0.8, ["width"] = 2.8, ["heading"] = 50, ["debug"] = false,
        ["minZ"] = 23.36,
        ["maxZ"] = 27.36,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    ["SandyShoresFingerprint"] = {
        ["name"] = "SandyShoresFingerprint",
        ["coords"] = vector3(1867.03, 3701.73, 34.58),
        ["height"] = 1.05, ["width"] = 0.6, ["heading"] = 42, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 35.23,
        ["type"] = "client", ["event"] = "qb-police:client:scanFingerPrint",
        ["icon"] = "fa-solid fa-fingerprint", ["label"] = "Scan Fingerprint",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SandyShoresPersonalStash"] = {
        ["name"] = "SandyShoresPersonalStash",
        ["coords"] = vector3(1869.03, 3704.12, 34.58),
        ["height"] = 2.0, ["width"] = 1.0, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 33.58,
        ["maxZ"] = 35.98,
        ["type"] = "client", ["event"] = "qb-police:client:openStash",
        ["icon"] = "fa-solid fa-dungeon", ["label"] = "Open Personal Stash",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["SandyShoresTrash"] = {
        ["name"] = "SandyShoresTrash",
        ["coords"] = vector3(1868.44, 3691.99, 34.58),
        ["height"] = 1.0, ["width"] = 1.6, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 30.58,
        ["maxZ"] = 34.58,
        ["type"] = "client", ["event"] = "qb-police:client:openTrash",
        ["icon"] = "fa-solid fa-trash", ["label"] = "Open Trash",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    -- [[ Grapeseed Sheriff's Office ]] --
    ["Grapeseed:Sheriff:Duty"] = {
        ["name"] = "Grapeseed:Sheriff:Duty",
        ["coords"] = vector3(1652.43, 4885.82, 42.16),
        ["height"] = 0.6, ["width"] = 0.6, ["heading"] = 320, ["debug"] = false,
        ["minZ"] = 41.96,
        ["maxZ"] = 42.71,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:ToggleDuty",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Go On/Off Duty",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, } -- < Job required to use target
    },
    ["Grapeseed:Sheriff:Armory"] = {
        ["name"] = "Grapeseed:Sheriff:Armory",
        ["coords"] = vector3(1652.03, 4889.14, 42.16),
        ["height"] = 2.0, ["width"] = 0.8, ["heading"] = 10, ["debug"] = false,
        ["minZ"] = 40.16,
        ["maxZ"] = 43.76,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory",
        ["icon"] = "fa-solid fa-gun", ["label"] = "Open Armory",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["Grapeseed:Sheriff:Evidence"] = {
        ["name"] = "Grapeseed:Sheriff:Evidence",
        ["coords"] = vector3(1651.83, 4880.39, 45.52),
        ["height"] = 3.0, ["width"] = 4.2, ["heading"] = 9, ["debug"] = false,
        ["minZ"] = 42.92,
        ["maxZ"] = 46.92,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
    ["Grapeseed:Sheriff:Trash"] = {
        ["name"] = "Grapeseed:Sheriff:Trash",
        ["coords"] = vector3(1649.6, 4887.93, 42.16),
        ["height"] = 0.4, ["width"] = 2.2, ["heading"] = 8, ["debug"] = false,
        ["minZ"] = 38.76,
        ["maxZ"] = 42.76,
        ["type"] = "client", ["event"] = "qb-police:client:openTrash",
        ["icon"] = "fa-solid fa-trash", ["label"] = "Open Trash",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },

    -- [[ San Andreas Fire Department ]] --
    ["GrapeseedDutyLocation"] = {
        ["name"] = "GrapeseedDutyLocation",
        ["coords"] = vector3(1773.02, 4604.87, 37.72),
        ["height"] = 0.4, ["width"] = 0.5, ["heading"] = 315, ["debug"] = false,
        ["minZ"] = 36.72,
        ["maxZ"] = 38.32,
        ["type"] = "client", ["event"] = "EMSToggle:Duty",
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

    -- [[ Sandy Shores Clinic ]] --
    ["SandyShoresClinic:Checkin"] = {
        ["name"] = "SandyShoresClinic:Checkin",
        ["coords"] = vector3(1674.21, 3667.22, 35.34),
        ["height"] = 1.6, ["width"] = 0.8, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 31.54,
        ["maxZ"] = 35.54,
        ["type"] = "client", ["event"] = "qb-ambulancejob:checkin",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Check In",
    },
    ["SandyShoresClinic:Armory"] = {
        ["name"] = "SandyShoresClinic:Armory",
        ["coords"] = vector3(1661.35, 3659.55, 35.34),
        ["height"] = 0.8, ["width"] = 3.4, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 32.54,
        ["maxZ"] = 36.54,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:EMSArmory",
        ["icon"] = "fa-solid fa-pill", ["label"] = "Open Armory",
        ["job"] = "ambulance", -- < Job required to use target
    },
    ["SandyShoresClinic:Stash"] = {
        ["name"] = "SandyShoresClinic:Stash",
        ["coords"] = vector3(1668.04, 3654.22, 35.34),
        ["height"] = 1.0, ["width"] = 2.2, ["heading"] = 30, ["debug"] = false,
        ["minZ"] = 32.74,
        ["maxZ"] = 36.74,
        ["type"] = "client", ["event"] = "qb-ambulancejob:stash",
        ["icon"] = "fa-solid fa-box", ["label"] = "Open Stash",
        ["job"] = "ambulance", -- < Job required to use target
    },

    -- [[ Pillbox Hospital ]] --
    ["Pillbox:Checkin"] = {
        ["name"] = "Pillbox:Checkin",
        ["coords"] = vector3(309.8, -579.72, 43.27),
        ["height"] = 0.75, ["width"] = 0.4, ["heading"] = 338, ["debug"] = false,
        ["minZ"] = 42.87,
        ["maxZ"] = 43.67,
        ["type"] = "client", ["event"] = "qb-ambulancejob:checkin",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Check In",
    },
    ["Pillbox:Armory"] = {
        ["name"] = "Pillbox:Armory",
        ["coords"] = vector3(313.03, -581.96, 43.27),
        ["height"] = 3.2, ["width"] = 1.0, ["heading"] = 340, ["debug"] = false,
        ["minZ"] = 40.67,
        ["maxZ"] = 44.67,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory",
        ["icon"] = "fa-solid fa-pill", ["label"] = "Open Armory",
        ["job"] = "ambulance", -- < Job required to use target
    },
    ["Pillbox:Stash"] = {
        ["name"] = "Pillbox:Stash",
        ["coords"] = vector3(313.8, -580.01, 43.27),
        ["height"] = 1.2, ["width"] = 0.6, ["heading"] = 340, ["debug"] = false,
        ["minZ"] = 42.27,
        ["maxZ"] = 43.47,
        ["type"] = "client", ["event"] = "qb-ambulancejob:stash",
        ["icon"] = "fa-solid fa-box", ["label"] = "Open Stash",
        ["job"] = "ambulance", -- < Job required to use target
    },

    -- [[ Blaine County HQ ]] -- 
    ["BCHQF:Armory"] = {
        ["name"] = "BCHQF:Armory",
        ["coords"] = vector3(2513.32, 4248.64, 40.42),
        ["height"] = 1.0, ["width"] = 1.6, ["heading"] = 350, ["debug"] = false,
        ["minZ"] = 37.82,
        ["maxZ"] = 41.82,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory",
        ["icon"] = "fa-solid fa-pill", ["label"] = "Open Armory",
        ["job"] = "ambulance", -- < Job required to use target
    },

    ["DelPerro:Substation:Evidence"] = {
        ["name"] = "DelPerro:Substation:Evidence",
        ["coords"] = vector3(-1629.41, -1026.29, 13.16),
        ["height"] = 0.6, ["width"] = 2.5, ["heading"] = 50, ["debug"] = false,
        ["minZ"] = 10.76,
        ["maxZ"] = 14.76,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:CheckZone",
        ["icon"] = "fa-solid fa-clipboard", ["label"] = "Evidence",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },


    ["Ranger:Custom"] = {
        ["name"] = "Ranger:Custom",
        ["coords"] = vector3(387.35, 800.32, 187.46),
        ["height"] = 0.6, ["width"] = 2.56, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = 184.66,
        ["maxZ"] = 188.66,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:RangerCustom",
        ["icon"] = "fa-solid fa-locker", ["label"] = "Lockers",
        ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, }, -- < Job required to use target
    },
}

RegisterNetEvent('LENT-GovernmentJob:Client:RangerCustom', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Ranger - Lockers',
            icon = 'fas fa-locker',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Open Evidence Locker',
            txt = 'Opens the Evidence Lockers',
            icon = 'fas fa-clipboard',
            params = {
                event = 'LENT-GovernmentJob:Client:CheckZone',
            }
        }, 
        {
            header = 'Open Armory',
            txt = 'Opens the Armory',
            icon = 'fas fa-gun',
            params = {
                event = 'qb-bcso:client:openArmoury',
            }
        },
    })

end)

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

                if v['job'] ~= nil then
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
                    -- print("Created: " .. k)
                else
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
                            },
                        },
                        distance = v["distance"]
                    })  
                end
            end
    
            ZoneSpawned = true
        end
    end
end)

function DeleteZones()
    if ZoneSpawned then
        for k, v in pairs(ZoneCreated) do
            exports['qb-target']:RemoveZone(k)
            exports['qb-target']:RemoveZone(v["name"])
        end
    end
end