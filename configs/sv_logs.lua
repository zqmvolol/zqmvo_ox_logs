Config = {}

-- Webhook URLs for different log types
Config.Webhooks = {
    ['item_drop'] = 'YOUR_DROP_WEBHOOK_URL_HERE',
    ['item_pickup'] = 'YOUR_PICKUP_WEBHOOK_URL_HERE',
    ['item_transfer'] = 'YOUR_TRANSFER_WEBHOOK_URL_HERE',
    ['stash_operations'] = 'YOUR_STASH_WEBHOOK_URL_HERE',
    ['vehicle_operations'] = 'YOUR_VEHICLE_WEBHOOK_URL_HERE',
    ['shop_operations'] = 'YOUR_SHOP_WEBHOOK_URL_HERE',
    ['crafting_operations'] = 'YOUR_CRAFTING_WEBHOOK_URL_HERE'
}

-- Footer configuration for promotional purposes
Config.Footer = {
    text = "🎮 Your Server Name | discord.gg/yourserver",
    icon_url = "https://your-server-logo-url.com/logo.png"
}

-- Additional embed configurations
Config.EmbedSettings = {
    thumbnail_url = "https://your-server-logo-url.com/thumbnail.png", -- Small image in top right
    author_name = "📦 Inventory System",
    author_icon = "https://your-server-logo-url.com/icon.png",
    timestamp = true -- Include timestamp in embeds
}

-- Color scheme for different operations
Config.Colors = {
    drop = 0xFF6B6B,        -- Red for drops
    pickup = 0x4ECDC4,      -- Teal for pickups
    give = 0x45B7D1,        -- Blue for giving items
    stash_deposit = 0x96CEB4, -- Light green for stash deposits
    stash_withdraw = 0xFD79A8, -- Pink for stash withdrawals
    vehicle_store = 0x74B9FF, -- Light blue for vehicle storage
    vehicle_take = 0xA29BFE,  -- Purple for taking from vehicles
    shop_buy = 0x00B894,     -- Green for purchases
    shop_sell = 0xE17055,    -- Orange for sales
    craft = 0xFDCB6E,        -- Yellow for crafting
    warning = 0xFF7675,      -- Light red for warnings
    success = 0x00B894       -- Green for success
}

-- Enable/disable specific log types
Config.EnabledLogs = {
    drop = true,
    pickup = true,
    give = true,
    stash = true,
    vehicle = true,
    shop = true,
    crafting = true
}

-- Log format settings
Config.LogFormat = {
    include_coordinates = true,
    include_metadata = true,
    include_item_images = false, -- Set to true if you have item image URLs
    coordinate_precision = 1 -- Decimal places for coordinates
}