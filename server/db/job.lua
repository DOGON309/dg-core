DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

DGCore.DB.Job = {}

function DGCore.DB.Job.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.Job.SelectAll, {})
end

function DGCore.DB.Job.Insert(Job)
    DGCore.DB.insert(DGCore.Constant.Queries.Job.Insert, Job:toInsert())
end

function DGCore.DB.Job.Update(Job)
    DGCore.DB.update(DGCore.Constant.Queries.Job.Update, Job:toUpdate())
end

DGCore.DB.JobGrade = {}

function DGCore.DB.JobGrade.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.JobGrade.SelectAll, {})
end

function DGCore.DB.JobGrade.SelectByJobId(job_id)
    return DGCore.DB.fetch(DGCore.Constant.Queries.JobGrade.SelectByJobId, { job_id })
end

function DGCore.DB.JobGrade.Insert(JobGrade)
    DGCore.DB.insert(DGCore.Constant.Queries.JobGrade.Insert, {})
end

function DGCore.DB.JobGrade.Update(JobGrade)
    DGCore.DB.update(DGCore.Constant.Queries.JobGrade.Update, {})
end

DGCore.DB.JobPermission = {}

function DGCore.DB.JobPermission.SelectAll()
    return DGCore.DB.fetch(DGCore.Constant.Queries.JobPermission.SelectAll, {})
end

function DGCore.DB.JobPermission.Insert(JobPermission)
    DGCore.DB.insert(DGCore.Constant.Queries.JobPermission.Insert, {})
end

function DGCore.DB.JobPermission.Update(JobPermission)
    DGCore.DB.update(DGCore.Constant.Queries.JobPermission.Update, {})
end
