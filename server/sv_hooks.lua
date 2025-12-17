for name, data in pairs(hooks) do
    addTypeHook(name, data.from, data.to, data.callback)
end

function sendWebhook(webhook, embeds)
    if not Config.Webhooks[webhook] or Config.Webhooks[webhook] == "" then
        print('^1[Inventory Logs] ^0Webhook "' .. webhook .. '" is not configured or empty.')
        return
    end

    local payload = {
        username = "Inventory Logger",
        avatar_url = Config.EmbedSettings.author_icon,
        embeds = embeds
    }

    PerformHttpRequest(
        Config.Webhooks[webhook],
        function(err, text, headers)
            if err ~= 200 and err ~= 204 then
                print('^1[Inventory Logs] ^0Failed to send webhook: ' .. webhook .. ' | Error: ' .. tostring(err))
            end
        end,
        'POST',
        json.encode(payload),
        { 
            ['Content-Type'] = 'application/json',
            ['User-Agent'] = 'InventoryLogger/1.0'
        }
    )
end
