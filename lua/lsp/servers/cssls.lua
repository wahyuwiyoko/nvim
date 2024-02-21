local config = require("lsp.config")

local validate = { validate = true }

local server = config.options({
  name = "cssls",
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_pattern = { "package.json", ".git" },
  init_options = { provideFormatter = true },
  settings = {
    css = validate,
    scss = validate,
    less = validate,
  },
})

return server
