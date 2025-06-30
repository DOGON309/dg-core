RegisterNetEvent('dg-core:Client:Inventory:Open', function ()
    SenNuiFocus(true, true)
    SendNUIMessage({
        action = 'OpenInventory'
    })
end)
