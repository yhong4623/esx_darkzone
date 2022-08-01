-- 定義自己的暗區(下面輸入的xyz是中心點)
ESX = nil
local darkzone = {
    { ['x'] = 1838.96, ['y'] = 3673.77, ['z'] = 34.28},
} ---真正的暗區圈更改後記得也要把159 163 167 171 175 179 183 187行的下面的重生點改掉不然會出生在原本的暗區重生點 154行改復活時間150改復活時右下角的通知---
local notifin = false
local notifout = false
local closestZone = 1
local count = 0
local kills = 0
local people = false
local spawnpoint = 0


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

-- 定義暗區地圖標誌 
function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 49)
	SetBlipAlpha (blip, 128)

	-- create a blip in the middle
	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
	for k,zone in pairs(Config.darkzone) do

		CreateBlipCircle(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)

-- 定義暗區respawn
function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)

	ESX.UI.Menu.CloseAll()
end

-- 定義

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(10)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 10000000000
		for i = 1, #darkzone, 1 do
			dist = Vdist(darkzone[i].x, darkzone[i].y, darkzone[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(10)
	end
end)

-- 定義暗區文字
Citizen.CreateThread(function()
	while NetworkIsPlayerActive(PlayerId()) do
	    Citizen.Wait(0)
		local player = PlayerId()
		local ped = PlayerPedId()
	    if notifIn and not notifOut and not people then
		    count = count+1
			TriggerServerEvent('esx_darkzone:inthezonemessage')
	    elseif not notifIn and notifOut and people then
		    count = count-1
			TriggerServerEvent('esx_darkzone:leftthezonemessage')
		end
	end
end)


-- 定義
Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(10)
	end

	while true do
		Citizen.Wait(10)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(darkzone[closestZone].x, darkzone[closestZone].y, darkzone[closestZone].z, x, y, z)
		local no = false

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local _source = source
		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}
		
		if notifIn == false and IsEntityDead(playerPed) and no == false and dist <= 350.0 then
			no = true
			ESX.ShowNotification(_U('darkzone_norespawn'))
		elseif notifIn == ture and IsEntityDead(playerPed) == false and no == true then
			no = false
		end

		if dist <= 350.0 and IsEntityDead(playerPed) and no == false then
			-- ESX.ShowNotification(_U('darkzone_respawn'))
			ESX.ShowAdvancedNotification('暗區', '~r~醫療組', '~p~即將在5秒內復活', 'CHAR_BLANK_ENTRY', 7, true, true, 200)
		end

		if dist <= 350.0 and IsEntityDead(playerPed) and no == false then
			Citizen.Wait(5000) -- 1000 = 1 second/1 秒
			spawnpoint = math.random(1, 8)
			TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
			RespawnPed(playerPed, formattedCoords, 0.0)
			if spawnpoint == 1 then
				SetEntityCoords(playerPed, 2039.83, 3656.91, 34.3, true, true, true, false)
				print('a')
				TriggerServerEvent('esx_darkzone:dead1')
			elseif spawnpoint == 2 then
				SetEntityCoords(playerPed, 1648.3, 3560.06, 35.32, true, true, true, false)
				print('b')
				TriggerServerEvent('esx_darkzone:dead2')
			elseif spawnpoint == 3 then
				SetEntityCoords(playerPed, 1555.32, 3675.23, 34.68, true, true, true, false)
				print('c')
				TriggerServerEvent('esx_darkzone:dead3')
			elseif spawnpoint == 4 then
				SetEntityCoords(playerPed, 1691.16, 3867.8, 34.91, true, true, true, false)
				print('d')
				TriggerServerEvent('esx_darkzone:dead4')
			elseif spawnpoint == 5 then
				SetEntityCoords(playerPed, 1891.24, 3564.15, 38.27, true, true, true, false)
				print('e')
				TriggerServerEvent('esx_darkzone:dead5')
			elseif spawnpoint == 6 then
				SetEntityCoords(playerPed, 1954.22, 3440.79, 41.68, true, true, true, false)
				print('f')
				TriggerServerEvent('esx_darkzone:dead6')
			elseif spawnpoint == 7 then
				SetEntityCoords(playerPed, 1891.97, 3704.53, 32.89, true, true, true, false)
				print('g')
				TriggerServerEvent('esx_darkzone:dead7')
			elseif spawnpoint == 8 then
				SetEntityCoords(playerPed, 2021.18, 3849.7, 32.59, true, true, true, false)
				print('h')
				TriggerServerEvent('esx_darkzone:dead8')
			end
			StopScreenEffect('DeathFailOut')
		end

		if notifIn and not notifOut and not people then
			people = true
		elseif not notifIn and notifOut and people then
			people = false
		end

		if dist <= 350.0 then -- 範圍
			if not notifIn and no == false then
				ClearPlayerWantedLevel(PlayerId())
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#CE0000'>你已經進入暗區,請你注意安全</b>",
					type = "warning",
					theme = "metroui",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				notifIn = true
				notifOut = false
			end
		else
			if not notifOut and no == false then
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#1E90FF'>你已經離開暗區,請你注意安全!</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				notifOut = true
				notifIn = false
			end
		end
	end
end)
