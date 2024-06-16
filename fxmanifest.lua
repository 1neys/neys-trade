fx_version 'bodacious'
game 'gta5'
lua54 'yes'
author 'neys.lua'
description 'Trade Menu'
version '1.0.1'

client_scripts {
  'client/client.lua',
  'config.lua',
}

server_scripts {
  'server/server.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
}

escrow_ignore {
  'config.lua',
}
