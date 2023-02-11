# LENT-GovernmentJob
*This script is meant to replace `qb-policejob` It adds all departments such as SASP, LSPD(Default: police), BCSO, DOC & in some cases even UPD<sup>1</sup>*

## Subscripts
<sup>1</sup> - *UPD: Unified Police Deparmtent Ususally meant for players who run 1 police department or have it as a replacement for DOJ* 

## Dependencies
- qb-core
- ps-dispatch
- ps-mdt

## Disclaimer
- This script does **NOT** Come pre-configured and is not just plug and play. The members of your development team or yourself should be the ones setting up the coordinates, peds & zones! If you don't do this 90% of this rewrite will be inaccessible to you!
- I will set this script up for you but it will require me to have access to your `shared/shared.lua` and all `functions/*.lua` files!
    - I will need the ability to grab coordinates!
- There is bound to be bugs, unfinished code but as far as was tested the script **SHOULD** function as the normal police job!

## How to Install
- Add the Panic Button & MDT Item to your `qb-core/shared/items.lua`
```lua
	["mdt"] 						 = {["name"] = "mdt",							["label"] = "MDT",						["weight"] = 1000,		["type"] = "item",		["image"] = "mdt.png",					["unique"] = true,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,  ["description"] = "Special Device for Police Information."},
	["panicbutton"] 				 = {["name"] = "panicbutton",					["label"] = "Panic Button"				["weight"] = 0,			["type"] = "item",		["image"] = "panic.png",				["unique"] = true,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,  ["description"] = "Special button to send distress signal."},
```
- Add images form the `images` folder to your `inventory/html/images`
- Make sure the jobs are labled as following.
    - You are offcourse free to change the ranks
        - You can change the job names if you know what you're doing.
```lua
['upd'] = {
        label = 'Unified Police Department',
        defaultDuty = false,
		offDutyPay = false,
        grades = {
            ['1'] = {
                name = 'Assistant Commissioner',
                payment = 0
            },
            ['2'] = {
                name = 'Deputy Commissioner',
                payment = 0
            },
            ['3'] = {
                name = 'Commissioner',
                payment = 0
            },
            ['4'] = {
                name = 'Assistant Director',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['5'] = {
                name = 'Deputy Director',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['6'] = {
                name = 'Director',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
        },
    },
    ['sasp'] = {
        label = 'San Andreas State Police',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 0
            },
            ['1'] = {
                name = 'Trooper',
                payment = 0
            },
            ['2'] = {
                name = 'Sergeant',
                payment = 0
            },
            ['3'] = {
                name = 'Lieutenant',
                payment = 0
            },
            ['4'] = {
                name = 'Captain',
                payment = 0
            },
            ['5'] = {
                name = 'Assistant Chief',
                payment = 0,
                isboss = true,
            },
            ['6'] = {
                name = 'Chief',
                payment = 0,
                isboss = true,
            },
            ['7'] = {
                name = 'Assistant Commissioner',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['8'] = {
                name = 'Deputy Commissioner',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['9'] = {
                name = 'Commissioner',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
        },
    },
	['police'] = {
		label = 'Los Santos Police Department',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			['0'] = {
                name = 'Officer Ⅰ',
                payment = 0
            },
			['1'] = {
                name = 'Officer Ⅱ',
                payment = 0
            },
			['2'] = {
                name = 'Corporal',
                payment = 0
            },
			['3'] = {
                name = 'Sergeant Ⅰ',
                payment = 0
            },
            ['4'] = {
                name = 'Sergeant Ⅱ',
                payment = 0
            },
			['5'] = {
                name = 'Staff Sergeant Ⅰ',
                payment = 0
            },
			['6'] = {
                name = 'Staff Sergeant Ⅱ',
                payment = 0
            },
			['7'] = {
                name = 'Lieutenant',
                payment = 0
            },
            ['8'] = {
                name = 'Captain',
                payment = 0
            },
			['9'] = {
                name = 'Commander',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
			['10'] = {
                name = 'Deputy Chief of Police',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['11'] = {
                name = 'Assistant Chief of Police',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
			['12'] = {
                name = 'Chief of Police',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
        },
	},
	['bcso'] = {
		label = "Blaine County Sheriff's Office",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Deputy Sheriff Trainee',
                payment = 0
            },
			['1'] = {
                name = 'Deputy Sheriff Ⅰ',
                payment = 0
            },
			['2'] = {
                name = 'Deputy Sheriff Ⅱ',
                payment = 0
            },
			['3'] = {
                name = 'Corporal',
                payment = 0
            },
            ['4'] = {
                name = 'Senior Corporal',
                payment = 0
            },
			['5'] = {
                name = 'Sergeant Ⅰ',
                payment = 0
            },
            ['6'] = {
                name = 'Sergeant Ⅱ',
                payment = 0
            },
			['7'] = {
                name = 'Lieutenant',
                payment = 0
            },
            ['8'] = {
                name = 'Captain',
                payment = 0
            },
			['9'] = {
                name = 'Commander',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
			['10'] = {
                name = 'Assistant Sheriff',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['11'] = {
                name = 'Undersheriff',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
			['12'] = {
                name = 'Sheriff',
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
        },
	},
    ['doc'] = {
        label = "Department of Corrections",
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = "Cadet",
                payment = 0,
            },
            ['1'] = {
                name = "Officer",
                payment = 0,
            },
            ['2'] = {
                name = "Sergeant",
                payment = 0,
            },
            ['3'] = {
                name = "Lieutenant",
                payment = 0,
            },
            ['4'] = {
                name = "Captain",
                payment = 0,
            },
            ['5'] = {
                name = "Associate Warden",
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['6'] = {
                name = "Chief Deputy Warden",
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['7'] = {
                name = "Warden",
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
            ['8'] = {
                name = "Department Director",
                payment = 0,
                isboss = true,
                bankAuth = true,
            },
        }
    },
```

## Optional Settings / Dependencies
- This script will work fine with renewed-phone / renewed-banking
- This script will NOT work if you have the default `qb-policejob`
- Settings for zones can be found in `client/cl_zones.lua`
- Settings for peds can be found in `client/cl_peds.lua`

### Optional
You can remove the Panic Button actions from the radial menu. Every config is different so I can't give an exact. You should go into the config and press `CONTROL+F` and search for `Button` then see what is linked in your police, ems jobs.

## Target Settings
**When you create zones yourself these are some important events that some zones should be able to trigger upon use!**
```
# Duty Settings
LENT-GovernmentJob:ToggleDuty

# Evidence Lockers
Evidence Lockers: LENT-GovernmentJob:Client:CheckZone

# Armory Settings
qb-sasp:client:openArmoury
qb-police:client:openArmoury
qb-bcso:client:openArmoury
LENT-GovernmenJob:Client:EMSArmory

# Fingerprint
qb-police:client:scanFingerPrint

# Stashes
qb-police:client:openStash

# Trash
qb-police:client:openTrash
```
**If you're using peds that are custom placed there are additional events that you can trigger!**
*Peds can also trigger all items above!*
```
# Select Vehicle
LENT-GovernmentJob:Client:SelectVehicle

# Questions Menu
LENT-GovernmentJob:Client:QuestionsMenu
Can be modified in "client/cl_desks.lua"
```

## Issues
|  Question |  Answer |
|----       |----     |
|           |         |

## Contributors
|  Rank       |  Member       | ID                 | Qualifications                       |
|----         |----           |----                |----                                  |
| Director    | [Lanzaned#2512](https://discordapp.com/users/871877975346405388) | [871877975346405388](https://discordapp.com/users/871877975346405388) | Javascript, XML, HTML, CSS, lua, SQL |

## Discord Profiles
<div allign="center">

<a href="https://discordapp.com/users/871877975346405388"><img width="45%" src="https://discord.c99.nl/widget/theme-3/871877975346405388.png"/></a>

</div>

## Useful Links 
Discord: https://discord.lanzaned.com<br>
Github: https://github.lanzaned.com<br>
Documentation: https://docs.lanzaned.com/

## Sponsors
San Andreas Life: https://sal.lanzaned.com/


