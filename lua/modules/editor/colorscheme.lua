local status_ok, rose_pine = pcall(require, "rose-pine")

if not status_ok then
  print("Colorscheme not found!")
  return
end

rose_pine.setup({
  variant = "main",
  disable_italics = true
})

vim.cmd("colorscheme rose-pine")
