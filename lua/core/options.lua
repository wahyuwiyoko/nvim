local opt = vim.opt
local indent_size = 4

-- Editor
opt.clipboard = "unnamedplus"
opt.mouse = ""
opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.grepprg = "rg --vimgrep"
opt.confirm = true
opt.timeoutlen = 300
opt.completeopt = { "menu", "menuone", "noselect" }

-- File
opt.fileformat = "unix"
opt.undofile = true
opt.writebackup = false
opt.swapfile = false

-- Appearance
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.shortmess:append("sI")
opt.pumheight = 10
opt.laststatus = 3
opt.showcmd = false
opt.showmode = false
opt.ruler = false
opt.emoji = false
opt.fillchars = {
  eob = " ",
  foldopen = "v",
  foldclose = ">",
}

-- Indentation
opt.tabstop = indent_size
opt.softtabstop = indent_size
opt.shiftwidth = indent_size
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Split window
opt.splitright = true
opt.splitbelow = true
