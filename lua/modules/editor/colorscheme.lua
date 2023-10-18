return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  main = "rose-pine",
  opts = {
    variant = "main",
    disable_italics = true
  },
  init = function ()
    vim.cmd("colorscheme rose-pine")
  end
}
