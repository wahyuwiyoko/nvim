vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    border = "single",
    style = "minimal",
    max_width = 50,
  },
})

local diagnostic = vim.diagnostic

local function map(mode, key, commands, desc)
  vim.keymap.set(mode, key, commands, {
    noremap = true,
    silent = true,
    desc = desc,
  })
end

map("n", "<Leader>dj", diagnostic.goto_next, "Go to next diagnostic")
map("n", "<Leader>dk", diagnostic.goto_prev, "Go to previous diagnostic")
map(
  "n",
  "<Leader>df",
  diagnostic.open_float,
  "Open diagnostic for the current line"
)
map(
  "n",
  "<Leader>dq",
  diagnostic.setqflist,
  "Add all diagnostic to the quickfix list"
)
map(
  "n",
  "<Leader>dl",
  diagnostic.setloclist,
  "Add buffer diagnostic to the location list"
)
