RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

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

	end
end)
