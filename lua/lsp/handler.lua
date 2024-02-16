local handler = {}

local lsp = vim.lsp
local handlers = lsp.handlers

function handler.handler()
  handlers["textDocument/publishDiagnostics"] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      virtual_text = false,
      update_in_insert = false,
    })

  handlers["textDocument/definition"] = function(_, result)
    if result == nil or vim.tbl_isempty(result) then
      vim.notify("[LSP] Cannot find definition", vim.log.levels.INFO)
    else
      lsp.util.jump_to_location(result[1], "utf-8")
    end
  end

  handlers["textDocument/hover"] =
    lsp.with(handlers.hover, { border = "single" })

  handlers["textDocument/signatureHelp"] =
    lsp.with(handlers.signature_help, { border = "single" })
end

return handler
