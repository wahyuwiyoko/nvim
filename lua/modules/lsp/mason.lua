return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ui = {
      icons = {
        package_installed = "+",
        package_pending = "p",
        package_uninstalled = "x"
      }
    }
  }
}
