return {
  "saghen/blink.cmp",
  opts = {

    completion = {
      ghost_text = { enabled = false },
    },

    -- -----------------------------------------------------------------
    --  Customize keys
    -- -----------------------------------------------------------------

    keymap = {
      preset = "default",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<Cr>"] = { "accept", "fallback" },
    },

    -- -----------------------------------------------------------------
    --  Disable snippets
    -- -----------------------------------------------------------------

    -- sources = {
    --   transform_items = function(_, items)
    --     return vim.tbl_filter(function(item)
    --       return item.kind
    --         ~= require("blink.cmp.types").CompletionItemKind.Snippet
    --     end, items)
    --   end,
    -- },
  },
}
