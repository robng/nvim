vim.keymap.del("n", "<C-h>")

vim.keymap.set("n", "<C-e>", "<leader>e")
vim.keymap.set("n", "<C-#>", "gcc")
vim.keymap.set({ "n", "v" }, "J", "Lzz")
vim.keymap.set({ "n", "v" }, "K", "Hzz")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

vim.keymap.set("n", ",", ";", { noremap = true })
vim.keymap.set("n", ";", ",", { noremap = true })
vim.keymap.set("n", "ä", "@")
