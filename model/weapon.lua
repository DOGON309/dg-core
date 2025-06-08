DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

DGCore.Model.Weapon = {}

function DGCore.Model.Weapon.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.Weapon })
    self.id = data.id
    self.item_id = data.item_id
    self.damage = data.damage
    self.recoil = data.recoil
    self.firerate = data.firerate
    self.magazine_size = data.magazine_size
    self.weapon_category = data.weapon_category
    return self
end

function DGCore.Model.Weapon.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.Weapon.new(data)
end

function DGCore.Model.Weapon:toJson()
    return json.encode({
        id = self.id,
        item_id = self.item_id,
        damage = self.damage,
        recoil = self.recoil,
        firerate = self.firerate,
        magazine_size = self.magazine_size,
        weapon_category = self.weapon_category
    })
end
