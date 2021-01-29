commands.add_command("tagset", {"tags.help-tagset"}, function(cmd)
    local print = util.print(cmd)
    if not util.admin(cmd) then
        print{"cant-run-command-not-admin", cmd.name}
        return
    elseif not util.multiplayer() then
        print{"cant-run-command-not-in-multiplayer-game", cmd.name}
        return
    elseif not cmd.parameter then
        print{"tags.input-player-name"}
        return
    end


    local params = util.split(cmd.parameter)
    local player_name = table.remove(params, 1)
    local player = game.players[player_name]
    if not player then
        print{"player-doesnt-exist", player_name}
        return
    end

    local tag = nil
    if #params > 0 then tag = table.concat(params, " ") end

    -- intentionally DON'T enforce max length, since this is an admin command

    tag = util.set_tag(player, tag)
    if tag then print{"tags.set", tag}
    else print{"tags.removed"} end
end)
