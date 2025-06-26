DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Permission = {}

function DGCore.DB.Permission.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Permission.SelectAll, {})
end

function DGCore.DB.Permission.SelectById(id)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.Permission.SelectById, { id })
end

function DGCore.DB.Permission.SelectByName(name)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.Permission.SelectByName, { name })
end

function DGCore.DB.Permission.Insert(permission)
    DGCore.DB.Insert(DGCore.Constant.Queries.Permission.Insert, permission:toInsert())
end

function DGCore.DB.Permission.Update(permission)
    DGCore.DB.update(DGCore.Constant.Queries.Permission.Update, permission:toUpdate())
end
