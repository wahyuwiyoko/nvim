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
        -- Editor
        StatusLine = { fg = "text", bg = "surface" },
        TabLine = { fg = "subtle", bg = "base" },

        -- Telescope
        TelescopeBorder = { fg = "subtle", bg = "surface" },
        TelescopeTitle = { fg = "text", bold = true },

        -- Diff files
        ["@attribute.diff"] = { fg = "gold" },
        ["@text.diff.add"] = { fg = "foam", bg = "foam", blend = 20 },
        ["@text.diff.delete"] = { fg = "love", bg = "love", blend = 20 }
      }
    })

    vim.cmd("colorscheme rose-pine")
  end
}
