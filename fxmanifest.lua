-- [[ Metadata ]] --
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'Izumi S. <https://discordapp.com/users/871877975346405388>'
description 'Lananed Development | Government Jobs'
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/LENT-GovJobs'
docs 'https://docs.lanzaned.com/'

-- [[ Version ]] --
version '0.0.0'

-- [[ Dependencies ]] --
dependencies {
    'qb-core',
}

-- [[ Files ]] --
ui_page 'html/index.html'

shared_scripts {
    -- Dependency Files
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    '@ox_lib/init.lua',
    -- Config Files
    'shared/*.lua',
}

server_scripts {
    -- SQL Dependency
    '@oxmysql/lib/MySQL.lua',
    -- Server Events
    'server/*.lua',
}

client_scripts {
    -- Polyzone Dependency
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    -- Client Events
    'client/*.lua',
    -- Functions
    'functions/*.lua'
}

files {
	'html/index.html',
	'html/vue.min.js',
	'html/script.js',
	'html/tablet-frame.png',
	'html/fingerprint.png',
	'html/main.css',
	'html/vcr-ocd.ttf'
}

-- [[ Tebex ]] --
lua54 'yes'