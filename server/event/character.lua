RegisterNetEvent("dg-core:Server:createCharacter")
AddEventHandler("dg-core:Server:createCharacter", function (data)
    local src = source
    local user = DGCore.Users[src]
    local rockstartid = GetPlayerIdentifierByType(src, 'license')

    local player = DGCore.Player.Create(data, user)

    local characters = DGCore.Database.Player.SelectByUserId(user.id)
    TriggerClientEvent('dg-core:Client:showCharacter', src, characters)
end)