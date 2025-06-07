-- FiveMのイベント

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
