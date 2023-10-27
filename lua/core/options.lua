local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- File
opt.fileencoding = "utf-8"
opt.fileformat = "unix"
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
opt.showcmd = false
opt.showmode = false
opt.cursorline = false
opt.showtabline = 1
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.pumheight = 10
opt.laststatus = 3
opt.list = true
opt.shortmess:append "sI"
opt.emoji = false
opt.ruler = false
opt.statusline = require("custom.status_line")
opt.tabline = "%!v:lua.require'custom.tab_line'.tab_line()"

-- Split window
opt.splitright = true
opt.splitbelow = true

-- Buffer
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 0
opt.confirm = true
opt.timeoutlen = 300
opt.updatetime = 300

-- Editor
opt.clipboard = "unnamedplus"
opt.wrap = false
opt.mouse = ""
opt.backspace = { "indent", "eol", "start" }
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.wildmenu = true
opt.belloff = "all"
