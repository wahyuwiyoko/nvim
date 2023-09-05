local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

local modules = {
  { import = "modules.editor" },
  { import = "modules.tools" },
  { import = "modules.lsp" },
}

local opts = {
  ui = {
    icons = {
      cmd = "cmd",
      config = "conf",
      event = "event",
      ft = "ft",
      init = "init",
      keys = "keys",
      plugin = "plugin",
      runtime = "runtime",
      source = "source",
      start = "start",
      task = "task",
      lazy = "lazy",
      list = {
        "O",
        "->",
        "*",
        "-"
      }
    }
  }
}

require("lazy").setup(modules, opts)
