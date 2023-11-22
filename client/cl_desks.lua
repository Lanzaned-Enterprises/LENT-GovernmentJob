RegisterNetEvent("LENT-GovernmentJob:Client:QuestionsMenu:SandyShores", function()
    exports[Config.GlobalSettings['MenuExport']]:openMenu({
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
    exports[Config.GlobalSettings['MenuExport']]:openMenu({
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
    })
end)