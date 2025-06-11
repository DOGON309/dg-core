RegisterNetEvent("dg-core:Server:fetchCharacters", function ()
    local src = source
    local user = DGCore.Users[src]

    local characters = DGCore.Database.User.selectbyrockstartid(user.rockstart_id)

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

    local playerData = DGCore.Player.
    if exists == 1 then
        return 
    end
end)