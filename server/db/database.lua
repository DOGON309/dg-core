DGDB = {}

-- @query SQL文
-- @params 入れる内容{license:1234...}
-- @cb コールバック関数
function DGDB.fetch(query, params)
    local result =  MySQL.prepare.await(query, params)

    -- resultがnilの場合
    if not result then
        return {}
    end

    -- resultが一件の場合
    if result and not result[1] then
        return { result }
    end

    return result
end

function DGDB.scalar(query, params)
    return MySQL.scalar.await(query, params)
end

function DGDB.insert(query, params)
    return MySQL.insert.await(query, params)
end

function DGDB.update(query, params)
    return MySQL.update.await(query, params)
end