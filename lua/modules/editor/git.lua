return {
  "lewis6991/gitsigns.nvim",
  version = "0.x",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<Leader>gn", "<Cmd>Gitsigns next_hunk<CR>", desc = "Git next hunk" },
    { "<Leader>gp", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Git previous hunk" },
    { "<Leader>gh", "<Cmd>Gitsigns preview_hunk<CR>", desc = "Git preview hunk" },
    { "<Leader>gs", "<Cmd>Gitsigns diffthis<CR>", desc = "Git show diff" }
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" }
    }
  }
}
