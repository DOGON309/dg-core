DGCore = DGCore or {}

DGCore.User = {}

function DGCore.User.Load(userId)
    local userData = DGCore.Database.User.SelectById(userId)
    if not userData then return nil end

    local user = DGModel.User(userData)

    return user
end

function DGCore.User.GenerateId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.User.Exists(id)
    if result == 0 then return id end
    return DGCore.User.GenerateId()
end