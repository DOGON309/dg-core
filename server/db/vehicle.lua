DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Vehicle = {}

function DGCore.DB.Vehicle.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Vehicle.SelectAll, {})
end

function DGCore.DB.Vehicle.Insert(Vehicle)
    DGCore.DB.insert(DGCore.Constant.Queries.Vehicle.Insert, Vehicle:toInsert())
end

function DGCore.DB.Vehicle.Update(Vehicle)
    DGCore.DB.update(DGCore.Constant.Queries.Vehicle.Update, Vehicle:toUpdate())
end

DGCore.DB.VehiclePermission = {}

function DGCore.DB.VehiclePermission.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.VehiclePermission.SelectAll, {})
end

function DGCore.DB.VehiclePermission.Insert(VehiclePermission)
    DGCore.DB.insert(DGCore.Constant.Queries.VehiclePermission.Insert, VehiclePermission:toInsert())
end

function DGCore.DB.VehiclePermission.Update(VehiclePermission)
    DGCore.DB.insert(DGCore.Constant.Queries.VehiclePermission.Update, VehiclePermission:toUpdate())
end
