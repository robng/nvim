-- -------------------------------------------------------------------------- --
--  UI                                                                        --
-- -------------------------------------------------------------------------- --

-- View
vim.opt.colorcolumn = "81"
vim.opt.relativenumber = true
vim.opt.number = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- -------------------------------------------------------------------------- --
--  Keymap                                                                    --
-- -------------------------------------------------------------------------- --

vim.g.mapleader = " "

-- Normal mode
vim.keymap.set({ "n", "v" }, "J", "<C-D>zz")
vim.keymap.set({ "n", "v" }, "K", "<C-U>zz")
vim.keymap.set("n", ",", ";", { noremap = true })
vim.keymap.set("n", ";", ",", { noremap = true })
vim.keymap.set("n", "<C-S>", ":w<CR>")

-- Normal mode (LSP)
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- -------------------------------------------------------------------------- --
--  Whitespace                                                                --
-- -------------------------------------------------------------------------- --

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Trailing whitespace
vim.opt.list = true
vim.opt.listchars = { trail = '␣' }

-- -------------------------------------------------------------------------- --
--  LSP                                                                       --
-- -------------------------------------------------------------------------- --

vim.lsp.enable("ts_ls")

-- -------------------------------------------------------------------------- --
--  Plugins                                                                   --
-- -------------------------------------------------------------------------- --

require("lazy-setup")
require("lazy").setup({
  spec = {
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("*", {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end,
    },
    {
      "mason-org/mason.nvim",
      opts = {}
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {}
    },
    {
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require("cmp")
        cmp.setup({
          sources = {
            { name = "nvim_lsp" },
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"]      = cmp.mapping.confirm({ select = true }),
            ["<C-J>"]     = cmp.mapping.select_next_item(),
            ["<C-K>"]     = cmp.mapping.select_prev_item(),
          }),
        })
      end,
      opts = { sources = { name = "nvim_lsp" } }
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      opts = {}
    },
    {
      "ramojus/mellifluous.nvim",
      config = function()
        vim.cmd("colorscheme mellifluous")
        vim.opt.background = "light"
      end,
    }
  },
  checker = { enabled = true },
})
