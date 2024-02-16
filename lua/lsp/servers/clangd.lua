local config = require("lsp.config")

local server = config.options({
  name = "clangd",
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_pattern = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git",
  },
})

return server
