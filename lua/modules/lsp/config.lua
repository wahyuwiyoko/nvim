local servers = {
  "lua_ls", "bashls", "jsonls",
  "html", "cssls", "tsserver",
  "gopls", "marksman"
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    version = "1.x.x",
    opts = {
      ensure_installed = servers,
      automatic_installation = false
    }
  },
  config = function ()
    local lsp = vim.lsp
    local handlers = lsp.handlers
    local cmp = require("cmp_nvim_lsp")

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp.default_capabilities(capabilities)

    local on_attach = function (_, bufnr)
      local keymap = vim.keymap.set
      local lsp_buf = vim.lsp.buf
      local telescope = require("telescope.builtin")

      local function opts(desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = desc }
      end

      keymap("n", "gD", lsp_buf.declaration, opts("LSP declaration"))
      keymap("n", "<leader>k", lsp_buf.hover, opts("LSP hover to show documentation under cursor"))
      keymap("n", "<leader>hs", lsp_buf.signature_help, opts("LSP signature help"))
      keymap("n", "<leader>rn", lsp_buf.rename, opts("LSP rename"))
      keymap({ "n", "v" }, "<leader>ca", lsp_buf.code_action, opts("LSP code action"))
      keymap({ "n", "v" }, "<leader>lf", lsp_buf.format, opts("LSP format"))
      keymap("n", "gd", telescope.lsp_definitions, opts("LSP definition"))
      keymap("n", "gi", telescope.lsp_implementations, opts("LSP implementation"))
      keymap("n", "<leader>gt", telescope.lsp_type_definitions, opts("LSP type definition"))
      keymap("n", "gr", telescope.lsp_references, opts("LSP references"))
      keymap("n", "<leader>D", function ()
        telescope.diagnostics({ bufnr = 0 })
      end, opts("LSP diagnostics current buffer"))
    end

    local lspconfig = require("lspconfig")

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities
      }

      local languages_setup, languages = pcall(require, "languages." .. server)

      if languages_setup then
        opts = vim.tbl_deep_extend("force", languages, opts)
      end

      lspconfig[server].setup(opts)
    end

    vim.diagnostic.config({
      signs = false,
      virtual_text = false,
      update_in_insert = false,
      float = {
        focusable = true,
        border = "single",
        style = "minimal"
      }
    })

    handlers["textDocument/hover"] = lsp.with(handlers.hover, {
      border = "single"
    })

    handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, {
      border = "single"
    })
  end
}
