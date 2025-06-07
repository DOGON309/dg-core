DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}
DGCore.Model.Job = {}

function DGCore.Model.Job.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.Job })
    self.id = data.id
    self.event = data.event
    self.label = data.label
    self.defaultDuty = data.defaultDuty
    self.offDuty = data.offDuty
end

function DGCore.Model.Job.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.Job.new(data)
end

function DGCore.Model.Job:toJson()
    return json.encode({
        id = self.id,
        event = self.event,
        label = self.label,
        defaultDuty = self.defaultDuty,
        offDuty = self.offDuty
    })
end

function DGCore.Model.Job:toString()
    return string.format(
        'Job(id=%s, event=%s, label=%s, defaultDuty=%s, offDuty=%s)',
        self.id, self.event, self.label, self.defaultDuty, self.offDuty
    )
end

function DGCore.Model.JobGrade.new(data)
    local self = setmetatable({}, { __index = DGCore.Model.JobGrade })
    self.id = data.id
    self.job_id = data.job_id
    self.level = data.level
    self.label = data.label
    self.payment = data.payment
    self.isboss = data.isboss
end

function DGCore.Model.JobGrade.fromJson(json)
    local data = json.decode(json)
    return DGCore.Model.JobGrade.new(json)
end

function DGCore.Model.JobGrade:toJson()
    return json.encode({
        id = self.id,
        job_id = self.job_id,
        level = self.level,
        label = self.label,
        payment = self.payment,
        isboss = self.isboss
    })
end
