local config = require("lsp.config")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local server = config.options({
  name = "html",
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  root_pattern = { "package.json", ".git" },
  capabilities = capabilities,
})

return server
