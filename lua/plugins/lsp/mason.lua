return {
  "williamboman/mason.nvim",
  version = "1.x.x",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ui = {
      icons = {
        package_installed = "+",
        package_pending = "~",
        package_uninstalled = "x",
      },
    },
  },
}
