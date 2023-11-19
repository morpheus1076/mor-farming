ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('mor-farming:additem')
AddEventHandler('mor-farming:additem', function(data)
    local item = data
    exports.ox_inventory:AddItem(source, item.item, item.menge)
end)