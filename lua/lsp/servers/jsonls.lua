local config = require("lsp.config")

-- Find more: https://www.schemastore.org/json
local schemas = {
  {
    description = "TypeScript compiler configuration file",
    fileMatch = { "tsconfig.json", "tsconfig.*.json" },
    url = "https://json.schemastore.org/tsconfig.json",
  },
  {
    description = "NPM configuration file",
    fileMatch = { "package.json" },
    url = "https://json.schemastore.org/package.json",
  },
  {
    description = "OpenAPI specification file",
    fileMatch = { "*api*.json" },
    url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
  },
}

local server = config.options({
  name = "jsonls",
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_pattern = { ".git" },
  init_options = { provideFormatter = true },
  settings = {
    json = {
      schemas = schemas,
    },
  },
})

return server
