-- [[ Remove Peds ]] --
local areaRadius = 500.0

AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    if #(vector3(1819.2, 3673.54, 34.71) - vector3(x, y, z)) < areaRadius then
        CancelEvent()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeletePeds()
    end
end)

local pedSpawned = false
local PedCreated = {}

local peds = {
    ["UPDArmory"] = {
        ["coords"] = vector4(821.19, -1295.11, 19.85, 267.56), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = -1,           ["mask_Texture"] = 5,
        ["glasses"] = -1,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 20,            ["HA_Texture"] = 0,
        ["undershirts"] = 161,     ["U_Texture"] = 0,
        ["tops"] = 102,            ["T_Texture"] = 2,
        ["kevlar"] = -1,           ["K_Texture"] = 0,
        ["decal"] = -1,           ["D_Texture"] = 0,
        ["accs"] = -1,            ["A_Texture"] = 0,
        ["bags"] = -1,              ["B_Texture"] = 0,
        ["pants"] = 10,           ["P_Texture"] = 0,
        ["shoes"] = 10,            ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    }, 
    -- [[ Los Santos Police ]] --
    ["LSPDArmory"] = {
        ["coords"] = vector4(484.62, -1003.71, 25.73, 7.76), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 228,           ["mask_Texture"] = 5,
        ["glasses"] = -1,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 172,            ["HA_Texture"] = 0,
        ["undershirts"] = 220,     ["U_Texture"] = 0,
        ["tops"] = 550,            ["T_Texture"] = 4,
        ["kevlar"] = -1,           ["K_Texture"] = 0,
        ["decal"] = -1,           ["D_Texture"] = 0,
        ["accs"] = 178,            ["A_Texture"] = 0,
        ["bags"] = 117,              ["B_Texture"] = 1,
        ["pants"] = 179,           ["P_Texture"] = 1,
        ["shoes"] = 10,            ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    }, 
    ["LSPDVespucciDesk"] = {
        ["coords"] = vector4(-1633.45, -1026.1, 13.16, 45.5), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = false,
        ["type"] = "client", ["event"] = "", 
        ["icon"] = "fa-solid fa-questionmark", ["text"] = "Ask Question",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 228,           ["mask_Texture"] = 5,
        ["glasses"] = -1,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 172,            ["HA_Texture"] = 0,
        ["undershirts"] = 220,     ["U_Texture"] = 0,
        ["tops"] = 550,            ["T_Texture"] = 4,
        ["kevlar"] = -1,           ["K_Texture"] = 0,
        ["decal"] = -1,           ["D_Texture"] = 0,
        ["accs"] = 178,            ["A_Texture"] = 0,
        ["bags"] = 117,              ["B_Texture"] = 1,
        ["pants"] = 179,           ["P_Texture"] = 1,
        ["shoes"] = 10,            ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },

    -- [[ Sheriffs Office ]]
    ["BCSODesk"] = {
        ["coords"] = vector4(1818.43, 3672.73, 34.71, 109.75), -- The start Coordinatos of the first mission

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
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },
    ["BCSOArmory"] = {
        ["coords"] = vector4(1835.01, 3694.68, 34.71, 210.61), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },
    ["BCSOArmory2"] = {
        ["coords"] = vector4(1819.26, 3666.89, 30.31, 113.03), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },

    ["BCSODeskPaleto"] = {
        ["coords"] = vector4(-443.16, 6009.53, 31.49, 6.19), -- The start Coordinatos of the first mission

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
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },
    ["BCSOArmoryPaleto"] = {
        ["coords"] = vector4(-483.21, 6015.89, 34.33, 227.10), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 2,           ["HAIR_Texture"] = 10,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 10, -- leave opacity at 1.0
    },
    ["BCSOArmoryDavis"] = {
        ["coords"] = vector4(379.55, -1631.09, 29.76, 61.11), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 2,           ["HAIR_Texture"] = 10,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 10, -- leave opacity at 1.0
    },
    ["BCSOArmoryDavis2"] = {
        ["coords"] = vector4(384.35, -1600.4, 25.36, 325.86), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory", 
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 2,           ["HAIR_Texture"] = 10,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 10, -- leave opacity at 1.0
    },
    ["DESKDAVISSHERIFF"] = {
        ["coords"] = vector4(387.88, -1606.51, 29.76, 320.37), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_VALET", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = false,
        ["type"] = "client", ["event"] = "LENT-GovernmentJob:Client:QuestionsMenu", 
        ["icon"] = "fa-solid fa-clipboard", ["text"] = "Ask Question",

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 2,           ["HAIR_Texture"] = 10,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 227,           ["mask_Texture"] = 11,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 77,          ["HA_Texture"] = 0,
        ["undershirts"] = 220,    ["U_Texture"] = 0,
        ["tops"] = 554,           ["T_Texture"] = 20,
        ["kevlar"] = -1,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 180,           ["A_Texture"] = 0,
        ["bags"] = 119,           ["B_Texture"] = 1,
        ["pants"] = 194,          ["P_Texture"] = 0,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = 11,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = 0, -- leave opacity at 1.0
    },

    -- [[ San Andreas Fire Department ]] --

    -- [[ Military ]] --
    ["MilitaryArmory"] = {
        ["coords"] = vector4(-2425.97, 3273.44, 32.98, 330.17), -- The start Coordinatos of the first mission

        ["ped"] = "mp_m_freemode_01",
        ["scenario"] = "WORLD_HUMAN_COP_IDLES", ["block_events"] = true, ["invincible"] = true, ["freeze"] = true,

        ["target"] = true,
        ["type"] = "client", ["event"] = "LENT-GovernmenJob:Client:OpenArmory",
        ["icon"] = "fa-solid fa-gun", ["text"] = "Armory", ["job"] = { ['military'] = 0, ['fib'] = 0, ['iaa'] = 0, ['upd'] = 0, ['sasp'] = 0, ['police'] = 0, ['bcso'] = 0, ['doc'] = 0, },

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
    
        ["mother"] = 45,        ["father"] = 45,                ["mix"] = 1.0,
    
        ["hair"] = 4,           ["HAIR_Texture"] = 1,           ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1,           ["hat_TEXTURE"] = 0,
        ["mask"] = 218,           ["mask_Texture"] = 3,
        ["glasses"] = 5,       ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 1,          ["HA_Texture"] = 0,
        ["undershirts"] = 218,    ["U_Texture"] = 0,
        ["tops"] = 538,           ["T_Texture"] = 10,
        ["kevlar"] = 101,         ["K_Texture"] = 0,
        ["decal"] = 0,          ["D_Texture"] = 0,
        ["accs"] = 175,           ["A_Texture"] = 0,
        ["bags"] = 0,           ["B_Texture"] = 0,
        ["pants"] = 172,          ["P_Texture"] = 2,
        ["shoes"] = 10,          ["S_Texture"] = 0,

        ["eye_COLOR"] = 1,
        ["makeup"] = -1,        ["makeup_OPACITY"] = 0.0,       ["makeup_COLOR"] = -1, -- leave opacity at 1.0
        ["lipstick"] = -1,      ["lipstick_OPACITY"] = 0.0,     ["lipstick_COLOR"] = -1, -- leave opacity at 1.0
        ["eyebrows"] = -1,      ["eyebrows_OPACITY"] = 0.0,     ["eyebrows_COLOR"] = -1, -- leave opacity at 1.0
        ["beard"] = -1,         ["beard_OPACITY"] = 1.0,        ["beard_COLOR"] = -1, -- leave opacity at 1.0
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
                    distance = 5.0
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