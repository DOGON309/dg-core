RegisterNUICallback("CreateCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:CreateCharacter", data)
    cb({})
end)

RegisterNUICallback("DeleteCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:DeleteCharacter", data)
    cb({})
end)

RegisterNUICallback("SelectCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:SelectCharacter", data)
    cb({})
end)

RegisterNetEvent("dg-core:Client:ShowCharacter")
AddEventHandler("dg-core:Client:ShowCharacter", function (characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "ShowCharacter",
        characters = characters
    })
end)

RegisterNetEvent("dg-core:Client:SpawnCharacter")
AddEventHandler("dg-core:Client:SpawnCharacter", function (character)
    ShutdownLoadingScreen()

    local spawnPos = DGConfig.DefaultSpawn

    DoScreenFadeOut(500)
    Wait(500)

    SetNuiFocus(false, false)
    RenderScriptCams(false, false, 0, true, true)
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityVisible(PlayerPedId(), true, false)
    ClearPedTasksImmediately(PlayerPedId())

    SetEntityCoords(PlayerPedId(), spawnPos.x, spawnPos.y, spawnPos.z)
    SetEntityHeading(PlayerPedId(), 0.0)

    Wait(500)
    DoScreenFadeIn(500)

    SendNUIMessage({
        action = "CloseCharacter"
    })
    TriggerEvent("dg-core:Client:LoadSkin", character.skin)
end)