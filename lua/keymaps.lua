-- Nvim Tree and Telecscope
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-S-f>", ":Telescope live_grep<CR>")

-- Inspect
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Move
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Left>", "<C-w>h")

-- Format
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "Format code" })

-- Move Line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Claude Code
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<CR>", { desc = "Add current file to Claude" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<CR>", { desc = "Send selection to Claude" })
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", { desc = "Accept Claude's diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", { desc = "Reject Claude's diff" })

-- Copilot Chat
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatModels<CR>", { desc = "Pick Copilot model" })

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
