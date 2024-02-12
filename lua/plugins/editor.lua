return {
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    opts = {
      options = {
        disabled_filetypes = { "TelescopePrompt" },
        pair_spaces = true,
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "2.x.x",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    version = "0.8.x",
    keys = {
      {
        mode = { "n", "v", "x" },
        "gc",
        desc = "Toggle line comment",
      },
      {
        mode = { "n", "v", "x" },
        "gb",
        desc = "Toggle block comment",
      },
    },
    config = true,
  },
}
