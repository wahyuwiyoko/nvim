return {
  "rose-pine/neovim",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  config = function ()
    require("rose-pine").setup({
      variant = "main",
      disable_italics = true,
      highlight_groups = {
        EndOfBuffer = { fg = "base" },
        StatusLine = { fg = "text", bg = "surface" },
        TabLine = { fg = "subtle", bg = "base" },
        TelescopeBorder = { fg = "subtle", bg = "surface" },
        TelescopeTitle = { fg = "text", bold = true }
      }
    })

    vim.cmd("colorscheme rose-pine")
  end
}
