-- Windows
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Focus left window" })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Focus right window" })
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Focus above window" })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Focus below window" })

-- Macro
vim.keymap.set("n", "<leader>mr", "qx", { desc = "Record quick macro (into register x)" })
vim.keymap.set("n", "<leader>ma", "@x", { desc = "Apply quick macro (from register x)" })

-- Files 
local minifiles = require("mini.files")
local telescope = require('telescope.builtin')

local toggle_file_explorer = function(...)
  if not minifiles.close() then minifiles.open(...) end
end

vim.keymap.set("n", "<leader>e",  toggle_file_explorer, { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep,  { desc = "Telescope live grep" })

-- Go To
vim.keymap.set("n", "gd", vim.lsp.buf.definition,       { desc = "Go to definition" })

-- LSP
vim.keymap.set("n", "<leader>h",  vim.lsp.buf.hover,         { desc = "LSP: Hover" })
vim.keymap.set("n", "<leader>g",  vim.lsp.buf.definition,    { desc = "LSP: Go to definition" })
vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, { desc = "LSP: Show diagnostics" })

