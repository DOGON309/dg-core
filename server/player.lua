DGCore = DGCore or {}

DGCore.Player = {}

-- @playerId プレイヤーのUUID
function DGCore.Player.Load(playerId)
    local playerData = DGCore.Database.Player.fetch(playerId)
    if not playerData then return nil end

    local playerStatus = DGCore.Database.PlayerStatus.fetch(playerId)
    if not playerStatus then return nil end

    local playerItems = DGCore.Database.PlayerItems.fetch(playerId) or {}
    local playerWallet = DGCore.Database.PlayerWallet.fetch(playerId) or {}
    local playerBanks = DGCore.Database.PlayerBank.fetch(playerId) or {}
    local playerJobs = DGCore.Database.PlayerJob.fetch(playerId) or {}
    local playerGang = DGCore.Database.PlayerGang.fetch(playerId) or {}

    local player = DGModel.Player(
        DGModel.PlayerData(playerData),
        DGModel.PlayerStatus(playerStatus),
        DGModel.PlayerItems(playerItems),
        DGModel.PlayerWallet(playerWallet),
        DGModel.PlayerBanks(playerBanks),
        DGModel.PlayerJobs(playerJobs),
        DGModel.PlayerGang(playerGang)
    )

    return player
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