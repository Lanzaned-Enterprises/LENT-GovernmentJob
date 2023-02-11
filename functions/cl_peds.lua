AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeletePeds()
    end
end)

local pedSpawned = false
local PedCreated = {}

local peds = {
    ["SASPVehicleSpawner"] = {
        ["coords"] = vector4(1550.26, 817.12, 77.16, 251.03), -- The start Coordinatos of the first mission
        
        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT:TAKE:VEHICLE:SASP", 
        ["icon"] = "fa-solid fa-car", ["text"] = "Select Vehicle", ["job"] = "sasp",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
        
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
        
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = -1,       ["glasses_TEXTURE"] = 0,
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 447,           ["T_Texture"] = 0,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 159,          ["D_Texture"] = 7,
        ["accs"] = 169,           ["A_Texture"] = 0,
        ["bags"] = 111,           ["B_Texture"] = 0,
        ["pants"] = 165,          ["P_Texture"] = 0,
        ["shoes"] = 13,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = -1,         ["beard_OPACITY"] = 0.0,        ["beard_COLOR"] = -1, -- leave opacity at 1.0
    },

    -- [[ Sheriffs Office ]]
    ["BCSODesk"] = {
        ["coords"] = vector4(1852.08, 3688.13, 34.22, 207.68), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_VALET", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:QuestionsMenu:SandyShores", 
        ["icon"] = "fa-solid fa-clipboard", ["text"] = "Ask Question",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 464,           ["T_Texture"] = 2,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 162,          ["D_Texture"] = 0,
        ["accs"] = 172,           ["A_Texture"] = 0,
        ["bags"] = 113,           ["B_Texture"] = 1,
        ["pants"] = 168,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },
    ["BCSOVehicleSpawner"] = {
        ["coords"] = vector4(1886.49, 3692.63, 33.54, 85.61), -- The start Coordinatos of the first mission
        
        ["ped"] = "mp_m_freemode_01", -- The model of chracter that you interact with
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true, -- True = Allows interaction | False = Doesn't allow
        -- ["type"] = "client", 
        -- ["event"] = "LENT-GovernmentJob:Client:SelectVehicle", 
        -- ["icon"] = "fas fa-car", ["text"] = "Spawn Cruiser", 
        -- ["job"] = "bcso",

        ["type"] = "client", 
        ["event"] = "LENT-GovernmentJob:Client:DeskHarold", 
        ["icon"] = "fas fa-question", ["text"] = "Ask Harold a Question", 
        ["job"] = "bcso",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
        
        ["mother"] = 0, ["father"] = 1, ["mix"] = 0.0,
        
        ["hair"] = 3, ["HAIR_Texture"] = 3, ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = 200, ["hat_TEXTURE"] = 0,
        ["mask"] = 0, ["mask_Texture"] = 3,
        ["glasses"] = 5, ["glasses_TEXTURE"] = 0,
        ["hands"] = 6, ["HA_Texture"] = 0,
       
        ["undershirts"] = 198, ["U_Texture"] = 0,
        ["tops"] = 464, ["T_Texture"] = 14,
        ["kevlar"] = 62, ["K_Texture"] = 0,
        ["decal"] = 157, ["D_Texture"] = 7,
        ["accs"] = -1, ["A_Texture"] = 0,
        ["bags"] = -1, ["B_Texture"] = 0,
        ["pants"] = 168, ["P_Texture"] = 2,
        ["shoes"] = 10, ["S_Texture"] = 0,

        ["eye_COLOR"] = 2,
        ["makeup"] = 1, ["makeup_OPACITY"] = 0.0, ["makeup_COLOR"] = 1, -- leave opacity at 1.0
        ["lipstick"] = 0, ["lipstick_OPACITY"] = 0.0, ["lipstick_COLOR"] = 21, -- leave opacity at 1.0
        ["eyebrows"] = 0, ["eyebrows_OPACITY"] = 1.0, ["eyebrows_COLOR"] = 1, -- leave opacity at 1.0
        ["beard"] = -1, ["beard_OPACITY"] = 1.0, ["beard_COLOR"] = 1, -- leave opacity at 1.0
    },
    ["BCSOArmory"] = {
        ["coords"] = vector4(1860.73, 3690.68, 34.22, 9.82), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "qb-bcso:client:openArmoury", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = "bcso",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = 195,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 464,           ["T_Texture"] = 2,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 162,          ["D_Texture"] = 0,
        ["accs"] = 172,           ["A_Texture"] = 0,
        ["bags"] = 113,           ["B_Texture"] = 1,
        ["pants"] = 168,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },

    ["BCSODeskPaleto"] = {
        ["coords"] = vector4(-449.35, 6012.71, 31.72, 314.02), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_VALET", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:QuestionsMenu", 
        ["icon"] = "fa-solid fa-clipboard", ["text"] = "Ask Question",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 464,           ["T_Texture"] = 2,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 162,          ["D_Texture"] = 0,
        ["accs"] = 172,           ["A_Texture"] = 0,
        ["bags"] = 113,           ["B_Texture"] = 1,
        ["pants"] = 168,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },
    ["BCSOArmoryPaleto"] = {
        ["coords"] = vector4(-429.16, 5997.77, 31.72, 46.46), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "qb-bcso:client:openArmoury", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = "bcso",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 2,           ["HAIR_Texture"] = 10,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 464,           ["T_Texture"] = 2,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 162,          ["D_Texture"] = 0,
        ["accs"] = 172,           ["A_Texture"] = 0,
        ["bags"] = 113,           ["B_Texture"] = 1,
        ["pants"] = 168,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 10, -- leave opacity at 1.0
    },
    ["BCSOVehicleSpawnerPaleto"] = {
        ["coords"] = vector4(-449.37, 6003.72, 31.49, 134.79), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:BCSO:Paleto:SelectVehicle", 
        ["icon"] = "fa-solid fa-car", ["text"] = "Request Cruiser", ["job"] = "bcso",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = 197,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,          ["HA_Texture"] = 0,
        ["undershirts"] = 203,    ["U_Texture"] = 0,
        ["tops"] = 458,           ["T_Texture"] = 8,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 162,          ["D_Texture"] = 4,
        ["accs"] = 172,           ["A_Texture"] = 0,
        ["bags"] = 113,           ["B_Texture"] = 1,
        ["pants"] = 168,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },

    -- [[ San Andreas Fire Department ]] --
    ["SAFDGrapeseedSpawner"] = {
        ["coords"] = vector4(1791.3, 4617.39, 37.72, 190.06), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:SpawnEMSVehicle:Grapeseed", 
        ["icon"] = "fa-solid fa-car", ["text"] = "Spawn Vehicle", ["job"] = "ambulance",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 7,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 4,          ["HA_Texture"] = 0,
        ["undershirts"] = 15,    ["U_Texture"] = 0,
        ["tops"] = 478,           ["T_Texture"] = 0,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 155,          ["D_Texture"] = 0,
        ["accs"] = -1,           ["A_Texture"] = 0,
        ["bags"] = 116,           ["B_Texture"] = 0,
        ["pants"] = 35,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 10,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
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