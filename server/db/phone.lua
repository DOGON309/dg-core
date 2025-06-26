DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Phone = {}

function DGCore.DB.Phone.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Phone.SelectAll, {})
end

function DGCore.DB.Phone.SelectByPhoneNumber(phone_number)
    return DGCore.DB.fetchOne(DGCore.Constant.Queries.Phone.SelectByPhoneNumber, { phone_number })
end

function DGCore.DB.Phone.Insert(Phone)
    DGCore.DB.insert(DGCore.Constant.Queries.Phone.Insert, Phone:toInsert())
end

function DGCore.DB.Phone.Update(Phone)
    DGCore.DB.update(DGCore.Constant.Queries.Phone.Update, Phone:toUpdate())
end
