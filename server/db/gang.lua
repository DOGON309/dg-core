DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Gang = DGCore.DB.Gang or {}

function DGCore.DB.Gang.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Gang.SelectAll, {})
end

function DGCore.DB.Gang.Insert(Gang)
    DGCore.DB.insert(DGCore.Constant.Queries.Gang.Insert, Gang:toInsert())
end

function DGCore.DB.Gang.Update(Gang)
    DGCore.DB.update(DGCore.Constant.Queries.Gang.Update, Gang:toUpdate())
end

DGCore.DB.GangGrade = {}

function DGCore.DB.GangGrade.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.SelectAll, {})
end

function DGCore.DB.GangGrade.SelectByGangId(gang_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.SelectByGangId, { gang_id })
end

function DGCore.DB.GangGrade.Insert(GangGrade)
    DGCore.DB.insert(DGCore.Constant.Queries.Insert, GangGrade:toInsert())
end

function DGCore.DB.GangGrade.Update(GangGrade)
    DGCore.DB.update(DGCore.Constant.Queries.Update, GangGrade:toUpdate())
end

DGCore.DB.GangPermission = {}

function DGCore.DB.GangPermission.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.GangPermission.SelectAll, {})
end

function DGCore.DB.GangPermission.Insert(GangPermission)
    DGCore.DB.insert(DGCore.Constant.Queries.GangPermission.Insert, GangPermission:toInsert())
end

function DGCore.DB.GangPermission.Update(GangPermission)
    DGCore.DB.update(DGCore.Constant.Queries.GangPermission.Update, GangPermission:toUpdate())
end
