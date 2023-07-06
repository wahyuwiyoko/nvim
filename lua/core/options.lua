local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- Tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- File
opt.fileencoding = "utf-8"
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.showmode = true
opt.cursorline = true
opt.showtabline = 2
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.pumheight = 10

-- Split window
opt.splitright = true
opt.splitbelow = true

-- Buffer
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.timeoutlen = 1000
opt.updatetime = 300

-- Editor
opt.clipboard:append("unnamedplus")
opt.wrap = false
opt.mouse = "a"
opt.backspace = "indent,eol,start"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wildmenu = true
opt.ruler = true
opt.iskeyword:append("-")
