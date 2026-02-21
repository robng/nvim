require("config.lazy")

vim.cmd("colo everforest")
vim.cmd("set cc=81")

vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })
