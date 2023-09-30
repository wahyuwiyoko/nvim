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
  },
  init = function ()
    local registry = require("mason-registry")
    local linters = { "selene", "shellcheck", "markdownlint" }

    for _, linter in ipairs(linters) do
      if not registry.is_installed(linter) then
        vim.cmd("MasonInstall " .. linter)
      end
    end
  end
}
