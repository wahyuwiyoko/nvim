local formatting = { "stevearc/conform.nvim" }

formatting.event = "BufWritePre"

formatting.keys = {
  {
    mode = { "n", "v", "x" },
    "<Leader>mp",
    function()
      require("conform").format({ timeout_ms = 500 })
    end,
    desc = "Format buffer",
  },
}

formatting.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
  },
  format_on_save = { timeout_ms = 500 },
}

return formatting
