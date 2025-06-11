DGConfig = {}

-- QBCoreと設定内容はほぼ同じ

DGConfig.MaxPlayers = GetConvarInt('sv_maxclients', 48)         -- 参加プレイヤーの最大人数（デフォルトは48人）
DGConfig.DefaultSpawn = vector4(-1035.71, -2731.87, 12.86, 0.0) -- デフォルトにスポーン位置
DGConfig.UpdateInterval = 5                                     -- プレイヤデータの更新頻度（分単位）
DGConfig.StatusInterval = 5000                                  -- プレイヤーステータスの確認頻度（ミリ秒単位）

DGConfig.Money = {}
DGConfig.Money.DefaultMoney = { cash = 500, bank = 5000, crypto = 0 } -- 最初の所持金・最初の銀行残高・最初の暗号資産
DGConfig.Money.DontAllowMinus = { 'cash', 'crypto' }                  -- マイナスにならないお金
DGConfig.Money.MinusLimit = -5000                                     -- マイナスの最大値
DGConfig.Money.PayCheckTimeOut = 10                                   -- 給料が払われるタイミング
DGConfig.Money.PayCheckSociety = false                                -- 給料を会社口座から引き落としされるシステム

DGConfig.Player = {}
DGConfig.Player.HungerRate = 4.2 -- 空腹になる速度
DGConfig.Player.ThirstRate = 3.8 -- 喉が渇く速度
DGConfig.Player.Nationality = 'Japan'

DGConfig.Server = {}
DGConfig.Server.Closed = false
DGConfig.Server.ClosedReason = 'サーバーが閉じています'
DGConfig.Server.Uptime = 0
DGConfig.Server.Whitelist = false
DGConfig.Server.WhitelistPermission = 'admin'
DGConfig.Server.PVP = true
DGConfig.Server.CheckDuplicateLicense = true
DGConfig.Server.Permissions = { 'god', 'admin', 'mod' }

DGConfig.Commands = {}
DGConfig.Commands.OOCColor = { 255, 151, 133 }

DGConfig.Notify = {}
DGConfig.Notify.NotificationStyling = {
    group = false,
    position = 'right',
    progress = true
}
DGConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'check_circle'
    },
    primary = {
        classes = 'primary',
        icon = 'notifications'
    },
    warning = {
        classes = 'warning',
        icon = 'warning'
    },
    error = {
        classes = 'error',
        icon = 'error'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}

DGConfig.Debug = 1
