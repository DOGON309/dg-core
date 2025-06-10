RegisterNetEvent("dg-core:inventory:open", function ()
    local src = source
    local playerId = DGCore.Player.GetId(src)
    local inventory = DGCore.Inventory.GetInventoryForClient(playerId)

    TriggerClientEvent("dg-core:client:openInventory", src, inventory)
end)