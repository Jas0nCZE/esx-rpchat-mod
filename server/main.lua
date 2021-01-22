ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
        TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, {_U('oop_prefix', playerId).. "~w~" ..message}, args)
        
	end
end)

RegisterCommand(Config.HelpCommand, function(playerId, args, rawCommand)
	if playerId == 0 then
		print(_U('no') )
	else
		args = table.concat(args, ' ')

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('a_prefix', playerId), args}, color = {255, 128, 0}})
	end
end, false)

RegisterCommand(Config.IDCommand, function(playerId, args, rawCommand)
	if playerId == 0 then
		print(_U('no') )
	else
		args = table.concat(args, ' ')

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('id_prefix', playerId), args}, color = {0, 255, 128}})
	end
end, false)

RegisterCommand(Config.PoliceCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.PoliceJob then
        local src = source
        local msg = rawCommand:sub(7)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('police_prefix', name), args}, color = {0, 0, 250}})
        end
    elseif Config.Tnotify then
        print(_U('no_police')) 
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_police')
        })

    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_pol'), playerName, _U('no_police'), 'CHAR_BLOCKED', 1)
    end
end, false)

RegisterCommand(Config.AmbulanceCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.AmbulanceJob then
        local src = source
        local msg = rawCommand:sub(10)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

            TriggerClientEvent('chat:addMessage', -1, {args = {_U('ambulance_prefix', name), args}, color = {250, 0, 0}})
        end
    elseif Config.Tnotify then
        print (_U('no_amb'))
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_ambulance')
        })
    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_amb'), playerName, _U('no_ambulance'), 'CHAR_CALL911', 1)
    end
end, false)

RegisterCommand(Config.BennysCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.BennysJob then
        local src = source
        local msg = rawCommand:sub(7)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('bennys_prefix', name), args}, color = {204, 0, 82}})
        end

    elseif Config.Tnotify then
        print (_U('no_bennys'))
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_bennys')
        })
    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_bennys'), playerName, _U('no_bennys'), 'CHAR_CARSITE', 1)
    end
end, false)

RegisterCommand(Config.LSCCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.LSCJob then
        local src = source
        local msg = rawCommand:sub(4)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('lsc_prefix', name), args}, color = {51, 0, 102}})
        end
    elseif Config.Tnotify then
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_lsc')
        })
    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_lsc'), playerName, _U('no_lsc'), 'CHAR_LS_CUSTOMS', 1)
    end
end, false)

RegisterCommand(Config.TDNCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.TDNJob then
        local src = source
        local msg = rawCommand:sub(4)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('tdn_prefix', name), args}, color = {51, 0, 0}})
        end
    elseif Config.Tnotify then
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_tdn')
        })
    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_lsc'), playerName, _U('no_lsc'), 'CHAR_CHAT_CALL', 1)
    end
end, false)

RegisterCommand(Config.TaxiCommand, function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetRealPlayerName(source)
    if xPlayer.job.name == Config.TaxiJob then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetRealPlayerName(source)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('taxi_prefix', name), args}, color = {255, 255, 51}})
        end
    elseif Config.Tnotify then
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info', 
            duration = 3000,
            message = _U('no_taxi')
        })
    elseif Config.ESX then
        TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('job_taxi'), playerName, _U('no_taxi'), 'CHAR_TAXI', 1)
    end
end, false)

RegisterCommand(Config.meCommand, function(playerId, args, rawCommand)
	if playerId == 0 then
		print(_U('no') )
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerId), args, {255, 50, 50})
	end
end, false)

RegisterCommand(Config.doCommand, function(playerId, args, rawCommand)
	if playerId == 0 then
		print(_U('no') )
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
