DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.User = {}

function DGCore.DB.User.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.User.SelectAll, {})
end

function DGCore.DB.User.SelectById(id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.User.SelectById, { id })
end

function DGCore.DB.User.SelectByLicense(license)
    return DGCore.DB.fetch(DGCore.Constant.Queries.User.SelectByLicense, { license })
end

function DGCore.DB.User.SelectByLicense2(license2)
    return DGCore.DB.fetch(DGCore.Constant.Queries.User.SelectByLicense2, { license2 })
end

function DGCore.DB.User.Insert(user)
    DGCore.DB.insert(DGCore.Constant.Queries.User.Insert, user:toInsert())
end

function DGCore.DB.User.Update(user)
    DGCore.DB.update(DGCore.Constant.Queries.User.Update, user:toUpdate())
end
