local cmp = require("cmp_nvim_lsp")
local commands = require("lsp.commands")
local keymaps = require("lsp.keymaps")
local utils = require("core.utils")

local options = {}

local api = vim.api
local fs = vim.fs
local lsp = vim.lsp
local handlers = lsp.handlers
local fmt = string.format

function options.root_dir(root_pattern)
  local dir_path = fs.find(root_pattern, {
    path = fs.dirname(api.nvim_buf_get_name(0)),
    upward = true,
    stop = vim.env.HOME,
  })

  local root_dir_path = fs.dirname(dir_path[1])

  if root_dir_path == "." then
    return vim.fn.getcwd()
  end

  if root_dir_path == nil then
    return fs.dirname(api.nvim_buf_get_name(0))
  end

  return root_dir_path
end

function options.capabilities()
  local capabilities = lsp.protocol.make_client_capabilities()

  capabilities.textDocument.completion.completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    documentationFormat = { "markdown", "plaintext" },
    preselectSupport = true,
    snippetSupport = true,
  }

  return utils.merge_table(capabilities, cmp.default_capabilities())
end

options.handlers = {
  ["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
      signs = true,
      virtual_text = false,
      update_in_insert = false,
    }
  ),

  ["textDocument/definition"] = function(_, result)
    if result == nil or vim.tbl_isempty(result) then
      vim.notify("[LSP] Cannot find definition", vim.log.levels.INFO)
    else
      lsp.util.jump_to_location(result[1], "utf-8")
    end
  end,

  ["textDocument/hover"] = lsp.with(handlers.hover, { border = "single" }),

  ["textDocument/signatureHelp"] = lsp.with(
    handlers.signature_help,
    { border = "single" }
  ),
}

function options.on_init(client, result)
  -- Handle offset encoding by default
  if result.offsetEncoding then
    client.offset_encoding = result.offsetEncoding
  end
end

function options.on_exit(code, signal, client_id)
  local prefix = fmt("[Client %s]", tostring(client_id))

  print(fmt("%s LSP exited with code %s", prefix, tostring(code)))

  if signal ~= nil then
    print(fmt("%s Signal %s", prefix, tostring(signal)))
  end

  vim.schedule_wrap(function()
    local group = fmt("LSP_%s", lsp.get_client_by_id(client_id).config.name)

    if vim.fn.exists(fmt("#%s", group)) == 1 then
      api.nvim_del_augroup_by_name(group)
    end
  end)
end

function options.on_attach(client, bufnr)
  keymaps.mapping(bufnr)
  commands.user()

  if not client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

return options
