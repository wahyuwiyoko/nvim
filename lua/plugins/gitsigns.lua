local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" }
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = { follow_files = true },
  attach_to_untracked = true,
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
  yadm = { enable = false }
})
