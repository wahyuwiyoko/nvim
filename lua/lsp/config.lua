local options = require("lsp.options")

local config = {}

function config.options(opts)
  local default_options = {
    name = opts.name,
    cmd = opts.cmd,
    root_dir = options.root_dir(opts.root_pattern),
    capabilities = options.capabilities(),
    handlers = options.handlers,
    on_init = options.on_init,
    on_exit = options.on_exit,
    on_attach = options.on_attach,
  }

  return vim.tbl_deep_extend("force", default_options, opts)
end

return config
