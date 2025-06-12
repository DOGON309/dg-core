DGCore = DGCore or {}
DGCore.Database = DGCore.Database or {}

DGCore.Database.Player = {}
DGCore.Database.PlayerStatus = {}
DGCore.Database.PlayerItems = {}
DGCore.Database.PlayerWallet = {}
DGCore.Database.PlayerBanks = {}
DGCore.Database.PlayerJobs = {}
DGCore.Database.PlayerGang = {}

function DGCore.Database.Player.Exists(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.Player.Exists, { playerId })
end

function DGCore.Database.Player.SelectById(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.Player.SelectById, { playerId })
end

function DGCore.Database.Player.SelectByRockStartId(rockstart_id)
    return DGDB.fetch(DGCore.Constant.Queries.Player.SelectByRockStartId, { rockstart_id })
end

function DGCore.Database.Player.Update(playerData)
    DGDB.update(DGCore.Constant.Queries.Player.Update, playerData:toUpdateArray())
end

function DGCore.Database.Player.Insert(playerData)
    DGDB.insert(DGCore.Constant.Queries.Player.Insert, playerData:toInsertArray())
end

function DGCore.Database.PlayerStatus.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerStatus.Exists, { id })
end

function DGCore.Database.PlayerStatus.SelectJoinStatusByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerStatus.SelectJoinStatusByPlayerId, { playerId })
end

function DGCore.Database.PlayerStatus.Update(playerStatus)
    return DGDB.update(DGCore.Constant.Queries.PlayerStatus.Update, playerStatus:toUpdateArray())
end

function DGCore.Database.PlayerStatus.Insert(playerStatus)
    DGDB.insert(DGCore.Constant.Queries.PlayerStatus.Insert, playerStatus:toInsertArray())
end

function DGCore.Database.PlayerItems.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerItem.Exists, { id })
end

function DGCore.Database.PlayerItems.SelectJoinItemByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerItem.SelectJoinItemByPlayerId, { playerId })
end

function DGCore.Database.PlayerItems.Update(playerItems)
    for _, item in ipairs(playerItems) do
        DGDB.update(DGCore.Constant.Queries.PlayerItem.Update, item:toUpdateArray())
        DGDB.update(DGCore.Constant.Queries.PlayerItemStatus.Update, item:toStatusUpdateArray())
    end
end

function DGCore.Database.PlayerItems.Insert(playerItems)
    for _, item in ipairs(playerItems) do
        DGDB.insert(DGCore.Constant.Queries.PlayerItem.Insert, item:toInsertArray())
    end
end

function DGCore.Database.PlayerWallet.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerWallet.Exists, { id })
end

function DGCore.Database.PlayerWallet.SelectByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerWallet.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerWallet.Update(playerWallet)
    DGDB.update(DGCore.Constant.Queries.PlayerWallet.Update, playerWallet:toUpdateArray())
end

function DGCore.Database.PlayerWallet.Insert(playerWallet)
    DGDB.insert(DGCore.Constant.Queries.PlayerWallet.insert, playerWallet:toInsertArray())
end

function DGCore.Database.PlayerBanks.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerBank.Exists, { id })
end

function DGCore.Database.PlayerBanks.ExistsByAccountNumber(account_number)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerBank.ExistsByAccountNumber, { account_number })
end

function DGCore.Database.PlayerBanks.SelectByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerBank.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerBanks.Update(playerBanks)
    for _, bank in ipairs(playerBanks) do
        DGDB.update(DGCore.Constant.Queries.PlayerBank.Update, bank:toUpdateArray())
    end
end

function DGCore.Database.PlayerBanks.Insert(playerBanks)
    for _, bank in ipairs(playerBanks) do
        DGDB.insert(DGCore.Constant.Queries.PlayerBank.Insert, bank:toInsertArray())
    end
end

function DGCore.Database.PlayerJobs.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerJob.Exists, { id })
end

function DGCore.Database.PlayerJobs.SelectJoinJobByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerJob.SelectJoinJobByPlayerId, { playerId })
end

function DGCore.Database.PlayerJobs.Update(playerJobs)
    for _, job in ipairs(playerJobs) do
        DGDB.update(DGCore.Constant.Queries.PlayerJob.Update, job:toUpdateArray())
    end
end

function DGCore.Database.PlayerJobs.Insert(playerJobs)
    for _, job in ipairs(playerJobs) do
        DGDB.insert(DGCore.Constant.Queries.PlayerJob.Insert, job:toInsertArray())
    end
end

function DGCore.Database.PlayerGang.Exists(id)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerGang.Exists, { id })
end

function DGCore.Database.PlayerGang.SelectJoinGangByPlayerId(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerGang.SelectJoinGangByPlayerId, { playerId })
end

function DGCore.Database.PlayerGang.Update(playerGang)
    DGDB.update(DGCore.Constant.Queries.PlayerGang.Update, playerGang:toUpdateArray())
end

function DGCore.Database.PlayerGang.Insert(playerGang)
    DGDB.insert(DGCore.Constant.Queries.PlayerGang.Insert, playerGang:toInsertArray())
end