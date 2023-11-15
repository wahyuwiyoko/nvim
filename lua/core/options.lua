local opt = vim.opt

-- Editor
opt.clipboard = "unnamedplus"
opt.mouse = ""
opt.wrap = false
opt.wildmenu = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.belloff = "all"
opt.grepprg = "rg --vimgrep"
opt.backspace = { "indent", "eol", "start" }
opt.nrformats:append("alpha")

-- File
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformat = "unix"
opt.undofile = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.showtabline = 1
opt.signcolumn = "auto"
opt.colorcolumn = "80"
opt.shortmess:append("sI")
opt.pumheight = 10
opt.laststatus = 3
opt.showcmd = false
opt.showmode = false
opt.cursorline = false
opt.ruler = false
opt.emoji = false
opt.statusline = require("custom.status_line")
opt.tabline = "%!v:lua.require'custom.tab_line'.tab_line()"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- Buffer
opt.confirm = true
opt.conceallevel = 0
opt.timeoutlen = 300
opt.updatetime = 300
opt.completeopt = { "menu", "menuone", "noselect" }

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Split window
opt.splitright = true
opt.splitbelow = true
