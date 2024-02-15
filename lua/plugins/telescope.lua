local telescope = { "nvim-telescope/telescope.nvim" }

telescope.dependencies = {
  {
    "nvim-lua/plenary.nvim",
    version = false,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = vim.fn.executable("make") == 1,
    build = "make",
  },
}

function telescope.keys()
  local builtin = require("telescope.builtin")

  return {
    { "<Leader>ff", builtin.find_files, desc = "Search files" },
    { "<Leader>fg", builtin.git_files, desc = "Search Git files" },
    { "<Leader>gt", builtin.git_status, desc = "Search Git status" },
    { "<Leader>sw", builtin.grep_string, desc = "Search current word" },
    { "<Leader>sg", builtin.live_grep, desc = "Search by grep" },
    { "<Leader>sb", builtin.buffers, desc = "Search buffers" },
    { "<Leader>sc", builtin.commands, desc = "Search commands" },
    {
      "<Leader>ch",
      builtin.command_history,
      desc = "Search command history",
    },
    { "<Leader>sp", builtin.help_tags, desc = "Search help" },
    {
      "<Leader>qq",
      builtin.quickfixhistory,
      desc = "Search quickfix history",
    },
    { "<Leader>rr", builtin.registers, desc = "Search registers" },
    { "<Leader>mm", builtin.marks, desc = "Search marks" },
    { "<Leader>sk", builtin.keymaps, desc = "Search keymaps" },
  }
end

function telescope.config()
  local plugin = require("telescope")
  local actions = require("telescope.actions")

  plugin.setup({
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
      },
      sorting_strategy = "ascending",
      preview = { filesize_limit = 5 },
      color_devicons = false,
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "┌",
        "┐",
        "┘",
        "└",
      },
      mappings = {
        n = {
          ["q"] = actions.close,
        },
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-s>"] = actions.file_split,
        },
      },
    },
  })

  plugin.load_extension("fzf")
end

return telescope
