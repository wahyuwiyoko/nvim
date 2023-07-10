local lspconfig_setup, lspconfig = pcall(require, "lspconfig")

if not lspconfig_setup then
  return
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_setup then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- TODO: Attach to LSP and create keymaps in keymaps.lua
-- vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--     vim.keymap.set("n", "<C-i>", vim.lsp.buf.signature_help, opts)
--     vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set("n", "<leader>wl", function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--     vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
--     vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--     vim.keymap.set("n", "<leader>f", function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end
-- })

lspconfig["lua_ls"].setup({
  capabilities = capabilities
})

lspconfig["html"].setup({
  capabilities = capabilities
})

lspconfig["cssls"].setup({
  capabilities = capabilities
})

lspconfig["tsserver"].setup({
  capabilities = capabilities
})

lspconfig["bashls"].setup({
  capabilities = capabilities
})
