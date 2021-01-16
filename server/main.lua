ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
        TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, {_U('ooc_prefix', playerId), message}, args, {255, 50, 50})
        
	end
end)

RegisterCommand('a', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('a_prefix', playerId), args}, color = {255, 128, 0}})
	end
end, false)

RegisterCommand('id', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('id_prefix', playerId), args}, color = {0, 255, 128}})
	end
end, false)

RegisterCommand('police', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "police" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('police_prefix', name), args}, color = {0, 0, 250}})
        end
    end
end, false)

RegisterCommand('ambulance', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "ambulance" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('ambulance_prefix', name), args}, color = {250, 0, 0}})
        end
    end
end, false)

RegisterCommand('bennys', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "mechanic" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('bennys_prefix', name), args}, color = {204, 0, 82}})
        end
    end
end, false)

RegisterCommand('lsc', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "mechanic" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('lsc_prefix', name), args}, color = {51, 0, 102}})
        end
    end
end, false)

RegisterCommand('tdn', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "mechanic" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('tdn_prefix', name), args}, color = {51, 0, 0}})
        end
    end
end, false)

RegisterCommand('taxi', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "taxi" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('taxi_prefix', name), args}, color = {255, 255, 51}})
        end
    end
end, false)

--RegisterCommand('', function(playerId, args, rawCommand)
--	if playerId == 0 then
--		print('esx_rpchat: you can\'t use this command from console!')
--	else
--		args = table.concat(args, ' ')
--		local playerName = GetRealPlayerName(playerId)
--
--		TriggerClientEvent('chat:addMessage', -1, {args = {_U('a_prefix', playerName), args}, color = {0, 153, 204}})
--	end
--end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerId), args, {255, 50, 50})
	end
end, false)

RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerId), args, {83, 170, 230})
	end
end, false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
