local opt = vim.opt
local indent_size = 4

-- Editor
opt.clipboard = "unnamedplus"
opt.mouse = ""
opt.confirm = true
opt.timeoutlen = 300
opt.grepprg = "rg --vimgrep --ignore-case"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.path = { ".", "**", "" }
opt.wildmode = { "longest:full", "full" }
opt.wildoptions = { "fuzzy", "pum" }
opt.wildignore = { "**/node_modules/**", "**/vendor/**", "**/.git/**" }
opt.wildignorecase = true

-- File
opt.fileformat = "unix"
opt.undofile = true
opt.writebackup = false
opt.swapfile = false

-- Indentation
opt.tabstop = indent_size
opt.softtabstop = indent_size
opt.shiftwidth = indent_size
opt.expandtab = true
opt.smartindent = true

-- Window
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.splitright = true
opt.splitbelow = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.guicursor = ""
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.pumheight = 10
opt.laststatus = 3
opt.showcmd = false
opt.showmode = false
opt.ruler = false
opt.emoji = false
opt.shortmess:append("sI")
opt.fillchars = {
  eob = " ",
  foldopen = "v",
  foldclose = ">",
}
