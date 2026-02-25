local lib = require("lib")
local xsharp = require("scripts.xsharp")

vim.keymap.del("n", "<C-h>")

vim.keymap.set("n", "<leader>e", lib.focus_explorer)
vim.keymap.set("n", "<C-#>", "gcc")
vim.keymap.set({ "n", "v" }, "J", "Lzz")
vim.keymap.set({ "n", "v" }, "K", "Hzz")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

vim.keymap.set("n", ",", ";", { noremap = true })
vim.keymap.set("n", ";", ",", { noremap = true })

-- "Permanent macros"
vim.keymap.set("n", "ä;", "$100a<Space><Esc>080ldwa;<Esc>0j")
vim.keymap.set("n", "ä#", xsharp.jump_to_error)

-- Macros
vim.keymap.set("n", "ä", "@")
