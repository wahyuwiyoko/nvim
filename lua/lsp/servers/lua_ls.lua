local config = require("lsp.config")

local server = config.options({
  name = "lua_ls",
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_pattern = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
  },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

return server
