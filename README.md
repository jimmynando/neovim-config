# Personal Nvim

## What is this?
Customized Nvim to give the user an IDE experience, with AI assistants built in.

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

## Requirements
- [Claude Code](https://claude.com/claude-code) CLI installed, for the Claude integration
- A GitHub Copilot subscription, for Copilot Chat
- `make`, used to build Copilot Chat's token counter
- Node.js and `npm`, used to build Strudel

## Installation
Clone the repo into `~/.config/nvim`

```bash
git clone https://github.com/jimmynando/neovim-config.git ~/.config/nvim
```
