local nvim_feedkeys = vim.api.nvim_feedkeys
local nvim_replace_termcodes = vim.api.nvim_replace_termcodes

return {
  feedkeys = function(mode, keys)
    local escaped = nvim_replace_termcodes(keys, true, false, true)
    nvim_feedkeys(escaped, mode, false)
  end,

  focus_explorer = function()
    local active = Snacks.picker.get({ source = "explorer" })[1]
    if active ~= nil then
      active:focus()
      return
    end

    Snacks.explorer.open()
  end,
}
