return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.x",
  keys = function ()
    local telescope = require("telescope.builtin")

    return {
      { "<leader>ff", telescope.find_files, desc = "Search files" },
      { "<leader>fg", telescope.git_files, desc = "Search Git files" },
      { "<leader>sw", telescope.grep_string, desc = "Search current word" },
      { "<leader>sg", telescope.live_grep, desc = "Search by grep" },
      { "<leader>sb", telescope.buffers, desc = "Search buffers" },
      { "<leader>sc", telescope.commands, desc = "Search commands" },
      { "<leader>ch", telescope.command_history, desc = "Search command history" },
      { "<leader>sp", telescope.help_tags, desc = "Search help" },
      { "<leader>qq", telescope.quickfixhistory, desc = "Search quickfix history" },
      { "<leader>rr", telescope.registers, desc = "Search registers" },
      { "<leader>sk", telescope.keymaps, desc = "Search keymaps" },
      { "<leader>sd", telescope.diagnostics, desc = "Search diagnostics" }
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
