DGCore = DGCore or {}

DGCore.User = {}

function DGCore.User.Create(data)
    local self = {}

    self.id = DGCore.User.GenerateUserId()
    self.license = data.license
    self.license2 = data.license2 or ""
    self.is_admin = false
    self.is_ban = false
    self.ban_reason = ""
    self.is_whitelist = false
    self.note = ""

    local user = DGCore.Model.User(self.id, self.license, self.license2, self.is_admin, self.is_ban, self.ban_reason, self.is_whitelist, self.note)

    DGCore.DB.User.Insert(user)

    return user
end

function DGCore.User.Load(data)
    local result = DGCore.DB.User.SelectByLicense(data.license)

    if not result or #result == 0 then
        return DGCore.User.Create(data)
    end

    local row = result[1]
    local user = DGCore.Model.User(
        row.id,
        row.license,
        row.license2,
        row.is_admin,
        row.is_ban,
        row.ban_reason,
        row.is_whitelist,
        row.note
    )

    return user
end

function DGCore.User.GenerateUserId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.DB.User.SelectById(id)
    if #result == 0 then return id end
    return DGCore.User.GenerateUserId()
end