-- Neovim Config

-- Leader key (must be set before plugins load)
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("options")
require("keymaps")
require("autocmds")
-- require("highlights") -- disabled while trying gruvbox
