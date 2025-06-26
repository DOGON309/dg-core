-- ログイン中のユーザー
DGCore.Users = {}

-- 権限
DGCore.Permissions = {}

-- 口座
DGCore.Banks = {}

-- 携帯
DGCore.Phones = {}

-- アイテム
DGCore.Items = {}

-- 乗り物
DGCore.Vehicles = {}

-- 仕事
DGCore.Jobs = {}

-- ギャング
DGCore.Gangs = {}

-- キャラクター
DGCore.Characters = {}

DGCore = DGCore or {}
DGCore.Cash = {}

function DGCore.Cash.User()
    local users = DGCore.DB.User.SelectAll()
    print(users)
    for _, row in ipairs(users) do
        DGCore.Users[row.license] = DGCore.Model.User(row.id, row.license, row.license2, row.is_admin, row.is_ban, row.ban_reason, row.is_whitelist, row.note)
    end
    print(string.format('[DGCore]ユーザー情報をキャッシュ完了。（%d 件)', #users))
end

function DGCore.Cash.Permission()
    local permissions = DGCore.DB.Permission.SelectAll()
    for _, row in ipairs(permissions) do
        DGCore.Permissions[row.id] = DGCore.Model.Permission(row.id, row.name)
    end
    print(string.format('[DGCore]権限情報をキャッシュ完了。（%d 件）', #permissions))
end

function DGCore.Cash.Bank()
    local banks = DGCore.DB.Bank.SelectAll()
    for _, row in ipairs(banks) do
        local transactions = DGCore.DB.BankTransaction.SelectByFromBank(row.id)
        DGCore.Banks[row.id] = DGCore.Model.Bank(row.id, row.account_number, row.type, row.balance, row.is_disable, row.is_infinite, transactions)
    end
    print(string.format('[DGCore]口座情報をキャッシュ完了。（%d 件）', #banks))
end

function DGCore.Cash.Phone()
    local phones = DGCore.DB.Phone.SelectAll()
    for _, row in ipairs(phones) do
        DGCore.Phones[row.id] = DGCore.Model.Phone(row.id, row.phone_number, row.is_active, row.metadata)
    end
    print(string.format('[DGCore]携帯情報をキャッシュ完了。（%d 件）', #phones))
end

function DGCore.Cash.Item()
    local items = DGCore.DB.Item.SelectAll()
    for _, row in ipairs(items) do
        DGCore.Items[row.id] = DGCore.Model.Item(row.id, row.label, row.description, row.event, row.weight, row.image, row.stack, row.category, row.unique, row.usable, row.price, row.is_trade, row.is_remove, row.metadata)
    end
    print(string.format('[DGCore]アイテム情報をキャッシュ完了。（%d 件）', #items))
end

function DGCore.Cash.Vehicle()
    local vehicles = DGCore.DB.Vehicle.SelectAll()
    for _, row in ipairs(vehicles) do
        DGCore.Vehicles[row.id] = DGCore.Model.Vehicle(row.id, row.label, row.brand, row.type, row.category, row.print, row.trunk_capacity, row.fuel_capacity, row.seats, row.is_rentable, row.is_sellable, row.is_disable, row.image, row.metadata)
    end
    print(string.format('[DGCore]乗り物情報をキャッシュ完了。（%d 件）', #vehicles))
end

function DGCore.Cash.Job()
    local jobs = DGCore.DB.Job.SelectAll()
    for _, row in ipairs(jobs) do
        local grades = DGCore.DB.GangGrade.SelectByGangId(row.id)
        DGCore.Jobs[row.id] = DGCore.Model.Job(row.id, row.label, row.icon, row.description, row.bank, row.is_whitelist, row.is_disable, grades)
    end
    print(string.format('[DGCore]仕事情報をキャッシュ完了。（%d 件）', #jobs))
end

function DGCore.Cash.Gang()
    local gangs = DGCore.DB.Gang.SelectAll()
    for _, row in ipairs(gangs) do
        local grades = DGCore.DB.GangGrade.SelectByGangId(row.id)
        DGCore.Gangs[row.id] = DGCore.Model.Gang(row.id, row.label, row.icon, row.description, row.bank, row.is_disable, grades)
    end
    print(string.format('[DGCore]ギャング情報をキャッシュ完了。（%d 件）', #gangs))
end

function DGCore.Cash.Character()
    local characters = DGCore.DB.Character.SelectAll()
    for _, row in ipairs(characters) do
        local CharacterBanks = DGCore.DB.CharacterBank.SelectByCharacterId(row.id)
        local CharacterPhones = DGCore.DB.CharacterPhone.SelectByCharacterId(row.id)
        local CharacterItems = DGCore.DB.CharacterItem.SelectByCharacterId(row.id)
        local CharacterVehicles = DGCore.DB.CharacterVehicle.SelectByCharacterId(row.id)
        local CharacterJobs = DGCore.DB.CharacterJob.SelectByCharacterId(row.id)
        local CharacterGang = DGCore.DB.CharacterGang.SelectByCharacterId(row.id)
        DGCore.Characters[row.id] = DGCore.Model.Character(row.id, row.user_id, row.firstName, row.lastName, row.birthday, row.gender, row.cash, row.nationality, row.slot, row.skin, row.pos_x, row.pos_y, row.pos_z, row.heading, row.hp, row.armor, row.hunger, row.thirst, row.stress, row.weight, row.is_dead, row.is_crippling, row.is_handcuff, row.is_tracker, row.is_jail, row.is_ban, row.ban_reason, row.is_deleted, CharacterBanks, CharacterPhones, CharacterItems, CharacterVehicles, CharacterJobs, CharacterGang)
    end
    print(string.format('[DGCore]キャラクター情報をキャッシュ完了。（%d 件）', #characters))
end
