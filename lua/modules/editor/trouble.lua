return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { mode = "n", "<leader>tt", ":TroubleToggle<CR>" }
  },
  opts = {
    icons = false,
    fold_open = "v",
    fold_closed = ">",
    indent_lines = false,
    signs = {
      error = "error",
      warning = "warn",
      hint = "hint",
      information = "info"
    },
    use_diagnostic_sign = false
  }
}
