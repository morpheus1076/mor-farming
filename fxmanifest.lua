-- Resource Metadata
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
games        { 'rdr3', 'gta5' }

name 'mor-farming'
author 'morpheus1076'
description 'Farming with Seeds?'
version '0.0.1'

client_script {	
			"client.lua",
			"config.lua"
			}

server_script {"server.lua"}

shared_script {'@ox_lib/init.lua'}
