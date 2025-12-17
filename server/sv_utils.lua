function GetPlayerInfo(source)
    if not source or source == 0 then return nil end
    
    local playerName = GetPlayerName(source) or "Unknown Player"
    local identifiers = GetPlayerIdentifiers(source)
    local license = "Unknown"
    local discord = "Unknown"
    local steam = "Unknown"
    
    for _, id in pairs(identifiers) do
        if string.find(id, "license:") then
            license = id
        elseif string.find(id, "discord:") then
            discord = "<@" .. string.gsub(id, "discord:", "") .. ">"
        elseif string.find(id, "steam:") then
            steam = id
        end
    end
    
    return {
        name = playerName,
        source = source,
        license = license,
        discord = discord,
        steam = steam
    }
end

function GetFormattedCoords(source)
    if not Config.LogFormat.include_coordinates then
        return "Coordinates disabled"
    end
    
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local precision = Config.LogFormat.coordinate_precision
    
    return string.format("**X:** %.1f **Y:** %.1f **Z:** %.1f", 
        coords.x, coords.y, coords.z)
end

function GetItemInfo(slot)
    local metadata = ""
    if Config.LogFormat.include_metadata and slot.metadata then
        metadata = "\n**Metadata:** `" .. json.encode(slot.metadata) .. "`"
    end
    
    return {
        name = slot.name or "unknown_item",
        label = slot.label or slot.name or "Unknown Item",
        count = slot.count or 1,
        metadata = metadata
    }
end

function FormatTime()
    return os.date("%H:%M:%S - %d/%m/%Y")
end

function CreateBaseEmbed(title, description, color)
    local embed = {
        title = "📦 " .. title,
        description = description,
        color = color or Config.Colors.success,
        footer = {
            text = Config.Footer.text,
            icon_url = Config.Footer.icon_url
        },
        author = {
            name = Config.EmbedSettings.author_name,
            icon_url = Config.EmbedSettings.author_icon
        }
    }
    
    if Config.EmbedSettings.timestamp then
        embed.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    end
    
    if Config.EmbedSettings.thumbnail_url then
        embed.thumbnail = {
            url = Config.EmbedSettings.thumbnail_url
        }
    end
    
    return embed
end