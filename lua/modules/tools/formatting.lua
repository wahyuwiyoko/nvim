return {
  "stevearc/conform.nvim",
  version = "4.x.x",
  event = "BufWritePre",
  keys = {
    {
      mode = { "n", "v", "x" },
      "<Leader>mp",
      function ()
        require("conform").format({ timeout_ms = 500 })
      end,
      desc = "Format file"
    }
  },
  opts = {
    formatters_by_ft = {
      go = { "gofmt" }
    },
    format_on_save = { timeout_ms = 500 }
  }
}
