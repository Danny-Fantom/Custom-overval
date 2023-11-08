overvalgaande = false
starter = nil

RegisterNetEvent('playerDropped')
AddEventHandler('playerDropped', function(reason)
	local source = source
    local player = GetPlayerName(source)
    if player == starter then
		for _, xPlayer in pairs(ESX.GetExtendedPlayers('job', 'police')) do
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Overval Gestopt")
			TriggerClientEvent('esx_holdup:killBlip', xPlayer.source)
			starter = nil
		end
            starter = nil
            overvalgaande = false
    end
end)

RegisterServerEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	local source = source
	for _, xPlayer in pairs(ESX.GetExtendedPlayers('job', 'police')) do
		TriggerClientEvent('esx:showNotification', xPlayer.source, "Overval Gestopt")
		TriggerClientEvent('esx_holdup:killBlip', xPlayer.source)
	end
    for _, xPlayer in pairs(ESX.GetExtendedPlayers('job', 'kmar')) do
		TriggerClientEvent('esx:showNotification', xPlayer.source, "Overval Gestopt")
		TriggerClientEvent('esx_holdup:killBlip', xPlayer.source)
	end
    for _, xPlayer in pairs(ESX.GetExtendedPlayers('job', 'dsi')) do
		TriggerClientEvent('esx:showNotification', xPlayer.source, "Overval Gestopt")
		TriggerClientEvent('esx_holdup:killBlip', xPlayer.source)
	end
	overvalgaande = false
	TriggerClientEvent('esx_holdup:tooFar', source)
end)

RegisterServerEvent('esx_holdup:startOV')
AddEventHandler('esx_holdup:startOV', function()
	local source = source
	starter = GetPlayerName(source)
	overvalgaande = true
end)

RegisterServerEvent('esx_holdup:stopOV')
AddEventHandler('esx_holdup:stopOV', function()
	overvalgaande = false
end)

RegisterServerEvent('esx_holdup:geefBuit')
AddEventHandler('esx_holdup:geefBuit', function(geld)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addAccountMoney('black_money', geld, "Robbery")
end)

RegisterServerEvent('esx_holdup:geefExtraBuit')
AddEventHandler('esx_holdup:geefExtraBuit', function(ItemNaam)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(ItemNaam, 1)
end)

RegisterServerEvent('esx_holdup:geefBriefje')
AddEventHandler('esx_holdup:geefBriefje', function()
	local source  = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local briefjescount = xPlayer.getInventoryItem("KluisCode").count
	if (briefjescount < 1) then
		xPlayer.addInventoryItem("KluisCode", 1)
	end
end)
RegisterServerEvent('esx_holdup:geefVezel')
AddEventHandler('esx_holdup:geefVezel', function()
	local source  = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem("ballistic", 1)
end)

ESX.RegisterServerCallback('esx_holdup:BriefjeCheck', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if(xPlayer.getInventoryItem("KluisCode").count > 0) then
		xPlayer.removeInventoryItem("KluisCode",1)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_holdup:ovCheck', function(source, cb)
	cb(overvalgaande)
end)


--[[
  ESX.RegisterServerCallback('esx_holdup:robberyStarted', function(source, cb, currentStore)
	local source  = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	if Stores[currentStore] then
		local store = Stores[currentStore]
		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRob and store.lastRobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastRobbed)))
			return
			cb(false)
		end
		if not rob then
			local xPlayersPopo = ESX.GetExtendedPlayers('job', 'police')
			if #xPlayersPopo >= Config.PoliceNumberRequired then
				rob = true
				for _, xPlayer in pairs(xPlayersPopo) do
					TriggerClientEvent('esx:showNotification', xPlayer.source, _U('rob_in_prog', store.nameOfStore))
					TriggerClientEvent('esx_holdup:setBlip', xPlayer.source, Stores[currentStore].position)
				end
				TriggerClientEvent('esx:showNotification', source, _U('started_to_rob', store.nameOfStore))
				TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('esx_holdup:currentlyRobbing', source, currentStore)	
				Stores[currentStore].lastRobbed = os.time()
				rob = false
				cb(true)
			else
				TriggerClientEvent('esx:showNotification', source, _U('min_police', Config.PoliceNumberRequired))
				cb(false)
			end
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
			cb(false)
		end
	end
  end)

  ]]--
  
ESX.RegisterServerCallback('esx_holdup:getPolice', function(source, cb)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')
	local politieAantal = 0
	for i=1, #(xPlayers) do 
		politieAantal = politieAantal + 1
	end
    local xPlayers = ESX.GetExtendedPlayers('job', 'kmar')
        for i=1, #(xPlayers) do 
		politieAantal = politieAantal + 1
	end
    local xPlayers = ESX.GetExtendedPlayers('job', 'dsi')
        for i=1, #(xPlayers) do 
		politieAantal = politieAantal + 1
	end
	cb(politieAantal)
end)

RegisterServerEvent('esx_holdup:alertPolice')
AddEventHandler('esx_holdup:alertPolice', function(currentStore)
    local store = Stores[currentStore]
	local xPlayers = ESX.GetExtendedPlayers('job', 'police')
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]
		TriggerClientEvent('esx:showNotification', xPlayer.source,"Stil alarm op " ..  store.nameOfStore)
		TriggerClientEvent('esx_holdup:setBlip', xPlayer.source, Stores[currentStore].start)
	end
    local xPlayers = ESX.GetExtendedPlayers('job', 'kmar')
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]
		TriggerClientEvent('esx:showNotification', xPlayer.source,"Stil alarm op " ..  store.nameOfStore)
		TriggerClientEvent('esx_holdup:setBlip', xPlayer.source, Stores[currentStore].start)
	end
    local xPlayers = ESX.GetExtendedPlayers('job', 'dsi')
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]
		TriggerClientEvent('esx:showNotification', xPlayer.source,"Stil alarm op " ..  store.nameOfStore)
		TriggerClientEvent('esx_holdup:setBlip', xPlayer.source, Stores[currentStore].start)
	end
end)
