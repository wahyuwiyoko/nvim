local setup, efmls = pcall(require, "efmls-configs")

if not setup then
  return
end

local shellcheck = require("efmls-configs.linters.shellcheck")
local luacheck = require("efmls-configs.linters.luacheck")

efmls.init({ default_config = false })

efmls.setup({
  sh = { linter = shellcheck },
  lua = { linter = luacheck }
})
