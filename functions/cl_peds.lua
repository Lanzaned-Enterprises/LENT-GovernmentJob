AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeletePeds()
    end
end)

local pedSpawned = false
local PedCreated = {}

local peds = {
    ["ExamplePed-VehicleSpawner"] = {
        ["coords"] = vector4(0, 0, 0, 0), -- The start Coordinatos of the first mission
        
        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:SelectVehicle", 
        ["icon"] = "fa-solid fa-car", ["text"] = "Select Vehicle", ["job"] = { ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
        
        ["mother"] = -1,        ["father"] = -1,                ["mix"] = 1.0,
        
        ["hair"] = -1,           ["HAIR_Texture"] = 0,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 0,
        ["glasses"] = -1,       ["glasses_TEXTURE"] = 0,
        ["hands"] = -1,          ["HA_Texture"] = 0,
        ["undershirts"] = -1,    ["U_Texture"] = 0,
        ["tops"] = -1,           ["T_Texture"] = 0,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = -1,          ["D_Texture"] = 0,
        ["accs"] = -1,           ["A_Texture"] = 0,
        ["bags"] = -1,           ["B_Texture"] = 0,
        ["pants"] = -1,          ["P_Texture"] = 0,
        ["shoes"] = -1,          ["S_Texture"] = 0,

        ["eye_COLOR"] = -1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = -1,         ["beard_OPACITY"] = 0.0,        ["beard_COLOR"] = -1, -- leave opacity at 1.0
    },
}

CreateThread(function()
    for k, v in pairs(peds) do
        if pedSpawned then 
            return 
        end
    
        for k, v in pairs(peds) do
            if not PedCreated[k] then 
                PedCreated[k] = {} 
            end
    
            local current = v["ped"]
            current = type(current) == 'string' and joaat(current) or current
            RequestModel(current)
    
            while not HasModelLoaded(current) do
                Wait(0)
            end
    
            -- The coords + heading of the Ped
            PedCreated[k] = CreatePed(0, current, v["coords"].x, v["coords"].y, v["coords"].z-1, v["coords"].w, false, false)
            
            -- Start the scneario in a basic loop
            TaskStartScenarioInPlace(PedCreated[k], v["scenario"], true)
            
            if v["freeze"] then
                -- Let the entity stay in posistion
                FreezeEntityPosition(PedCreated[k], true)
            end
    
            if v["invincible"] then
                -- Set the ped to be invincible
                SetEntityInvincible(PedCreated[k], true)
            end
    
            -- Block events like bumping
            if v["block_events"] then
                SetBlockingOfNonTemporaryEvents(PedCreated[k], true)
            end
    
            -- Target Stuff.. Read Config
            if v["target"] then
                exports['qb-target']:AddTargetEntity(PedCreated[k], {
                    options = {
                        {
                            type = v["type"],
                            event = v["event"],
                            icon = v["icon"],
                            label = v["text"],
                            job = v["job"],
                        },
                    },
                    distance = 2.0
                })
            end
    
            -- Clothing for MP Characters
            if v["clothing"] then
                SetPedComponentVariation(PedCreated[k], 2, v["hair"], 0, 0)
                SetPedComponentVariation(PedCreated[k], 3, v["hands"], v["HA_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 8, v["undershirts"], v["U_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 11, v["tops"], v["T_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 9, v["kevlar"], v["K_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 10, v["decal"], v["D_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 7, v["accs"], v["A_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 5, v["bags"], v["B_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 4, v["pants"], v["P_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 6, v["shoes"], v["S_Texture"], 0)
                SetPedComponentVariation(PedCreated[k], 1, v["mask"], v["mask_Texture"], 0)
                SetPedPropIndex(PedCreated[k], 0, v['hat'], v['hat_TEXTURE'], true)
                SetPedPropIndex(PedCreated[k], 1, v['glasses'], v['glasses_TEXTURE'], true)
                SetPedHeadBlendData(PedCreated[k], v["mother"], v["father"], 0,0, 0, 0, 0, v["mix"], 0, false)
                SetPedHairColor(PedCreated[k], v["HAIR_Texture"], v["HAIR_HIGHLIGHT"])
                SetPedHeadOverlay(PedCreated[k], 4, v["makeup"], v["makeup_OPACITY"])
                SetPedHeadOverlayColor(PedCreated[k], 4, 1, v["makeup_COLOR"], 0)
                SetPedHeadOverlay(PedCreated[k], 8, v["lipstick"], v["lipstick_OPACITY"])
                SetPedHeadOverlayColor(PedCreated[k], 8, 1, v["lipstick_COLOR"], 0)
                SetPedHeadOverlay(PedCreated[k], 2, v["eyebrows"], v["eyebrows_OPACITY"])
                SetPedHeadOverlayColor(PedCreated[k], 2, 1, v["eyebrows_COLOR"], 0)
                SetPedHeadOverlay(PedCreated[k], 1, v["beard"], v["beard_OPACITY"])
                SetPedHeadOverlayColor(PedCreated[k], 1, 1, v["beard_COLOR"], 0)
                SetPedEyeColor(PedCreated[k], v['eye_COLOR'])
            end
        end
    
        pedSpawned = true
    end
end)

-- [[ Function To Delete Peds ]] --
function DeletePeds()
    if pedSpawned then
        for _, v in pairs(PedCreated) do
            DeletePed(v)
        end
    end
end

-- [[ Check if the Ped is dead and delete afther 1 Minute ]] --
CreateThread(function()
    while true do
        Wait(5000)
        if pedSpawned then
            for _, v in pairs(PedCreated) do
                if IsEntityDead(v) then 
                    DeletePed(v)
                end
            end
        end
    end
end)