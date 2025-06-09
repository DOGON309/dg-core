DGCore = DGCore or {}
DGCore.Database = DGCore.Database or {}

DGCore.Database.Player = {}
DGCore.Database.PlayerStatus = {}
DGCore.Database.PlayerItems = {}
DGCore.Database.PlayerWallet = {}
DGCore.Database.PlayerBank = {}
DGCore.Database.PlayerJob = {}
DGCore.Database.PlayerGang = {}

function DGCore.Database.Player.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.Player.SelectById, { playerId })
end

function DGCore.Database.PlayerStatus.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerStatus.SelectJoinStatusByPlayerId, { playerId })
end

function DGCore.Database.PlayerItems.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerItem.SelectJoinItemByPlayerId, { playerId })
end

function DGCore.Database.PlayerWallet.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerWallet.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerBank.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerBank.SelectByPlayerId, { playerId })
end

function DGCore.Database.PlayerJob.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerJob.SelectJoinJobByPlayerId, { playerId })
end

function DGCore.Database.PlayerGang.fetch(playerId)
    return DGDB.fetch(DGCore.Constant.Queries.PlayerGang.SelectJoinGangByPlayerId, { playerId })
end