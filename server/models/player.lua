DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}
DGCore.Model.Player = {}

DGModel = DGModel or {}
DGModel.Player = {}

-- @playerData DGModel.PlayerData
-- @playerStatus DGModel.PlayerStatus
-- @playerItems DGModel.PlayerItems
-- @playerWallet DGModel.PlayerWallet
-- @playerBanks DGModel.PlayerBanks
-- @playerJobs DGModel.PlayerJobs
-- @playerGang DGModel.PlayerGang
function DGModel.Player(playerData, playerStatus, playerItems, playerWallet, playerBanks, playerJobs, playerGang)
    local self = {}

    self.id = playerData.id
    self.firstname = playerData.firstname
    self.lastname = playerData.lastname
    self.birthday = playerData.birthday
    self.gender = playerData.gender
    self.nationality = playerData.nationality

    self.status = playerStatus
    self.items = playerItems
    self.wallet = playerWallet
    self.banks = playerBanks
    self.jobs = playerJobs
    self.gang = playerGang

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

DGModel.PlayerData = {}

function DGModel.PlayerData(playerData)
    local self = {}

    self.id = playerData.id
    self.firstname = playerData.firstname
    self.lastname = playerData.lastname
    self.birthday = playerData.birthday
    self.gender = playerData.gender
    self.nationality = playerData.nationality

    return self
end

function DGModel.PlayerStatus(playerStatus)
    local self = {}

    self.id = playerStatus.id
    self.player_id = playerStatus.player_id
    self.hunger = playerStatus.hunger
    self.thirst = playerStatus.thirst
    self.stress = playerStatus.stress
    self.isdead = playerStatus.isdead
    self.iscrippling = playerStatus.iscrippling
    self.armor = playerStatus.armor
    self.ishandcuff = playerStatus.ishandcuff
    self.istracker = playerStatus.istracker
    self.isinjail = playerStatus.isinjail

    return self
end

function DGModel.PlayerItems(playerItems)
    local result = {}
    for i, item in ipairs(playerItems) do
        result[i] = DGModel.PlayerItem(item)
    end
    return result
end

function DGModel.PlayerItem(playerItem)
    local self = {}

    -- player_itemデーブル
    self.id = playerItem.id
    self.player_id = playerItem.player_id
    self.item_id = playerItem.item_id
    self.quantity = playerItem.quantity
    self.isjail = playerItem.isjail

    -- itemテーブル
    self.name = playerItem.name
    self.label = playerItem.label
    self.weight = playerItem.weight
    self.category = playerItem.category
    self.ammotype = playerItem.ammotype
    self.image = playerItem.image
    self.isstack = playerItem.isstack
    self.stacksize = playerItem.stacksize
    self.isrightclick = playerItem.isrightclick
    self.isshouldclose = playerItem.isshouldclose
    self.description = playerItem.description

    -- player_item_statusテーブル
    self.durability = playerItem.durability
    self.is_equipped = playerItem.is_equipped
    self.use_count = playerItem.use_count

    return self
end

function DGModel.PlayerWallet(playerWallet)
    local self = {}

    self.id = playerWallet.id
    self.player_id = playerWallet.player_id
    self.cash = playerWallet.cash
    self.crypto = playerWallet.crypto

    return self
end

function DGModel.PlayerBanks(playerBanks)
    local result = {}
    for i, bank in ipairs(playerBanks) do
        result[i] = DGModel.PlayerBank(bank)
    end
    return result
end

function DGModel.PlayerBank(playerBank)
    local self = {}

    self.id = playerBank.id
    self.player_id = playerBank.player_id
    self.name = playerBank.name
    self.account_number = playerBank.account_number
    self.balance = playerBank.balance

    return self
end

function DGModel.PlayerJobs(playerJobs)
    local result = {}
    for i, job in ipairs(playerJobs) do
        result[i] = DGModel.PlayerJob(job)
    end
    return result
end

function DGModel.PlayerJob(playerJob)
    local self = {}

    -- player_jobデーブル
    self.id = playerJob.id
    self.player_id = playerJob.player_id
    self.job_id = playerJob.job_id
    self.job_grade_id = playerJob.job_grade_id

    -- jobテーブル
    self.event = playerJob.event
    self.label = playerJob.label
    self.defaultDuty = playerJob.defaultDuty
    self.offDuty = playerJob.offDuty

    -- job_gradeテーブル
    self.jg_level = playerJob.jg_level
    self.jg_label = playerJob.jg_label
    self.jg_payment = playerJob.jg_payment
    self.jg_isboss = playerJob.jg_isboss

    return self
end

function DGModel.PlayerGang(playerGang)
    local self = {}

    -- player_gangテーブル
    self.id = playerGang.id
    self.player_id = playerGang.player_id
    self.gang_id = playerGang.gang_id
    self.gang_grade_id = playerGang.gang_grade_id

    -- gangテーブル
    self.label = playerGang.label

    -- gang_gradeテーブル
    self.gg_level = playerGang.level
    self.gg_label = playerGang.gg_label

    return self
end