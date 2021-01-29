util = {} -- global variable

function util.get_symbols()
    return settings.global["tags-prefix"].value, settings.global["tags-suffix"].value
end

function util.split(s)
    local words = {}
    for word in s:gmatch("%S+") do table.insert(words, word) end
    return words
end

function util.multiplayer()
    if __DebugAdapter then return true
    else return util.multiplayer() end
end

-- returns the function to print to whoever called the command
function util.print(cmd)
    if not cmd.player_index then return log
    else return game.players[cmd.player_index].print end
end

function util.admin(cmd)
    return
        not cmd.player_index -- command was run from console
        or game.players[cmd.player_index].admin
        or not util.multiplayer() -- no harm if in a singleplayer game
end

-- sets a player's tag with prefix/suffix, and also fires an event
-- since this is also in the remote interface it verifies args
function util.set_tag(player, tag)
    if not player or player.object_name ~= "LuaPlayer" then
        error("Expected a LuaPlayer")
    elseif type(tag) ~= "string" and tag ~= nil then
        error("Expected a string or nil")
    end

    if tag == "" then tag = nil end
    local previous = global.tags[player.index]
    if tag == previous then return end

    global.tags[player.index] = tag
    if tag then
        local prefix, suffix = util.get_symbols()
        player.tag = table.concat{prefix, tag, suffix}
    else
        player.tag = ""
    end
    script.raise_event(util.tag_change_event, {
        player = player,
        tag = tag,
        previous = previous
    })
    if player.tag ~= "" then return player.tag end
end
