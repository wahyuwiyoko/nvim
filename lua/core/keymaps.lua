local map = require("core.utils").map

-- Delete using x will not save to register
map("n", "x", "\"_x")

-- Yanking or deleting will keep the register after pasting
map("v", "p", "\"_dP")

-- Don't include whitespace character when using $
map("x", "$", "g_")

-- Changing text will not save to register
map({ "n", "x" }, "c", "\"_c")
map("n", "C", "\"_C")
map("n", "cc", "\"_cc")

map("n", "<Leader>nh", "<Cmd>nohlsearch<CR>", { desc = "Turn off highlighted matches" })

map({ "n", "x" }, "<S-h>", "^", { desc = "Go to start of the line" })
map({ "n", "x" }, "<S-l>", "g_", { desc = "Go to end of the line" })

map("n", "<C-k>", "<Cmd>resize +2<CR>", { desc = "Increase the current window height" })
map("n", "<C-j>", "<Cmd>resize -2<CR>", { desc = "Decrease the current window height" })
map("n", "<C-l>", "<Cmd>vertical resize +2<CR>", { desc = "Increase the current window width" })
map("n", "<C-h>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease the current window width" })

map("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Go to the next buffer" })
map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Go to the previous buffer" })
map("n", "<Leader>bc", "<Cmd>bdelete<CR>", { desc = "Close the buffer" })

map("n", "<Leader>tn", "<Cmd>tabnew<CR>", { desc = "Open a new tab page" })
map("n", "<Leader>tl", "<Cmd>tabnext<CR>", { desc = "Go to the next tab page" })
map("n", "<Leader>th", "<Cmd>tabprevious<CR>", { desc = "Go to the previous tab page" })
map("n", "<Leader>tc", "<Cmd>tabclose<CR>", { desc = "Close the current tab page" })

map({ "v", "x" }, "<", "<gv", { desc = "Indent line to left" })
map({ "v", "x" }, ">", ">gv", { desc = "Indent line to right" })

map("n", "<C-\\>", "<Cmd>terminal<CR>", { desc = "Open a new terminal buffer" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Escape from terminal mode" })
