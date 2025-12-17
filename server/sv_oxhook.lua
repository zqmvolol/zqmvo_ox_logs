types = {}

function addTypeHook(name, from, to, callback)
    types[name] = {
        from = from,
        to = to,
        callback = callback
    }
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    
    if GetResourceState('ox_inventory') ~= 'started' then
        print('^1[Inventory Logs] ^0ox_inventory is not started. Please ensure ox_inventory is running.')
        return
    end
    
    print('^2[Inventory Logs] ^0Successfully started inventory logging system.')
    print('^3[Inventory Logs] ^0Registered ' .. #types .. ' hook types.')
    
    exports.ox_inventory:registerHook(
        'swapItems',
        function(payload)
            for name, data in pairs(types) do
                if payload.fromType == data.from and payload.toType == data.to then
                    data.callback(payload)
                end
            end
        end,
        {
            print = false -- Disable ox_inventory debug prints
        }
    )
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if GetResourceState('ox_inventory') ~= 'started' then return end
    
    exports.ox_inventory:removeHooks()
    print('^3[Inventory Logs] ^0Inventory logging hooks removed.')
end)
