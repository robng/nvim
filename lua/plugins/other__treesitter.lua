return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "svelte",
      "typescript",
      "javascript",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
