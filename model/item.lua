DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}
DGCore.Model.Item = {}

function DGCore.Model.Item.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.Item })
    self.id = data.id
    self.name = data.name
    self.label = data.label
    self.weight = data.weight
    self.category = data.category
    self.ammotype = data.ammotype
    self.image = data.image
    self.isstack = data.isstack
    self.stacksize = data.stacksize
    self.isrightclick = data.isrightclick
    self.isshouldclose = data.isshouldclose
    self.description = data.description
end

function DGCore.Model.Item.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.Item.new(data)
end

function DGCore.Model.Item:toJson()
    return json.encode({
        id            = self.id,
        name          = self.name,
        label         = self.label,
        weight        = self.weight,
        category      = self.category,
        ammotype      = self.ammotype,
        image         = self.image,
        isstack       = self.isstack,
        stacksize     = self.stacksize,
        isrightclick  = self.isrightclick,
        isshouldclose = self.isshouldclose,
        description   = self.description
    })
end
