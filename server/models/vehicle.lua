DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Vehicle(id, label, brand, type, category, price, trunk_capacity, fuel_capacity, seats, is_rentable, is_sellable, is_disable, image, metadata)
    local self = {}

    self.id = id
    self.label = label
    self.brand = brand
    self.type = type
    self.category = category
    self.price = price
    self.trunk_capacity = trunk_capacity
    self.fuel_capacity = fuel_capacity
    self.seats = seats
    self.is_rentable = is_rentable
    self.is_sellable = is_sellable
    self.is_disable = is_disable
    self.image = image
    self.metadata = metadata

    function self:toInsert()
        return {
            self.id,
            self.label,
            self.brand,
            self.type,
            self.category,
            self.price,
            self.trunk_capacity,
            self.fuel_capacity,
            self.seats,
            self.is_rentable,
            self.is_sellable,
            self.is_disable,
            self.image,
            self.metadata
        }
    end

    function self:toUpdate()
        return {
            self.label,
            self.brand,
            self.type,
            self.category,
            self.price,
            self.trunk_capacity,
            self.fuel_capacity,
            self.seats,
            self.is_rentable,
            self.is_sellable,
            self.is_disable,
            self.image,
            self.metadata,
            self.id
        }
    end

    return self
end

function DGCore.Model.VehiclePermission(vehicle_id, permission_id)
    local self = {}

    self.vehicle_id = vehicle_id
    self.permission_id = permission_id

    function self:toInsert()
        return {
            self.vehicle_id,
            self.permission_id
        }
    end

    function self:toUpdate()
        return {
            self.permission_id,
            self.vehicle_id
        }
    end

    return self
end