util.tag_change_event = script.generate_event_name()

remote.add_interface("tags", {
    on_player_tag_changed = function() return util.tag_change_event end,
    set_tag = util.set_tag,
    get_tag = function(player)
        if not player or player.object_name ~= "LuaPlayer" then
            error("Expected a LuaPlayer")
        end
        return global.tags[player.index]
    end,
    tags = function()
        return table.deepcopy
    end
})
