# Personal Nvim

## What is this?
Customized Nvim to give the user an IDE experience, with AI assistants built in.
Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which installs itself on the first run.

## Features
- Treesitter
- Nvimtree
- LSP
- ESLint
- Conform (formatting)
- Blink (completion)
- Lua Line
- Telescope
- Alpha Dashboard
- Gruvbox theme
- Strudel
- Claude Code
- Copilot Chat (default model: Claude Haiku 5.5)
- Markdown Preview (live preview in the browser)
- [nanquim.nvim](https://github.com/jimmynando/nanquim.nvim) (Markdown rendered inside the buffer, with image previews)

## Keymaps
The leader key is `Space`.

```text
Ctrl + n -> Nvimtree toggle
Ctrl + p -> Telescope
Ctrl + Shift + f -> Search in project
K -> Hover
gd -> Definition
gr -> References
<leader> + rn -> Rename
<leader> + e -> Show diagnostic
Ctrl + Down -> Move cursor down
Ctrl + Up -> Move cursor up
Ctrl + Left -> Move cursor left
Ctrl + Right -> Move cursor right
Alt + j -> Move line down
Alt + k -> Move line up
<leader> + f -> Format
```

### Claude Code
```text
<leader> + ac -> Toggle Claude
<leader> + ab -> Add current file to Claude
<leader> + as -> Send selection to Claude (visual mode)
<leader> + aa -> Accept Claude's diff
<leader> + ad -> Reject Claude's diff
```

### Copilot Chat
```text
<leader> + cc -> Toggle Copilot Chat
<leader> + cm -> Pick Copilot model
```

### Markdown Preview
Only available in markdown files. Opens a live preview in your browser that follows the cursor.

```text
<leader> + mp -> Toggle markdown preview
```

Commands: `:MarkdownPreview`, `:MarkdownPreviewStop`, `:MarkdownPreviewToggle`

### Nanquim
Renders Markdown inside the buffer. Markdown files are rendered as soon as they open, and the line under the cursor shows the raw text so you can edit it.

```text
<leader> + mn -> Toggle nanquim rendering
<leader> + mi -> Preview the image on the cursor line in a floating window
```

Commands: `:Nanquim` (toggle), `:Nanquim enable`, `:Nanquim disable`, `:Nanquim image`

## Requirements
- Neovim 0.11 or newer (required by nanquim)
- `git`, used by lazy.nvim to install plugins
- A [Nerd Font](https://www.nerdfonts.com) set as your terminal font, for the icons (nanquim uses its `nerd` preset)
- [Claude Code](https://claude.com/claude-code) CLI installed, for the Claude integration
- A GitHub Copilot subscription, for Copilot Chat
- `make`, used to build Copilot Chat's token counter
- Node.js and `npm`, used to build Strudel
- `curl` (or `wget`), used to download Markdown Preview's prebuilt server on install
- A web browser, for Markdown Preview
- Optional: [catimg](https://github.com/posva/catimg), for nanquim's image previews

## Installation
Back up your current config if you have one:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone the repo into `~/.config/nvim`:

```bash
git clone https://github.com/jimmynando/neovim-config.git ~/.config/nvim
```

Open `nvim`. On the first run lazy.nvim installs itself and every plugin, then you can restart Nvim.
Plugin versions are pinned in `lazy-lock.json`.

## Folder structure
```text
~/.config/nvim
├── init.lua              -> Leader key, lazy.nvim setup, loads the files below
├── lazy-lock.json        -> Pinned plugin versions (updated by :Lazy update)
└── lua
    ├── options.lua       -> Editor options (tabs, line numbers, clipboard...)
    ├── keymaps.lua       -> All keymaps
    ├── autocmds.lua      -> Autocommands (lint on save, Treesitter start)
    ├── highlights.lua    -> Custom colors (disabled while trying gruvbox)
    └── plugins           -> One file per plugin, loaded automatically by lazy.nvim
        ├── gruvbox.lua
        ├── nanquim.lua
        └── ...
```

## Adding a plugin
1. Create a file in `lua/plugins/`, for example `lua/plugins/my-plugin.lua`, that returns the plugin spec:

   ```lua
   return {
     "author/my-plugin.nvim",
     opts = {}, -- passed to require("my-plugin").setup(opts)
   }
   ```

2. If it needs keymaps, add them to `lua/keymaps.lua` under a comment with the plugin name.
3. Restart Nvim (or run `:Lazy sync`). lazy.nvim installs the plugin and adds it to `lazy-lock.json`. Commit that file too.
4. Add the plugin to Features and Keymaps in this README.

To remove a plugin, delete its file and run `:Lazy clean`.

### Developing a plugin locally
Plugins marked `dev = true` (like nanquim) load from `~/repos/<plugin-name>` when that folder exists, so you can edit them and see the changes after restarting Nvim. When the folder doesn't exist they install from GitHub as usual. The folder is set by `dev.path` in `init.lua`.

## Customizing
- **Theme**: `lua/plugins/gruvbox.lua`. Change `contrast`, `background` or the italic settings, or replace the file with another colorscheme plugin.
- **Editor options**: `lua/options.lua` (tab size, line numbers, clipboard, mouse...).
- **Keymaps**: `lua/keymaps.lua`. The leader key is set in `init.lua` (`vim.g.mapleader`), before lazy.nvim loads.
- **Plugin options**: the `opts` or `config` in each file in `lua/plugins/`. For example, nanquim's icons are set by `preset` in `lua/plugins/nanquim.lua` (`"nerd"` or `"unicode"`).

## Troubleshooting
- **See plugin errors**: run `:Lazy` to see which plugins failed to install or build, then press `S` to sync again.
- **General health check**: run `:checkhealth` (or `:checkhealth <plugin>`, e.g. `:checkhealth lazy`).
- **Icons show as squares or question marks**: your terminal isn't using a Nerd Font. Install one and select it in the terminal settings, or set `preset = "unicode"` in `lua/plugins/nanquim.lua`.
- **`<leader>mi` says "catimg not found"**: install catimg (for example `sudo dnf install catimg` or `sudo apt install catimg`).
- **Heading backgrounds don't show in Markdown**: nanquim needs `termguicolors`, which needs a terminal with true color support.
- **Start from a clean state**: delete `~/.local/share/nvim/lazy` and open Nvim again to reinstall every plugin.
