# LENT-Police
*Script that enhances the realism of the normal qb-policejob. This is NOT meant to be seen as a full replacement. Though that will be the aim for this resource.*

## Dependencies
- qb-core
- ps-dispatch
- ps-mdt

## How to Install
- Add the Panic Button & MDT Item to your `qb-core/shared/items.lua`
```lua
		["mdt"] = {
			["name"] = "mdt", 
			["label"] = "MDT", 
			["weight"] = 1000, 
			["type"] = "item", 
			["image"] = "mdt.png",
			["unique"] = true,
			["useable"] = true,
			["shouldClose"] = true,
			["combinable"] = nil,
			["description"] = "Special Device for Police Information."
		},
		["panicbutton"] = {
			["name"] = "panicbutton", 
			["label"] = "Panic Button", 
			["weight"] = 0, 
			["type"] = "item", 
			["image"] = "panic.png",
			["unique"] = true,
			["useable"] = true,
			["shouldClose"] = true,
			["combinable"] = nil,
			["description"] = "Special button to send distress signal."
		},
```
- Add images form the `images` folder to your `inventory/html/images`
- Add the following snippet to `LENT-PedSpawner/peds.lua`
	- This is a ped that uses CUSTOM clothing from EUP. You will have to change the ID's or use a precreated ped such as "s_f_y_cop_01".
```lua
    ["MRPDVehicleSpawner"] = {
        ["coords"] = vector4(458.87, -1017.18, 28.18, 90.6), -- The start Coordinatos of the first mission
        
        ["ped"] = "mp_f_freemode_01", -- The model of chracter that you interact with
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD", -- The animation they are playing
        ["block_events"] = true, -- Will block the ped from moving when hit or bumped into
        ["invincible"] = true, -- Makes the ped invincible
        ["freeze"] = true, -- Freezes the ped in it's location
  
        ["weapon"] = false, -- Leave false when using Scenario
        ["weapon_hash"] = "", -- Should be hash like "WEAPON_CARBINERIFLE"
        ["hostile"] = false, -- Should the ped attack the player?

        ["target"] = true, -- True = Allows interaction | False = Doesn't allow
        ["type"] = "client",
        ["event"] = "LENT:TAKE:VEHICLE", 
        ["icon"] = "fa-solid fa-car", -- The icon that shows up
        ["text"] = "Select Vehicle", -- The text which is cheap "locale" support

        -- [[ Do recommand that you use a clothing menu to get the right ID's ]] --
        ["clothing"] = true, -- True if ped = "mp_m_freemode_01" || "mp_f_freemode_01" else leave false
        
        ["mother"] = 45, ["father"] = 45, ["mix"] = 1.0,
        
        ["hair"] = 87, ["HAIR_Texture"] = 8, ["HAIR_HIGHLIGHT"] = 0,
        ["hat"] = -1, ["hat_TEXTURE"] = 0,
        ["mask"] = -1, ["mask_Texture"] = 0,
        ["glasses"] = 11, ["glasses_TEXTURE"] = 0,
        
        ["hands"] = 19, ["HA_Texture"] = 0,
        ["undershirts"] = 247, ["U_Texture"] = 0,
        ["tops"] = 456, ["T_Texture"] = 1,
        ["kevlar"] = 57, ["K_Texture"] = 0,
        ["decal"] = 145, ["D_Texture"] = 1,
        ["accs"] = 126, ["A_Texture"] = 0,
        ["bags"] = 0, ["B_Texture"] = 0,
        ["pants"] = 166, ["P_Texture"] = 1,
        ["shoes"] = 25, ["S_Texture"] = 0,

        ["eye_COLOR"] = 2,
        ["makeup"] = -1, ["makeup_OPACITY"] = 1.0, ["makeup_COLOR"] = 1, -- leave opacity at 1.0
        ["lipstick"] = -1, ["lipstick_OPACITY"] = 1.0, ["lipstick_COLOR"] = 21, -- leave opacity at 1.0
        ["eyebrows"] = -1, ["eyebrows_OPACITY"] = 1.0, ["eyebrows_COLOR"] = 1, -- leave opacity at 1.0
        ["beard"] = -1, ["beard_OPACITY"] = 1.0, ["beard_COLOR"] = 1, -- leave opacity at 1.0
    },
```

### Optional
You can remove the Panic Button actions from the radial menu. Every config is different so I can't give an exact. You should go into the config and press `CONTROL+F` and search for `Button` then see what is linked in your police, ems jobs.

## Issues
|  Question |  Answer |
|----       |----     |
|           |         |

## Contributors
|  Rank       |  Member       | ID                 | Qualifications                       |
|----         |----           |----                |----                                  |
| Director    | [Lanzaned#2512](https://discordapp.com/users/871877975346405388) | [871877975346405388](https://discordapp.com/users/871877975346405388) | Javascript, XML, HTML, CSS, lua, SQL |

## Useful Links 
Discord: https://discord.lanzaned.com<br>
Github: https://github.lanzaned.com<br>
Documentation: https://lanzaned-development.gitbook.io/lanzaned-development-or-documentation/