RegisterNetEvent("dg-core:Server:createCharacter")
AddEventHandler("dg-core:Server:createCharacter", function (data)
    local src = source
    local user = DGCore.Users[src]
    local rockstartid = GetPlayerIdentifierByType(src, 'license')

    local player = DGCore.Player.Create(data, user)

    local characters = DGCore.Database.Player.SelectByUserId(user.id)

    -- デバッグ
    if DGConfig.Debug == 1 then
        print('createCharacter')
        for i, d in ipairs(characters) do
            for key, value in pairs(d) do
                print(string.format('%s: %s: %s', i, key, value))
            end
        end
    end

    TriggerClientEvent('dg-core:Client:showCharacter', src, characters)
end)

RegisterNetEvent("dg-core:Server:deleteCharacter")
AddEventHandler("dg-core:Server:deleteCharacter", function(data)
    local src = source
    local player = DGModel.PlayerData(DGCore.Database.Player.SelectById(data.user_id))

    DGCore.Database.Player.Delete(player.id)
end)