return {
  "hrsh7th/nvim-cmp",
  name = "cmp",
  config = function()
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local lspkind = require("lspkind")

    local next_completion = function(fallback)
      if cmp.visible() then
          cmp.select_next_item()
      else
        fallback()
      end
    end

    local prev_completion = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end

    local sort_label = function(entry1, entry2)
      local label1 = entry1.completion_item.label
      local label2 = entry2.completion_item.label
      if label1 and label2 then
        local diff = vim.stricmp(label1, label2)
        if diff < 0 then
          return true
        elseif diff > 0 then
          return false
        end
      end
      return nil
    end

    cmp.setup({
      sources = { { name = "nvim_lsp" } },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-J>"]     = cmp.mapping(next_completion),
        ["<C-K>"]     = cmp.mapping(prev_completion),
        ["<Tab>"]     = cmp.mapping(next_completion),
        ["<S-Tab>"]   = cmp.mapping(prev_completion),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
      }),
      formatting =  {
        fields = { "kind", "abbr" },
        format = lspkind.cmp_format({
          mode = "symbol",
          before = function(entry, vim_item)
            vim_item.menu = ""
            return vim_item
          end,
        }),
      },
      sorting = {
        comparators = {
          sort_label,
        }
      },
    })
  end,
}

