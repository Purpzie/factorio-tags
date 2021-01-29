# Tags
## Tips for contributing
1. Open Factorio, install the [Editor Extensions](https://mods.factorio.com/mod/EditorExtensions) and [Factorio Library](https://mods.factorio.com/mod/flib) mods, then close the game.
2. Clone this respository.
3. Symlink `src` into [Factorio's `mods` folder](https://wiki.factorio.com/Application_directory). Name it `playertags`.
4. Open this repository in VSCode and install the [Factorio Mod Debug](https://marketplace.visualstudio.com/items?itemName=justarandomgeek.factoriomod-debug) extension. A popup should also recommend this to you.
5. If you did NOT use Steam to install Factorio, modify `.vscode/launch.json` to use the correct path to `factorio.exe`. If you have the extension installed, Intellisense will suggest some possible paths. **Please do not commit this change.**
6. Viola, you can now use the debugger.
