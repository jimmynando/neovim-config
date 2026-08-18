return {
  "neovim/nvim-lspconfig",
  lazy = false,

  config = function()
    vim.lsp.enable("ts_ls")
  end,
}
