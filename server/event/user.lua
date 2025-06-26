RegisterNetEvent('dg-core:Server:UserReady')
AddEventHandler('dg-core:Server:UserReady', function ()
    local src = source
    local license = GetPlayerIdentifierByType(src, 'license')

    local user = DGCore.Users[license]

    print(string.format('dg-core:Server:UserReady: %s', license))
    print(string.format('dg-core:Server:UserReady: %s', user.id))

    local characters = DGCore.DB.Character.SelectByUserId(user.id)

    TriggerClientEvent('dg-core:Client:ShowCharacter', src, characters)
end)
