DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Permission(id, name)
    local self = {}

    self.id = id
    self.name = name

    function self:toInsert()
        return {
            self.id,
            self.name
        }
    end

    function self:toUpdate()
        return {
            self.name,
            self.id
        }
    end

    return self
end
