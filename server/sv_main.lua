-- Variables
local Plates = {}
local PlayerStatus = {}
local Casings = {}
local BloodDrops = {}
local FingerDrops = {}
local Objects = {}
local QBCore = exports['qb-core']:GetCoreObject()
local updatingCops = false

-- Functions
local function UpdateBlips()
    local dutyPlayers = {}
    local players = QBCore.Functions.GetQBPlayers()

    for _, v in pairs(players) do
        if v and (v.PlayerData.job.name == Config.Job['DOJ'] or v.PlayerData.job.name == Config.Job['StatePolice'] or v.PlayerData.job.name == Config.Job['Police'] or v.PlayerData.job.name == Config.Job['Sheriff'] or v.PlayerData.job.name == Config.Job['Corrections'] or v.PlayerData.job.name == Config.Job['FireDepartment']) and v.PlayerData.job.onduty then
            local coords = GetEntityCoords(GetPlayerPed(v.PlayerData.source))
            local heading = GetEntityHeading(GetPlayerPed(v.PlayerData.source))
            local ped = GetPlayerPed(v.PlayerData.source)
            local pedVehicle = GetVehiclePedIsIn(ped, false) 
            local vehicleType = GetVehicleType(pedVehicle)

            if pedVehicle ~= 0 and vehicleType == "automobile" then
                blipNum = 672
                blipSize = Config.UnitblipSettings['VehicleBlipSize']
            elseif pedVehicle ~= 0 and vehicleType == "bike" then
                blipNum = 348
                blipSize = Config.UnitblipSettings['VehicleBlipSize']
            elseif pedVehicle ~= 0 and vehicleType == "boat" then
                blipNum = 427
                blipSize = Config.UnitblipSettings['VehicleBlipSize']
            elseif pedVehicle ~= 0 and vehicleType == "heli" then
                blipNum = 422
                blipSize = Config.UnitblipSettings['VehicleBlipSize']
            elseif pedVehicle ~= 0 and vehicleType == "plane" then
                blipNum = 423
                blipSize = Config.UnitblipSettings['VehicleBlipSize']
            else
                blipNum = 1
                blipSize = 0.8
            end

            if v.PlayerData.job.name == Config.Job['DOJ'] then
                blipColorNum = Config.UnitblipSettings['DOJColor']
            elseif v.PlayerData.job.name == Config.Job['StatePolice'] then
                blipColorNum = Config.UnitblipSettings['SASPColor']
            elseif v.PlayerData.job.name == Config.Job['Police'] then
                blipColorNum = Config.UnitblipSettings['LSPDColor']
            elseif v.PlayerData.job.name == Config.Job['Sheriff'] then
                blipColorNum = Config.UnitblipSettings['BCSOColor']
            elseif v.PlayerData.job.name == Config.Job['Corrections'] then
                blipColorNum = Config.UnitblipSettings['DOCColor']
            elseif v.PlayerData.job.name == Config.Job['FireDepartment'] then
                blipColorNum = Config.UnitblipSettings['SAFDColor']
            else 
                blipColorNum = Config.UnitblipSettings['FallBackBlip']
            end
         
            dutyPlayers[#dutyPlayers+1] = {
                source = v.PlayerData.source,
                label = v.PlayerData.metadata["callsign"],
                job = v.PlayerData.job.name,
                blipNum = blipNum,
                blipSize = blipSize,
                blipColorNum= blipColorNum,
                location = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                    w = heading
                }
            }
        end
    end

    TriggerClientEvent("police:client:UpdateBlips", -1, dutyPlayers)
end

local function CreateBloodId()
    if BloodDrops then
        local bloodId = math.random(10000, 99999)
        while BloodDrops[bloodId] do
            bloodId = math.random(10000, 99999)
        end
        return bloodId
    else
        local bloodId = math.random(10000, 99999)
        return bloodId
    end
end

local function CreateFingerId()
    if FingerDrops then
        local fingerId = math.random(10000, 99999)
        while FingerDrops[fingerId] do
            fingerId = math.random(10000, 99999)
        end
        return fingerId
    else
        local fingerId = math.random(10000, 99999)
        return fingerId
    end
end

local function CreateCasingId()
    if Casings then
        local caseId = math.random(10000, 99999)
        while Casings[caseId] do
            caseId = math.random(10000, 99999)
        end
        return caseId
    else
        local caseId = math.random(10000, 99999)
        return caseId
    end
end

local function CreateObjectId()
    if Objects then
        local objectId = math.random(10000, 99999)
        while Objects[objectId] do
            objectId = math.random(10000, 99999)
        end
        return objectId
    else
        local objectId = math.random(10000, 99999)
        return objectId
    end
end

local function IsVehicleOwned(plate)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    return result
end

local function GetCurrentCops()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.Job['Police'] and v.PlayerData.job.onduty then
            amount += 1
        end
    end
    return amount
end

local function DnaHash(s)
    local h = string.gsub(s, ".", function(c)
        return string.format("%02x", string.byte(c))
    end)
    return h
end

RegisterNetEvent('police:server:SendTrackerLocation', function(coords, requestId)
    local Target = QBCore.Functions.GetPlayer(source)
    local msg = Lang:t('info.target_location', {firstname = Target.PlayerData.charinfo.firstname, lastname = Target.PlayerData.charinfo.lastname})
    local alertData = {
        title = Lang:t('info.anklet_location'),
        coords = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        description = msg
    }
    TriggerClientEvent("police:client:TrackerMessage", requestId, msg, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", requestId, alertData)
end)

-- Items
QBCore.Functions.CreateUseableItem("handcuffs", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player.Functions.GetItemByName("handcuffs") then return end
    TriggerClientEvent("police:client:CuffPlayerSoft", src)
end)

QBCore.Functions.CreateUseableItem("moneybag", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Player.Functions.GetItemByName("moneybag") or not item.info or item.info == "" or Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] or not Player.Functions.RemoveItem("moneybag", 1, item.slot) then return end
    Player.Functions.AddMoney("cash", tonumber(item.info.cash), "used-moneybag")
end)

-- Callbacks
QBCore.Functions.CreateCallback('police:server:isPlayerDead', function(_, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    cb(Player.PlayerData.metadata["isdead"])
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    QBCore.Functions.CreateCallback('police:GetPlayerStatus', function(_, cb, playerId)
        local Player = QBCore.Functions.GetPlayer(playerId)
        local statList = {}
        if Player then
            if PlayerStatus[Player.PlayerData.source] and next(PlayerStatus[Player.PlayerData.source]) then
                for k in pairs(PlayerStatus[Player.PlayerData.source]) do
                    statList[#statList+1] = PlayerStatus[Player.PlayerData.source][k].text
                end
            end
        end
        cb(statList)
    end)
end

QBCore.Functions.CreateCallback('police:IsSilencedWeapon', function(source, cb, weapon)
    local Player = QBCore.Functions.GetPlayer(source)
    local itemInfo = Player.Functions.GetItemByName(QBCore.Shared.Weapons[weapon]["name"])
    local retval = false
    if itemInfo then
        if itemInfo.info and itemInfo.info.attachments then
            for k in pairs(itemInfo.info.attachments) do
                if itemInfo.info.attachments[k].component == "COMPONENT_AT_AR_SUPP_02" or
                    itemInfo.info.attachments[k].component == "COMPONENT_AT_AR_SUPP" or
                    itemInfo.info.attachments[k].component == "COMPONENT_AT_PI_SUPP_02" or
                    itemInfo.info.attachments[k].component == "COMPONENT_AT_PI_SUPP" then
                    retval = true
                end
            end
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('police:GetDutyPlayers', function(_, cb)
    local dutyPlayers = {}
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.Job['DOJ'] or v.PlayerData.job.name == Config.Job['StatePolice'] or v.PlayerData.job.name == Config.Job['Police'] or v.PlayerData.job.name == Config.Job['Sheriff'] or v.PlayerData.job.name == Config.Job['Corrections'] and v.PlayerData.job.onduty then
            dutyPlayers[#dutyPlayers+1] = {
                source = v.PlayerData.source,
                label = v.PlayerData.metadata["callsign"],
                job = v.PlayerData.job.name
            }
        end
    end
    cb(dutyPlayers)
end)

QBCore.Functions.CreateCallback('police:GetImpoundedVehicles', function(_, cb)
    local vehicles = {}
    MySQL.query('SELECT * FROM player_vehicles WHERE state = ?', {2}, function(result)
        if result[1] then
            vehicles = result
        end
        cb(vehicles)
    end)
end)

QBCore.Functions.CreateCallback('police:IsPlateFlagged', function(_, cb, plate)
    local retval = false
    if Plates and Plates[plate] then
        if Plates[plate].isflagged then
            retval = true
        end
    end
    cb(retval)
end)

QBCore.Functions.CreateCallback('police:GetCops', function(_, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.Job['DOJ'] or v.PlayerData.job.name == Config.Job['StatePolice'] or v.PlayerData.job.name == Config.Job['Police'] or v.PlayerData.job.name == Config.Job['Sheriff'] or v.PlayerData.job.name == Config.Job['Corrections'] and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('police:server:IsPoliceForcePresent', function(_, cb)
    local retval = false
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.Job['DOJ'] or v.PlayerData.job.name == Config.Job['StatePolice'] or v.PlayerData.job.name == Config.Job['Police'] or v.PlayerData.job.name == Config.Job['Sheriff'] or v.PlayerData.job.name == Config.Job['Corrections'] and v.PlayerData.job.grade.level >= 2 then
            retval = true
            break
        end
    end
    cb(retval)
end)

-- Events
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        CreateThread(function()
            MySQL.query("DELETE FROM stashitems WHERE stash = 'policetrash'")
        end)
    end
end)

RegisterNetEvent('police:server:TakeOutImpound', function(plate, garage)
    local src = source
    local playerPed = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = Config.Locations["impound"][garage]
    if #(playerCoords - targetCoords) > 10.0 then return DropPlayer(src, "Attempted exploit abuse") end

    MySQL.update('UPDATE player_vehicles SET state = ? WHERE plate = ?', {0, plate})
    TriggerClientEvent('QBCore:Notify', src, Lang:t("success.impound_vehicle_removed"), 'success')
end)

RegisterNetEvent('police:server:CuffPlayer', function(playerId, isSoftcuff)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(src)
    local CuffedPlayer = QBCore.Functions.GetPlayer(playerId)
    -- if not Player or not CuffedPlayer or (not Player.Functions.GetItemByName("handcuffs") and Player.PlayerData.job.name ~= Config.Job['DOJ'] or Player.PlayerData.job.name ~= Config.Job['StatePolice'] or Player.PlayerData.job.name ~= Config.Job['Police'] or Player.PlayerData.job.name ~= Config.Job['Sheriff'] or Player.PlayerData.job.name ~= Config.Job['Corrections']) then return end

    if (Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] or Player.PlayerData.job.name == Config.Job['FireDepartment']) then
        TriggerClientEvent("police:client:GetCuffed", CuffedPlayer.PlayerData.source, Player.PlayerData.source, isSoftcuff)
    end
end)

RegisterNetEvent('police:server:EscortPlayer', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(source)
    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not EscortPlayer then return end

    if (Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections'] or Player.PlayerData.job.name == Config.Job['FireDepartment']) or (EscortPlayer.PlayerData.metadata["ishandcuffed"] or EscortPlayer.PlayerData.metadata["isdead"] or EscortPlayer.PlayerData.metadata["inlaststand"]) then
        TriggerClientEvent("police:client:GetEscorted", EscortPlayer.PlayerData.source, Player.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_cuffed_dead"), 'error')
    end
end)

RegisterNetEvent('police:server:KidnapPlayer', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(source)
    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not EscortPlayer then return end

    if EscortPlayer.PlayerData.metadata["ishandcuffed"] or EscortPlayer.PlayerData.metadata["isdead"] or EscortPlayer.PlayerData.metadata["inlaststand"] then
        TriggerClientEvent("police:client:GetKidnappedTarget", EscortPlayer.PlayerData.source, Player.PlayerData.source)
        TriggerClientEvent("police:client:GetKidnappedDragger", Player.PlayerData.source, EscortPlayer.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_cuffed_dead"), 'error')
    end
end)

RegisterNetEvent('police:server:SetPlayerOutVehicle', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    if not QBCore.Functions.GetPlayer(src) or not EscortPlayer then return end

    if EscortPlayer.PlayerData.metadata["ishandcuffed"] or EscortPlayer.PlayerData.metadata["isdead"] then
        TriggerClientEvent("police:client:SetOutVehicle", EscortPlayer.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_cuffed_dead"), 'error')
    end
end)

RegisterNetEvent('police:server:PutPlayerInVehicle', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    if not QBCore.Functions.GetPlayer(src) or not EscortPlayer then return end

    if EscortPlayer.PlayerData.metadata["ishandcuffed"] or EscortPlayer.PlayerData.metadata["isdead"] then
        TriggerClientEvent("police:client:PutInVehicle", EscortPlayer.PlayerData.source)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.not_cuffed_dead"), 'error')
    end
end)

RegisterNetEvent('police:server:BillPlayer', function(playerId, price)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(src)
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not OtherPlayer or Player.PlayerData.job.name ~= Config.Job['DOJ'] or Player.PlayerData.job.name ~= Config.Job['StatePolice'] or Player.PlayerData.job.name ~= Config.Job['Police'] or Player.PlayerData.job.name ~= Config.Job['Sheriff'] or Player.PlayerData.job.name ~= Config.Job['Corrections'] then return end

    OtherPlayer.Functions.RemoveMoney("bank", price, "paid-bills")
    exports['Renewed-Banking']:addAccountMoney(Config.Job['Police'], price)
    TriggerClientEvent('QBCore:Notify', OtherPlayer.PlayerData.source, Lang:t("info.fine_received", {fine = price}))
end)

RegisterNetEvent('police:server:JailPlayer', function(playerId, time)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(src)
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)

    if (Player.PlayerData.job.name == Config.Job['DOJ'] or Player.PlayerData.job.name == Config.Job['StatePolice'] or Player.PlayerData.job.name == Config.Job['Police'] or Player.PlayerData.job.name == Config.Job['Sheriff'] or Player.PlayerData.job.name == Config.Job['Corrections']) then
        local currentDate = os.date("*t")
        if currentDate.day == 31 then
            currentDate.day = 30
        end
    
        OtherPlayer.Functions.SetMetaData("injail", time)
        OtherPlayer.Functions.SetMetaData("criminalrecord", {
            ["hasRecord"] = true,
            ["date"] = currentDate
        })
        TriggerClientEvent("police:client:SendToJail", OtherPlayer.PlayerData.source, time)
        TriggerClientEvent('QBCore:Notify', src, Lang:t("info.sent_jail_for", {time = time}))
    else
        return
    end
end)

RegisterNetEvent('police:server:SetHandcuffStatus', function(isHandcuffed)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.SetMetaData("ishandcuffed", isHandcuffed)
    end
end)

RegisterNetEvent('heli:spotlight', function(state)
    local serverID = source
    TriggerClientEvent('heli:spotlight', -1, serverID, state)
end)

RegisterNetEvent('police:server:SearchPlayer', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local SearchedPlayer = QBCore.Functions.GetPlayer(playerId)
    if not QBCore.Functions.GetPlayer(src) or not SearchedPlayer then return end

    TriggerClientEvent('QBCore:Notify', src, Lang:t("info.cash_found", {cash = SearchedPlayer.PlayerData.money["cash"]}))
    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("info.being_searched"))
end)

RegisterNetEvent('police:server:SeizeCash', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(src)
    local SearchedPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not SearchedPlayer then return end

    local moneyAmount = SearchedPlayer.PlayerData.money["cash"]
    local info = { cash = moneyAmount }
    SearchedPlayer.Functions.RemoveMoney("cash", moneyAmount, "police-cash-seized")
    Player.Functions.AddItem("moneybag", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["moneybag"], "add")
    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("info.cash_confiscated"))
end)

RegisterNetEvent('police:server:SeizeDriverLicense', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local SearchedPlayer = QBCore.Functions.GetPlayer(playerId)
    if not QBCore.Functions.GetPlayer(src) or not SearchedPlayer then return end

    local driverLicense = SearchedPlayer.PlayerData.metadata["licences"]["driver"]
    if driverLicense then
        local licenses = {["driver"] = false, ["business"] = SearchedPlayer.PlayerData.metadata["licences"]["business"]}
        SearchedPlayer.Functions.SetMetaData("licences", licenses)
        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("info.driving_license_confiscated"))
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_driver_license"), 'error')
    end
end)

RegisterNetEvent('police:server:RobPlayer', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Player = QBCore.Functions.GetPlayer(src)
    local SearchedPlayer = QBCore.Functions.GetPlayer(playerId)
    if not Player or not SearchedPlayer then return end

    local money = SearchedPlayer.PlayerData.money["cash"]
    Player.Functions.AddMoney("cash", money, "police-player-robbed")
    SearchedPlayer.Functions.RemoveMoney("cash", money, "police-player-robbed")
    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("info.cash_robbed", {money = money}))
    TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, Lang:t("info.stolen_money", {stolen = money}))
end)

RegisterNetEvent('police:server:spawnObject', function(type)
    local src = source
    local objectId = CreateObjectId()
    Objects[objectId] = type
    TriggerClientEvent("police:client:spawnObject", src, objectId, type, src)
end)

RegisterNetEvent('police:server:deleteObject', function(objectId)
    TriggerClientEvent('police:client:removeObject', -1, objectId)
end)

RegisterNetEvent('police:server:SyncSpikes', function(table)
    TriggerClientEvent('police:client:SyncSpikes', -1, table)
end)

RegisterNetEvent('police:server:Impound', function(plate, fullImpound, price, body, engine, fuel)
    local src = source
    price = price and price or 0
    if IsVehicleOwned(plate) then
        MySQL.query(
            'UPDATE player_vehicles SET state = ?, depotprice = ?, body = ?, engine = ?, fuel = ? WHERE plate = ?',
            {2, price, body, engine, fuel, plate})
        TriggerClientEvent('QBCore:Notify', src, Lang:t("info.vehicle_taken_depot", {price = price}))
    end
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    RegisterNetEvent('evidence:server:UpdateStatus', function(data)
        local src = source
        PlayerStatus[src] = data
    end)

    RegisterNetEvent('evidence:server:CreateBloodDrop', function(citizenid, bloodtype, coords)
        local bloodId = CreateBloodId()
        BloodDrops[bloodId] = {
            dna = citizenid,
            bloodtype = bloodtype
        }
        TriggerClientEvent("evidence:client:AddBlooddrop", -1, bloodId, citizenid, bloodtype, coords)
    end)

    RegisterNetEvent('evidence:server:CreateFingerDrop', function(coords)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local fingerId = CreateFingerId()
        FingerDrops[fingerId] = Player.PlayerData.metadata["fingerprint"]
        TriggerClientEvent("evidence:client:AddFingerPrint", -1, fingerId, Player.PlayerData.metadata["fingerprint"], coords)
    end)

    RegisterNetEvent('evidence:server:ClearBlooddrops', function(blooddropList)
        if blooddropList and next(blooddropList) then
            for _, v in pairs(blooddropList) do
                TriggerClientEvent("evidence:client:RemoveBlooddrop", -1, v)
                BloodDrops[v] = nil
            end
        end
    end)

    RegisterNetEvent('evidence:server:AddBlooddropToInventory', function(bloodId, bloodInfo)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
            if Player.Functions.AddItem("filled_evidence_bag", 1, false, bloodInfo) then
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
                TriggerClientEvent("evidence:client:RemoveBlooddrop", -1, bloodId)
                BloodDrops[bloodId] = nil
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.have_evidence_bag"), "error")
        end
    end)

    RegisterNetEvent('evidence:server:AddFingerprintToInventory', function(fingerId, fingerInfo)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
            if Player.Functions.AddItem("filled_evidence_bag", 1, false, fingerInfo) then
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
                TriggerClientEvent("evidence:client:RemoveFingerprint", -1, fingerId)
                FingerDrops[fingerId] = nil
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.have_evidence_bag"), "error")
        end
    end)

    RegisterNetEvent('evidence:server:CreateCasing', function(weapon, coords)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local casingId = CreateCasingId()
        local weaponInfo = QBCore.Shared.Weapons[weapon]
        local serieNumber = nil
        if weaponInfo then
            local weaponItem = Player.Functions.GetItemByName(weaponInfo["name"])
            if weaponItem then
                if weaponItem.info and weaponItem.info ~= "" then
                    serieNumber = weaponItem.info.serie
                end
            end
        end
        TriggerClientEvent("evidence:client:AddCasing", -1, casingId, weapon, coords, serieNumber)
    end)
end

RegisterNetEvent('police:server:UpdateCurrentCops', function()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    if updatingCops then return end
    updatingCops = true
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == Config.Job['Police'] and v.PlayerData.job.onduty then
            amount += 1
        end
    end
    TriggerClientEvent("police:SetCopCount", -1, amount)
    updatingCops = false
end)

if Config.GlobalSettings['Evidence'] == 'default' then
    RegisterNetEvent('evidence:server:ClearCasings', function(casingList)
        if casingList and next(casingList) then
            for _, v in pairs(casingList) do
                TriggerClientEvent("evidence:client:RemoveCasing", -1, v)
                Casings[v] = nil
            end
        end
    end)

    RegisterNetEvent('evidence:server:AddCasingToInventory', function(casingId, casingInfo)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
            if Player.Functions.AddItem("filled_evidence_bag", 1, false, casingInfo) then
                TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
                TriggerClientEvent("evidence:client:RemoveCasing", -1, casingId)
                Casings[casingId] = nil
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.have_evidence_bag"), "error")
        end
    end)
end

RegisterNetEvent('police:server:showFingerprint', function(playerId)
    local src = source
    TriggerClientEvent('police:client:showFingerprint', playerId, src)
    TriggerClientEvent('police:client:showFingerprint', src, playerId)
end)

RegisterNetEvent('police:server:showFingerprintId', function(sessionId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fid = Player.PlayerData.metadata["fingerprint"]
    TriggerClientEvent('police:client:showFingerprintId', sessionId, fid)
    TriggerClientEvent('police:client:showFingerprintId', src, fid)
end)

RegisterNetEvent('police:server:SetTracker', function(targetId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(targetId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    

    local Target = QBCore.Functions.GetPlayer(targetId)
    if not QBCore.Functions.GetPlayer(src) or not Target then return end

    local TrackerMeta = Target.PlayerData.metadata["tracker"]
    if TrackerMeta then
        Target.Functions.SetMetaData("tracker", false)
        TriggerClientEvent('QBCore:Notify', targetId, Lang:t("success.anklet_taken_off"), 'success')
        TriggerClientEvent('QBCore:Notify', src, Lang:t("success.took_anklet_from", {firstname = Target.PlayerData.charinfo.firstname, lastname = Target.PlayerData.charinfo.lastname}), 'success')
        TriggerClientEvent('police:client:SetTracker', targetId, false)
    else
        Target.Functions.SetMetaData("tracker", true)
        TriggerClientEvent('QBCore:Notify', targetId, Lang:t("success.put_anklet"), 'success')
        TriggerClientEvent('QBCore:Notify', src, Lang:t("success.put_anklet_on", {firstname = Target.PlayerData.charinfo.firstname, lastname = Target.PlayerData.charinfo.lastname}), 'success')
        TriggerClientEvent('police:client:SetTracker', targetId, true)
    end
end)

-- Threads
CreateThread(function()
    while true do
        Wait(1000 * 60 * 10)
        local curCops = GetCurrentCops()
        TriggerClientEvent("police:SetCopCount", -1, curCops)
    end
end)

CreateThread(function()
    while true do
        Wait(5000)
        UpdateBlips()
    end
end)
