return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,

  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "extension",
      },
      renderer = {
        root_folder_label = false,
      },
    })
  end,
}