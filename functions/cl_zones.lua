AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteZones()
    end
end)

local ZoneSpawned = false 
local ZoneCreated = {}

local hasCreatedPolyZones = false
local Poly = {
    -- ["EXAMPLEARMORY"] = {
    --     ["name"] = "EXAMPLEARMORY",
    --     ["coords"] = vector3(0, 0, 0),
    --     ["height"] = 0.0, ["width"] = 0.0, ["heading"] = 0, ["debug"] = false,
    --     ["minZ"] = 0.0,
    --     ["maxZ"] = 0.0,
    --     ["type"] = "client", ["event"] = "qb-sasp:client:openArmoury",
    --     ["icon"] = "fa-solid fa-gun", ["label"] = "Armory",
    --     ["job"] = { ['sasp'] = true, ['sahp'] = true }, -- < Job required to use target
    -- },
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