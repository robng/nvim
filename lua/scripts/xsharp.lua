local lib = require("lib")

local function goto_terminal_window()
  for winnr = 1, vim.fn.winnr("$") do
    local bufnr = vim.fn.winbufnr(winnr)
    if vim.bo[bufnr].buftype == "terminal" then
      vim.cmd(winnr .. "wincmd w")
      return true
    end
  end
  return false
end

local function goto_previous_window()
  vim.cmd("wincmd p")
end

return {
  jump_to_error = function()
    if not goto_terminal_window() then
      return
    end

    local match = vim.fn.search("error XS", "W")
    if match == 0 then
      goto_previous_window()
      return
    end

    lib.feedkeys("nx", "zz")
    local line_idx = vim.fn.line(".")
    local line_text = vim.fn.getline(line_idx)
    goto_previous_window()

    local file, s_line, s_col = line_text:match("(.+)%((%d+),%s*(%d+)%)")
    local line = tonumber(s_line)
    local col = tonumber(s_col) - 1

    vim.cmd("e " .. file)
    vim.api.nvim_win_set_cursor(0, { line, col })
    lib.feedkeys("n", "zz")
  end,
}
