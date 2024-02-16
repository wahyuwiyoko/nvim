local config = require("lsp.config")

local server = config.options({
  name = "gopls",
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_pattern = { "go.mod", "go.work", ".git" },
})

return server
