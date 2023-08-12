local mason_setup, mason = pcall(require, "mason")

if not mason_setup then
  return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_setup then
  return
end

local servers = require("modules.lsp.servers")

mason.setup({
  ui = {
    icons = {
      package_installed = "+",
      package_pending = "p",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = false
})
