local config = require("lsp.config")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local validate = { validate = true }

local server = config.options({
  name = "css",
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_pattern = { "package.json", ".git" },
  capabilities = capabilities,
  settings = {
    css = validate,
    scss = validate,
    less = validate,
  },
})

return server
