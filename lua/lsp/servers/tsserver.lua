local config = require("lsp.config")

local server = config.options({
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_pattern = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
  },
})

return server
