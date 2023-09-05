return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TodoTrouble", "TodoTelescope" },
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true }
  },
  opts = {
    signs = false,
    keywords = {
      FIX = { icon = "" },
      TODO = { icon = "" },
      HACK = { icon = "" },
      WARN = { icon = "" },
      PERF = { icon = "" },
      NOTE = { icon = "" },
      TEST = { icon = "" }
    }
  }
}
