local config = require("lsp.config")

local server = config.options({
  name = "svelte",
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_pattern = { "package.json", ".git" },
})

return server
