RegisterNetEvent('dg-core:Server:CreateCharacter')
AddEventHandler('dg-core:Server:CreateCharacter', function (data)
    local src = source
    local license = GetPlayerIdentifierByType(src, 'license')

    local user = DGCore.Users[license]

    local character = DGCore.Character.Create(data, user)
    local characters = DGCore.DB.Character.SelectByUserId(user.id)

    if not character then
        print(string.format('[DGCore]キャラクター生成の失敗しました。（license: %s）', license))
        TriggerClientEvent('dg-core:Client:ShowCharacter', src, characters)
        return 
    end

    DGCore.Characters[character.id] = character
    TriggerClientEvent('dg-core:Client:ShowCharacter', src, characters)
end)

RegisterNetEvent('dg-core:Server:SelectCharacter')
AddEventHandler('dg-core:Server:SelectCharacter', function (character_id)
    local src = source
    local character = DGCore.Characters[character_id]

    TriggerClientEvent('dg-core:Client:SpawnCharacter', src, character)
end)
