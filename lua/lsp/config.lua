local options = require("lsp.options")
local merge_table = require("core.utils").merge_table

local config = {}

function config.options(opts)
  local default_options = {
    name = opts.name,
    cmd = opts.cmd,
    root_dir = options.root_dir(opts.root_pattern),
    capabilities = options.capabilities,
    handlers = options.handlers,
    on_init = options.on_init,
    on_exit = options.on_exit,
    on_attach = options.on_attach,
  }

  return merge_table(default_options, opts)
end

function config.diagnostic()
  -- NOTE: Diagnostic sign text for Neovim 0.9 or lower
  local function sign(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = "",
    })
  end

  sign({ name = "DiagnosticSignError", text = "E" })
  sign({ name = "DiagnosticSignWarn", text = "W" })
  sign({ name = "DiagnosticSignHint", text = "H" })
  sign({ name = "DiagnosticSignInfo", text = "I" })

  -- NOTE: Diagnostic sign text for Neovim 0.10
  -- vim.diagnostic.config({
  --   signs = {
  --     text = {
  --       [vim.diagnostic.severity.ERROR] = "E",
  --       [vim.diagnostic.severity.WARN] = "W",
  --       [vim.diagnostic.severity.HINT] = "H",
  --       [vim.diagnostic.severity.INFO] = "I",
  --     },
  --   },
  -- })

  vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = false,
      border = "single",
      style = "minimal",
      max_width = 50,
    },
  })
end

return config
