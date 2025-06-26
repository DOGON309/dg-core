DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Item(id, label, description, event, weight, image, stack, category, unique, usable, price, is_trade, is_remove, metadata)
    local self = {}

    self.id = id
    self.label = label
    self.description = description
    self.event = event
    self.weight = weight
    self.image = image
    self.stack = stack
    self.category = category
    self.unique = unique
    self.usable = usable
    self.price = price
    self.is_trade = is_trade
    self.is_remove = is_remove
    self.metadata = metadata

    function self:toInsert()
        return {
            self.id,
            self.label,
            self.description,
            self.event,
            self.weight,
            self.image,
            self.stack,
            self.category,
            self.unique,
            self.usable,
            self.price,
            self.is_trade,
            self.is_remove,
            self.metadata
        }
    end

    function self:toUpdate()
        return {
            self.label,
            self.description,
            self.event,
            self.weight,
            self.image,
            self.stack,
            self.category,
            self.unique,
            self.usable,
            self.price,
            self.is_trade,
            self.is_remove,
            self.metadata,
            self.id
        }
    end

    return self
end

function DGCore.Model.ItemPermission(item_id, permission_id)
    local self = {}

    self.item_id = item_id
    self.permission_id = permission_id

    function self:toInsert()
        return {
            self.item_id,
            self.permission_id
        }
    end

    function self:toUpdate()
        return {
            self.permission_id,
            self.item_id
        }
    end

    return self
end