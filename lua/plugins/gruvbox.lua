return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    vim.o.background = "dark"
    require("gruvbox").setup({
      contrast = "hard",
      italic = {
        strings = false,
        comments = false,
        emphasis = false,
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
