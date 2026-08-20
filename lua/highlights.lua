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
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#c0caf5" })
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

-- Bg
vim.api.nvim_set_hl(0, "Normal", {
  bg = "none",
  fg = "#c5cdd8",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
  bg = "none",
  fg = "#c5cdd8",
})
