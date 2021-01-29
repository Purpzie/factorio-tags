if __DebugAdapter then
    __DebugAdapter.defineGlobal("util")
    require "debug"
end

util = {}
require "util"
require "interface"

script.on_init(function()
    -- even though player.tag exists, we need to store the tags without prefixes/suffixes
    global.tags = {}
end)

-- delete tags from removed players
script.on_event(defines.events.on_pre_player_removed, function(event)
    local index = event.player_index
    if global.tags[index] then
        global.tags[index] = nil
    end
end)

-- update displayed tags when prefix or suffix changes
script.on_event(defines.events.on_runtime_mod_setting_changed, function(setting)
    local setting = setting.setting
    if setting == "tags-prefix" or setting == "tags-suffix" then
        local prefix, suffix = util.get_symbols()
        for index, tag in pairs(global.tags) do
            -- intentionally don't fire an event, since the tag content doesn't change
            game.players[index].tag = table.concat{prefix, tag, suffix}
        end
    end
end)

require "commands/tag"
require "commands/tagset"
require "commands/cleartags"
require "commands/taglist"

-- todo: use a gui for admins to manage tags instead of /tagset, /cleartags, and /taglist
