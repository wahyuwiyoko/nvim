local function mapping(bufnr)
  local lsp = vim.lsp.buf

  local function map(mode, key, commands, desc)
    vim.keymap.set(mode, key, commands, {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc,
    })
  end

  map("n", "gd", lsp.definition, "Go to definition")
  map("n", "gD", lsp.declaration, "Go to declaration")
  map("n", "gr", lsp.references, "Go to references")
  map("n", "gi", lsp.implementation, "Go to implementation")
  map("n", "gt", lsp.type_definition, "Go to type definition")
  map("n", "<Leader>k", lsp.hover, "Show documentation under the cursor")
  map(
    "n",
    "<Leader>hs",
    lsp.signature_help,
    "Show signature help under the cursor"
  )
  map("n", "<Leader>rn", lsp.rename, "Rename all references under the cursor")
  map({ "n", "v" }, "<Leader>ca", lsp.code_action, "Select a code action")
  map({ "n", "v" }, "<Leader>fm", lsp.format, "Format a buffer")
end

return mapping
