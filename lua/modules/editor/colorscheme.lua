return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "main",
      styles = {
        bold = false,
        italic = false,
      },
      highlight_groups = {
        StatusLine = { fg = "text", bg = "surface" },
        TabLine = { fg = "subtle", bg = "base" },
        TelescopeTitle = { fg = "text", bold = true },
        TelescopeBorder = { fg = "subtle", bg = "surface" },
      },
    })

    vim.cmd.colorscheme("rose-pine")
  end,
}
