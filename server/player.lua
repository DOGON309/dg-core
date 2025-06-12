DGCore = DGCore or {}

DGCore.Player = {}

-- @playerData {id, firstname, lastname, ...}
function DGCore.Player.Create(playerData)
    local playerStatus = DGModel.PlayerStatus({
        id = DGCore.Player.GeneratePlayerStatusId(),
        player_id = playerData.id,
        hunger = 100,
        thirst = 0,
        stress = 0,
        isdead = 0,
        iscrippling = 0,
        armor = 0,
        ishandcuff = 0,
        istracker = 0,
        isinjail = 0
    })
    local playerItems = {}
    local playerWallet = {
        id = DGCore.Player.GenerateWalletId(),
        player_id = playerData.id,
        cash = DGConfig.Money.DefaultMoney.cash,
        crypto = DGConfig.Money.DefaultMoney.crypto
    }
    local playerBanks = {}
    local playerJobs = {}
    local playerGang = {}

    local player = DGModel.Player(playerData, playerStatus, playerItems, playerWallet, playerBanks, playerJobs, playerGang)

    player:create()
end

-- @playerId プレイヤーのUUID
function DGCore.Player.Load(playerId)
    local playerData = DGCore.Database.Player.SelectById(playerId)
    if not playerData then return nil end

    local playerStatus = DGCore.Database.PlayerStatus.SelectJoinStatusByPlayerId(playerId)
    if not playerStatus then return nil end

    local playerItems = DGCore.Database.PlayerItems.SelectJoinItemByPlayerId(playerId) or {}
    local playerWallet = DGCore.Database.PlayerWallet.SelectByPlayerId(playerId) or {}
    local playerBanks = DGCore.Database.PlayerBanks.SelectByPlayerId(playerId) or {}
    local playerJobs = DGCore.Database.PlayerJobs.SelectJoinJobByPlayerId(playerId) or {}
    local playerGang = DGCore.Database.PlayerGang.SelectJoinGangByPlayerId(playerId) or {}

    local player = DGModel.Player(
        DGModel.PlayerData(playerData),
        DGModel.PlayerStatus(playerStatus),
        DGModel.PlayerItems(playerItems),
        DGModel.PlayerWallet(playerWallet),
        DGModel.PlayerBanks(playerBanks),
        DGModel.PlayerJobs(playerJobs),
        DGModel.PlayerGang(playerGang)
    )

    return player
end

function DGCore.Player.GeneratePlayerId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.Player.Exists(id)
    if DGConfig.Debug == 1 then print(result) end -- デバッグ出力
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerId()
end

function DGCore.Player.GeneratePlayerStatusId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.PlayerStatus.Exists(id)
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerStatusId()
end

function DGCore.Player.GenerateWalletId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.PlayerItems.Exists(id)
    if result == 0 then return id end
    return DGCore.Player.GenerateWalletId()
end

function DGCore.Player.GenerateBankAccountNumber()
    local number = string.format("%06d", math.random(0, 999999))
    local result = DGCore.Database.PlayerBanks.ExistsByAccountNumber(number)
    if result == 0 then return number end
    return DGCore.Player.GenerateBankAccountNumber()
end

function DGCore.Player.GeneratePlayerJobId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.PlayerJobs.Exists(id)
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerJobId()
end

function DGCore.Player.GeneratePlayerGangId()
    local id = DGCore.Function.GenerateUUID()
    local result = DGCore.Database.PlayerGang.Exists(id)
    if result == 0 then return id end
    return DGCore.Player.GeneratePlayerGangId()
end