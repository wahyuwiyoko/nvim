local mason = { "williamboman/mason.nvim" }

mason.cmd = "Mason"

mason.build = ":MasonUpdate"

mason.opts = {
  ui = {
    icons = {
      package_installed = "+",
      package_pending = "~",
      package_uninstalled = "x",
    },
  },
}

return mason
