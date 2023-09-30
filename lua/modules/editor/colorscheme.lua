return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  main = "rose-pine",
  opts = {
    variant = "main",
    disable_italics = true
  },
  init = function ()
    vim.cmd("colorscheme rose-pine")
  end
}
