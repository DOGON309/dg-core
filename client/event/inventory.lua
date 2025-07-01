local isInventoryOpen = false

RegisterCommand('toggleInventory', function()
    if isInventoryOpen then
        -- 閉じる処理
        SendNUIMessage({ action = 'CloseInventory' })
        SetNuiFocus(false, false)
        isInventoryOpen = false
    else
        -- 開く処理
        SendNUIMessage({ action = 'OpenInventory' })
        SetNuiFocus(true, true)
        isInventoryOpen = true
    end
end, false)

RegisterKeyMapping('toggleInventory', 'インベントリを開閉する', 'keyboard', 'TAB')

-- NUIから閉じる指示が来たとき
RegisterNUICallback('closeInventory', function(_, cb)
    if isInventoryOpen then
        SendNUIMessage({ action = 'CloseInventory' })
        SetNuiFocus(false, false)
        isInventoryOpen = false
    end
    cb({})
end)
