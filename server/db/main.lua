DGCore = DGCore or {}
DGCore.DB = DGCore.DB or {}

function DGCore.DB.fetch(query, params)
    local result = MySQL.prepare.await(query, params)

    if not result then
        return {}
    end

    if type(result) == 'table' and not result[1] then
        return {result}
    end

    return result
end

function DGCore.DB.scalar(query, params)
    return MySQL.scalar.await(query, params)
end

function DGCore.DB.insert(query, params)
    return MySQL.insert.await(query, params)
end

function DGCore.DB.update(query, params)
    return MySQL.update.await(query, params)
end
