# Neovim

Start with `nvim` or `nvim path/to/project`. Space is the leader key.
Press Space and pause to see available shortcuts. Editing uses normal Vim modes:
`i` inserts text, Escape returns to normal mode, `:w` saves, and `:q` quits.

The Rosé Pine theme, transparency, and green comments follow the Zed theme.
Opacity, blur, and font size are controlled by your terminal application.
Relative line numbers are enabled, with the current line's absolute number.
Autosave and Copilot are not configured.

| Keys | Action |
| --- | --- |
| Space ff | Find files |
| Space fg | Search project text |
| Space fb | Switch buffers |
| Space e | File sidebar |
| Space w | Save |
| Space cf | Format |
| Space rn | Rename symbol |
| Space ca | Code action |
| Space fd | Diagnostics |
| Space uh | Toggle inlay hints |
| Space ut | Toggle Rosé Pine / Dawn |
| Space tt | Bottom terminal |
| Space mp | Toggle live Markdown preview in browser |
| Escape Escape | Leave terminal input mode |
| gd / gr / gI | Definition / references / implementation |
| K | Hover documentation |
| Ctrl h/j/k/l | Navigate windows |
| Shift h/l | Previous / next buffer |
| Ctrl n/p | Navigate completion menu |
| Ctrl y | Accept completion |
| gcc / gc with selection | Toggle comments |

## Editing the config

The config is in `~/.config/nvim/`. Press `Space vc` to open its entry point.
`init.lua` only sets the leader and loads modules in order.

| File or folder | What to edit |
| --- | --- |
| `lua/config/theme.lua` | Active theme, light/dark default, transparency, color overrides |
| `lua/plugins/themes.lua` | Install additional theme plugins |
| `lua/config/options.lua` | Line numbers, indentation, wrapping, clipboard, editor settings |
| `lua/config/keymaps.lua` | General keyboard shortcuts |
| `lua/config/autocmds.lua` | Automatic editor actions and system Tree-sitter support |
| `lua/config/diagnostics.lua` | Inline errors/warnings and insert-mode updates |
| `lua/config/lsp.lua` | Language servers, inlay hints, LSP-specific shortcuts |
| `lua/config/tools.lua` | Language tools installed by `:SetupTools` |
| `lua/config/lazy.lua` | Plugin manager bootstrap and settings |
| `lua/plugins/editor.lua` | Completion, pairs, surroundings, Git indicators, status/tab bars |
| `lua/plugins/navigation.lua` | Shortcut hints and file sidebar |
| `lua/plugins/formatting.lua` | Formatters per language and format-on-save |
| `lua/plugins/lsp.lua` | Language-tool plugin dependencies |
| `lua/plugins/markdown.lua` | Browser preview and its `Space mp` shortcut |

Every Lua file in `lua/plugins/` is discovered automatically and returns a list
of Lazy plugin specifications. Add a file there to install another plugin.
Restart Neovim after editing; run `:Lazy sync` when adding/removing plugins.
Keep your edits in this config directory, rather than downloaded plugin files.

## Themes

Open `lua/config/theme.lua` to change the current appearance:

```lua
M.colorscheme = "rose-pine"
M.background = "dark" -- "light" selects Dawn
M.transparent = true
```

Rosé Pine-specific options and comment/cursor-line colors live in `M.apply()`.
The theme module also removes inlay-hint backgrounds after every theme change.
`Space ut` toggles the background and reapplies the selected theme.

To add another theme, add its repository to the list in
`lua/plugins/themes.lua`, for example `{ "author/theme.nvim" }` using the
theme's actual repository. Put any setup it needs in `M.apply()` and set
`M.colorscheme` to its colorscheme name. Transparency is theme-specific, so
use that theme's setup option there. Run `:Lazy sync` and restart Neovim.

## Plugin and language tools

`:Lazy` manages plugins; `lazy-lock.json` pins their installed revisions.
`:Mason` manages language tools; `:SetupTools` installs the configured tools.
Existing system Rust, Zig, and clangd installations are used directly.
`:checkhealth vim.lsp` reports language-server status; `:ConformInfo` reports formatters.
Formatting runs on save and can also be triggered with Space cf.
Available system Tree-sitter parsers are used automatically; missing parsers
fall back to Neovim's standard syntax highlighting.
