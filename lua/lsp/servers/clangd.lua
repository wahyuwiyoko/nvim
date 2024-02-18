local config = require("lsp.config")

local function on_init(client, result)
  if result.offsetEncoding then
    client.offset_encoding = result.offsetEncoding
  end
end

local server = config.options({
  name = "clangd",
  cmd = { "clangd" },
  filetypes = {
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "proto",
  },
  root_pattern = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git",
  },
  on_init = on_init,
  capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
  },
})

return server
