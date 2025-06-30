Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, 245) then
            TriggerEvent('dg-core:Client:Inventory:Open')
        end
    end
end)
