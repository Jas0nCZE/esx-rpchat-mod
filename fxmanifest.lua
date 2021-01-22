fx_version 'cerulean'

game 'gta5'

description 'This is the average esx_rpchat modified by Project-Entity'

version '1.3.1'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua'
}

dependency 'es_extended'
