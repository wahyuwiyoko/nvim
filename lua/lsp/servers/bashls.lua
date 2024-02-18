local config = require("lsp.config")

local server = config.options({
  name = "bashls",
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  root_pattern = { ".git" },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
    },
  },
})

return server
