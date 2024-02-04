-- Find more: https://www.schemastore.org/json

local schemas = {
  ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
  ["https://json.schemastore.org/hugo.json"] = "hugo.yaml",
}

return {
  settings = {
    yaml = {
      schemas = {
        schemas,
      },
    },
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
  },
}
