DGCore = DGCore or {}
DGCore.Users = DGCore.Users or {}
DGCore.DB = DGCore.DB or {}

-- 起動した時のイベント
AddEventHandler('onResourceStart', function (resource)
    if resource == GetCurrentResourceName() then
        DGCore.Cash.User()
        DGCore.Cash.Permission()
        DGCore.Cash.Bank()
        DGCore.Cash.Phone()
        DGCore.Cash.Item()
        DGCore.Cash.Vehicle()
        DGCore.Cash.Job()
        DGCore.Cash.Gang()
        DGCore.Cash.Character()
    end
end)

-- 接続したら
AddEventHandler('playerConnecting', function (name, _, deferrals)
    local src = source
    deferrals.defer()
    Wait(0)

    -- licenseを取得
    local license = GetPlayerIdentifierByType(src, 'license')
    local license2 = GetPlayerIdentifierByType(src, 'license2') or ''

    local user = DGCore.Users[license] or nil
    if not user then
        user = DGCore.User.Create({
            license = license,
            license2 = license2
        })
    end

    -- 管理者チェック
    if DGConfig.Server.Closed and user.is_admin and not IsPlayerAceAllowed(src, "dgcore.admin") then
        return deferrals.done('メンテナンス中のため管理者のみ参加できます')
    end

    -- ホワイトリスト
    if DGConfig.Server.Whitelist and user.is_whitelist == 0 then
        return deferrals.done('ホワイトリストに登録されていません')
    end

    -- Ban確認
    if user.is_ban == 1 then
        return deferrals.done(string.format('あなたはBanされています。理由：%s', user.ban_reason))
    end

    -- キャッシュにユーザーを格納
    DGCore.Users[license] = user

    print(string.format('[DGCore] %s が接続しました。（ライセンス：%s）', GetPlayerName(src), license))

    -- セキュリティ完了
    deferrals.done()
end)

AddEventHandler('playerDropped', function (reason)
    local src = source
    local license = GetPlayerIdentifierByType(src, 'license')
    local user = DGCore.Users[license]

    if user then
        user:save()
    end
end)