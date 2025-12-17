hooks = {
    -- ITEM DROP LOGGING
    ['item_drop'] = {
        from = 'player',
        to = 'drop',
        callback = function(payload)
            if not Config.EnabledLogs.drop then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Dropped",
                description,
                Config.Colors.drop
            )
            
            embed.fields = {
                {
                    name = "🎯 Action Type",
                    value = "`DROP`",
                    inline = true
                },
                {
                    name = "📝 Item ID",
                    value = "`" .. item.name .. "`",
                    inline = true
                },
                {
                    name = "📊 Quantity",
                    value = "`" .. item.count .. "`",
                    inline = true
                }
            }
            
            sendWebhook('item_drop', { embed })
        end
    },

    -- ITEM PICKUP LOGGING
    ['item_pickup'] = {
        from = 'drop',
        to = 'player',
        callback = function(payload)
            if not Config.EnabledLogs.pickup then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Picked Up",
                description,
                Config.Colors.pickup
            )
            
            embed.fields = {
                {
                    name = "🎯 Action Type",
                    value = "`PICKUP`",
                    inline = true
                },
                {
                    name = "📝 Item ID",
                    value = "`" .. item.name .. "`",
                    inline = true
                },
                {
                    name = "📊 Quantity",
                    value = "`" .. item.count .. "`",
                    inline = true
                }
            }
            
            sendWebhook('item_pickup', { embed })
        end
    },

    -- ITEM TRANSFER (GIVE) LOGGING
    ['item_transfer'] = {
        from = 'player',
        to = 'player',
        callback = function(payload)
            if not Config.EnabledLogs.give then return end
            if payload.fromInventory == payload.toInventory then return end
            
            local fromPlayer = GetPlayerInfo(payload.source)
            local toPlayer = GetPlayerInfo(payload.toInventory)
            if not fromPlayer or not toPlayer then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local fromCoords = GetFormattedCoords(payload.source)
            local toCoords = GetFormattedCoords(payload.toInventory)
            
            local description = string.format(
                "👤 **From Player:** %s (%s)\n" ..
                "📋 **From Discord:** %s\n" ..
                "🆔 **From Source:** `%s`\n\n" ..
                "👤 **To Player:** %s (%s)\n" ..
                "📋 **To Discord:** %s\n" ..
                "🆔 **To Source:** `%s`\n\n" ..
                "📦 **Item:** %s x**%s**%s\n" ..
                "📍 **From Location:** %s\n" ..
                "📍 **To Location:** %s\n" ..
                "⏰ **Time:** %s",
                fromPlayer.name, fromPlayer.license, fromPlayer.discord, fromPlayer.source,
                toPlayer.name, toPlayer.license, toPlayer.discord, toPlayer.source,
                item.label, item.count, item.metadata,
                fromCoords, toCoords,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Transfer Between Players",
                description,
                Config.Colors.give
            )
            
            embed.fields = {
                {
                    name = "🎯 Action Type",
                    value = "`TRANSFER`",
                    inline = true
                },
                {
                    name = "📝 Item ID",
                    value = "`" .. item.name .. "`",
                    inline = true
                },
                {
                    name = "📊 Quantity",
                    value = "`" .. item.count .. "`",
                    inline = true
                }
            }
            
            sendWebhook('item_transfer', { embed })
        end
    },

    -- STASH DEPOSIT LOGGING
    ['stash_deposit'] = {
        from = 'player',
        to = 'stash',
        callback = function(payload)
            if not Config.EnabledLogs.stash then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "🏪 **Stash ID:** `%s`\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                payload.toInventory,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Stored in Stash",
                description,
                Config.Colors.stash_deposit
            )
            
            embed.fields = {
                {
                    name = "🎯 Action Type",
                    value = "`STASH DEPOSIT`",
                    inline = true
                },
                {
                    name = "📝 Item ID",
                    value = "`" .. item.name .. "`",
                    inline = true
                },
                {
                    name = "🏪 Stash",
                    value = "`" .. payload.toInventory .. "`",
                    inline = true
                }
            }
            
            sendWebhook('stash_operations', { embed })
        end
    },

    -- STASH WITHDRAWAL LOGGING
    ['stash_withdrawal'] = {
        from = 'stash',
        to = 'player',
        callback = function(payload)
            if not Config.EnabledLogs.stash then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "🏪 **Stash ID:** `%s`\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                payload.fromInventory,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Taken from Stash",
                description,
                Config.Colors.stash_withdraw
            )
            
            embed.fields = {
                {
                    name = "🎯 Action Type",
                    value = "`STASH WITHDRAWAL`",
                    inline = true
                },
                {
                    name = "📝 Item ID",
                    value = "`" .. item.name .. "`",
                    inline = true
                },
                {
                    name = "🏪 Stash",
                    value = "`" .. payload.fromInventory .. "`",
                    inline = true
                }
            }
            
            sendWebhook('stash_operations', { embed })
        end
    },

    -- VEHICLE TRUNK STORAGE
    ['vehicle_store'] = {
        from = 'player',
        to = 'glovebox',
        callback = function(payload)
            if not Config.EnabledLogs.vehicle then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "🚗 **Vehicle:** `%s`\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                payload.toInventory,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Stored in Vehicle",
                description,
                Config.Colors.vehicle_store
            )
            
            sendWebhook('vehicle_operations', { embed })
        end
    },

    -- VEHICLE TRUNK RETRIEVAL
    ['vehicle_take'] = {
        from = 'glovebox',
        to = 'player',
        callback = function(payload)
            if not Config.EnabledLogs.vehicle then return end
            
            local player = GetPlayerInfo(payload.source)
            if not player then return end
            
            local item = GetItemInfo(payload.fromSlot)
            local coords = GetFormattedCoords(payload.source)
            
            local description = string.format(
                "🎒 **Player:** %s (%s)\n" ..
                "📋 **Discord:** %s\n" ..
                "🆔 **Source ID:** `%s`\n" ..
                "📦 **Item:** %s x**%s**\n" ..
                "🚗 **Vehicle:** `%s`\n" ..
                "📍 **Location:** %s%s\n" ..
                "⏰ **Time:** %s",
                player.name,
                player.license,
                player.discord,
                player.source,
                item.label,
                item.count,
                payload.fromInventory,
                coords,
                item.metadata,
                FormatTime()
            )
            
            local embed = CreateBaseEmbed(
                "Item Taken from Vehicle",
                description,
                Config.Colors.vehicle_take
            )
            
            sendWebhook('vehicle_operations', { embed })
        end
    }
}