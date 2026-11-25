-- Neovim Config

-- Leader key (must be set before plugins load)
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim on the first run
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n" .. out, "ErrorMsg" } }, true, {})
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  -- Plugins marked `dev = true` load from ~/repos/<name> when that folder
  -- exists, and fall back to GitHub when it doesn't.
  dev = { path = "~/repos", fallback = true },
})

require("options")
require("keymaps")
require("autocmds")
-- require("highlights") -- disabled while trying gruvbox
