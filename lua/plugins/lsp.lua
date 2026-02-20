return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            -- Disable LazyVim defaults
            { "K", enabled = false },

            -- Set up custom keys
            {
              "<C-.>",
              function()
                return vim.lsp.buf.code_action()
              end,
            },
            {
              "<C-h>",
              function()
                return vim.lsp.buf.hover()
              end,
            },
            {
              "<C-r>",
              function()
                return vim.lsp.buf.rename()
              end,
            },
          },
        },
      },
    },
  },
}
