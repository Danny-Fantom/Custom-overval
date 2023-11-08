local holdingUp = false
local store = ''
local blipRobbery = nil
doorgaan = false

function DrawTxt(x,y, width, height, scale, text, r, g, b, a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then
        SetTextOutline()
    end
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width / 2, y - height / 2 + 0.005)
end

function Anim(dict,name)
	RequestAnimDict(dict)
    TaskPlayAnim((PlayerPedId()),dict,name,100.0, 200.0, 0.1, 120, 0.2, 0, 0, 0, 50003)
end

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function(winkel)
	holdingUp = false
	ESX.ShowNotification("Overval beindigt")
	disableRobbery(currentStore)
	doorgaan = false
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)
	PulseBlip(blipRobbery)
end)

CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.start)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("Overval")
		EndTextCommandSetBlipName(blip)
	end
end)

function disableRobbery(location)
	for kassasnaam,kassas in pairs(location.kassas) do
		kassas.aan = false
	end
	for kluisnaam,kluis in pairs(location.kluis) do
		kluis.aan = false
	end
	location.wordOvervallen = false
	holdingUp = false
end

function enableRobbery(location)
	for kassasnaam,kassas in pairs(location.kassas) do
		kassas.aan = true
	end
	for kluisnaam,kluis in pairs(location.kluis) do
		kluis.aan = true
	end
	location.wordOvervallen = true
	holdingUp = true
end

function whilerobberyactive(robbery)
	doorgaan = true
	while doorgaan do
		Wait(0)
		local xPlayer = PlayerPedId()
		local playerPos = GetEntityCoords(xPlayer)
		for kassasnaam,kassas in pairs(robbery.kassas) do
			distance = #(playerPos - kassas.locatie)
			if(kassas.aan and distance < Config.Marker.DrawDistance) then
				DrawMarker(Config.Marker.Type, kassas.locatie, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
					ESX.ShowHelpNotification("Leeg roven")
					if IsControlJustReleased(0, 38) then
					ClearPedTasks(xPlayer)
					FreezeEntityPosition(xPlayer, true)
					local result = exports['lockpick']:startLockpick()
					if result then
						if robbery.type == 0 then --winkel
							counter = 0
							exports['progressBars']:startUI(45000, "Plunderen")-- 18 x 2 x 14
							while counter < 18 
							do
								counter = counter + 1
								Anim("veh@break_in@0h@p_m_one@","low_force_entry_ds")
								Wait(2500) --2500 x 18 = 45000
							end
						end
						if robbery.type == 1 then --stripclub
							counter = 0
							exports['progressBars']:startUI(22500, "Geld pakken")-- 18 x 2 x 14
							while counter < 9 
							do
								counter = counter + 1
								Anim("veh@break_in@0h@p_m_one@","low_force_entry_ds")
								Wait(2500) -- 9 x 2 x 14
							end
						end
						if robbery.type == 2 then --humainlabs
							counter = 0
							exports['progressBars']:startUI(22500, "Openbreken")-- 18 x 2 x 14
							while counter < 9 
							do
								counter = counter + 1
								Anim("veh@break_in@0h@p_m_one@","low_force_entry_ds")
								Wait(2500) -- 9 x 2 x 14
							end
						end
						if robbery.type == 3 then --fantom huis
							counter = 0
							exports['progressBars']:startUI(5000, "Plunderen")-- 18 x 2 x 14
							while counter < 2 
							do
								counter = counter + 1
								Anim("veh@break_in@0h@p_m_one@","low_force_entry_ds")
								Wait(2500) --2500 x 18 = 45000
							end
						end
						if robbery.type == 4 then -- drugs huis 2
							counter = 0
							exports['progressBars']:startUI(7500, "Plunderen")-- 18 x 2 x 14
							while counter < 3 
							do
								counter = counter + 1
								Anim("veh@break_in@0h@p_m_one@","low_force_entry_ds")
								Wait(2500) --2500 x 18 = 45000
							end
						end
						if robbery.type == 5 then -- wapenwinkel
							if not HasAnimDictLoaded("missheist_jewel") then
								RequestAnimDict("missheist_jewel") 
							end
							counter = 0
							exports['progressBars']:startUI(45000, "Vetrine inslaan")-- 18 x 2 x 14
							while counter < 9 
							do
								counter = counter + 1
								Anim("missheist_jewel","smash_case")
								Wait(5000) -- 9 x 2 x 14
							end
                            TriggerServerEvent('esx_holdup:geefVezel')
						end
						FreezeEntityPosition(xPlayer, false)
						TriggerServerEvent('esx_holdup:geefBuit', robbery.kassaGeld)
						TriggerServerEvent('esx_holdup:geefBriefje')
						kassas.aan = false
					else
						FreezeEntityPosition(xPlayer, false)
						ESX.ShowNotification("Lockpick fout")
					end
					FreezeEntityPosition(xPlayer ,false)
				end
			end
		end
		for kluisnaam,kluis in pairs(robbery.kluis) do
			distance = #(playerPos - kluis.locatie)
			if(kluis.aan and distance < Config.Marker.DrawDistance) then
				DrawMarker(Config.Marker.Type, kluis.locatie, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
				if distance < Config.Marker.DrawDistance then
					ESX.ShowHelpNotification("Kluis leeg roven")
					if IsControlJustReleased(0, 38) then
						ESX.TriggerServerCallback('esx_holdup:BriefjeCheck', function(doorgaan) 
								if doorgaan then
									ClearPedTasks(xPlayer)
									FreezeEntityPosition(xPlayer, true)
									counter = 0
									exports['progressBars']:startUI(25000, "Grote stacks pakken")-- 18 x 2 x 14
									while counter < 10 
									do
										counter = counter + 1
										Anim("mini@safe_cracking","idle_base")
										Wait(2500) -- 9 x 2 x 14
									end
									TriggerServerEvent('esx_holdup:geefBuit', robbery.kluisGeld)
									kluis.aan = false
									doorgaan = false
									FreezeEntityPosition(xPlayer ,false)
								else
									ESX.ShowNotification("Geen kluis code")
								end
						end, "KluisCode")
					end
				end
			end
		end
	end
end

CreateThread(function()
	while true do
		Wait(0)
		local playerPos, letSleep = GetEntityCoords(PlayerPedId()), true
		for k,v in pairs(Stores) do
			local distance = #(playerPos - v.start)
			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
                    letSleep = false
					DrawMarker(Config.Marker.Type, v.start, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
					if distance < 2.0 then
						ESX.ShowHelpNotification('Druk ~INPUT_CONTEXT~ om ~o~overval~s~ te starten op ' ..  v.nameOfStore)
						if IsControlJustReleased(0, 38) then
							if v.type == 2 or v.type == 5 or v.type == 4 then
								if (IsPedArmed(PlayerPedId(), 4)) then -- vuurwapens
									ESX.TriggerServerCallback('esx_holdup:getPolice', function(police) 	
										if police >= v.PoliceNumberRequired then
											ESX.TriggerServerCallback('esx_holdup:ovCheck', function(allowed)
												print(allowed)
												if not allowed then
													enableRobbery(v)
													TriggerServerEvent('esx_holdup:startOV')
													TriggerServerEvent('esx_holdup:alertPolice', k)
													whilerobberyactive(v)
												else
													ESX.ShowNotification("Er is al een overval gaande")
												end
											end)
										else
											ESX.ShowNotification("Te weinig politie")
										end
									end)
								else
									ESX.ShowNotification('je vormt geen dreiging')
								end
							else
								if (IsPedArmed(PlayerPedId(), 4) or IsPedArmed(PlayerPedId(), 1)) then -- mesje
									ESX.TriggerServerCallback('esx_holdup:getPolice', function(police) 	
										if police >= v.PoliceNumberRequired then
											ESX.TriggerServerCallback('esx_holdup:ovCheck', function(allowed)
												print(allowed)
												if not allowed then
													enableRobbery(v)
													TriggerServerEvent('esx_holdup:startOV')
													ESX.TriggerServerCallback('esx_holdup:ovCheck', function(allowedd)
														print(allowedd)
													end)
													TriggerServerEvent('esx_holdup:alertPolice', k)
													whilerobberyactive(v)
												else
													ESX.ShowNotification("Er is al een overval gaande")
												end
											end)
										else
											ESX.ShowNotification("Te weinig politie")
										end
									end)
								else
									ESX.ShowNotification('je vormt geen dreiging')
								end
							end
						end
					end
				end
                break
			else
				letSleep = true
			end
			if holdingUp then
				letSleep = false
				if #(playerPos - v.start) > v.distance and v.wordOvervallen then
					TriggerServerEvent('esx_holdup:tooFar')
                    TriggerServerEvent('esx_holdup:stopOV')
					disableRobbery(v)
					holdingUp, letSleep = false, true
				end
			end
		end
		if letSleep then
			Wait(500)
		end
	end
end)


		--[[
		for k,v in pairs(Stores) do
			if(v.wordOvervallen and holdingUp) then
				--[[
				for kluisnaam,kluis in pairs(v.kluis) do
					distance = #(playerPos - kluis.locatie)
					if(kluis.aan and distance < Config.Marker.DrawDistance) then
						DrawMarker(Config.Marker.Type, kluis.locatie, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)
						if distance < Config.Marker.DrawDistance then
							ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))
							if IsControlJustReleased(0, 38) then
								ESX.TriggerServerCallback('esx_holdup:BriefjeCheck', function(doorgaan) 
										if doorgaan then
											TriggerServerEvent('esx_holdup:geefBuit', v.kluisGeld)
											kluis.aan = false
											holdingUp = false
											letSleep = true
										else
											ESX.ShowNotification("Geen kluis code")
										end
								end, "KluisCode")
							end
						end
					end
				end
			end
		end
		]]--
