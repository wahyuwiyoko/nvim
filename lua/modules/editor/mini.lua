return {
  {
    "echasnovski/mini.pairs",
    event = { "InsertEnter" },
    config = true
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    config = true
  },
  {
    "echasnovski/mini.surround",
    event = { "BufReadPre", "BufNewFile" },
    config = true
  },
  {
    "echasnovski/mini.trailspace",
    event = { "BufReadPre", "BufNewFile" },
    config = true
  },
  {
    "echasnovski/mini.files",
    keys = {
      { "<leader>e", ":lua MiniFiles.open()<CR>" }
    },
    opts = {
      -- Disable icons
      content = { prefix = function() end }
    }
  },
  {
    "echasnovski/mini.statusline",
    event = "VeryLazy",
    opts = { use_icons = false }
  },
  {
    "echasnovski/mini.tabline",
    event = "VeryLazy",
    opts = { show_icons = false, tabpage_section = "right" }
  }
}
