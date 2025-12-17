fx_version 'cerulean'
game 'gta5'
author 'zqmvo'
description 'Advanced Discord Logging System for ox_inventory'
version '2.0.0'

server_scripts {
    'configs/sv_logs.lua',
    'server/sv_utils.lua',
    'server/sv_inventorylogs.lua',
    'server/sv_oxhook.lua',
    'server/sv_hooks.lua'
}

dependencies {
    'ox_inventory'
}

-- Metadata for resource management
metadata {
    name = 'Enhanced OX Inventory Logs',
    author = 'zqmvo',
    version = '2.0.0',
    description = 'Professional inventory logging system with Discord integration'
}