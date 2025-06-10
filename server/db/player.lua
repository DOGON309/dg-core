DGCore = DGCore or {}
DGCore.Database = DGCore.Database or {}

DGCore.Database.Player = {}
DGCore.Database.PlayerStatus = {}
DGCore.Database.PlayerItems = {}
DGCore.Database.PlayerWallet = {}
DGCore.Database.PlayerBank = {}
DGCore.Database.PlayerJob = {}
DGCore.Database.PlayerGang = {}

function DGCore.Database.Player.exists(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.Player.Exists, { playerId })
end

function DGCore.Database.Player.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.Player.SelectById, { playerId })
end

function DGCore.Database.Player.update(playerData)
    DGDB.update(DGCore.Constant.Queries.Player.Update, playerData:toUpdateArray())
end

function DGCore.Database.Player.insert(playerData)
    DGDB.insert(DGCore.Constant.Queries.Player.Insert, playerData:toInsertArray())
end

function DGCore.Database.PlayerStatus.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerStatus.SelectJoinStatusByPlayerId, { playerId })
end

function DGCore.Database.PlayerStatus.update(playerStatus)
    return DGDB.update(DGCore.Constant.Queries.PlayerStatus.Update, playerStatus:toUpdateArray())
end

function DGCore.Database.PlayerStatus.insert(playerStatus)
    DGDB.insert(DGCore.Constant.Queries.PlayerStatus.Insert, playerStatus:toInsertArray())
end

function DGCore.Database.PlayerItems.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerItem.SelectJoinItemByPlayerId, { playerId })
end

function DGCore.Database.PlayerItems.update(playerItems)
    for _, item in ipairs(playerItems) do
        DGDB.update(DGCore.Constant.Queries.PlayerItem.Update, item:toUpdateArray())
        DGDB.update(DGCore.Constant.Queries.PlayerItemStatus.Update, item:toStatusUpdateArray())
    end
end

function DGCore.Database.PlayerItems.insert(playerItems)
    for _, item in ipairs(playerItems) do
        DGDB.insert(DGCore.Constant.Queries.PlayerItem.Insert, item:toInsertArray())
    end
end

function DGCore.Database.PlayerWallet.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerWallet.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerWallet.update(playerWallet)
    DGDB.update(DGCore.Constant.Queries.PlayerWallet.Update, playerWallet:toUpdateArray())
end

function DGCore.Database.PlayerWallet.insert(playerWallet)
    DGDB.insert(DGCore.Constant.Queries.PlayerWallet.insert, playerWallet:toInsertArray())
end

function DGCore.Database.PlayerBanks.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerBank.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerBanks.update(playerBanks)
    for _, bank in ipairs(playerBanks) do
        DGDB.update(DGCore.Constant.Queries.PlayerBank.Update, bank:toUpdateArray())
    end
end

function DGCore.Database.PlayerBanks.insert(playerBanks)
    for _, bank in ipairs(playerBanks) do
        DGDB.insert(DGCore.Constant.Queries.PlayerBank.Insert, bank:toInsertArray())
    end
    
end

function DGCore.Database.PlayerJobs.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerJob.SelectJoinJobByPlayerId, { playerId })
end

function DGCore.Database.PlayerJobs.update(playerJobs)
    for _, job in ipairs(playerJobs) do
        DGDB.update(DGCore.Constant.Queries.PlayerJob.Update, job:toUpdateArray())
    end
end

function DGCore.Database.PlayerJobs.Insert(playerJobs)
    for _, job in ipairs(playerJobs) do
        DGDB.insert(DGCore.Constant.Queries.PlayerJob.Insert, job:toInsertArray())
    end
end

function DGCore.Database.PlayerGang.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerGang.SelectJoinGangByPlayerId, { playerId })
end

function DGCore.Database.PlayerGang.update(playerGang)
    DGDB.update(DGCore.Constant.Queries.PlayerGang.Update, playerGang:toUpdateArray())
end

function DGCore.Database.PlayerGang.insert(playerGang)
    DGDB.insert(DGCore.Constant.Queries.PlayerGang.Insert, playerGang:toInsertArray())
end