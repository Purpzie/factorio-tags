# Tags
[Mod portal](https://mods.factorio.com/mod/playertags)

Change your tag with /tag. Configurable permissions for multiplayer.
Admins can also use /tagset, /cleartags, and /taglist.

## Commands
- `/tag [text]` - Set your tag. Leaving it blank will reset it.
- `/tagset <player> [tag]` - Admin only. Set another player's tag (removes it if blank). This bypasses the character limit setting.
- `/cleartags` - Admin only. Clear all tags.
- `/taglist` - Admin only. List all players with tags.

## Settings
- **Prefix & suffix** - Nothing by default. These get placed before and after tags.
For example, if your tag is `birb` and the prefix & suffix are `(` & `)`, your tag will show in chat as `(birb)`.
This can also be used to make tags have a different color than player names.
- **Restrict to admins** - If checked, only admins will be able to change tags.
- **Max tag length** - Only applies in multiplayer. Admins can bypass this limit with `/tagset`.

## Remote interface
This mod provides an interface named `tags`.
- `on_player_tag_changed()`

    Get the event ID for when a tag is changed. This event provides:
    - player : [`LuaPlayer`][LuaPlayer] - The player whose tag was changed
    - tag : `string` or `nil` - The player's new tag
    - previous : `string` or `nil` - The player's old tag
- `get_tag(player)` => `string` or `nil`
    > player : [`LuaPlayer`][LuaPlayer]

    Get a player's tag (not including prefix or suffix).
- `set_tag(player, tag)`
  > player : [`LuaPlayer`][LuaPlayer]  
  tag : `string` or `nil`

  Set a player's tag. Prefix/suffix will be added to it in chat.

## Tips for contributing
1. Open Factorio, install the [Editor Extensions](https://mods.factorio.com/mod/EditorExtensions) and [Factorio Library](https://mods.factorio.com/mod/flib) mods, then close the game.
2. Clone this respository.
3. Symlink `src` into [Factorio's `mods` folder](https://wiki.factorio.com/Application_directory). Name it `playertags`.
4. Open this repository in VSCode and install the [Factorio Mod Debug](https://marketplace.visualstudio.com/items?itemName=justarandomgeek.factoriomod-debug) extension. A popup should also recommend this to you.
5. Modify `.vscode/launch.json` to use the correct path to `factorio.exe`. If you have the extension installed, Intellisense will suggest some possible paths. **Please do not commit this change.**
6. Viola, you can now use the debugger.

While debugging, the `/break` and `/reloadtags` commands are available.

[LuaPlayer]: https://lua-api.factorio.com/latest/LuaPlayer.html
