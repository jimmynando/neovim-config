return {
  "jimmynando/nanquim.nvim",

  -- Uses ~/repos/nanquim.nvim when it exists (see `dev` in init.lua),
  -- otherwise installs from GitHub.
  dev = true,

  opts = { preset = "nerd" },
  config = function(_, opts)
    require("nanquim").setup(opts)
  end,
}
