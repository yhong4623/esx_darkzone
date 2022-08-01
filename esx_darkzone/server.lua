ESX = nil
local count = 0
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord (name,message,first,second,three,four,five,color)
    local DiscordWebHook = 'https://discord.com/api/webhooks/879265634175811584/HjlfVlLsWzmndl9Gaw2tNhfL8dYxTAoo6eUuWfUx8LID_FJkhgwrY3zwEE_UAfYHL-ma'
    -- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
  local embeds = {
      {
          ["title"]=message,
		  ["timestamp"]=os.date('!%Y-%m-%dT%H:%M:%S'),
          ["type"]="rich",
          ['author']={
              ['name']= "暗區系統",
              ['icon_url']= 'https://i.imgur.com/H0DPdyq.png?1',
          },
          ['fields']={
              {
                  ["name"]= second,
                  ["value"]= three,
                  ["inline"]= true,
              },
              {
                  ["name"]= four,
                  ["value"] = five,
                  ["inline"] = true,
              },
          },
          ["description"]=first,
          ["color"]=color,
          ["footer"]=  {
              ["icon_url"]= 'https://i.imgur.com/H0DPdyq.png?1',
              ["text"]= "by INK#3561 and 派大星#8888",
         },
      }
  }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

RegisterNetEvent('esx_darkzone:inthezonemessage')
AddEventHandler('esx_darkzone:inthezonemessage', function()
    local count2 = count
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    count = count + 1
    TriggerClientEvent('esx:showNotification', -1, xPlayer.name .. '進入了~r~暗區~w~,' )
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**進入者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n進入前暗區人數", "\n進入後暗區人數", count2, count, 0x0099ff)
end)

RegisterNetEvent('esx_darkzone:leftthezonemessage')
AddEventHandler('esx_darkzone:leftthezonemessage', function()
    local count2 = count
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    count = count - 1
    TriggerClientEvent('esx:showNotification', -1, xPlayer.name .. '離開了~r~暗區~w~,' )
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**離開者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n離開前暗區人數", "\n離開後暗區人數",count2, count, 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead1')
AddEventHandler('esx_darkzone:dead1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "2043.45, 3651.28, 36.61", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead2')
AddEventHandler('esx_darkzone:dead2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1648.3, 3560.06, 35.32", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead3')
AddEventHandler('esx_darkzone:dead3', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1555.32, 3675.23, 34.68", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead4')
AddEventHandler('esx_darkzone:dead4', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1691.16, 3867.8, 34.91", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead5')
AddEventHandler('esx_darkzone:dead5', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1891.24, 3564.15, 38.27", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead6')
AddEventHandler('esx_darkzone:dead6', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1975.54, 3464.25, 43.49", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead8')
AddEventHandler('esx_darkzone:dead8', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "1870, 3688.55, 33.71", 0x7289da)
end)

RegisterNetEvent('esx_darkzone:dead8')
AddEventHandler('esx_darkzone:dead8', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = GetPlayerIdentifiers(source)[5]
    local steam = GetPlayerIdentifiers(source)[1]
    local discord2 = string.gsub(discord, "discord:", "")
    local time = os.date('%Y-%m-%d | %X')
    sendToDiscord("暗區紀錄", "暗區系統" .. " | " .. time , "**被重生者:**  " .. "<@" .. discord2  .. ">" .. "\n**steam16碼:**  "  .. steam .. "\n**職業:**  " .. xPlayer.job.label .. xPlayer.job.grade_label, "\n目前暗區人數", "\n重生點",count, "2021.18, 3849.7, 32.59", 0x7289da)
end)