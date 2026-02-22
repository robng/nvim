return {
  "nvim-mini/mini.pairs",
  opts = function(_)
    -- Disable inserting an extra newline after cursor if
    -- enter is pressed between the opening closing symbols
    vim.keymap.set("i", "<CR>", "<CR>", { buffer = false })
  end,
}
