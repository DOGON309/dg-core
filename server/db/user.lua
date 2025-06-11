DGCore = DGCore or {}
DGCore.Database = DGCore.Database or {}

DGCore.Database.User = {}

function DGCore.Database.User.SelectById(userid)
    return DGDB.fetch(DGCore.Constant.Queries.User.SelectById, { userid })
end

function DGCore.Database.User.SelectByRockStartId(rockstartid)
    return DGDB.fetch(DGCore.Constant.Queries.User.SelectByRockStartId, { rockstartid })
end

function DGCore.Database.User.Exists(userId)
    return DGDB.fetch(DGCore.Constant.Queries.User.Exists, { userId })
end

function DGCore.Database.User.ExistsByRockStartId(rockstartid)
    return DGDB.fetch(DGCore.Constant.Queries.User.ExistsRockStartId, { rockstartid })
end

function DGCore.Database.User.Insert(user)
    return DGDB.insert(DGCore.Constant.Queries.User.Insert, user:toInsertArray())
end
