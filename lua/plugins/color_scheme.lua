local color_scheme = { "wahyuwiyoko/dark-moon.nvim" }

color_scheme.version = false

color_scheme.lazy = false

color_scheme.priority = 1000

function color_scheme.config()
  require("dark-moon").setup({
    styles = {
      bold = false,
    },
  })

  vim.cmd.colorscheme("dark-moon")
end

return color_scheme
