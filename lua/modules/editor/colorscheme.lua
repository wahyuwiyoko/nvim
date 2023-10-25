return {
  "rose-pine/neovim",
  version = "1.x.x",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  main = "rose-pine",
  opts = {
    variant = "main",
    disable_italics = true,
    highlight_groups = {
      EndOfBuffer = { fg = "base" },
      StatusLine = { fg = "text", bg = "surface" },
      TabLine = { fg = "subtle", bg = "base" }
    }
  },
  init = function ()
    vim.cmd("colorscheme rose-pine")
  end
}
