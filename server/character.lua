DGCore = DGCore or {}

DGCore.Character = {}

function DGCore.Character.Create(data, user)
    local characters = DGCore.DB.Character.SelectByUserId(user.id)
    if #characters >= 3 then return end

    local character = DGCore.Model.Character(
        DGCore.Character.GenerateUserId(),  -- id
        user.id,  -- user_id
        data.firstName,  -- firstName
        data.lastName,  --lastName
        data.birthday, -- birthday
        data.gender,  --gender
        DGConfig.Money.DefaultMoney.cash,  -- cash 
        data.nationality,  -- nationality
        #characters + 1,  -- slot
        {},  -- skin
        DGConfig.DefaultSpawn.x,  -- pos_x
        DGConfig.DefaultSpawn.y,  -- pos_y
        DGConfig.DefaultSpawn.z,  -- pos_z
        12,  -- heading
        100,  -- hp
        0,  -- armor
        100,  -- hunger
        100,  -- thirst
        0, -- stress
        DGConfig.Character.DefaultWeight,  -- weight
        0,  -- is_dead
        0,  -- is_crippling
        0,  -- is_handcuff
        0,  -- is_tracker
        0,  -- is_jail
        0,  -- is_is_ban
        '',  -- ban_reason
        0,  -- is_deleted
        {},  -- CharacterBanks
        {},  -- CharacterPhones
        {},  -- CharacterItems
        {},  -- CharacterVehicles
        {},  -- CharacterJobs
        {} -- CharacterGang
    )

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