-- [[ Metadata ]] --
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'Izumi S. <https://discordapp.com/users/871877975346405388>'
description 'Lananed Development | Police'
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/LENT-Nightclub'
docs 'https://lanzaned-development.gitbook.io/lanzaned-development-or-documentation/'

-- [[ Version ]] --
version '1.0.0'

-- [[ Dependencies ]] --
dependencies {
    'qb-core',
    'ps-dispatch',
    'ps-mdt',
}

-- [[ Files ]] --
shared_scripts {
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

client_scripts {
    -- Client Events
    'client/*.lua',
}

-- [[ Tebex ]] --
lua54 'yes'