local mason_setup, mason = pcall(require, "mason")

if not mason_setup then
  return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_setup then
  return
end

mason.setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "→",
      package_uninstalled = "✗"
    }
  },
  keymaps = {
    toggle_package_expand = "<CR>",
    install_package = "i",
    update_package = "u",
    check_package_version = "c",
    update_all_packages = "U",
    check_outdated_packages = "C",
    uninstall_package = "X",
    cancel_installation = "<C-c>",
    apply_language_filter = "<C-f>"
  }
})

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "bashls", "html", "cssls", "tsserver" },
  automatic_installation = false
})
