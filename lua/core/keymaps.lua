local keymap = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts("Focus left window"))
keymap("n", "<C-j>", "<C-w>j", opts("Focus down window"))
keymap("n", "<C-k>", "<C-w>k", opts("Focus up window"))
keymap("n", "<C-l>", "<C-w>l", opts("Focus right window"))

keymap("n", "<leader>nh", ":nohl<CR>", opts("Disable highlight search"))

-- Will not copied to register
keymap("n", "x", "\"_x")

-- Resize with arrow key
keymap("n", "<C-Up>", ":resize -2<CR>", opts("Resize up window"))
keymap("n", "<C-Down>", ":resize +2<CR>", opts("Resize down window"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Resize left window"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Resize right window"))

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Focus next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Focus previous buffer"))
keymap("n", "<S-x>", ":bdelete<CR>", opts("Close buffer"))

-- Split windows
keymap("n", "<leader>sv", "<C-w>v", opts("Split window vertically"))
keymap("n", "<leader>sh", "<C-w>s", opts("Split window horizontally"))
keymap("n", "<leader>se", "<C-w>=", opts("Make split windows equal width"))
keymap("n", "<leader>sx", ":close<CR>", opts("Close focused split window"))

keymap("n", "<leader>to", ":tabnew<CR>", opts("Open new tab"))
keymap("n", "<leader>tx", ":tabclose<CR>", opts("Close focused tab"))
keymap("n", "<leader>tn", ":tabn<CR>", opts("Focus next tab"))
keymap("n", "<leader>tp", ":tabp<CR>", opts("Focus previous tab"))

-- Gitsigns
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts("Git next hunk"))
keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts("Git previous hunk"))
keymap("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", opts("Git preview hunk"))
keymap("n", "<leader>gs", ":Gitsigns diffthis<CR>", opts("Git show diff"))

-- Visual mode
-- Stay in indent mode
keymap("v", "<", "<gv^", opts("Indent line to left"))
keymap("v", ">", ">gv^", opts("Indent line to right"))

-- Move line up & down
keymap({ "v", "x" }, "<S-k>", ":m '<-2<CR>gv=gv", opts("Move line up"))
keymap({ "v", "x" }, "<S-j>", ":m '>+1<CR>gv=gv", opts("Move line down"))

-- Will keep to register after yank/delete
keymap("v", "p", "\"_dP")

-- Terminal
-- Open terminal
keymap("n", "<C-\\>", ":terminal<CR>", opts("Open terminal"))

-- Escape from terminal mode
keymap("t", "<C-[>", "<C-\\><C-n>", opts("Escape from terminal mode"))

-- Switch between windows from terminal mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts("Focus left window in terminal mode"))
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts("Focus down window in terminal mode"))
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts("Focus up window in terminal mode"))
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts("Focus right window in terminal mode"))
