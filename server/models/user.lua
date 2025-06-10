DGCore = DGCore or {}
DGModel = DGModel or {}

function DGModel.User(user)
    local self = {}

    self.id = user.id
    self.rockstart_id = user.rockstart_id
    self.is_admin = user.is_admin
    self.is_ban = user.is_ban
    self.ban_reason = user.ban_reason
    self.is_whitelist = user.is_whitelist

    function self:toInsertArray()
        return {
            self.id,
            self.rockstart_id,
            self.is_admin,
            self.is_ban,
            self.ban_reason,
            self.is_whitelist
        }
    end

    return self
end