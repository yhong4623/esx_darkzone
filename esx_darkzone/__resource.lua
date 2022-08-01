resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'ESX Dark zone'

version '2.0.0'

client_scripts {
    "@es_extended/locale.lua",
    "locales/en.lua",
    "config.lua",
    "client.lua"
}

server_scripts {
    "@es_extended/locale.lua",
    "locales/en.lua",
    "config.lua",
    "server.lua"
}

dependencies {
	'es_extended'
}