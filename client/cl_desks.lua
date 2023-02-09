RegisterNetEvent("LENT-GovernmentJob:Client:QuestionsMenu:SandyShores", function()
    exports["LENT-Menu"]:openMenu({
        {
            header = 'Sergeant - H. Jquafis',
            isMenuHeader = true,
        },
        {
            header = "Ask for Supervisor",
            params = {
                event = "LENT-GovernmentJob:Client:SupervisorRequest",
                args = {
                    location = vector3(1852.0, 3689.48, 34.58),
                },
            },
        },
    })
end)

RegisterNetEvent("LENT-GovernmentJob:Client:QuestionsMenu", function()
    exports["LENT-Menu"]:openMenu({
        {
            header = 'Sergeant - T. Klein',
            isMenuHeader = true,
        },
        {
            header = "Ask for Supervisor",
            params = {
                event = "LENT-GovernmentJob:Client:SupervisorRequest",
                args = {
                    location = vector3(-448.2, 6013.53, 31.72),
                },
            },
        },
        -- {
        --     header = "Sheriff Application",
        --     params = {
        --         event = "LENT-GovernmentJob:Client:DeskApplication",
        --     },
        -- },
    })
end)

RegisterNetEvent('LENT-GovernmentJob:Client:DeskHarold', function()
    exports["LENT-Menu"]:openMenu({
        {
            header = 'Sergeant - Harold',
            isMenuHeader = true,
        },
        {
            header = "Spawn Cruiser",
            params = {
                event = "LENT-GovernmentJob:Client:SelectVehicle",
            },
        },
        {
            header = "Buy Cruiser",
            params = {
                event = "serrulata-policevehicleshop:client:enter",
            },
        },
    })
end)

-- [[ Events ]] --
RegisterNetEvent('LENT-GovernmentJob:Client:SupervisorRequest', function(data)
    local loc = data.location
    local myPos = GetEntityCoords(PlayerPedId(), true)

    local dist = #(myPos - loc)
    if dist < 20.0 then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistanceOnCoords', 10.0, "deskbell", 0.5, loc)
        print("Debug: Player has been in range to activate sound")
    end
end)

RegisterNetEvent('LENT-GovernmentJob:Client:DeskApplication', function()
    local application = exports['qb-input']:ShowInput({
        header = 'Sergeant - T. Klein',
        submitText = "Submit Application",
        inputs = {
            {
                text = "Citizen Name",
                name = "citizenname",
                type = "text",
                isRequired = true,
            },
            {
                text = "Prior Arrests",
                name = "priorarrests",
                type = "select",
                isRequired = true,
                options = { 
                    { value = "noarrests", text = "No Arrests" },
                    { value = "yesarrests", text = "Prior Arrests"},
                },
            },
        }
    })

    if application ~= nil then
        for k, v in pairs(application) do
            print(k .. ' : ' .. v)
        end
    end
end)