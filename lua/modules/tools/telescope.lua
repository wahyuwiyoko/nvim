return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  keys = function ()
    local telescope = require("telescope.builtin")

    return {
      { "<Leader>ff", telescope.find_files, desc = "Search files" },
      { "<Leader>fg", telescope.git_files, desc = "Search Git files" },
      { "<Leader>sw", telescope.grep_string, desc = "Search current word" },
      { "<Leader>sg", telescope.live_grep, desc = "Search by grep" },
      { "<Leader>sb", telescope.buffers, desc = "Search buffers" },
      { "<Leader>sc", telescope.commands, desc = "Search commands" },
      { "<Leader>ch", telescope.command_history, desc = "Search command history" },
      { "<Leader>sp", telescope.help_tags, desc = "Search help" },
      { "<Leader>qq", telescope.quickfixhistory, desc = "Search quickfix history" },
      { "<Leader>rr", telescope.registers, desc = "Search registers" },
      { "<Leader>sk", telescope.keymaps, desc = "Search keymaps" }
    }
  end,
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      version = "0.1.x"
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable("make") == 1,
      build = "make"
    }
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55
          }
        },
        sorting_strategy = "ascending",
        preview = { filesize_limit = 5 },
        set_env = { COLORTERM = "truecolor" },
        color_devicons = false,
        mappings = {
          n = {
            ["q"] = actions.close
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-h>"] = actions.file_split
          }
        }
      }
    })

    telescope.load_extension("fzf")
  end
}
