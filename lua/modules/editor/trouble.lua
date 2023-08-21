local setup, trouble = pcall(require, "trouble")

if not setup then
  return
end

trouble.setup({
  icons = false,
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false,
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
  use_diagnostic_sign = false
})
