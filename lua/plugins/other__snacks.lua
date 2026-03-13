return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["<esc>"] = { "", mode = "n" },
              },
            },
            input = {
              keys = {
                ["<esc>"] = { "", mode = "n" },
              },
            },
          },
        },
      },
    },
  },
}
