DGCore = DGCore or {}
DGCore.Inventory = {}

function DGCore.Inventory.GetInventory(playerId)
    local playerItems = DGCore.Database.PlayerItems.fetch(playerId)
    local inventory = DGModel.PlayerItems(playerItems)

    return inventory
end

function DGCore.Inventory.GetInventoryForClient(playerId)
    local inventory = DGCore.Inventory.GetInventoryForClient(playerId)
    local clientInventory = {}

    for i, item in ipairs(inventory) do
        clientInventory[i] = item:toClient()
    end

    return clientInventory
end