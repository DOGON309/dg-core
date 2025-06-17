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