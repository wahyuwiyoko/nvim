return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      version = "0.1.x"
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable("make") == 1,
      build = "make",
      config = function ()
        require("telescope").load_extension("fzf")
      end
    }
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next
          }
        }
      }
    })
  end
}
