local keymap = vim.keymap.set
local opts = function (description)
  return { noremap = true, silent = true, desc = description }
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: Add gitsigns, telescope, diagnostic, and todo-comments keymaps

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts("Focus left window"))
keymap("n", "<C-j>", "<C-w>j", opts("Focus down window"))
keymap("n", "<C-k>", "<C-w>k", opts("Focus up window"))
keymap("n", "<C-l>", "<C-w>l", opts("Focus right window"))

keymap("n", "<leader>nh", ":nohl<CR>", opts("Disable highlight search"))

keymap("n", "x", '"_x') -- Will not copied to register

-- Resize with arrow key
keymap("n", "<C-Up>", ":resize -2<CR>", opts("Resize up window"))
keymap("n", "<C-Down>", ":resize +2<CR>", opts("Resize down window"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Resize left window"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Resize right window"))

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Focus next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Focus previous buffer"))
keymap("n", "<S-x>", ":bdelete<CR>", opts("Close buffer"))

-- Move text up & down
keymap("n", "<S-k>", ":m .-2<CR>==", opts("Move text up"))
keymap("n", "<S-j>", ":m .+1<CR>==", opts("Move text down"))

-- Window
keymap("n", "<leader>sv", "<C-w>v", opts("Split window vertically"))
keymap("n", "<leader>sh", "<C-w>s", opts("Split window horizontally"))
keymap("n", "<leader>se", "<C-w>=", opts("Make split windows equal width"))
keymap("n", "<leader>sx", ":close<CR>", opts("Close focused split window"))

keymap("n", "<leader>to", ":tabnew<CR>", opts("Open new tab"))
keymap("n", "<leader>tx", ":tabclose<CR>", opts("Close focused tab"))
keymap("n", "<leader>tn", ":tabn<CR>", opts("Focus next tab"))
keymap("n", "<leader>tp", ":tabp<CR>", opts("Focus previous tab"))

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts("Toggle file browser"))

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts("Search files"))
keymap("n", "<leader>gf", ":Telescope git_files<CR>", opts("Search Git files"))
keymap("n", "<leader>sg", ":Telescope live_grep<CR>", opts("Search by grep"))
keymap("n", "<leader>sw", ":Telescope grep_string<CR>", opts("Search current word"))
keymap("n", "<leader>sb", ":Telescope buffers<CR>", opts("Search buffers"))
keymap("n", "<leader>sd", ":Telescope diagnostics<CR>", opts("Search diagnostics"))
keymap("n", "<leader>sp", ":Telescope help_tags<CR>", opts("Search help"))
keymap("n", "<leader>sk", ":Telescope keymaps<CR>", opts("Search keymaps"))

-- Insert mode
keymap("i", "jk", "<ESC>", opts("Escape from insert mode"))
keymap("i", "kj", "<ESC>", opts("Escape from insert mode"))

-- Visual mode
-- Stay in indent mode
keymap("v", "<", "<gv^", opts("Indent line to left"))
keymap("v", ">", ">gv^", opts("Indent line to right"))

-- Move line up & down
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts("Move line up"))
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts("Move line down"))

keymap("v", "p", '"_dP') -- Will keep to register after yank/delete

-- Visual block
-- Move line up & down using Alt key
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts("Move line up"))
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts("Move line down"))

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
