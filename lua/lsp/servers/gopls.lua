local config = require("lsp.config")

local server = config.options({
  name = "gopls",
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_pattern = { "go.mod", "go.work", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedvariable = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        shadow = true,
      },
    },
  },
})

return server
