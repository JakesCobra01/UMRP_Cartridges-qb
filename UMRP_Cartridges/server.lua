local QBCore = exports['qb-core']:GetCoreObject() -- Ensure this is correctly referencing the QBCore object

RegisterServerEvent('checkTaserCartridges')
AddEventHandler('checkTaserCartridges', function()
    local _source = source
    local hasCartridge = false

    -- Check if the player has the taser cartridge in their inventory
    local Player = QBCore.Functions.GetPlayer(_source)
    local item = Player.Functions.GetItemByName('taser_cartridge')

    if item then
        if item.amount > 0 then
            -- Remove the item from the inventory
            Player.Functions.RemoveItem('taser_cartridge', 1)
            hasCartridge = true
        end
    else
        print("Player does not have taser cartridges.")
    end

    -- Trigger the client event with the result
    TriggerClientEvent('reloadTaser', _source, hasCartridge)
end)