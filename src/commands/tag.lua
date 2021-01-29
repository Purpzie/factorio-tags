commands.add_command("tag", {"tags.help"}, function(cmd)
    if not cmd.player_index then
        log{"tags.no-console"}
        return
    end

    local player = game.players[cmd.player_index]
    local multiplayer = util.multiplayer()

    if multiplayer and not player.admin and settings.global["tags-admin-only"].value then
        player.print{"cant-run-command-not-admin", cmd.name}
        return
    end

    -- if there's no parameter, it's nil
    local tag = cmd.parameter

    -- enforce max length
    if multiplayer and tag then
        local max_length = settings.global["tags-max-length"].value
        if max_length and #tag > max_length then
            if player.admin then
                player.print{"tags.too-long-admin", max_length, player.name}
            else
                player.print{"tags.too-long", max_length}
            end
            return
        end
    end

    tag = util.set_tag(player, tag)
    if tag then player.print{"tags.set", tag}
    else player.print{"tags.removed"} end
end)
