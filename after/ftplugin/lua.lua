vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

if vim.fn.executable("stylua") == 1 then
  vim.opt_local.formatexpr = ""
  vim.opt_local.formatprg = string.format(
    "stylua --search-parent-directories --stdin-filepath %s -",
    vim.api.nvim_buf_get_name(0)
  )
end
