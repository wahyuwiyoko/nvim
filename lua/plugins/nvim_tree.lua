local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = false,
  sort_by = "case_sensitive",
  view = {
    cursorline = true,
    width = 25,
    side = "left",
    number = true,
    relativenumber = true
  },
  renderer = {
    root_folder_label = false,
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
      },
      glyphs = {
        bookmark = "*",
        modified = "m",
        git = {
          unstaged = "u",
          staged = "s",
          unmerged = "um",
          renamed = "r",
          untracked = "*",
          deleted = "x",
          ignored = "o"
        }
      }
    }
  },
  filters = { dotfiles = false, git_ignored = false },
  hijack_directories = { enable = true },
  update_focused_file = { enable = true },
  diagnostics = {
    enable = true,
    icons = { hint = "?", info = "i", warning = "!", error = "x" }
  },
  git = { enable = true },
  modified = { enable = true }
})
