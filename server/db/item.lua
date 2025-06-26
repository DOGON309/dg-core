DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Item = {}

function DGCore.DB.Item.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Item.SelectAll, {})
end

function DGCore.DB.Item.Insert(Item)
    DGCore.DB.insert(DGCore.Constant.Queries.Item.Insert, Item:toInsert())
end

function DGCore.DB.Item.Update(Item)
    DGCore.DB.update(DGCore.Constant.Queries.Item.Update, Item:toUpdate())
end

DGCore.DB.ItemPermission = {}

function DGCore.DB.ItemPermission.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.ItemPermission.SelectAll, {})
end

function DGCore.DB.ItemPermission.Insert(ItemPermission)
    DGCore.DB.insert(DGCore.Constant.Queries.ItemPermission.Insert, ItemPermission:toInsert())
end

function DGCore.DB.ItemPermission.Update(ItemPermission)
    DGCore.DB.update(DGCore.Constant.Queries.ItemPermission.Update, ItemPermission:toUpdate())
end
