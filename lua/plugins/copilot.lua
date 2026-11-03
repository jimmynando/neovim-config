return {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "make tiktoken",
  opts = {
    model = "claude-haiku-5.5",
  },
}
