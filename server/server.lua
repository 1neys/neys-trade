local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('neys-trade:removeItem')
AddEventHandler('neys-trade:removeItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, amount) 
end)

RegisterServerEvent('neys-trade:addItem')
AddEventHandler('neys-trade:addItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.AddItem(item, amount) 
end)

QBCore.Functions.CreateCallback('neys-trade:server:hasItem', function(source, cb, item)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local playerItem = player.Functions.GetItemByName(item)
    if player then 
        if playerItem ~= nil then
            if playerItem.amount >= 1 then
                cb(true, playerItem.label)
            end
        else
            cb(false, QBCore.Shared.Items[item].label)
        end
    end
end)