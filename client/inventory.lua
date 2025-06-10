RegisterNetEvent("dg-core:inventory:openInventory", function (inventory)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openInventory",
        items = inventory
    })
end)