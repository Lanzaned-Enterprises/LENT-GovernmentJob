-- TriggerServerEvent("LENT:TIMER:SET:SASP")
-- [[ Timer for Duty ]] --
local people = { }
timeTracker = {}

CreateThread(function()
	while true do 
		Wait(1000); -- Wait a second
		for k, v in pairs(timeTracker) do 
			timeTracker[k] = timeTracker[k] + 1;
		end 
	end 
end)

RegisterServerEvent("LENT:TIMER:SET:SASP", function()
    local PlayerName = GetPlayerName(source)
    local Player = QBCore.Functions.GetPlayer(source)

    local prettyTime = os.date("%A the %d of %B at %X")
    if has_value(people, PlayerName, time) then

        removeFirst(people, PlayerName, time)
        
        local time = timeTracker[source];
        local now = os.time();
        local startPlusNow = time + now;
        local minutesActive = os.difftime(now, startPlusNow) / 60;
        minutesActive = math.floor(math.abs(minutesActive))

        if Player.PlayerData.job.name == "sasp" then
            SASPEmbed(9502720, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **off** duty from: **San Andreas State Police**\n" .. prettyTime .. "\nDuration of Shift: " .. minutesActive .. " Minutes", "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "police" then
            LSPDEmbed(9502720, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **off** duty from: **Los Santos Police Department**\n" .. prettyTime .. "\nDuration of Shift: " .. minutesActive .. " Minutes", "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "bcso" then
            BCSOEmbed(9502720, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **off** duty from: **Blaine County Sheriff's Office**\n" .. prettyTime .. "\nDuration of Shift: " .. minutesActive .. " Minutes", "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "doc" then
            DOCEmbed(9502720, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **off** duty from: **Department of Corrections**\n" .. prettyTime .. "\nDuration of Shift: " .. minutesActive .. " Minutes", "Script by: https://discord.lanzaned.com/")
        end
        
        timeTracker[source] = nil;
    elseif not has_value(people, PlayerName, time) then
        table.insert(people, PlayerName)

        if Player.PlayerData.job.name == "sasp" then
            SASPEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **on** duty as: **San Andreas State Police**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "police" then
            LSPDEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **on** duty as: **Los Santos Police Department**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "bcso" then
            BCSOEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **on** duty as: **Blaine County Sheriff's Office**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "doc" then
            DOCEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " Has gone **on** duty as: **Department of Corrections**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        end
    end
    
    timeTracker[source] = 0;
end)

-- [[ Discord Embed ]] --
function SASPEmbed(color, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. Config.SASP_TITLE .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.SASP_WEBHOOK, 
    function(err, text, headers) 
    end, 
    'POST', 
    json.encode({
        username = Config.SASP_USERNAME, 
        embeds = content, 
        avatar_url = Config.SASP_IMAGE}
    ), {['Content-Type'] = 'application/json'})
end

function LSPDEmbed(color, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. Config.LSPD_TITLE .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.LSPD_WEBHOOK, 
    function(err, text, headers) 
    end, 
    'POST', 
    json.encode({
        username = Config.LSPD_USERNAME, 
        embeds = content, 
        avatar_url = Config.LSPD_IMAGE}
    ), {['Content-Type'] = 'application/json'})
end

function BCSOEmbed(color, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. Config.BCSO_TITLE .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.BCSO_WEBHOOK, 
    function(err, text, headers) 
    end, 
    'POST', 
    json.encode({
        username = Config.BCSO_USERNAME, 
        embeds = content, 
        avatar_url = Config.BCSO_IMAGE}
    ), {['Content-Type'] = 'application/json'})
end

function DOCEmbed(color, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. Config.DOC_TITLE .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.DOC_WEBHOOK, 
    function(err, text, headers) 
    end, 
    'POST', 
    json.encode({
        username = Config.DOC_USERNAME, 
        embeds = content, 
        avatar_url = Config.DOC_IMAGE}
    ), {['Content-Type'] = 'application/json'})
end

-- [[ Timer Functions ]] --
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function removeFirst(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return table.remove(tbl, i)
    end
  end
end

-- [[ Player Related ]] --
AddEventHandler("playerDropped", function(reason)
    local PlayerName = GetPlayerName(source)
    local Player = QBCore.Functions.GetPlayer(source)
    -- print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ')')
    if has_value(people, PlayerName, time) then

        removeFirst(people, PlayerName, time)

        local prettyTime = os.date("%A the %d of %B at %X")

        local time = timeTracker[source];
        local now = os.time();
        local startPlusNow = time + now;
        local minutesActive = os.difftime(now, startPlusNow) / 60;
        minutesActive = math.floor(math.abs(minutesActive))

        if Player.PlayerData.job.name == "sasp" then
            SASPEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " (" .. PlayerName .. ") Has gone **off** duty as: **San Andreas State Police**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "police" then
            LSPDEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " (" .. PlayerName .. ") Has gone **off** duty as: **San Andreas State Police**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "bcso" then
            BCSOEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " (" .. PlayerName .. ") Has gone **off** duty as: **San Andreas State Police**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        elseif Player.PlayerData.job.name == "doc" then
            DOCEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " (" .. PlayerName .. ") Has gone **off** duty as: **San Andreas State Police**\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        else
            SASPEmbed(007300, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname .. " (" .. PlayerName .. ") Has gone **off** duty. Department couldn't be identified.\nAt: " .. prettyTime, "Script by: https://discord.lanzaned.com/")
        end
        
        timeTracker[source] = nil;
    end
end)