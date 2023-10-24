return {
  "lewis6991/gitsigns.nvim",
  version = "0.x",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<Leader>gn", "<Cmd>Gitsigns next_hunk<CR>", desc = "Git next hunk" },
    { "<Leader>gp", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Git previous hunk" },
    { "<Leader>gh", "<Cmd>Gitsigns preview_hunk<CR>", desc = "Git preview hunk" },
    { "<Leader>gsh", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Git stage hunk" },
    { "<Leader>gsb", "<Cmd>Gitsigns stage_buffer<CR>", desc = "Git stage buffer" },
    { "<Leader>gdf", "<Cmd>Gitsigns diffthis<CR>", desc = "Git show diff" }
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
