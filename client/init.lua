CreateThread(function ()
    while not NetworkIsSessionStarted() do
        Wait(100)
    end

    print("プレイヤー初期化が完了しました")
    TriggerServerEvent("dg-core:Server:playerReady")
end)