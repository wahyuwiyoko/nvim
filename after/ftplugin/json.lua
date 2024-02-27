if vim.fn.executable("jq") == 1 then
  vim.opt_local.formatexpr = ""
  vim.opt_local.formatprg = "jq"
end
