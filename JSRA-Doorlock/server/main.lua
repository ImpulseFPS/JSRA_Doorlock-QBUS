QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback("JSRA-Doorlock:server:get:config", function(source, cb)
    cb(Config)
end)

RegisterServerEvent('JSRA-Doorlock:server:change:door:looks')
AddEventHandler('JSRA-Doorlock:server:change:door:looks', function(Door, Type)
 TriggerClientEvent('JSRA-Doorlock:client:change:door:looks', -1, Door, Type)
end)

RegisterServerEvent('JSRA-Doorlock:server:reset:door:looks')
AddEventHandler('JSRA-Doorlock:server:reset:door:looks', function()
 TriggerClientEvent('JSRA-Doorlock:client:reset:door:looks', -1)
end)

RegisterServerEvent('JSRA-Doorlock:server:updateState')
AddEventHandler('JSRA-Doorlock:server:updateState', function(doorID, state)
 Config.Doors[doorID]['Locked'] = state
 TriggerClientEvent('JSRA-Doorlock:client:setState', -1, doorID, state)
end)