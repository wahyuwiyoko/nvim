local config = require("lsp.config")

local server = config.options({
  name = "marksman",
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" },
  root_pattern = { ".git", ".marksman.toml" },
})

return server
