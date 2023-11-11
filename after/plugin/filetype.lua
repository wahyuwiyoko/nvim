vim.filetype.add({
  extension = {
    hurl = "hurl"
  },
  filename = {
    ["go.mod"] = "gomod",
    ["go.sum"] = "gosum"
  }
})

vim.api.nvim_create_autocmd("TermOpen", {
  command = "set filetype=term"
})
