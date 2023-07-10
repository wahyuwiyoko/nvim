local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- TODO: Add gitsigns, telescope, diagnostic, and todo-comments keymaps

-- Normal mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>nh", ":nohl<CR>", opts)

keymap("n", "x", '"_x', opts) -- Will not copied to register

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-x>", ":bdelete<CR>", opts)

-- TODO: Move text up & down
-- keymap("n", "<S-x>", ":m .-2<CR>==", opts)
-- keymap("n", "<S-z>", ":m .+1<CR>==", opts)

keymap("n", "<leader>sv", "<C-w>v", opts) -- Split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- Split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- Make split windows equal width
keymap("n", "<leader>sx", ":close<CR>", opts) -- Close current split window

keymap("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) -- Go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) -- Go to previous tab

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Visual
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- TODO: Move text up & down
-- keymap("v", "<S-w>", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "<S-e>", ":m '<-2<CR>gv=gv", opts)

keymap("v", "p", '"_dP', opts) -- Will keep to register after yank/delete with visual mode

-- Visual block
-- Move text up & down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)

-- TODO: Change keymap from Alt
-- keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal
-- Better terminal navigation
-- WARNING: Not tested yet
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })
