DGCore = DGCore or {}

DGCore.Character = {}

function DGCore.Character.Create(data, user)
    local characters = DGCore.DB.Character.SelectByUserId(user.id)
    if #characters >= 3 then return end

    local character = DGCore.Model.Character({
        id = DGCore.Character.GenerateUserId(),
        user_id = user.id,
        firstName = data.firstName,
        lastName = data.lastName,
        birthday = data.birthday,
        gender = data.gender,
        cash = DGConfig.Money.DefaultMoney.cash,
        nationality = data.nationality,
        slot = #characters + 1,
        pos_x = DGConfig.DefaultSpawn.x,
        pos_y = DGConfig.DefaultSpawn.y,
        pos_z = DGConfig.DefaultSpawn.z,
        heading = 12,
        hp = 100,
        armor = 0,
        hunger = 100,
        thirst = 100,
        weight = DGConfig.Character.DefaultWeight,
        is_dead = 0,
        is_crippling = 0,
        is_handcuff = 0,
        is_tracker = 0,
        is_jail = 0,
        is_ban = 0,
        ban_reason = '',
        is_deleted = 0
    })

    character:create()

    return character
end

function DGCore.Character.Load(character_id)
    local character = DGCore.DB.Character.SelectById(character_id)
    if not character then return nil end

    local banks = DGCore.DB.CharacterBank.SelectByCharacterId(character_id)
    local phones = DGCore.DB.CharacterPhone.SelectByCharacterId(character_id)
    local items = DGCore.DB.CharacterItem.SelectByCharacterId(character_id)
    local vehicles = DGCore.DB.CharacterVehicle.SelectByCharacterId(character_id)
    local jobs = DGCore.DB.CharacterJob.SelectByCharacterId(character_id)
    local gangs = DGCore.DB.CharacterGang.SelectByCharacterId(character_id)

    local result = DGCore.Model.Character(
        character.id,
        character.user_id,
        character.firstName,
        character.lastName,
        character.birthday,
        character.gender,
        character.cash,
        character.nationality,
        character.slot,
        character.skin,
        character.pos_x,
        character.pos_y,
        character.pos_z,
        character.heading,
        character.hp,
        character.armor,
        character.hunger,
        character.thirst,
        character.stress,
        character.weight,
        character.is_dead,
        character.is_crippling,
        character.is_handcuff,
        character.is_tracker,
        character.is_jail,
        character.is_ban,
        character.ban_reason,
        character.is_deleted,
        banks,
        phones,
        items,
        vehicles,
        jobs,
        gangs
    )

    return result
end

function DGCore.Character.GenerateUserId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.DB.Character.SelectByUserId(id)
    if #result == 0 then return id end
    return DGCore.Character.GenerateUserId()
end