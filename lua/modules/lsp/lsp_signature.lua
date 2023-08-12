local setup, lsp_signature = pcall(require, "lsp_signature")

if not setup then
  return
end

lsp_signature.setup({
  bind = true,
  hint_enable = false,
  handler_opts = { border = "single" }
})
