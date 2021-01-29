__DebugAdapter.defineGlobal("util")

commands.add_command("break", "pause on a breakpoint", function()
    local the_debugger_wont_let_me_pause_the_game = "so i made this and put a breakpoint on it"
end)

commands.add_command("reloadtags", {"tags.help-reloadtags"}, function(cmd)
    for _, player in pairs(game.players) do
        player.tag = global.tags[player.index] or ""
    end
    game.print("done")
end)
