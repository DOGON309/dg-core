Citizen.CreateThread(function ()
    while not NetworkIsSessionStarted() do
        Wait(100)
    end

    print("プレイヤー初期化が完了しました")
    TriggerServerEvent("dg-core:Server:playerReady")
end)

Citizen.CreateThread(function ()
    while true do
        Wait(0)
        -- 標準のHUDを削除
        DisplayRadar(false)
    end
end)

Citizen.CreateThread(function ()
    while true do
        -- 更新頻度を100ミリ
        Wait(100)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)

        SendNUIMessage({
            action = "updateMinimap",
            x = coords.x,
            y = coords.y,
            heading = heading
        })
    end
end)