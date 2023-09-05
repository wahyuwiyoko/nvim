return {
  "ray-x/lsp_signature.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    bind = true,
    hint_enable = false,
    handler_opts = { border = "single" }
  }
}
