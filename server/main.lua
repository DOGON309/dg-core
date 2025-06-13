-- FiveMのイベント
-- DGCore.Database.User = require('@dg-core/server/db/user');

DGCore = DGCore or {}
DGCore.Users = {}
DGCore.Players = {}

-- リソースが起動しようとした時に発火するイベント
AddEventHandler('onResourceStarting', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('[DGCore] フレームワーク起動中……')
end)

-- リソースが起動したら発火するイベント
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('[DGCore] フレームワーク起動！！')
end)

-- リソースが終了した時に発火するイベント
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print('[DGCore] フレームワークが終了しました……')
end)

-- リフレッシュコマンドが実行されたら発火するイベント
AddEventHandler('onResourceListRefresh', function()
    print('refreshコマンドを実行しました')
end)

AddEventHandler('playerConnecting', function (name, _, deferrals)
    local src = source
    print(src)
    deferrals.defer()
    Wait(0)

    -- RockStartIDの取得
    local rockstartid = GetPlayerIdentifierByType(src, 'license')

    -- userテーブル存在確認
    local userData = DGCore.Database.User.SelectByRockStartId(rockstartid)
    if not userData then
        -- 初めてサーバーに参加ひと
        userData = DGModel.User({
            id = DGCore.User.GenerateId(),
            rockstart_id = rockstartid,
            is_admin = 0,
            is_ban = 0,
            ban_reason = "",
            is_whitelist = 0
        })
        local id = DGCore.Database.User.insert(userData)
        userData = {id, rockstartid, is_admin = 0, is_ban = 0, ban_reason = "", is_whitelist = 0}
    end
    local user = DGModel.User(userData)

    -- 管理者チェック
    if DGConfig.Server.Closed and user.is_admin and not IsPlayerAceAllowed(src, "dgcore.admin") then
        return deferrals.done("メンテナンス中のため管理者のみ参加できます")
    end

    -- ホワイトリスト確認
    if DGConfig.Server.Whitelist and user.is_whitelist == 0 then
        return deferrals.done("ホワイトリストに登録されていません")
    end

    -- Ban確認
    if user.is_ban == 1 then
        return deferrals.done(string.format("あなたはBanされています。理由：%s", user.ban_reason))
    end
    -- セキュリティクリア
    deferrals.done()
end)

RegisterNetEvent("dg-core:Server:playerReady", function ()
    local src = source
    local rockstart_id = GetPlayerIdentifierByType(src, 'license')

    local user = DGCore.Database.User.SelectByRockStartId(rockstart_id)

    local characters = DGCore.Database.Player.SelectByUserId(user.id) or {}

    TriggerClientEvent("dg-core:Client:showCharacter", src, characters)

    DGCore.Users[src] = user
end)