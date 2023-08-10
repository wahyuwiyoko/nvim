local setup, efmls = pcall(require, "efmls-configs")

if not setup then
  return
end

local vale = require("efmls-configs.linters.vale")
local shellcheck = require("efmls-configs.linters.shellcheck")

efmls.init({ default_config = false })

efmls.setup({
  markdown = { linter = vale },
  sh = { linter = shellcheck }
})
