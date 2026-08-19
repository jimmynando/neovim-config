return {
  "goolord/alpha-nvim",
  lazy = false,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    require("alpha.term")

    local dashboard = require("alpha.themes.dashboard")

    local image_path = "/home/fernando/Pictures/Screenshots/logo.png"

    -- Image
    dashboard.section.terminal.command = "catimg -w 75 " .. image_path .. " && sleep infinity"
    dashboard.section.terminal.width = 38
    dashboard.section.terminal.height = 20
    dashboard.section.terminal.opts = {
      redraw = true,
      window_config = {},
      position = "center",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("e", "󰉋  Explore files", ":NvimTreeOpen<CR>"),
      dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    dashboard.section.buttons.opts.position = "left"
    dashboard.section.buttons.opts.spacing = 1

    -- Footer
    dashboard.section.footer.val = "󰑓  Happy coding"

    -- Keep Alpha's normal padding, but replace the header with the image
    dashboard.opts.layout = {
      { type = "padding", val = 2 },
      dashboard.section.terminal,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
  end,
}
