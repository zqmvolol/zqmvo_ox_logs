# 📦 Enhanced OX Inventory Discord Logs

A comprehensive, professional Discord logging system for **ox_inventory** with advanced embed formatting, customizable promotional footers, and detailed player tracking.

## 🌟 Features

### 📊 **Comprehensive Logging**
- **Item Drops & Pickups** - Track all ground interactions
- **Player Transfers** - Monitor item exchanges between players
- **Stash Operations** - Log deposits and withdrawals from storage
- **Vehicle Storage** - Track trunk/glovebox interactions
- **Shop Transactions** - Ready for shop system integration
- **Crafting Activities** - Framework ready for crafting logs

### 🎨 **Professional Discord Embeds**
- Rich, color-coded embed messages
- Detailed player information with Discord mentions
- Formatted coordinates and timestamps
- Structured field layouts for easy reading
- Custom thumbnails and author information

### 🚀 **Server Promotion Features**
- Customizable footer with server branding
- Promotional text in every log message
- Server logo integration
- Discord invite links
- Website promotion capabilities

### ⚙️ **Advanced Configuration**
- Modular enable/disable system for each log type
- Custom color schemes for different operations
- Configurable coordinate precision
- Metadata inclusion options
- Error handling and validation

## 📋 Requirements

- **FiveM Server** (Latest artifacts recommended)
- **ox_inventory** (Latest version)
- **Discord Server** with webhook permissions
- **Basic Lua knowledge** for configuration

## 🚀 Quick Start

### 1. Download & Installation

```bash
# Clone or download the resource
git clone https://github.com/yourrepo/ox-inventory-logs.git

# Or download ZIP and extract to your resources folder
```

### 2. File Structure Setup

```
resources/ox_inventory_logs/
├── 📄 fxmanifest.lua
├── 📁 configs/
│   └── 📄 sv_logs.lua
└── 📁 server/
    ├── 📄 sv_utils.lua
    ├── 📄 sv_inventorylogs.lua
    ├── 📄 sv_oxhook.lua
    └── 📄 sv_hooks.lua
```

### 3. Discord Webhook Setup

1. **Create Discord Channels:**
   ```
   #inventory-drops     - Item drops and pickups
   #inventory-transfers - Player-to-player trades
   #inventory-stash     - Storage operations
   #inventory-vehicles  - Vehicle storage logs
   #admin-inventory     - All logs (admin only)
   ```

2. **Create Webhooks:**
   - Right-click channel → Edit Channel → Integrations → Webhooks
   - Create Webhook → Copy URL
   - Repeat for each channel

3. **Configure Webhooks in `configs/sv_logs.lua`:**
   ```lua
   Config.Webhooks = {
       ['item_drop'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE',
       ['item_pickup'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE',
       ['item_transfer'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE',
       ['stash_operations'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE',
       ['vehicle_operations'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE',
   }
   ```

### 4. Server Configuration

Add to your `server.cfg`:
```cfg
# Ensure ox_inventory loads first
ensure ox_inventory

# Then load the logging system
ensure ox_inventory_logs
```

### 5. Customize Your Branding

Edit `configs/sv_logs.lua`:
```lua
Config.Footer = {
    text = "🎮 [Your Server Name] | discord.gg/yourserver | Visit: yourwebsite.com",
    icon_url = "https://your-domain.com/logo.png"
}

Config.EmbedSettings = {
    thumbnail_url = "https://your-domain.com/thumbnail.png",
    author_name = "📦 [Your Server] Inventory System",
    author_icon = "https://your-domain.com/icon.png",
    timestamp = true
}
```

## ⚙️ Configuration Guide

### 🎨 **Color Customization**

```lua
Config.Colors = {
    drop = 0xFF6B6B,        -- Red (#FF6B6B)
    pickup = 0x4ECDC4,      -- Teal (#4ECDC4)
    give = 0x45B7D1,        -- Blue (#45B7D1)
    stash_deposit = 0x96CEB4, -- Light Green (#96CEB4)
    stash_withdraw = 0xFD79A8, -- Pink (#FD79A8)
    vehicle_store = 0x74B9FF, -- Light Blue (#74B9FF)
    vehicle_take = 0xA29BFE,  -- Purple (#A29BFE)
    success = 0x00B894,     -- Green (#00B894)
    warning = 0xFF7675,     -- Light Red (#FF7675)
}
```

### 🔧 **Enable/Disable Logs**

```lua
Config.EnabledLogs = {
    drop = true,        -- Item drops to ground
    pickup = true,      -- Item pickups from ground
    give = true,        -- Player-to-player transfers
    stash = true,       -- Stash operations
    vehicle = true,     -- Vehicle storage
    shop = false,       -- Shop transactions (future)
    crafting = false    -- Crafting logs (future)
}
```

### 📊 **Log Format Options**

```lua
Config.LogFormat = {
    include_coordinates = true,     -- Show player locations
    include_metadata = true,        -- Show item metadata
    include_item_images = false,    -- Item thumbnails (if available)
    coordinate_precision = 1        -- Decimal places for coordinates
}
```

## 📊 Log Examples

### 🎯 **Item Drop Log**
```
📦 Item Dropped

🎒 Player: John_Doe (license:abc123)
📋 Discord: @JohnDoe#1234
🆔 Source ID: 1
📦 Item: Burger x2
📍 Location: X: 123.4 Y: 567.8 Z: 20.1
⏰ Time: 14:30:25 - 15/08/2025

🎯 Action Type: DROP
📝 Item ID: burger
📊 Quantity: 2

🎮 Your Server Name | discord.gg/yourserver
```

### 🔄 **Player Transfer Log**
```
📦 Item Transfer Between Players

👤 From Player: John_Doe (license:abc123)
📋 From Discord: @JohnDoe#1234
🆔 From Source: 1

👤 To Player: Jane_Smith (license:def456)  
📋 To Discord: @JaneSmith#5678
🆔 To Source: 2

📦 Item: Weapon Pistol x1
📍 From Location: X: 123.4 Y: 567.8 Z: 20.1
📍 To Location: X: 125.1 Y: 569.2 Z: 20.1
⏰ Time: 14:32:10 - 15/08/2025

🎮 Your Server Name | discord.gg/yourserver
```

## 🛠️ Advanced Features

### 🔌 **Custom Hook Types**

Add new logging types by extending `sv_inventorylogs.lua`:

```lua
['custom_operation'] = {
    from = 'source_inventory_type',
    to = 'destination_inventory_type',
    callback = function(payload)
        if not Config.EnabledLogs.custom then return end
        
        local player = GetPlayerInfo(payload.source)
        local item = GetItemInfo(payload.fromSlot)
        local coords = GetFormattedCoords(payload.source)
        
        local description = string.format(
            "Your custom log description with %s and %s",
            player.name, item.label
        )
        
        local embed = CreateBaseEmbed(
            "Custom Operation",
            description,
            Config.Colors.success
        )
        
        sendWebhook('custom_webhook', { embed })
    end
}
```

### 🎯 **Multiple Webhook Support**

Send logs to multiple channels:

```lua
-- In any callback function
sendWebhook('item_drop', { embed })      -- Specific channel
sendWebhook('admin_logs', { embed })     -- Admin channel too
```

### 🔍 **Debug Mode**

Enable detailed console logging:

```lua
Config.Debug = true -- Add to sv_logs.lua for verbose output
```

## 🚨 Troubleshooting

### **Common Issues & Solutions**

| Issue | Solution |
|-------|----------|
| ❌ "ox_inventory is not started" | Ensure ox_inventory loads before this resource |
| ❌ "Webhook does not exist" | Check webhook URLs are complete and valid |
| ❌ No logs appearing | Verify webhooks, check console for errors |
| ❌ Resource won't start | Check file structure and syntax errors |
| ❌ Embed formatting issues | Verify Discord webhook permissions |

### **Debug Steps**

1. **Check Console Messages:**
   ```
   [Inventory Logs] Successfully started inventory logging system.
   [Inventory Logs] Registered X hook types.
   ```

2. **Test Webhook URLs:**
   Use online webhook testers to verify URLs work

3. **Verify File Structure:**
   Ensure all files are in correct folders with exact names

4. **Check Resource Dependencies:**
   ```cfg
   # server.cfg
   ensure ox_inventory
   ensure ox_inventory_logs
   ```

## 📈 Performance

- **Lightweight:** Minimal server impact
- **Efficient:** Only logs enabled operations
- **Optimized:** Smart payload processing
- **Scalable:** Handles high-traffic servers

## 🔒 Security Features

- **Input Validation:** All data sanitized before logging
- **Error Handling:** Graceful failure management  
- **Rate Limiting:** Webhook spam protection
- **Privacy:** Configurable data inclusion

## 📜 Changelog

### Version 2.0.0
- ✅ Complete rewrite with enhanced embeds
- ✅ Promotional footer system
- ✅ Advanced configuration options
- ✅ Professional Discord formatting
- ✅ Comprehensive error handling
- ✅ Modular file structure

### Version 1.0.0
- ✅ Basic ox_inventory logging
- ✅ Simple webhook integration

## 🤝 Contributing

We welcome contributions! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

Need help? Get support through:

- **Discord:** [Join our server](https://discord.gg/sdyruNpXpA)

## 🙏 Credits

- **ox_inventory** - Core inventory system
- **FiveM Community** - Testing and feedback
- **Discord** - Webhook API
- **Contributors** - All community contributors

## 📞 Contact

- **Author:** zqmvo.dev
- **Discord:** zqmvo.dev

---


**⭐ If this helped your server, please vouch! ⭐**

Made with ❤️ for the FiveM community

https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA
https://discord.gg/sdyruNpXpA