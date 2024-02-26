vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

if vim.fn.executable("jq") == 1 then
  vim.opt_local.formatexpr = ""
  vim.opt_local.formatprg = "jq"
end
