-- My Neovim config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.fillchars = { eob = " " }
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = "",
                section_separators = "",
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },

                lualine_x = { "diagnostics" },
                lualine_y = { "filetype" },
                lualine_z = { "location" },
            },
        })
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                   ",
            "                                   ",
            "                                   ",
            "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
            "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
            "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
            "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
            "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
            "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
            "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
            " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
            " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
            "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
            "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
            "                                   ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
            dashboard.button("e", "󰉋  Explore files", ":NvimTreeOpen<CR>"),
            dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
        }

        dashboard.section.footer.val = "󰑓  Happy coding"

        dashboard.opts.layout[1].val = 5

        alpha.setup(dashboard.opts)
    end,
  },
})

require("nvim-tree").setup({
  sort = {
    sorter = "extension",
  },
  renderer = {
    root_folder_label = false,
  },
})

require("lint").linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
}

vim.api.nvim_set_hl(0, "Normal", {
  bg = "none",
  fg = "#c5cdd8",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
  bg = "none",
  fg = "#c5cdd8",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "python" },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.lsp.enable("ts_ls")
vim.keymap.set("n", "<leader>f", function()
  require("conform").format()
end)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-S-f>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cmdheight = 0

-- Tokyo Night-inspired syntax colors
vim.api.nvim_set_hl(0, "@keyword", { fg = "#bb9af7" })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#f7768e" })
vim.api.nvim_set_hl(0, "@string", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "@number", { fg = "#ff9e64" })
vim.api.nvim_set_hl(0, "@constant", { fg = "#ff9e64" })
vim.api.nvim_set_hl(0, "@function", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "@function.call", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "@type", { fg = "#2ac3de" })
vim.api.nvim_set_hl(0, "@variable", { fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "@property", { fg = "#73daca" })
vim.api.nvim_set_hl(0, "@operator", { fg = "#89ddff" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#565f89", italic = true })
vim.api.nvim_set_hl(0, "Directory", { fg = "#7aa2f7" })

-- NvimTree — Tokyo Night-inspired colors
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#7aa2f7" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#7dcfff", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#7aa2f7" })

vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = "#c0caf5" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#7dcfff", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#bb9af7", bold = true })

-- Git
vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#f7768e" })
vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#73daca" })
vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#bb9af7" })
vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#565f89" })

-- Icons
vim.api.nvim_set_hl(0, "NvimTreeSymlink", { fg = "#2ac3de" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#9ece6a" })
