DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}
DGCore.Model.Player = {}

DGModel = DGModel or {}
DGModel.Player = {}

-- @playerData {id firstname lastname birthday gender nationality}
-- @playerStatus DGModel.PlayerStatus
-- @playerItems DGModel.PlayerItems[] Array
-- @playerWallet DGModel.PlayerWallet
-- @playerBanks DGModel.PlayerBank[] Array
-- @playerJobs DGModel.PlayerJobs[] Array
-- @playerGang {id grade_id label level grade_label}
function DGModel.Player(playerData, playerStatus, playerItems, playerWallet, playerBank, playerJobs, playerGang)
    local self = {}

    self.id = playerData.id
    self.firstname = playerData.firstname
    self.lastname = playerData.lastname
    self.birthday = playerData.birthday
    self.gender = playerData.gender
    self.nationality = playerData.nationality

    self.status = {
        id = playerStatus.id,
        hunger = playerStatus.hunger,
        thirst = playerStatus.thirst,
        stress = playerStatus.stress,
        isdead = playerStatus.isdead,
        iscrippling = playerStatus.iscrippling,
        armor = playerStatus.armor,
        ishandcuff = playerStatus.ishandcuff,
        istracker = playerStatus.istracker,
        isinjail = playerStatus.isinjail
    }

    self.items = playerItems

    self.wallet = {
        id = playerWallet.id,
        cash = playerStatus.cash,
        crypto = playerStatus.crypto
    }

    self.banks = playerBank
    self.jobs = playerJobs
    
    self.Gang = {
        id = playerGang.id,
        grade_id = playerGang.grade_id,
        label = playerGang.label,
        level = playerGang.level,
        grade_label = playerGang.grade_label
    }

    function self:GetFullname()
        return string.format("%s%s", self.firstname, self.lastname)
    end

    function self:toTable()
        return {
            id = self.id,
            firstname = self.firstname,
            lastname = self.lastname,
            birthday = self.birthday,
            gender = self.gender,
            nationality = self.nationality,
            status = self.status,
            items = self.items,
            wallet = self.wallet,
            banks = self.banks,
            jobs = self.jobs,
            gang = self.gang
        }
    end

    return self
end

function DGCore.Model.Player.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.Player })
    self.Functions = {}

    self.id = data.id
    self.firstname = data.firstname
    self.lastname = data.lastname
    self.birthday = data.birthday
    self.gender = data.gender
    self.nationality = data.nationality

    function self.Functions.toJson()
        return json.encode({
            id = self.id,
            firstname = self.firstname,
            lastname = self.lastname,
            birthday = self.birthday,
            gender = self.gender,
            nationality = self.nationality
        })
    end

    function self.Functions.toFullname()
        return string.format("%s%s", self.firstname, self.lastname)
    end

    return self
end

function DGCore.Model.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.Player.new(data)
end

DGCore.Model.PlayerStatus = {}
-- ```
-- id プレイヤーステータスID
-- hunger 空腹度
-- thirst 喉の渇き
-- stress ストレス
-- isdead 死んでいるかどうか？
-- armor アーマー
-- ishandcuff 手錠をかけられているか
-- istracker GPSを付けられているか
-- isinjail 刑務所にいるかどうか
-- ```
function DGCore.Model.PlayerStatus.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerStatus })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.hunger = data.hunger
    self.thirst = data.thirst
    self.stress = data.stress
    self.isdead = data.isdead
    self.iscrippling = data.iscrippling
    self.armor = data.armor
    self.ishandcuff = data.ishandcuff
    self.istracker = data.tracker
    self.isinjail = data.isinjail

    function DGCore.Model.PlayerStatus:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            hunger = self.hunger,
            thirst = self.thirst,
            stress = self.stress,
            isdead = self.isdead,
            iscrippling = self.iscrippling,
            armor = self.armor,
            ishandcuff = self.ishandcuff,
            istracker = self.istracker,
            isinjail = self.isinjail
        })
    end

    return self
end

function DGCore.Model.PlayerStatus.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerStatus.new(data)
end

DGCore.Model.PlayerItem = {}

-- ```
-- id プレイヤーが所持しているアイテムデータのID
-- player_id プレイヤーレコードのID
-- item_id アイテムレコードのID
-- quantity 所持しているアイテムの数
-- isjail 服役中に没収されているか
-- ```

function DGCore.Model.PlayerItem.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerItem })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.item_id = data.item_id
    self.quantity = data.quantity
    self.isjail = data.isjail

    function DGCore.Model.PlayerItem:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            item_id = self.item_id,
            quantity = self.quantity,
            isjail = self.isjail
        })
    end

    return self
end

function DGCore.Model.PlayerItem.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerItem.new(data)
end

DGCore.Model.PlayerItemStatus = {}

-- ```
-- id 主キー
-- player_item_id player_itemの外部キー
-- durability 耐久値
-- is_equipped 現在装備中かどうか
-- use_count 使った回数
-- ```

function DGCore.Model.PlayerItemStatus.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerItemStatus })
    self.Functions = {}

    self.id = data.id
    self.player_item_id = data.player_item_id
    self.durability = data.durability
    self.is_equipped = data.is_equipped
    self.use_count = data.use_count

    function DGCore.Model.PlayerItemStatus:toJson()
        return json.encode({
            id = self.id,
            player_item_id = self.player_item_id,
            durability = self.durability,
            is_equipped = self.is_equipped,
            use_count = self.use_count
        })
    end

    return self
end

function DGCore.Model.PlayerItemStatus.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerItemStatus.new(data)
end

DGCore.Model.PlayerWallet = {}

-- ```
-- id 主キー
-- player_id playerの外部キー
-- cash 手持ちのお金
-- crypto 仮想通貨
-- ```

function DGCore.Model.PlayerWallet.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerWallet })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.cash = data.cash
    self.crypto = data.crypto

    function DGCore.Model.PlayerWallet:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            cash = self.cash,
            crypto = self.crypto
        })
    end

    return self
end

function DGCore.Model.PlayerWallet.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerWallet.new(data)
end

DGCore.Model.PlayerBank = {}

-- ```
-- id 主キー
-- player_id playerの外部キー
-- name 口座名
-- account_number 口座番号
-- balance 残高
-- ```

function DGCore.Model.PlayerBank.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerBank })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.name = data.name
    self.account_number = data.account_number
    self.balance = data.balance

    function DGCore.Model.PlayerBank:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            name = self.name,
            account_number = self.account_number,
            balance = self.balance
        })
    end

    return self
end

function DGCore.Model.PlayerBank.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerBank.new(data)
end

DGCore.Model.PlayerPhone = {}

-- ```
-- id 主キー
-- player_id playerの外部キー
-- number 電話番号
-- ```

function DGCore.Model.PlayerPhone.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerPhone })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.number = data.number

    function DGCore.Model.PlayerPhone:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            number = self.number
        })
    end

    return self
end

function DGCore.Model.PlayerPhone.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerPhone.new(data)
end

DGCore.Model.PlayerJob = {}

-- ```
-- id 主キー
-- player_id playerの外部キー
-- job_id jobの外部キー
-- job_grade_id job_grade_idの外部キー
-- ```

function DGCore.Model.PlayerJob.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.PlayerJob })
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.job_id = data.job_id
    self.job_grade_id = data.job_grade_id

    function DGCore.Model.PlayerJob:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            job_id = self.job_id,
            job_grade_id = self.job_grade_id
        })
    end

    return self
end

function DGCore.Model.PlayerJob.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerJob.new(data)
end

DGCore.Model.PlayerGang = {}

-- ```
-- id 主キー
-- player_id playerの外部キー
-- job_id jobの外部キー
-- job_grade_id job_gradeの外部キー
-- ```

function DGCore.Model.PlayerGang.new(data)
    local self = setmetatable({}, {__index=DGCore.Model.PlayerGang})
    self.Functions = {}

    self.id = data.id
    self.player_id = data.player_id
    self.gang_id = data.gang_id
    self.gang_grade_id = data.gang_grade_id

    function DGCore.Model.PlayerGang:toJson()
        return json.encode({
            id = self.id,
            player_id = self.player_id,
            gang_id = self.gang_id,
            gang_grade_id = self.gang_grade_id
        })
    end

    return self
end

function DGCore.Model.PlayerGang.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.PlayerGang.new(data)
end


