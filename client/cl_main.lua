-- Variables
QBCore = exports['qb-core']:GetCoreObject()
isHandcuffed = false
cuffType = 1
isEscorted = false
PlayerJob = {}
local DutyBlips = {}
local Blips = {}
GPSActive = false


AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

-- Functions
local function CreateDutyBlips(playerId, playerLabel, playerJob, playerLocation, vehClass)
    if not Blips[playerId] then Blips[playerId] = {} end
    local ped = GetPlayerPed(playerId)
    local blip = GetBlipFromEntity(ped)
    if NetworkIsPlayerActive(playerId) then
        blip = AddBlipForEntity(ped)
    else
        blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
    end
    for k,v in pairs(Config.UnitblipSettings) do
        if k == playerJob then
            blipcolor = v
        end
    end
    -- Heli
    if vehClass == 15 then
        SetBlipSprite(blip, 43)
        ShowHeadingIndicatorOnBlip(blip, true)
    -- Boats
    elseif vehClass == 14 then
        SetBlipSprite(blip, 427)
        ShowHeadingIndicatorOnBlip(blip, true)
    -- Plane
    elseif vehClass == 16 then
        SetBlipSprite(blip, 307)
        ShowHeadingIndicatorOnBlip(blip, true)
    -- MotorBikes
    elseif vehClass == 8 then
        SetBlipSprite(blip, 226)
        ShowHeadingIndicatorOnBlip(blip, true)
    -- Police Vehicles
    elseif vehClass == 18 then
        SetBlipSprite(blip, 56)
        ShowHeadingIndicatorOnBlip(blip, true)
    -- Walking
    elseif vehClass == 0 then
        SetBlipSprite(blip, 126)
        ShowHeadingIndicatorOnBlip(blip, true)
    else -- All other vehicles
        SetBlipSprite(blip, 225)
        ShowHeadingIndicatorOnBlip(blip, true)
    end
    ShowHeadingIndicatorOnBlip(blip, true)
    SetBlipRotation(blip, math.ceil(playerLocation.w))
    SetBlipScale(blip, Config.UnitblipSettings["VehicleBlipSize"])
    SetBlipColour(blip, blipcolor)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(playerLabel)
    EndTextCommandSetBlipName(blip)
    DutyBlips[#DutyBlips+1] = blip

    if GetBlipFromEntity(PlayerPedId()) == blip then
        RemoveBlip(blip)
    end
end

-- Events
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    isHandcuffed = false
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateBlips")
    TriggerServerEvent("police:server:UpdateCurrentCops")

    if player.metadata.tracker then
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = 13,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    else
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = -1,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    end

    -- if PlayerJob and PlayerJob.name ~= Config.Job['DOJ'] or PlayerJob.name ~= Config.Job['StatePolice'] or PlayerJob.name ~= Config.Job['Police'] or PlayerJob.name ~= Config.Job['Sheriff'] or PlayerJob.name ~= Config.Job['Corrections'] then
        
    if IsAllowedPoliceJob(PlayerJob.name) then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('police:server:UpdateBlips')
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateCurrentCops")
    isHandcuffed = false
    isEscorted = false
    PlayerJob = {}
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    if DutyBlips then
        for _, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent("QBCore:Client:SetDuty", function(newDuty)
    PlayerJob.onduty = newDuty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    if IsAllowedPoliceJob(JobInfo.name) or IsAllowedAmbulanceJob(JobInfo.name) then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
    if IsAllowedPoliceJob(JobInfo.name) or IsAllowedAmbulanceJob(JobInfo.name) and not JobInfo.onduty then GPSActive = false end
    PlayerJob = JobInfo
end)

RegisterNetEvent('police:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('info.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('info.mrs')
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message = Lang:t('email.message', {value = gender, value2 = charinfo.lastname, value3 = amount}),
            button = {}
        })
    end)
end)

RegisterNetEvent('police:client:UpdateBlips', function(players)
    if DutyBlips then
        for _, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
    end
    DutyBlips = {}
    if players and GPSActive then
        for _, data in pairs(players) do
            if data.gpsactive then
                local id = GetPlayerFromServerId(data.source)
                CreateDutyBlips(id, data.label, data.job, data.location, data.vehClass)
            end
        end
    end
end)

RegisterNetEvent('police:client:SendToJail', function(time)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

RegisterNetEvent("LENT-GovernmentJob:Client:MDT", function()
    local plyPed = PlayerPedId()
    PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
        if IsAllowedPoliceJob(PlayerData.job.name) or IsAllowedAmbulanceJob(PlayerData.job.name) then
            TriggerServerEvent('mdt:server:openMDT')
            TriggerServerEvent('mdt:requestOfficerData')
        end
    else
        QBCore.Functions.Notify("Can't do that!", "error")
    end
end)

RegisterNetEvent('ps-radialmenu:client:openmdt', function()
    local plyPed = PlayerPedId()
    PlayerData = QBCore.Functions.GetPlayerData()
    if QBCore.Functions.HasItem('mdt') and not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
        if IsAllowedPoliceJob(PlayerData.job.name) then
            TriggerServerEvent('mdt:server:openMDT')
            TriggerServerEvent('mdt:requestOfficerData')
        end
    else
        QBCore.Functions.Notify("Can't do that!", "error")
    end
end)

RegisterNetEvent('police:client:UseGPS', function()
    if (IsAllowedPoliceJob(PlayerJob.name) or IsAllowedAmbulanceJob(PlayerJob.name)) and PlayerJob.onduty then
        local newinputs = {}
        if not GPSActive then
            HeaderText = "GPS - "..PlayerJob.name.."<br>🔴 GPS is offline"
            Submittext = "Activate GPS"
            newinputs[#newinputs+1] = { type = 'text', name = 'callsign', text = "Callsign", isRequired = true}
        else
            HeaderText = "GPS - "..PlayerJob.name.."<br>🟢 GPS is online"
            Submittext = "Deactivate GPS"
            newinputs[#newinputs+1] = { type = 'text', name = 'callsign', text = "Callsign", isRequired = false}
        end
        local dialog = exports['qb-input']:ShowInput({ header = HeaderText, submitText = Submittext, inputs = newinputs })
        if dialog then
            if GPSActive then
                GPSActive = false
            else
                GPSActive = true
                TriggerServerEvent('police:server:SetCallSign', dialog.callsign)
            end
        end
    else
        QBCore.Functions.Notify('You must be induty to see G.P.S.', 'error', 4500)
    end
end)

CreateThread(function()
    while true do
        if (IsAllowedPoliceJob(PlayerJob.name) or IsAllowedAmbulanceJob(PlayerJob.name)) and PlayerJob.onduty and GPSActive then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local vehicleClass = GetVehicleClass(vehicle)
            local jobname = PlayerJob.name
            local call = QBCore.Functions.GetPlayerData().metadata["callsign"]
            if GPSActive and QBCore.Functions.HasItem('leogps') then GPSActive = true else GPSActive = false end
            local data = { vehClass = vehicleClass, playerJob = jobname, call = call, gpsactive = GPSActive }
            TriggerServerEvent('police:server:UpdateBlipInfo', data)
        elseif (IsAllowedPoliceJob(PlayerJob.name) or IsAllowedAmbulanceJob(PlayerJob.name)) and not PlayerJob.onduty or not GPSActive then
            local data = { gpsactive = GPSActive }
            TriggerServerEvent('police:server:UpdateBlipInfo', data)
        end
        Wait(3000)
    end
end)