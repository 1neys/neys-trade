local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('neys-trade:exchangeItem', function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    if not Player then return end
    local data = Config.TreadeItem[id]
    if not data then return end
    if Player.Functions.RemoveItem(data.removeitem, data.removeitemAmount) then
        Player.Functions.AddItem(data.additem, data.additemAmount) 
    end
end)

QBCore.Functions.CreateCallback('neys-trade:server:hasItem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PlayerItem = Player.Functions.GetItemByName(item)
    if Player then 
        if PlayerItem ~= nil then
            if PlayerItem.amount >= 1 then
                cb(true, PlayerItem.label)
            end
        else
            cb(false, QBCore.Shared.Items[item].label)
        end
    end
end)
