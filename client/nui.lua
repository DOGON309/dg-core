RegisterNetEvent("dg-core:Client:showCharacterMenu", function (characters)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showCharacterMenu",
        characters = characters
    })
end)

RegisterNUICallback("createCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:createCharacter", data)
    cb({})
end)

RegisterNUICallback("selectCharacter", function (data, cb)
    TriggerServerEvent("dg-core:Server:selectCharacter", data.id)
    cb({})
end)

RegisterNUICallback("closeMenu", function (_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNetEvent("dg-core:Client:characterCreated", function (character)
    SendNUIMessage({
        action = "characterCreated",
        character = character
    })
end)
