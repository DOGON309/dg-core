DGCore = DGCore or {}

DGCore.Player = {}

function DGCore.Player.CreatePlayer()
    local self = setmetatable({}, DGCore.Player)
    self.id = DGCore.Player.GeneratePlayerId()
    self.firstname = "Firstname"
    self.lastname = "Lastname"
    self.birthday = "00-00-0000"
    self.gender = DGCore.Constant.GenderList[0]
    self.nationality = "Japan"
    self.status = {
        id = DGCore.Player.GeneratePlayerId(),
        player_id = self.id,
        hunger = 100,
        thirst = 100,
        stress = 0,
        isdead = false,
        iscrippling = false,
        armor = 0,
        ishandcuff = false,
        istracker = false,
        isinjail = false
    }
    self.items = {}
    self.wallet = {
        id = DGCore.Player.GenerateWalletId(),
        player_id = self.id,
        cash = DGConfig.Money.DefaultMoney.cash,
        crypto = DGConfig.Money.DefaultMoney.crypto
    }
    self.bank = {
        id = DGCore.Player.GenerateBankId(),
        player_id = self.id,
        name = "無名",
        account_number = DGCore.Player.GenerateBankAccountNumber(),
        balance = DGConfig.Money.DefaultMoney.bank
    }
    self.job = {
        id = DGCore.Player.GeneratePlayerJobId(),
        player_id = self.id,
        job_id = '53cb9e57-60bb-45ef-a5bc-8d4b911aa6a3',
        job_grade_id = '66870BA7-B661-41C4-8212-EAB9F949BDA9'
    }
    self.gang = {
        id = DGCore.Player.GeneratePlayerGangId(),
        player_id = self.id,
        job_id = 'BE3CC613-79A9-47B4-BAC3-251FB32B1157',
        job_grade_id = '9C3DE4C6-14F7-4FC5-8B24-8DE669B5075A'
    }

    return self
end

function DGCore.Player.GeneratePlayerId()
    local id = DGCore.Function.GenerateUUID()
    local result = MySQL.prepare.await(DGCore.Constant.Queries.Player.Exists, { id })
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerId()
end

function DGCore.Player.GeneratePlayerStatusId()
    local id = DGCore.Function.GenerateUUID()
    local result = MySQL.prepare.await(DGCore.Constant.Queries.PlayerStatus.Exists, { id })
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerStatusId()
end

function DGCore.Player.GenerateWalletId()
    local id = DGCore.Function.GenerateUUID()
    local result = MySQL.prepare.await(DGCore.Constant.Queries.PlayerWallet.Exists, { id })
    if result == 0 then return id end
    return DGCore.Player.GenerateWalletId()
end

function DGCore.Player.GenerateBankAccountNumber()
    local number = string.format("%06d", math.random(0, 999999))
    local result = MySQL.prepare.await(DGCore.Constant.Queries.PlayerBank.ExistsAccountNumber, { number })
    if result == 0 then return number end
    return DGCore.Player.GenerateBankAccountNumber()
end

function DGCore.Player.GeneratePlayerJobId()
    local id = DGCore.Function.GenerateUUID()
    local result = MySQL.prepare.await(DGCore.Constant.Queries.PlayerJob.Exists, { id })
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerJobId()
end

function DGCore.Player.GeneratePlayerGangId()
    local id = DGCore.Function.GenerateUUID()
    local result = MySQL.prepare.await(DGCore.Constant.Queries.PlayerGang.Exists, { id })
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerGangId()
end