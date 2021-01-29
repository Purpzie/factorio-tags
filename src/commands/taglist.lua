commands.add_command("taglist", {"tags.help-taglist"}, function(cmd)
    if not util.admin(cmd) then
        util.print(cmd){"cant-run-command-not-admin", cmd.name}
        return
    end

    local list = {}
    for index, tag in pairs(global.tags) do
        table.insert(list, {game.players[index].name, tag})
    end
    -- sort alphabetically by tag, then by player name
    table.sort(list, function(a, b)
        return a[2]:lower() < b[2]:lower() and a[1]:lower() < b[1]:lower()
    end)

    for index, data in pairs(list) do
        local player = game.players[data[1]]
        list[index] = table.concat{player.name, " ", player.tag}
    end
    util.print(cmd){"", {"tags.list"}, "\n", table.concat(list, "\n")}
end)
