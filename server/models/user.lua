DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.User(id, license, license2, is_admin, is_ban, ban_reason, is_whitelist, note)
    local self = {}

    self.id = id
    self.license = license
    self.license2 = license2
    self.is_admin = is_admin
    self.is_ban = is_ban
    self.ban_reason = ban_reason
    self.is_whitelist = is_whitelist
    self.note = note

    function self:toInsert()
        return {
            self.id,
            self.license,
            self.license2,
            self.is_admin,
            self.is_ban,
            self.ban_reason,
            self.is_whitelist,
            self.note
        }
    end

    function self:toUpdate()
        return {
            self.license,
            self.license2,
            self.is_admin,
            self.is_ban,
            self.ban_reason,
            self.is_whitelist,
            self.note,
            self.id
        }
    end

    function self:save()
        DGCore.DB.User.Update(self)
    end

    return self
end
