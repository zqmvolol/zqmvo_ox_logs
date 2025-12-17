# 📦 OX Inventory Discord Logs

<div align="center">

![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)
![FiveM](https://img.shields.io/badge/FiveM-Ready-green.svg)
![License](https://img.shields.io/badge/license-MIT-orange.svg)

**A comprehensive, professional Discord logging system for ox_inventory with rich embeds and advanced customization**

[Features](#-features) • [Installation](#-installation) • [Configuration](#%EF%B8%8F-configuration) • [Support](#-support)

</div>

---

## 🌟 Features

### 📊 Comprehensive Logging
- ✅ **Item Drops & Pickups** - Track all ground interactions with detailed location data
- ✅ **Player Transfers** - Monitor item exchanges between players in real-time
- ✅ **Stash Operations** - Log deposits and withdrawals from storage locations
- ✅ **Vehicle Storage** - Track trunk/glovebox interactions with vehicle identifiers
- ✅ **Shop Transactions** - Framework ready for shop system integration
- ✅ **Crafting Activities** - Ready for crafting system logs

### 🎨 Professional Discord Embeds
- 🎯 Rich, color-coded embed messages for different action types
- 📝 Detailed player information with automatic Discord mentions
- 📍 Formatted coordinates with configurable precision
- 🕐 Automatic timestamps in ISO 8601 format
- 🖼️ Custom thumbnails and author information
- 🎨 Structured field layouts for easy reading

### 🚀 Server Promotion
- 📢 Customizable footer with server branding
- 🎮 Promotional text in every log message
- 🖼️ Server logo integration in embeds
- 🔗 Discord invite links embedded
- 🌐 Website promotion capabilities

### ⚙️ Advanced Configuration
- 🔧 Modular enable/disable system for each log type
- 🎨 Custom color schemes for different operations
- 📍 Configurable coordinate precision
- 📝 Metadata inclusion options
- 🛡️ Built-in error handling and validation
- 🚦 Webhook rate limiting protection

---

## 📋 Requirements

| Component | Version | Required |
|-----------|---------|----------|
| FiveM Server | Latest artifacts | ✅ |
| ox_inventory | Latest version | ✅ |
| Discord Server | With webhook permissions | ✅ |

---

## 🚀 Installation

### Step 1: Download the Resource

```bash
# Clone the repository
git clone https://github.com/yourusername/ox_inventory_logs.git

# Or download the latest release
# Extract to your resources folder
```

### Step 2: File Structure

Ensure your file structure matches:

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

### Step 3: Discord Webhook Setup

1. **Create Discord Channels** (recommended structure):
   ```
   📁 INVENTORY LOGS
   ├── 📌 inventory-drops      (Item drops/pickups)
   ├── 🤝 inventory-transfers  (Player trades)
   ├── 📦 inventory-stash      (Storage operations)
   ├── 🚗 inventory-vehicles   (Vehicle storage)
   └── 👮 admin-inventory      (All logs - admin only)
   ```

2. **Generate Webhooks**:
   - Right-click channel → **Edit Channel**
   - Navigate to **Integrations** → **Webhooks**
   - Click **Create Webhook**
   - Copy the webhook URL
   - Repeat for each channel

3. **Configure Webhooks**:
   
   Open `configs/sv_logs.lua` and add your webhook URLs:

   ```lua
   Config.Webhooks = {
       ['item_drop'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
       ['item_pickup'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
       ['item_transfer'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
       ['stash_operations'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
       ['vehicle_operations'] = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_ID/YOUR_WEBHOOK_TOKEN',
   }
   ```

### Step 4: Server Configuration

Add to your `server.cfg`:

```cfg
# Ensure ox_inventory loads FIRST
ensure ox_inventory

# Then load the logging system
ensure ox_inventory_logs
```

### Step 5: Customize Your Branding

Edit the branding section in `configs/sv_logs.lua`:

```lua
-- Footer shown in every log
Config.Footer = {
    text = "🎮 Chicago Loop Roleplay | discord.gg/yourserver | Visit: yourwebsite.com",
    icon_url = "https://i.imgur.com/your-logo.png"
}

-- Embed author and thumbnail
Config.EmbedSettings = {
    thumbnail_url = "https://i.imgur.com/your-thumbnail.png",
    author_name = "📦 Chicago Loop Inventory System",
    author_icon = "https://i.imgur.com/your-icon.png",
    timestamp = true
}
```

---

## ⚙️ Configuration

### 🎨 Color Customization

Customize colors for different log types (Hex values in decimal format):

```lua
Config.Colors = {
    drop = 0xFF6B6B,          -- Red (#FF6B6B)
    pickup = 0x4ECDC4,        -- Teal (#4ECDC4)
    give = 0x45B7D1,          -- Blue (#45B7D1)
    stash_deposit = 0x96CEB4, -- Light Green (#96CEB4)
    stash_withdraw = 0xFD79A8,-- Pink (#FD79A8)
    vehicle_store = 0x74B9FF, -- Light Blue (#74B9FF)
    vehicle_take = 0xA29BFE,  -- Purple (#A29BFE)
    success = 0x00B894,       -- Green (#00B894)
    warning = 0xFF7675,       -- Light Red (#FF7675)
}
```

💡 **Pro Tip**: Use [Discord Color Picker](https://discordjs.guide/popular-topics/embeds.html#embed-preview) to find hex values, then convert to decimal.

### 🔧 Enable/Disable Log Types

Toggle specific log types on or off:

```lua
Config.EnabledLogs = {
    drop = true,      -- Item drops to ground
    pickup = true,    -- Item pickups from ground
    give = true,      -- Player-to-player transfers
    stash = true,     -- Stash deposits/withdrawals
    vehicle = true,   -- Vehicle trunk operations
    shop = false,     -- Shop transactions (coming soon)
    crafting = false  -- Crafting logs (coming soon)
}
```

### 📊 Log Format Options

Configure what information is included in logs:

```lua
Config.LogFormat = {
    include_coordinates = true,      -- Show X, Y, Z coordinates
    include_metadata = true,         -- Show item metadata (durability, serial, etc.)
    include_item_images = false,     -- Show item icons (requires image URLs)
    coordinate_precision = 1         -- Decimal places (1 = 123.4, 2 = 123.45)
}
```

---

## 📸 Log Examples

<details>
<summary><b>🔻 Item Drop Log</b></summary>

```
📦 Item Dropped

🎒 Player: John_Doe (license:abc123abc123)
📋 Discord: @JohnDoe#1234
🆔 Source ID: 1
📦 Item: Burger x2
📍 Location: X: 123.4 Y: 567.8 Z: 20.1
⏰ Time: 14:30:25 - 16/12/2025

🎯 Action Type: DROP
🔖 Item ID: burger
📊 Quantity: 2

🎮 Chicago Loop Roleplay | discord.gg/yourserver
```
</details>

<details>
<summary><b>🔄 Player Transfer Log</b></summary>

```
📦 Item Transfer Between Players

👤 From Player: John_Doe (license:abc123abc123)
📋 From Discord: @JohnDoe#1234
🆔 From Source: 1

👤 To Player: Jane_Smith (license:def456def456)
📋 To Discord: @JaneSmith#5678
🆔 To Source: 2

📦 Item: Weapon Pistol x1
📍 From Location: X: 123.4 Y: 567.8 Z: 20.1
📍 To Location: X: 125.1 Y: 569.2 Z: 20.1
⏰ Time: 14:32:10 - 16/12/2025

🎯 Action Type: TRANSFER
🔖 Item ID: weapon_pistol
📊 Quantity: 1

🎮 Chicago Loop Roleplay | discord.gg/yourserver
```
</details>

<details>
<summary><b>📦 Stash Operation Log</b></summary>

```
📦 Item Stored in Stash

🎒 Player: John_Doe (license:abc123abc123)
📋 Discord: @JohnDoe#1234
🆔 Source ID: 1
📦 Item: Lockpick x5
🪝 Stash ID: house_storage_123
📍 Location: X: 123.4 Y: 567.8 Z: 20.1
⏰ Time: 14:35:42 - 16/12/2025

🎯 Action Type: STASH DEPOSIT
🔖 Item ID: lockpick
🪝 Stash: house_storage_123

🎮 Chicago Loop Roleplay | discord.gg/yourserver
```
</details>

---

## 🛠️ Advanced Usage

### Adding Custom Log Types

Extend functionality by adding custom hooks in `sv_inventorylogs.lua`:

```lua
hooks = {
    -- Your existing hooks...
    
    -- Custom shop purchase hook
    ['shop_purchase'] = {
        from = 'shop',
        to = 'player',
        callback = function(payload)
            if not Config.EnabledLogs.shop then return end
            
            local player = GetPlayerInfo(payload.source)
            local item = GetItemInfo(payload.fromSlot)
            
            local description = string.format(
                "🎒 **Player:** %s\n" ..
                "💰 **Purchased:** %s x%s\n" ..
                "🏪 **Shop:** `%s`",
                player.name,
                item.label,
                item.count,
                payload.fromInventory
            )
            
            local embed = CreateBaseEmbed(
                "Shop Purchase",
                description,
                Config.Colors.shop_buy
            )
            
            sendWebhook('shop_operations', { embed })
        end
    }
}
```

### Multiple Webhook Destinations

Send logs to multiple channels simultaneously:

```lua
-- In any callback function
sendWebhook('item_drop', { embed })      -- Specific channel
sendWebhook('admin_logs', { embed })     -- Also send to admin channel
```

### Debug Mode

Enable detailed console logging for troubleshooting:

```lua
-- Add to configs/sv_logs.lua
Config.Debug = true
```

When enabled, you'll see detailed output:
```
[Inventory Logs] Hook triggered: item_drop
[Inventory Logs] Player info retrieved: John_Doe (1)
[Inventory Logs] Webhook sent successfully: item_drop
```

---

## 🚨 Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| ❌ "ox_inventory is not started" | Loading order | Ensure `ox_inventory` loads before this resource |
| ❌ No logs appearing | Invalid webhook | Verify webhook URLs are complete and valid |
| ❌ "Webhook not configured" | Missing webhook URL | Check `Config.Webhooks` has all required URLs |
| ❌ Logs missing coordinates | Coordinates disabled | Set `Config.LogFormat.include_coordinates = true` |
| ❌ Embed formatting broken | Invalid Discord webhook | Test webhook URL with online tester |

### Debug Checklist

1. **Verify Resource Started**:
   ```
   Check F8 console for:
   [Inventory Logs] Successfully started inventory logging system.
   [Inventory Logs] Registered X hook types.
   ```

2. **Test Webhook URLs**:
   - Use [Discord Webhook Tester](https://discohook.org/)
   - Paste your webhook URL
   - Send a test message

3. **Check File Structure**:
   ```bash
   # Ensure files are in correct locations
   resources/ox_inventory_logs/
   ├── configs/sv_logs.lua      ✅
   └── server/sv_*.lua          ✅
   ```

4. **Verify Dependencies**:
   ```cfg
   # In server.cfg, correct order:
   ensure ox_inventory
   ensure ox_inventory_logs
   ```

5. **Console Error Messages**:
   - Check for red error messages in server console
   - Look for specific hook names or webhook issues

---

## 📈 Performance

- **Lightweight**: Minimal server resource usage (~0.01ms)
- **Efficient**: Only processes enabled log types
- **Optimized**: Smart payload validation and processing
- **Scalable**: Tested on high-traffic servers (200+ players)

### Performance Metrics
- CPU Usage: < 0.01ms per log event
- Memory Footprint: ~2MB
- Network Impact: Minimal (webhooks are async)

---

## 🔒 Security Features

- ✅ **Input Validation**: All data sanitized before logging
- ✅ **Error Handling**: Graceful failure management
- ✅ **Rate Limiting**: Webhook spam protection built-in
- ✅ **Privacy Control**: Configurable data inclusion
- ✅ **Identifier Protection**: License/Discord IDs properly formatted

---

## 📝 Changelog

### Version 2.0.0 (Current)
- ✨ Complete rewrite with enhanced embed system
- ✨ Professional Discord formatting with rich embeds
- ✨ Promotional footer and branding system
- ✨ Advanced configuration options
- ✨ Comprehensive error handling
- ✨ Modular file structure for easy maintenance
- ✨ Vehicle storage logging
- ✨ Stash operation tracking
- 🐛 Fixed coordinate formatting issues
- 🐛 Improved player identification

### Version 1.0.0
- ✅ Initial release
- ✅ Basic ox_inventory logging
- ✅ Simple webhook integration

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the Repository**
2. **Create a Feature Branch**: `git checkout -b feature/AmazingFeature`
3. **Commit Your Changes**: `git commit -m 'Add some AmazingFeature'`
4. **Push to Branch**: `git push origin feature/AmazingFeature`
5. **Open a Pull Request**

### Contribution Guidelines
- Follow existing code style (Lua conventions)
- Test thoroughly before submitting
- Update documentation for new features
- Include example screenshots for UI changes

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License - You are free to:
✅ Use commercially
✅ Modify
✅ Distribute
✅ Private use

With conditions:
⚠️ Include license and copyright notice
⚠️ No warranty provided
```

---

## 🆘 Support

Need help? We've got you covered!

- 💬 **Discord Server**: [Join Here](https://discord.gg/sdyruNpXpA)
- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/zqmvolol/ox_inventory_logs/issues)
- 💡 **Feature Requests**: [GitHub Discussions](https://github.com/zqmvolol/ox_inventory_logs/discussions)
- 📧 **Email**: zqmvo.dev

### Before Asking for Help
1. Check this README thoroughly
2. Search existing GitHub issues
3. Enable debug mode and check console
4. Test webhooks with online testers

---

## 🙏 Credits

- **ox_inventory** - Core inventory system by [Overextended](https://github.com/overextended)
- **FiveM Community** - Testing and valuable feedback
- **Discord** - Webhook API and embed system
- **Contributors** - All community contributors

Special thanks to everyone who provided feedback and helped test!
@jxhnwicked
@BIGDAME28
@reallilzayosama
<3

---

## 📞 Contact

- **Author**: zqmvo.dev
- **Discord**: zqmvo.dev
- **GitHub**: [@zqmvolol](https://github.com/zqmvolol)

---

<div align="center">

### ⭐ If this resource helped your server, please star the repository! ⭐

**Made with ❤️ for the FiveM community**

[⬆ Back to Top](#-ox-inventory-discord-logs)

</div>
