local function map(mode, key, commands, desc)
  local options = {
    noremap = true,
    silent = true,
  }

  if desc then
    options = vim.tbl_deep_extend("force", options, { desc = desc })
  end

  vim.keymap.set(mode, key, commands, options)
end

-- Delete using x will not save to register
map("n", "x", '"_x')

-- Yanking or deleting will keep the register after pasting
map("v", "p", '"_dP')

-- Don't include whitespace character when using $
map("x", "$", "g_")

-- Changing text will not save to register
map({ "n", "x" }, "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')

map("n", "<Leader>nh", "<Cmd>noh<CR>", "Turn off highlighted matches")

map({ "n", "x" }, "<S-h>", "^", "Go to start of the line")
map({ "n", "x" }, "<S-l>", "g_", "Go to end of the line")

map("n", "<C-k>", "<Cmd>res +2<CR>", "Increase the current window height")
map("n", "<C-j>", "<Cmd>res -2<CR>", "Decrease the current window height")
map("n", "<C-l>", "<Cmd>vert res +2<CR>", "Increase the current window width")
map("n", "<C-h>", "<Cmd>vert res -2<CR>", "Decrease the current window width")

map("n", "<Tab>", "<Cmd>bn<CR>", "Go to the next buffer")
map("n", "<S-Tab>", "<Cmd>bp<CR>", "Go to the previous buffer")
map("n", "<Leader>bc", "<Cmd>bd<CR>", "Close the current buffer")

map("n", "<Leader>tn", "<Cmd>tabe<CR>", "Open a new tab page")
map("n", "<Leader>tl", "<Cmd>tabn<CR>", "Go to the next tab page")
map("n", "<Leader>th", "<Cmd>tabp<CR>", "Go to the previous tab page")
map("n", "<Leader>tc", "<Cmd>tabc<CR>", "Close the current tab page")

map({ "v", "x" }, "<", "<gv", "Indent line to left")
map({ "v", "x" }, ">", ">gv", "Indent line to right")

map("n", "<C-\\>", "<Cmd>terminal<CR>", "Open a new terminal buffer")
map("t", "<C-[>", "<C-\\><C-n>", "Escape from terminal mode")

map({ "n", "v", "x" }, "gc", function ()
  require("custom.comment_line").toggle()
  vim.cmd.execute([["normal! \<Esc>"]])
end, "Toggle comment line")

map("n", "Q", function()
  local cursor_position = vim.api.nvim_win_get_cursor(0)

  vim.cmd("normal! gg gqG")

  vim.api.nvim_win_set_cursor(0, cursor_position)
end, "Format buffer")
