RegisterNetEvent("dg-core:Server:fetchCharacters", function ()
    local src = source
    local user = DGCore.Users[src]

    local characters = DGCore.Database.User.SelectByRockStartId(user.rockstart_id)

    local result = {}
    for _, character in ipairs(characters) do
        table.insert(result, {
            id = character.id,
            firstname = character.firstname,
            lastname = character.lastname,
            birthday = character.birthday,
            gender = character.gender,
            nationality = character.nationality,
            slot = character.slot
        })
    end

    TriggerClientEvent("dg-core:Client:showCharacterMenu", src, result)
end)

RegisterNetEvent("dg-core:Server:createCharacter", function (data)
    local src = source
    local user = DGCore.Users[src]

    local playerData = DGCore.Database.Player.SelectByRockStartId(user.rockstart_id)
    -- if #playerData == 3 then
    --     return TriggerClientEvent("dg-core:Client:Notify", src, "キャラクターは3人までです")
    -- end

    local slot = 1
    local useSlots = {}
    for _, c in ipairs(playerData) do useSlots[c.slot] = true end
    for i = 1, 3 do
        if not useSlots[i] then
            slot = i
            break
        end
    end

    playerData = DGModel.PlayerData({
        id = DGCore.Player.GeneratePlayerId(),
        user_id = user.id,
        firstname = data.firstname,
        lastname = data.lastname,
        birthday = data.birthday,
        gender = data.gender,
        nationality = data.nationality,
        slot = slot,
        is_deleted = 0
    })
    DGCore.Player.Create(playerData)

    if DGConfig.Debug then print("プレイヤーの生成が成功しました") end
end)

RegisterNetEvent("dg-core:Server:selectCharacter", function (playerId)
    local src = source
    local player = DGCore.Database.Player.SelectById(playerId)
    if not player or player.is_deleted then
        return TriggerClientEvent("dg-core:Client:Notify", src, "キャラクターが存在しません")
    end

    local playerModel = DGCore.Player.Load(playerId)
    DGCore.Players[src] = playerModel

    TriggerClientEvent("dg-core:Client:spawnCharacter", src, playerModel)
end)