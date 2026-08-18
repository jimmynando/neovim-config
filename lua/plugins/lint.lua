return {
  "mfussenegger/nvim-lint",
  lazy = false,

  config = function()
    require("lint").linters_by_ft = {
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    }
  end,
}
