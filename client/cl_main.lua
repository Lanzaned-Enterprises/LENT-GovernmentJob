-- Variables
QBCore = exports['qb-core']:GetCoreObject()
isHandcuffed = false
cuffType = 1
isEscorted = false
PlayerJob = {}
local DutyBlips = {}

createPoliceBlips = false
OfficerRequest = false

-- Functions
local function CreateDutyBlips(playerId, playerLabel, playerJob, playerLocation)
    local ped = GetPlayerPed(playerId)
    local blip = GetBlipFromEntity(ped)
    if not DoesBlipExist(blip) then
        if NetworkIsPlayerActive(playerId) then
            blip = AddBlipForEntity(ped)
        else
            blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
        end
        SetBlipSprite(blip, 1)
        ShowHeadingIndicatorOnBlip(blip, true)
        SetBlipRotation(blip, math.ceil(playerLocation.w))
        SetBlipScale(blip, 0.8)
        if playerJob == "sasp" then
            SetBlipColour(blip, 40)
        elseif playerJob == "police" then
            SetBlipColour(blip, 38)
        elseif playerJob == "bcso" then
            SetBlipColour(blip, 33)
        elseif playerJob == "doc" then
            SetBlipColour(blip, 65)
        elseif playerJob == "ambulance" then
            SetBlipColour(blip, 6)
        else 
            SetBlipColour(blip, 38)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(playerLabel)
        EndTextCommandSetBlipName(blip)
        DutyBlips[#DutyBlips+1] = blip
    end

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

    if PlayerJob and PlayerJob.name ~= 'upd' or PlayerJob.name ~= 'sasp' or PlayerJob.name ~= 'police' or PlayerJob.name ~= 'bcso' or PlayerJob.name ~= 'doc' then
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
    if JobInfo.name ~= "upd" or JobInfo.name ~= "sasp" or JobInfo.name ~= "police" or JobInfo.name ~= "bcso" or JobInfo.name ~= "doc" then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
    PlayerJob = JobInfo
    TriggerServerEvent("police:server:UpdateBlips")
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
    if PlayerJob and (PlayerJob.name == 'upd' or PlayerJob.name == 'sasp' or PlayerJob.name == 'police' or PlayerJob.name == 'bcso' or PlayerJob.name == 'doc' or PlayerJob.name == 'ambulance') and
        PlayerJob.onduty then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
        if players then
            for _, data in pairs(players) do
                local id = GetPlayerFromServerId(data.source)
                CreateDutyBlips(id, data.label, data.job, data.location)

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

RegisterNetEvent("LENT:POLICE:MDT", function()
    TriggerServerEvent('mdt:server:openMDT')    
end)

-- [[ Checking ]] --
local CheckOnDutyState = false

RegisterNetEvent("LENT:SP:CHECK:STATUS", function()
    if CheckOnDutyState then
        TriggerServerEvent("LENT:TIMER:SET:SASP")
        CheckOnDutyState = false
    elseif not CheckOnDutyState then
        TriggerServerEvent("LENT:TIMER:SET:SASP")
        CheckOnDutyState = true
    end
end)