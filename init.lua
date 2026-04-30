require("lib")

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
vim.keymap.set("n", "<Leader>e", ":lua MiniFiles.open()<CR>")

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- -------------------------------------------------------------------------- --
--  Keymap (LSP)                                                              --
-- -------------------------------------------------------------------------- --

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "<Leader>f", lsp_show_help)
    vim.keymap.set("n", "<Leader>r", lsp_rename)
    vim.keymap.set("n", "<Leader>h", lsp_hover)
    vim.keymap.set("n", "gd", lsp_goto)
  end
})

-- -------------------------------------------------------------------------- --
--  Whitespace                                                                --
-- -------------------------------------------------------------------------- --

-- Tabs
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true

-- Trailing whitespace
vim.opt.list = true
vim.opt.listchars = { trail = "␣" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "prg" },
  callback = function()
    vim.opt_local.tabstop     = 4
    vim.opt_local.shiftwidth  = 4
  end,
})

-- -------------------------------------------------------------------------- --
--  LSP                                                                       --
-- -------------------------------------------------------------------------- --

vim.lsp.enable("roslyn")
vim.lsp.enable("ts_ls")

-- -------------------------------------------------------------------------- --
--  Plugins                                                                   --
-- -------------------------------------------------------------------------- --

require("lazy-setup")
require("lazy").setup({
  spec = {

    -- ------------------------------------------------------------------ --
    --  Mason                                                             --
    -- ------------------------------------------------------------------ --

    {
      "mason-org/mason.nvim",
      opts = {
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      }
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {}
    },

    -- ------------------------------------------------------------------ --
    --  Themes                                                            --
    -- ------------------------------------------------------------------ --

    {
      "ramojus/mellifluous.nvim",
      lazy = false,
      priority = 69,
      config = function()
        vim.cmd("colorscheme mellifluous")
        vim.opt.background = "light"
      end,
    },

    -- ------------------------------------------------------------------ --
    --  File Tree                                                         --
    -- ------------------------------------------------------------------ --

    {
      "nvim-mini/mini.files",
      opts = {}
    },
    {
      "nvim-mini/mini.icons",
      opts = {}
    },

    -- ------------------------------------------------------------------ --
    --  Completion                                                        --
    -- ------------------------------------------------------------------ --

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

    -- ------------------------------------------------------------------ --
    --  Language Support                                                  --
    -- ------------------------------------------------------------------ --

    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("*", {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end,
    },

    {
      "seblyng/roslyn.nvim",
      opts = {}
    }

  },
  checker = { enabled = true },
})
