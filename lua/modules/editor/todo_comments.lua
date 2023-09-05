return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
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
