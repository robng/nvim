return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")
    -- Zig
    lspconfig.zls.setup({
      capabilities = cmp_lsp.default_capabilities()
    })
  end,
  -- opts = function()
--    local lspconfig = require("lspconfig")
--    local cmp_lsp = require("cmp_nvim_lsp")
--    -- Zig
--    lspconfig.zls.setup({
--      capabilities = cmp_lsp.default_capabilities()
--    })

--    print(require"lspconfig".zls)
  -- end
}

