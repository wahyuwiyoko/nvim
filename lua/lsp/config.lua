local handler = require("lsp.handler")
local options = require("lsp.options")
local merge_table = require("core.utils").merge_table

local config = {}

local function root_dir(root_pattern)
  local dir_path = vim.fs.find(root_pattern, {
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
    upward = true,
    stop = vim.env.HOME,
  })

  local root_dir_path = vim.fs.dirname(dir_path[1])

  if root_dir_path == "." then
    return vim.fn.getcwd()
  end

  return root_dir_path
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
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "single",
      source = "always",
      max_width = 50,
      header = "",
      prefix = "",
    },
  })
end

function config.options(opts)
  local default_options = {
    name = opts.name,
    cmd = opts.cmd,
    root_dir = root_dir(opts.root_pattern),
    handlers = handler.text_document,
    on_exit = options.on_exit,
  }

  return merge_table(default_options, opts)
end

return config
