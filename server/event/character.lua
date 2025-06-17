RegisterNetEvent("dg-core:Server:createCharacter")
AddEventHandler("dg-core:Server:createCharacter", function (data)
    if DGConfig.Debug == 1 then print(data) end
    print("キャラクター新規作成")
    local src = source
    local user = DGCore.Users[src]
    local rockstartid = GetPlayerIdentifierByType(src, 'license')

    for i, d in ipairs(data) do
        print(string.format('%s: %s', i, d))
    end

    local player = DGCore.Player.Create(data, user)
end)