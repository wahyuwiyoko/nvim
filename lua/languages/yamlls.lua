-- Find more: https://www.schemastore.org/json

local schemas = {
  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "openapi.yaml",
  ["https://json.schemastore.org/swagger-2.0.json"] = "swagger.yaml"
}

return {
  settings = {
    yaml = {
      schemas = { schemas }
    },
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  }
}
