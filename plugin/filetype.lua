vim.filetype.add({
  extension = {
    hurl = "hurl",
  },
  filename = {
    ["go.mod"] = "gomod",
    ["go.sum"] = "gosum",
  },
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  group = augroup("Filetype2Indent", { clear = true }),
  pattern = {
    "lua",
    "sh",
    "html",
    "css",
    "javascript",
    "typescript",
    "json",
    "xml",
    "yaml",
  },
  desc = "Filetype with 2 indent size",
  callback = function()
    local indent_size = 2

    vim.opt_local.tabstop = indent_size
    vim.opt_local.softtabstop = indent_size
    vim.opt_local.shiftwidth = indent_size
  end,
})
