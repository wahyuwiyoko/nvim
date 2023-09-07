return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-l>"] = actions.preview_scrolling_right,
            ["<C-h>"] = actions.preview_scrolling_left
          }
        }
      }
    })

    telescope.load_extension("fzf")
  end
}
