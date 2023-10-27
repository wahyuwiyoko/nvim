-- Find more: https://www.schemastore.org/json

local schemas = {
  {
    description = "TypeScript compiler configuration file",
    fileMatch = { "tsconfig.json", "tsconfig.*.json" },
    url = "https://json.schemastore.org/tsconfig.json"
  },
  {
    description = "NPM configuration file",
    fileMatch = { "package.json" },
    url = "https://json.schemastore.org/package.json"
  },
  {
    description = "OpenAPI specification file",
    fileMatch = { "openapi.json" },
    url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
  },
  {
    description = "Swagger API 2.0 specification file",
    fileMatch = { "swagger.json" },
    url = "https://json.schemastore.org/swagger-2.0.json"
  }
}

return {
  settings = {
    json = { schemas = schemas }
  },
  setup = {
    commands = {
      Format = {
        function ()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end
      }
    }
  }
}
