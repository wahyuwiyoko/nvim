local setup, indent_blankline = pcall(require, "indent_blankline")

if not setup then
  return
end

indent_blankline.setup({ show_first_indent_level= false })
