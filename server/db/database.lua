DGDB = {}

-- @query SQL文
-- @params 入れる内容{license:1234...}
-- @cb コールバック関数
function DGDB.fetch(query, params)
    return MySQL.prepare.await(query, params)
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