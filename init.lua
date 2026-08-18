-- Neovim Config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("options")
require("keymaps")
require("autocmds")
require("highlights")
