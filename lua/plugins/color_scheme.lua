return {
  "wahyuwiyoko/dark-moon.nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("dark-moon").setup({
      styles = {
        bold = false,
      },
    })

    vim.cmd.colorscheme("dark-moon")
  end,
}
