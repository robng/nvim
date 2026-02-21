require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

local roslyn_exe =
  vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/roslyn/roslyn")

local roslyn_logs =
  vim.fs.joinpath(vim.fn.stdpath("data"), "mason/packages/roslyn/logs")

return {
  "seblyng/roslyn.nvim",
  init = function()
    vim.fn.mkdir(roslyn_logs, "p")

    vim.lsp.config("roslyn", {
      cmd = {
        roslyn_exe,
        "--stdio",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. roslyn_logs,
      },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      root_markers = { "*.sln", "*.csproj" },
    })
  end,
}
