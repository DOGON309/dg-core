RegisterNetEvent("dg-core:Client:showCharacter")
AddEventHandler("dg-core:Client:showCharacter", function (characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showCharacter",
        characters = characters
    })
end)

RegisterNUICallback("createCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:createCharacter", data)
    cb({})
end)

RegisterNUICallback("deleteCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:deleteCharacter", data)
    cb({})
end)

RegisterNUICallback("selectCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:selectCharacter", data)
    cb({})
end)

RegisterNetEvent("dg-core:Client:spawnCharacter")
AddEventHandler("dg-core:Client:spawnCharacter", function (character)
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
        action = "closeCharacter"
    })
    TriggerEvent("dg-core:Client:LoadSkin", character.skin)
end)