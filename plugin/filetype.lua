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
  group = augroup("InsertModeFormat", { clear = true }),
  pattern = "*",
  desc = "Disable auto comment at new line",
  command = "setlocal formatoptions-=cro",
})

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
  command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
})

autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("GoTemplate", { clear = true }),
  pattern = { "*.tmpl" },
  desc = "Go HTML template filetype",
  command = "setlocal filetype=html",
})
