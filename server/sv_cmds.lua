local QBCore = exports['qb-core']:GetCoreObject()

-- Commands
QBCore.Commands.Add("spike", Lang:t("commands.place_spike"), {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local length = tonumber(args[1])
        
        if length > Config.GlobalSettings['MaxSpikes'] then
            TriggerClientEvent('police:client:SpawnSpikeStrip', src, Config.GlobalSettings['MaxSpikes'])
        elseif length < Config.GlobalSettings['MaxSpikes'] then
            TriggerClientEvent('police:client:SpawnSpikeStrip', src, length)
        else
            TriggerClientEvent('police:client:SpawnSpikeStrip', src, Config.GlobalSettings['MaxSpikes'])
        end
    end
end)

QBCore.Commands.Add("szone", 'Place Speed Zone with Radius', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local ZoneSize = tonumber(args[1])

        if ZoneSize > Config.GlobalSettings['MaxZoneSize'] then
            TriggerClientEvent('LENT-GovernmentJob:Client:CreateSpeedZone', src, Config.GlobalSettings['MaxZoneSize'])
        elseif ZoneSize < Config.GlobalSettings['MaxZoneSize'] then
            TriggerClientEvent('LENT-GovernmentJob:Client:CreateSpeedZone', src, ZoneSize)
        else
            TriggerClientEvent('LENT-GovernmentJob:Client:CreateSpeedZone', src, Config.GlobalSettings['MaxZoneSize'])
        end
    end
end)


QBCore.Commands.Add("grantlicense", Lang:t("commands.license_grant"), {{name = "id", help = Lang:t('info.player_id')}, {name = "license", help = Lang:t('info.license_type')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.grade.level >= Config.GlobalSettings['LicenseRank'] then
        if args[2] == "driver" or args[2] == "weapon" then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not SearchedPlayer then return end
            local licenseTable = SearchedPlayer.PlayerData.metadata["licences"]
            if licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.license_already"), "error")
                return
            end
            licenseTable[args[2]] = true
            SearchedPlayer.Functions.SetMetaData("licences", licenseTable)
            TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("success.granted_license"), "success")
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.grant_license"), "success")
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.error_license_type"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.rank_license"), "error")
    end
end)

QBCore.Commands.Add("revokelicense", Lang:t("commands.license_revoke"), {{name = "id", help = Lang:t('info.player_id')}, {name = "license", help = Lang:t('info.license_type')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.grade.level >= Config.GlobalSettings['LicenseRank'] then
        if args[2] == "driver" or args[2] == "weapon" then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not SearchedPlayer then return end
            local licenseTable = SearchedPlayer.PlayerData.metadata["licences"]
            if not licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.error_license"), "error")
                return
            end
            licenseTable[args[2]] = false
            SearchedPlayer.Functions.SetMetaData("licences", licenseTable)
            TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("error.revoked_license"), "error")
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.revoke_license"), "success")
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.error_license"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.rank_revoke"), "error")
    end
end)

QBCore.Commands.Add("pobject", Lang:t("commands.place_object"), {{name = "type",help = Lang:t("info.poobject_object")}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local type = args[1]:lower()
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        if type == "cone" then
            TriggerClientEvent("police:client:spawnCone", src)
        elseif type == "barrier" then
            TriggerClientEvent("police:client:spawnBarrier", src)
        elseif type == "roadsign" then
            TriggerClientEvent("police:client:spawnRoadSign", src)
        elseif type == "tent" then
            TriggerClientEvent("police:client:spawnTent", src)
        elseif type == "light" then
            TriggerClientEvent("police:client:spawnLight", src)
        elseif type == "delete" then
            TriggerClientEvent("police:client:deleteObject", src)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("cuff", Lang:t("commands.cuff_player"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:CuffPlayer", src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("escort", Lang:t("commands.escort"), {}, false, function(source)
    local src = source
    TriggerClientEvent("police:client:EscortPlayer", src)
end)

QBCore.Commands.Add("callsign", Lang:t("commands.callsign"), {{name = "name", help = Lang:t('info.callsign_name')}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("callsign", table.concat(args, " "))
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    QBCore.Commands.Add("clearcasings", Lang:t("commands.clear_casign"), {}, false, function(source)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
            TriggerClientEvent("evidence:client:ClearCasingsInArea", src)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
        end
    end)
end

QBCore.Commands.Add("jail", Lang:t("commands.jail_player"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:JailPlayer", src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("unjail", Lang:t("commands.unjail_player"), {{name = "id", help = Lang:t('info.player_id')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local playerId = tonumber(args[1])
        TriggerClientEvent("prison:client:UnjailPerson", playerId)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    QBCore.Commands.Add("clearblood", Lang:t("commands.clearblood"), {}, false, function(source)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
            TriggerClientEvent("evidence:client:ClearBlooddropsInArea", src)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
        end
    end)
end

QBCore.Commands.Add("seizecash", Lang:t("commands.seizecash"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:SeizeCash", src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("sc", Lang:t("commands.softcuff"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:CuffPlayerSoft", src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("cam", Lang:t("commands.camera"), {{name = "camid", help = Lang:t('info.camera_id')}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:ActiveCamera", src, tonumber(args[1]))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("flagplate", Lang:t("commands.flagplate"), {{name = "plate", help = Lang:t('info.plate_number')}, {name = "reason", help = Lang:t('info.flag_reason')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local reason = {}
        for i = 2, #args, 1 do
            reason[#reason+1] = args[i]
        end
        Plates[args[1]:upper()] = {
            isflagged = true,
            reason = table.concat(reason, " ")
        }
        TriggerClientEvent('QBCore:Notify', src, Lang:t("info.vehicle_flagged", {vehicle = args[1]:upper(), reason = table.concat(reason, " ")}))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("unflagplate", Lang:t("commands.unflagplate"), {{name = "plate", help = Lang:t('info.plate_number')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        if Plates and Plates[args[1]:upper()] then
            if Plates[args[1]:upper()].isflagged then
                Plates[args[1]:upper()].isflagged = false
                TriggerClientEvent('QBCore:Notify', src, Lang:t("info.unflag_vehicle", {vehicle = args[1]:upper()}))
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.vehicle_not_flag"), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.vehicle_not_flag"), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("plateinfo", Lang:t("commands.plateinfo"), {{name = "plate", help = Lang:t('info.plate_number')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        if Plates and Plates[args[1]:upper()] then
            if Plates[args[1]:upper()].isflagged then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.vehicle_flagged', {plate = args[1]:upper(), reason = Plates[args[1]:upper()].reason}), 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.vehicle_not_flag"), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.vehicle_not_flag"), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("impound", Lang:t("commands.impound"), {{name = "price", help = Lang:t('info.impound_price')}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:ImpoundVehicle", src, false, tonumber(args[1]))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("paytow", Lang:t("commands.paytow"), {{name = "id", help = Lang:t('info.player_id')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local playerId = tonumber(args[1])
        local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
        if OtherPlayer then
            if OtherPlayer.PlayerData.job.name == "tow" then
                OtherPlayer.Functions.AddMoney("bank", 500, "police-tow-paid")
                TriggerClientEvent('QBCore:Notify', OtherPlayer.PlayerData.source, Lang:t("success.tow_paid"), 'success')
                TriggerClientEvent('QBCore:Notify', src, Lang:t("info.tow_driver_paid"))
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_towdriver"), 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("paylawyer", Lang:t("commands.paylawyer"), {{name = "id",help = Lang:t('info.player_id')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] or Player.PlayerData.job.name == "judge" then
        local playerId = tonumber(args[1])
        local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
        if not OtherPlayer then return end
        if OtherPlayer.PlayerData.job.name == "lawyer" then
            OtherPlayer.Functions.AddMoney("bank", 500, "police-lawyer-paid")
            TriggerClientEvent('QBCore:Notify', OtherPlayer.PlayerData.source, Lang:t("success.tow_paid"), 'success')
            TriggerClientEvent('QBCore:Notify', src, Lang:t("info.paid_lawyer"))
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_lawyer"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add('fine', Lang:t("commands.fine"), {{name = 'id', help = Lang:t('info.player_id')}, {name = 'amount', help = Lang:t('info.amount')}}, false, function(source, args)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local amount = tonumber(args[2])
    if biller.PlayerData.job.name == Config.Job['DOJ'] or biller.PlayerData.job.name == Config.Job['StatePolice'] or biller.PlayerData.job.name == Config.Job['Police'] or biller.PlayerData.job.name == Config.Job['Sheriff'] then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    billed.Functions.RemoveMoney('bank', amount, "paid-fine")
                    TriggerClientEvent('QBCore:Notify', source, Lang:t("info.fine_issued"), 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, Lang:t("info.received_fine"))
                    exports['Renewed-Banking']:addAccountMoney('police', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, Lang:t("error.amount_higher"), 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t("error.fine_yourself"), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t("error.not_online"), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("anklet", Lang:t("commands.anklet"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:CheckDistance", src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("ankletlocation", Lang:t("commands.ankletlocation"), {{name = "cid", help = Lang:t('info.citizen_id')}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        local citizenid = args[1]
        local Target = QBCore.Functions.GetPlayerByCitizenId(citizenid)
        if not Target then return end
        if Target.PlayerData.metadata["tracker"] then
            TriggerClientEvent("police:client:SendTrackerLocation", Target.PlayerData.source, src)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_anklet"), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

QBCore.Commands.Add("takedrivinglicense", Lang:t("commands.drivinglicense"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:SeizeDriverLicense", source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.on_duty_police_only"), 'error')
    end
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    QBCore.Commands.Add("takedna", Lang:t("commands.takedna"), {{name = "id", help = Lang:t('info.player_id')}}, true, function(source, args)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local OtherPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if not OtherPlayer or Player.PlayerData.job.name ~= Config.Job['Police'] or not Player.PlayerData.job.onduty then return end
        if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
            local info = {
                label = Lang:t('info.dna_sample'),
                type = "dna",
                dnalabel = DnaHash(OtherPlayer.PlayerData.citizenid)
            }
            if not Player.Functions.AddItem("filled_evidence_bag", 1, false, info) then return end
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.have_evidence_bag"), "error")
        end
    end)
end

QBCore.Commands.Add("store", "Stores your cruiser if you're near a police garage", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] and Player.PlayerData.job.onduty then 
        TriggerClientEvent("LENT-GovernmentJob:Client:StoreVehicle", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You're not near a garage or you're not a onduty police officer!", "error")
    end
end)
