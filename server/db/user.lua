DGCore = DGCore or {}
DGCore.Database = DGCore.Database or {}

DGCore.Database.User = {}

function DGCore.Database.User.selectbyid(userid)
    return DGDB.fetch(DGCore.Constant.Queries.User.SelectById, { userid })
end

function DGCore.Database.User.selectbyrockstartid(rockstartid)
    return DGDB.fetch(DGCore.Constant.Queries.User.SelectByRockStartId, { rockstartid })
end

function DGCore.Database.User.exists(userId)
    return DGDB.fetch(DGCore.Constant.Queries.User.Exists, { userId })
end

function DGCore.Database.User.existsbyrockstartid(rockstartid)
    return DGDB.fetch(DGCore.Constant.Queries.User.ExistsRockStartId, { rockstartid })
end

function DGCore.Database.User.insert(user)
    return DGDB.insert(DGCore.Constant.Queries.User.Insert, user:toInsertArray())
end