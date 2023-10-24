local function map(mode, key, command, opts)
  local options = { noremap = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, key, command, opts)
end

-- Will not copied to register
map("n", "x", "\"_x")

-- Yanking or deleting will keep to the register
map("v", "p", "\"_dP")

map("n", "<Leader>nh", "<Cmd>nohlsearch<CR>", { desc = "Turn off highlighted matches" })

map("n", "<C-k>", "<Cmd>resize +2<CR>", { desc = "Increase the current window height" })
map("n", "<C-j>", "<Cmd>resize -2<CR>", { desc = "Decrease the current window height" })
map("n", "<C-l>", "<Cmd>vertical resize +2<CR>", { desc = "Increase the current window width" })
map("n", "<C-h>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease the current window width" })

map("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Go to the next buffer" })
map("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Go to the previous buffer" })
map("n", "<S-c>", "<Cmd>bdelete<CR>", { desc = "Close the buffer" })

map("n", "<Leader>tn", "<Cmd>tabnew<CR>", { desc = "Open a new tab page" })
map("n", "<Leader>tl", "<Cmd>tabnext<CR>", { desc = "Go to the next tab page" })
map("n", "<Leader>th", "<Cmd>tabprevious<CR>", { desc = "Go to the previous tab page" })
map("n", "<Leader>tc", "<Cmd>tabclose<CR>", { desc = "Close the current tab page" })

map({ "v", "x" }, "<", "<gv", { desc = "Indent line to left" })
map({ "v", "x" }, ">", ">gv", { desc = "Indent line to right" })

map("n", "<C-\\>", "<Cmd>terminal<CR>", { desc = "Open a new terminal buffer" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Escape from terminal mode" })
