local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  sort_by = "case_sensitive",
  view = {
    cursorline = true,
    width = 25,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      webdev_colors = false,
      symlink_arrow = "->",
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
        modified = true
      }
    }
  },
  filters = { dotfiles = false },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = { enable = false }
    }
  },
  hijack_directories = { enable = true, auto_open = true },
  update_focused_file = { enable = true, update_cwd = true },
  diagnostics = {
    enable = true,
    icons = { hint = "?", info = "i", warning = "!", error = "x" }
  },
  git = { enable = true, ignore = false, timeout = 500 }
})
