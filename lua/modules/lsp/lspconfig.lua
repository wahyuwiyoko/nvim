local servers = {
  "lua_ls", "bashls", "jsonls",
  "html", "cssls", "tsserver",
  "gopls", "marksman", "efm"
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = servers,
      automatic_installation = false
    }
  },
  config = function ()
    -- Add additional capabilities supported by nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local on_attach = function (_, bufnr)
      local keymap = vim.keymap.set
      local lsp = vim.lsp.buf

      local function opts(desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = desc }
      end

      keymap("n", "gD", lsp.declaration, opts("LSP declaration"))
      keymap("n", "K", lsp.hover, opts("LSP hover to show documentation under cursor"))
      keymap("n", "<space>hs", lsp.signature_help, opts("LSP signature help"))
      keymap("n", "<space>rn", lsp.rename, opts("LSP rename"))
      keymap({ "n", "v" }, "<space>ca", lsp.code_action, opts("LSP code action"))
      keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts("LSP definition"))
      keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts("LSP implementation"))
      keymap("n", "<space>gt", ":Telescope lsp_type_definitions<CR>", opts("LSP type definition"))
      keymap("n", "<space>D", ":Telescope diagnostics bufnr=0<CR>", opts("LSP diagnostics current buffer"))
      keymap("n", "gr", ":Telescope lsp_references<CR>", opts("LSP references"))
    end

    local lspconfig = require("lspconfig")

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
  end
}
