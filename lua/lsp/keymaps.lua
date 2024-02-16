local map = require("core.utils").map

local keymaps = {}

function keymaps.mapping(bufnr)
  local lsp = vim.lsp.buf
  local diagnostic = vim.diagnostic

  local function opts(desc)
    return {
      buffer = bufnr,
      desc = desc,
    }
  end

  map("n", "gd", lsp.definition, opts("Go to definition"))
  map("n", "gD", lsp.declaration, opts("Go to declaration"))
  map("n", "gr", lsp.references, opts("Go to references"))
  map("n", "gi", lsp.implementation, opts("Go to implementation"))
  map("n", "gt", lsp.type_definition, opts("Go to type definition"))
  map("n", "<Leader>k", lsp.hover, opts("Show documentation under the cursor"))
  map(
    "n",
    "<Leader>hs",
    lsp.signature_help,
    opts("Show signature help under the cursor")
  )
  map(
    "n",
    "<Leader>rn",
    lsp.rename,
    opts("Rename all references under the cursor")
  )
  map({ "n", "v" }, "<Leader>ca", lsp.code_action, opts("Select a code action"))
  map({ "n", "v" }, "<Leader>lf", lsp.format, opts("Format a buffer"))

  map("n", "<Leader>dj", diagnostic.goto_next, opts("Go to next diagnostic"))
  map(
    "n",
    "<Leader>dk",
    diagnostic.goto_prev,
    opts("Go to previous diagnostic")
  )
  map(
    "n",
    "<Leader>dl",
    diagnostic.open_float,
    opts("Open diagnostic for the current line")
  )
  map(
    "n",
    "<Leader>da",
    diagnostic.setqflist,
    opts("Add all diagnostic to the quickfix list")
  )
  map(
    "n",
    "<Leader>db",
    diagnostic.setloclist,
    opts("Add buffer diagnostic to the location list")
  )
end

return keymaps
