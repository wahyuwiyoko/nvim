local lspconfig_setup, lspconfig = pcall(require, "lspconfig")

if not lspconfig_setup then
  return
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_setup then
  return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local on_attach = function (_, bufnr)
  local keymap = vim.keymap.set
  local lsp = vim.lsp.buf

  local function opts(desc)
    return { noremap = true, silent = true, buffer = bufnr, desc = desc }
  end

  keymap("n", "gD", lsp.declaration, opts("LSP declaration"))
  keymap("n", "gd", lsp.definition, opts("LSP definition"))
  keymap("n", "K", lsp.hover, opts("LSP hover"))
  keymap("n", "gi", lsp.implementation, opts("LSP implementation"))
  keymap("n", "<C-k>", lsp.signature_help, opts("LSP signature help"))
  keymap("n", "<space>wa", lsp.add_workspace_folder, opts("LSP add workspace folder"))
  keymap("n", "<space>wr", lsp.remove_workspace_folder, opts("LSP remove workspace folder"))
  keymap("n", "<space>wl", function()
    print(vim.inspect(lsp.list_workspace_folders()))
  end, opts("LSP list workspace folders"))
  keymap("n", "<space>D", lsp.type_definition, opts("LSP type definition"))
  keymap("n", "<space>rn", lsp.rename, opts("LSP rename"))
  keymap({ "n", "v" }, "<space>ca", lsp.code_action, opts("LSP code action"))
  keymap("n", "gr", lsp.references, opts("LSP references"))
  keymap("n", "<space>f", function()
    lsp.format { async = true }
  end, opts("LSP format"))
end

local servers = require("modules.lsp.servers")

for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  local settings_setup, settings = pcall(require, "settings." .. server)

  if settings_setup then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  lspconfig[server].setup(opts)
end

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal"
  }
})
