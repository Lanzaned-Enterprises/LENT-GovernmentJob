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
Discord: https://discord.gg/kmKcHWGqbP<br>
Github: https://github.com/Lanzaned-Enterprises<br>
Documentation: https://lanzaned-development.gitbook.io/lanzaned-development-or-documentation/