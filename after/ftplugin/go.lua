vim.opt_local.expandtab = false

vim.cmd.compiler("go")

if vim.fn.executable("gofmt") then
  vim.opt_local.formatexpr = ""
  vim.opt_local.formatprg = "gofmt"
end
