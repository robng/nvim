return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {

        -- -------------------------------------------------------------
        --  Customize keys
        -- -------------------------------------------------------------

        keys = {

          -- Disable defaults

          { "K", enabled = false },
          { "<C-k>", enabled = false },

          -- Define custom keys

          {
            "<C-.>",
            function()
              return vim.lsp.buf.code_action()
            end,
          },
          -- TODO: <C-e>: show [e]rrors (aka diagnostics)
          -- [H]over
          {
            "<C-h>",
            function()
              return vim.lsp.buf.hover()
            end,
          },
          -- Re[n]ame
          {
            "<C-n>",
            function()
              return vim.lsp.buf.rename()
            end,
          },
        },
      },
    },
  },
}
