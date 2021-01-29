commands.add_command("cleartags", {"tags.help-cleartags"}, function(cmd)
    if not util.admin(cmd) then
        util.print(cmd){"cant-run-command-not-admin", cmd.name}
        return
    end

    for index, _ in pairs(global.tags) do
        util.set_tag(game.players[index], nil)
    end

    local caller_name
    if not cmd.player_index then caller_name = {"tags.the-server"}
    else caller_name = game.players[cmd.player_index].name end

    game.print{"tags.admin-cleared", caller_name}
end)
