DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

DGCore.Model.Gang = {}

function DGCore.Model.Gang.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.Gang })
    self.id = data.id
    self.label = data.label
    return self
end

function DGCore.Model.Gang.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.Gang.new(data)
end

function DGCore.Model.Gang:toJson()
    return json.encode({
        id = self.id,
        label = self.label
    })
end

DGCore.Model.GangGrade = {}

function DGCore.Model.GangGrade.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.GangGrade })
    self.id = data.id
    self.gang_id = data.gang_id
    self.level = data.level
    self.label = data.label
    return self
end

function DGCore.Model.GangGrade.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.GangGrade.new(data)
end

function DGCore.Model.GangGrade:toJson()
    return json.encode({
        id = self.id,
        gang_id = self.gang_id,
        level = self.level,
        label = self.label
    })
end
