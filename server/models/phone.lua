DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Phone(id, phone_number, is_active, metadata)
    local self = {}

    self.id = id 
    self.phone_number = phone_number
    self.is_active = is_active
    self.metadata = metadata

    function self:toInsert()
        return {
            self.id,
            self.phone_number,
            self.is_active,
            self.metadata
        }
    end

    function self:toUpdate()
        return {
            self.phone_number,
            self.is_active,
            self.metadata,
            self.id
        }
    end

    return self
end