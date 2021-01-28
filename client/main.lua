ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/a',  _U('a_help'),  {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/id',  _U('id_help'),  {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/police',   _U('police_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})	
	TriggerEvent('chat:addSuggestion', '/ambulance',   _U('ambulance_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/bennys',   _U('bennys_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/lsc',   _U('lsc_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})	
	TriggerEvent('chat:addSuggestion', '/tdn',   _U('tdn_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})	
	TriggerEvent('chat:addSuggestion', '/taxi',   _U('taxi_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/sheriff',   _U('sheriff_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/dado',   _U('dado_help'),   {{name = _U('generic_argument_name'), help = _U('generic_argument_help')}})	
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/a')
		TriggerEvent('chat:removeSuggestion', '/id')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/police')	
		TriggerEvent('chat:removeSuggestion', '/ambulance')
		TriggerEvent('chat:removeSuggestion', '/bennys')
		TriggerEvent('chat:removeSuggestion', '/lsc')
		TriggerEvent('chat:removeSuggestion', '/tdn')
		TriggerEvent('chat:removeSuggestion', '/taxi')
		TriggerEvent('chat:removeSuggestion', '/sheriff')
		TriggerEvent('chat:removeSuggestion', '/dado')
	end
end)

RegisterCommand(Config.DieCommand, function(id, args, rawCommand)
	local id = GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))
	local ped = PlayerPedId()
	if id == 0 then
		print(_U('no') )
	elseif IsPedInAnyVehicle(ped, false) then
		if Config.Tnotify then
			exports['t-notify']:Alert({
				style  =  'error',
				message  =  _U('no_dado')
			})
		elseif Config.ESX then
			ESX.ShowAdvancedNotification('Admin', GetPlayerName(NetworkGetEntityOwner(PlayerPedId())), _U('no_dado'), 'CHAR_BLOCKED', 2, false, false, 130)
		end
	else
		RequestAnimDict("anim@mp_player_intcelebrationmale@wank")
		while not HasAnimDictLoaded("anim@mp_player_intcelebrationmale@wank") do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, "anim@mp_player_intcelebrationmale@wank", "wank", -25.0, -8.0, -1, 1, 0, false, false, false)
			Citizen.Wait(1725)
	 	ClearPedTasks(ped)
		TriggerEvent('esx_rpchat:sendProximityMessage', id, _U('dado_prefix', id), math.random(1, 6), {255, 156, 43})
	end
end, false)
