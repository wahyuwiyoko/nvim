return {
  "creativenull/efmls-configs-nvim",
  version = "v0.1.4",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local efmls = require("efmls-configs")

    efmls.init({ default_config = false })

    efmls.setup({
      sh = { linter = require("efmls-configs.linters.shellcheck") },
      lua = { linter = require("efmls-configs.linters.luacheck") }
    })
  end
}
