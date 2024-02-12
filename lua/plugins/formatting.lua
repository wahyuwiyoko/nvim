return {
  "stevearc/conform.nvim",
  version = "5.x.x",
  event = "BufWritePre",
  keys = {
    {
      mode = { "n", "v", "x" },
      "<Leader>mp",
      function()
        require("conform").format({ timeout_ms = 500 })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt" },
    },
    format_on_save = { timeout_ms = 500 },
  },
}
