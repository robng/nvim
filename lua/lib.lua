lsp_show_help = function()
  vim.diagnostic.open_float()
  vim.lsp.buf.code_action()
end

lsp_rename = function()
  vim.lsp.buf.rename()
end

lsp_hover = function()
  vim.lsp.buf.hover()
end

lsp_goto = function()
  vim.lsp.buf.definition()
end
