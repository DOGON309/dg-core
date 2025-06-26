DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Character = {}

function DGCore.DB.Character.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Character.SelectAll, {})
end

function DGCore.DB.Character.SelectById(id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.Character.SelectById, { id })
end

function DGCore.DB.Character.SelectByUserId(user_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.Character.SelectByUserId, { user_id })
end

function DGCore.DB.Character.Insert(Character)
    DGCore.DB.insert(DGCore.Constant.Queries.Character.Insert, Character:toInsert())
end

function DGCore.DB.Character.Update(Character)
    DGCore.DB.update(DGCore.Constant.Queries.Character.Update, Character:toUpdate())
end

function DGCore.DB.Character.UpdateStatus(Character)
    DGCore.DB.update(DGCore.Constant.Queries.Character.UpdateStatus, Character:toUpdateStatus())
end

DGCore.DB.CharacterBank = {}

function DGCore.DB.CharacterBank.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterBank.SelectAll, {})
end

function DGCore.DB.CharacterBank.SelectByCharacterId(user_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterBank.SelectByCharacterId, { user_id })
end

function DGCore.DB.CharacterBank.Insert(CharacterBank)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterBank.Insert, CharacterBank:toInsert())
end

function DGCore.DB.CharacterBank.Update(CharacterBank)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterBank.Update, CharacterBank:toUpdate())
end

DGCore.DB.CharacterPhone = {}

function DGCore.DB.CharacterPhone.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterPhone.SelectAll, {})
end

function DGCore.DB.CharacterPhone.SelectByCharacterId(character_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterPhone.SelectByCharacterId, { character_id })
end

function DGCore.DB.CharacterPhone.Insert(CharacterPhone)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterPhone.Insert, CharacterPhone:toInsert())
end

function DGCore.DB.CharacterPhone.Update(CharacterPhone)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterPhone.Update, CharacterPhone:toUpdate())
end

DGCore.DB.CharacterItem = {}

function DGCore.DB.CharacterItem.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterItem.SelectAll, {})
end

function DGCore.DB.CharacterItem.SelectByCharacterId(character_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterItem.SelectByCharacterId, { character_id} )
end

function DGCore.DB.CharacterItem.Insert(CharacterItem)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterItem.Insert, CharacterItem:toInsert())
end

function DGCore.DB.CharacterItem.Update(CharacterItem)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterItem.Update, CharacterItem:toUpdate())
end

DGCore.DB.CharacterVehicle = {}

function DGCore.DB.CharacterVehicle.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterVehicle.SelectAll, {})
end

function DGCore.DB.CharacterVehicle.SelectByCharacterId(character_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterVehicle.SelectByCharacterId, { character_id })
end

function DGCore.DB.CharacterVehicle.Insert(CharacterVehicle)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterVehicle.Insert, CharacterVehicle:toInsert())
end

function DGCore.DB.CharacterVehicle.Update(CharacterVehicle)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterVehicle.Update, CharacterVehicle:toUpdate())
end

DGCore.DB.CharacterJob = {}

function DGCore.DB.CharacterJob.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterJob.SelectAll, {})
end

function DGCore.DB.CharacterJob.SelectByCharacterId(character_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterJob.SelectByCharacterId, { character_id })
end

function DGCore.DB.CharacterJob.Insert(CharacterJob)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterJob.Insert, CharacterJob:toInsert())
end

function DGCore.DB.CharacterJob.Update(CharacterJob)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterJob.Update, CharacterJob:toUpdate())
end

DGCore.DB.CharacterGang = {}

function DGCore.DB.CharacterGang.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterGang.SelectAll, {})
end

function DGCore.DB.CharacterGang.SelectByCharacterId(character_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.CharacterGang.SelectByCharacterId, { character_id })
end

function DGCore.DB.CharacterGang.Insert(CharacterGang)
    DGCore.DB.insert(DGCore.Constant.Queries.CharacterGang.Insert, CharacterGang:toInsert())
end

function DGCore.DB.CharacterGang.Update(CharacterGang)
    DGCore.DB.update(DGCore.Constant.Queries.CharacterGang.Update, CharacterGang:toUpdate())
end
