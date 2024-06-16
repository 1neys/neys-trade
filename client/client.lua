local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for _,v in pairs(Config.Ped) do    
      RequestModel(v.npcHash)
      while not HasModelLoaded(v.npcHash) do
        Wait(1)
      end
      ped =  CreatePed(4,v.npcHash, v.coords.x, v.coords.y, v.coords.z - 1, 3374176, false, true)
      SetEntityHeading(ped,v.npcHeading)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      if Config.Target then
        if Config.UseQbTarget then
          exports['qb-target']:AddTargetEntity(ped, {
            options = {
              {
                label = Config.TargetLabel,
                icon = 'fa-solid fa-dollar-sign',
                type = 'client',
                event = 'neys-trade:client:openmenu', 
              }
            },
            distance = 2.0
          })
        else
          exports.ox_target:addModel(ped, {
            icon = 'fas fa-dollar-sign',
            label = Config.TargetLabel,
            event = 'neys-trade:client:openmenu',
            distance = 2
          })
        end
      else
        while true do
          local sleep = 2000
          local ped = PlayerPedId()
          local Distance = #(GetEntityCoords(ped)- v.coords) 
            if Distance <= 3.0 then
              sleep  = 0 
                DrawText3D(v.coords.x,v.coords.y,v.coords.z + 0.98,Config.DrawTextLabel)
                if IsControlJustReleased(0, Config.DrawTextKey) then
                  TriggerEvent('neys-trade:client:openmenu')
                end
            end
          Wait(sleep)
        end
      end
    end
end)

RegisterNetEvent('neys-trade:client:trade', function(id)
  local neys = QBCore.Functions.HasItem(data.item, data.amount)
  QBCore.Functions.TriggerCallback('neys-trade:server:hasItem', function(hasItem, itemLabel)
    if hasItem then
      if neys then
        TriggerServerEvent('neys-trade:exchangeItem', id)
        lib.notify({
          title = Notify['trade_successful'],
          type = 'success'
        })
      else
        lib.notify({
          title = Notify['trade_error'],
          type = 'error'
        })
      end
    else 
      lib.notify({
        title = Notify['hasitem_error'],
        type = 'error'
      })
    end
  end, data.item)
end)

RegisterNetEvent('neys-trade:client:openmenu', function()
  ShowMenu()
end)

RegisterCommand(Config.TestCommand, function()
  if Config.UseTestCommand then
    ShowMenu()
  else
    lib.notify({
      title = Notify['test_command'],
      type = 'error'
    })
  end
end)

function ShowMenu()
  local resgisteredMenu = {
      id = 'neys_menu',
      title = Config.MenuLabel,
      options = {}
  }
  local options = {}
  for k, v in pairs(Config.TreadeItem) do
    options[#options+1] = {
        title = v.title,
        description = v.description,
        icon = v.icon,
        event = 'neys-trade:client:trade',
        args = k
    }
  end
  resgisteredMenu["options"] = options
  lib.registerContext(resgisteredMenu)
  lib.showContext('neys_menu')
end
