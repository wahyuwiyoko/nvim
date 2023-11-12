vim.filetype.add({
  extension = {
    hurl = "hurl"
  },
  filename = {
    ["go.mod"] = "gomod",
    ["go.sum"] = "gosum"
  }
})
