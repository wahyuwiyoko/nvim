local config = require("lsp.config")

local server = config.options({
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_pattern = {
    "tsconfig.json",
    "package.json",
    "jsconfig.json",
    ".git",
  },
  init_options = { hostInfo = "neovim" },
})

return server
