RegisterNetEvent("dg-core:Client:showCharacter")
AddEventHandler("dg-core:Client:showCharacter", function (characters)
    print("キャラクター一覧を表示します")
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