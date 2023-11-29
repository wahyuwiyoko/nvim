local servers = {
  "lua_ls", "bashls", "jsonls", "yamlls",
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
    local utils = require("core.utils")

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    utils.merge_table(capabilities, cmp.default_capabilities())

    local on_attach = function (_, bufnr)
      local map = utils.map
      local lsp_buf = lsp.buf
      local diagnostic = vim.diagnostic

      local function opts(desc)
        return { buffer = bufnr, desc = desc }
      end

      -- LSP
      map("n", "gd", lsp_buf.definition, opts("Go to definition"))
      map("n", "gD", lsp_buf.declaration, opts("Go to declaration"))
      map("n", "gr", lsp_buf.references, opts("Go to references"))
      map("n", "gi", lsp_buf.implementation, opts("Go to implementation"))
      map("n", "gt", lsp_buf.type_definition, opts("Go to type definition"))
      map("n", "<Leader>k", lsp_buf.hover, opts("Show documentation under the cursor"))
      map("n", "<Leader>hs", lsp_buf.signature_help, opts("Show signature help under the cursor"))
      map("n", "<Leader>rn", lsp_buf.rename, opts("Rename all references under the cursor"))
      map({ "n", "v" }, "<Leader>ca", lsp_buf.code_action, opts("Select a code action"))
      map({ "n", "v" }, "<Leader>lf", lsp_buf.format, opts("Format a buffer"))

      -- Diagnostics
      map("n", "<Leader>dj", diagnostic.goto_next, opts("Go to next diagnostic"))
      map("n", "<Leader>dk", diagnostic.goto_prev, opts("Go to previous diagnostic"))
      map("n", "<Leader>dl", diagnostic.open_float, opts("Open diagnostic for the current line"))
      map("n", "<Leader>da", diagnostic.setqflist, opts("Add all diagnostic to the quickfix list"))
      map("n", "<Leader>db", diagnostic.setloclist, opts("Add buffer diagnostic to the location list"))
    end

    local lspconfig = require("lspconfig")

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities
      }

      local languages_setup, languages = pcall(require, "languages." .. server)

      if languages_setup then
        opts = utils.merge_table(languages, opts)
      end

      lspconfig[server].setup(opts)
    end

    vim.diagnostic.config({
      underline = true,
      signs = true,
      virtual_text = false,
      update_in_insert = false,
      float = {
        focusable = true,
        border = "single",
        style = "minimal",
        max_width = 50
      }
    })

    handlers["textDocument/publishDiagnostics"] = lsp.with(
      lsp.diagnostic.on_publish_diagnostics, {
        signs = true,
        virtual_text = false,
        update_in_insert = false
      }
    )

    handlers["textDocument/definition"] = function (_, result)
      if result == nil or vim.tbl_isempty(result) then
        vim.notify("[LSP] Cannot find definition", vim.log.levels.INFO)
      else
        lsp.util.jump_to_location(result[1], "utf-8")
      end
    end

    handlers["textDocument/hover"] = lsp.with(
      handlers.hover, { border = "single" }
    )

    handlers["textDocument/signatureHelp"] = lsp.with(
      handlers.signature_help, { border = "single" }
    )
  end
}
