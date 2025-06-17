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