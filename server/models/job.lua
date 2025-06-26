DGCore = DGCore or {}
DGCore.Model = DGCore.Model or {}

function DGCore.Model.Job(id, label, icon, description, bank, is_whitelist, is_disable, grades)
    local self = {}

    self.id = id
    self.label = label 
    self.icon = icon
    self.description = description
    self.bank = bank
    self.is_whitelist = is_whitelist
    self.is_disable = is_disable

    self.grades = DGCore.Model.GangGrades(grades) or {}

    function self:toInsert()
        return {
            self.id,
            self.label,
            self.icon,
            self.description,
            self.bank,
            self.is_whitelist,
            self.is_disable
        }
    end

    function self:toUpdate()
        return {
            self.label,
            self.icon,
            self.description,
            self.bank,
            self.is_whitelist,
            self.is_disable,
            self.id
        }
    end

    return self
end

function DGCore.Model.JobGrades(grades)
    local result = {}
    for i, row in ipairs(grades) do
        result[i] = DGCore.Model.JobGrade(row.id, row.job_id, row.grade, row.label, row.salary, row.is_disable)
    end
    return result
end

function DGCore.Model.JobGrade(id, job_id, grade, label, salary, is_disable)
    local self = {}

    self.id = id
    self.job_id = job_id
    self.grade = grade
    self.label = label
    self.salary = salary
    self.is_disable = is_disable

    function self:toInsert()
        return {
            self.id,
            self.job_id,
            self.grade,
            self.label,
            self.salary,
            self.is_disable
        }
    end

    function self:toUpdate()
        return {
            self.job_id,
            self.grade,
            self.label,
            self.salary,
            self.is_disable,
            self.id
        }
    end

    return self
end

function DGCore.Model.JobPermission(job_grade_id, permission_id)
    local self = {}

    self.job_grade_id = job_grade_id
    self.permission_id = permission_id

    function self:toInsert()
        return {
            self.job_grade_id,
            self.permission_id
        }
    end

    function self:toUpdate()
        return {
            self.permission_id,
            self.job_grade_id
        }
    end

    return self
end