return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {

      -- -----------------------------------------------------------------
      --  General
      -- -----------------------------------------------------------------

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

      -- -----------------------------------------------------------------
      --  ts_ls
      -- -----------------------------------------------------------------

      ts_ls = {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*.svelte,*.svelte.ts",
            callback = function()
              client.notify(
                "$/onDidChangeTsOrJsFile",
                { uri = vim.uri_from_bufnr(bufnr) }
              )
            end,
          })
        end,
      },
    },
  },
}
