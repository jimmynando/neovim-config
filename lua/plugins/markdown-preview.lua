return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },

  -- Downloads the prebuilt preview server, so no npm install is needed.
  -- Runs the script directly: mkdp#util#install() isn't loaded yet at build time.
  build = "cd app && ./install.sh",

  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
