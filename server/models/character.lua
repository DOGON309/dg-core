DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Character(id, user_id, firstName, lastName, birthday, gender, cash, nationality, slot, skin, pos_x, pos_y, pos_z, heading, hp, armor, hunger, thirst, stress, weight, is_dead, is_crippling, is_handcuff, is_tracker, is_jail, is_ban, ban_reason, is_deleted, CharacterBanks, CharacterPhones, CharacterItems, CharacterVehicles, CharacterJobs, CharacterGang)
    local self = {}

    self.id = id
    self.user_id = user_id
    self.firstName = firstName
    self.lastName = lastName
    self.birthday = birthday
    self.gender = gender
    self.cash = cash
    self.nationality = nationality
    self.slot = slot
    self.skin = skin
    self.pos_x = pos_x
    self.pos_y = pos_y
    self.pos_z = pos_z
    self.heading = heading
    self.hp = hp
    self.armor = armor
    self.hunger = hunger
    self.thirst = thirst
    self.stress = stress
    self.weight = weight
    self.is_dead = is_dead
    self.is_crippling = is_crippling
    self.is_handcuff = is_handcuff
    self.is_tracker = is_tracker
    self.is_jail = is_jail
    self.is_ban = is_ban
    self.ban_reason = ban_reason
    self.is_deleted = is_deleted

    self.CharacterBanks = DGCore.Model.CharacterBanks(CharacterBanks) or {}
    self.CharacterPhones = DGCore.Model.CharacterPhones(CharacterPhones) or {}
    self.CharacterItems = DGCore.Model.CharacterItems(CharacterItems) or {}
    self.CharacterVehicles = DGCore.Model.CharacterVehicles(CharacterVehicles) or {}
    self.CharacterJobs = DGCore.Model.CharacterJobs(CharacterJobs) or {}
    self.CharacterGang = DGCore.Model.CharacterGang(CharacterGang) or nil

    function self:toInsert()
        return {
            self.id,
            self.user_id,
            self.firstName,
            self.lastName,
            self.birthday,
            self.gender,
            self.cash,
            self.nationality,
            self.slot,
            self.skin,
            self.pos_x,
            self.pos_y,
            self.pos_z,
            self.heading,
            self.hp,
            self.armor,
            self.hunger,
            self.thirst,
            self.stress,
            self.weight,
            self.is_dead,
            self.is_crippling,
            self.is_handcuff,
            self.is_tracker,
            self.is_jail,
            self.is_ban,
            self.ban_reason,
            self.is_deleted
        }
    end

    function self:toUpdate()
        return {
            self.user_id,
            self.firstName,
            self.lastName,
            self.birthday,
            self.gender,
            self.cash,
            self.nationality,
            self.slot,
            self.skin,
            self.pos_x,
            self.pos_y,
            self.pos_z,
            self.heading,
            self.hp,
            self.armor,
            self.hunger,
            self.thirst,
            self.stress,
            self.weight,
            self.is_dead,
            self.is_crippling,
            self.is_handcuff,
            self.is_tracker,
            self.is_jail,
            self.is_ban,
            self.ban_reason,
            self.is_deleted,
            self.id
        }
    end

    function self:toUpdateStatus()
        return {
            self.hp,
            self.armor,
            self.hunger,
            self.stress,
            self.weight,
            self.is_dead,
            self.is_handcuff,
            self.is_tracker,
            self.is_jail,
            self.id
        }
    end

    function self:create()
        DGCore.DB.Character.Insert(self)
    end

    return self
end

function DGCore.Model.CharacterBanks(CharacterBanks)
    local result = {}
    for i, bank in ipairs(CharacterBanks) do
        result[i] = DGCore.Model.CharacterBank(bank.bank_id, bank.character_id, bank.name, bank.is_default)
    end
    return result
end

function DGCore.Model.CharacterBank(bank_id, character_id, name, is_default)
    local self = {}

    self.bank_id = bank_id
    self.character_id = character_id
    self.name = name
    self.is_default = is_default

    function self:toInsert()
        return {
            self.bank_id,
            self.character_id,
            self.name,
            self.is_default
        }
    end

    function self:toUpdate()
        return {
            self.character_id,
            self.name,
            self.is_default,
            self.bank_id
        }
    end

    return self
end

function DGCore.Model.CharacterPhones(CharacterPhones)
    local result = {}
    for i, phone in ipairs(CharacterPhones) do
        result[i] = DGCore.Model.CharacterPhone(phone.phone_id, phone.character_id)
    end
    return result
end

function DGCore.Model.CharacterPhone(phone_id, character_id)
    local self = {}

    self.phone_id = phone_id
    self.character_id = character_id

    function self:toInsert()
        return {
            self.phone_id,
            self.character_id
        }
    end

    function self:toUpdate()
        return {
            self.character_id,
            self.phone_id
        }
    end

    return self
end

function DGCore.Model.CharacterItems(CharacterItems)
    local result = {}
    for i, item in ipairs(CharacterItems) do
        result[i] = DGCore.Model.CharacterItem(item.item_id, item.character_id, item.quantity, item.durability, item.slot, item.is_jail, item.metadata)
    end
    return result
end

function DGCore.Model.CharacterItem(item_id, character_id, quantity, durability, slot, is_jail, metadata)
    local self = {}

    self.item_id = item_id
    self.character_id = character_id
    self.quantity = quantity
    self.durability = durability
    self.slot = slot
    self.is_jail = is_jail
    self.metadata = metadata

    function self:toInsert()
        return {
            self.item_id,
            self.character_id,
            self.quantity,
            self.durability,
            self.slot,
            self.is_jail,
            self.metadata
        }
    end

    function self:toUpdate()
        return {
            self.quantity,
            self.durability,
            self.slot,
            self.is_jail,
            self.metadata,
            self.item_id,
            self.character_id
        }
    end

    return self
end

function DGCore.Model.CharacterVehicles(CharacterVehicles)
    local result = {}
    for i, vehicle in ipairs(CharacterVehicles) do
        result[i] = DGCore.Model.CharacterVehicle(vehicle.vehicle_id, vehicle.character_id, vehicle.plate, vehicle.garage, vehicle.fuel, vehicle.engine_health, vehicle.body_health, vehicle.is_impounded, vehicle.is_insured, vehicle.mods)
    end
    return result
end

function DGCore.Model.CharacterVehicle(vehicle_id, character_id, plate, garage, fuel, engine_health, body_health, is_impounded, is_insured, mods)
    local self = {}

    self.vehicle_id = vehicle_id
    self.character_id = character_id
    self.plate = plate
    self.garage = garage
    self.fuel = fuel
    self.engine_health = engine_health
    self.body_health = body_health
    self.is_impounded = is_impounded
    self.is_insured = is_insured
    self.mods = mods

    function self:toInsert()
        return {
            self.vehicle_id,
            self.character_id,
            self.plate,
            self.garage,
            self.fuel,
            self.engine_health,
            self.body_health,
            self.is_impounded,
            self.is_insured,
            self.mods
        }
    end

    function self:toUpdate()
        return {
            self.character_id,
            self.plate,
            self.garage,
            self.fuel,
            self.engine_health,
            self.body_health,
            self.is_impounded,
            self.is_insured,
            self.mods,
            self.vehicle_id
        }
    end

    return self
end

function DGCore.Model.CharacterJobs(CharacterJobs)
    local result = {}
    for i, job in ipairs(CharacterJobs) do
        result[i] = DGCore.Model.CharacterJob(job.job_id, job.job_grade_id, job.character_id)
    end
    return result
end

function DGCore.Model.CharacterJob(job_id, job_grade_id, character_id)
    local self = {}

    self.job_id = job_id
    self.job_grade_id = job_grade_id
    self.character_id = character_id

    function self:toInsert()
        return {
            self.job_id,
            self.job_grade_id,
            self.character_id
        }
    end

    function self:toUpdate()
        return {
            self.job_grade_id,
            self.character_id,
            self.job_id
        }
    end

    return self
end

function DGCore.Model.CharacterGang(gang_id, gang_grade_id, character_id)
    local self = {}

    self.gang_id = gang_id
    self.gang_grade_id = gang_grade_id
    self.character_id = character_id

    function self:toInsert()
        return {
            self.gang_id,
            self.gang_grade_id,
            self.character_id
        }
    end

    function self:toUpdate()
        return {
            self.gang_grade_id,
            self.character_id,
            self.gang_id
        }
    end

    return self
end