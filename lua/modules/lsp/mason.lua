return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function ()
    local servers = require("settings.servers")

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "+",
          package_pending = "p",
          package_uninstalled = "x"
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = false
    })
  end
}
