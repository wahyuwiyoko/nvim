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

require("lazy").setup({
  spec = {
    { import = "modules.editor" },
    { import = "modules.tools" },
    { import = "modules.lsp" }
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "editorconfig", "gzip", "netrwPlugin",
        "rplugin", "spellfile", "tarPlugin",
        "tohtml", "tutor", "zipPlugin"
      }
    }
  },
  defaults = { lazy = true },
  change_detection = { notify = false },
  ui = {
    icons = {
      cmd = "cmd",
      config = "conf",
      event = "event",
      ft = "ft",
      init = "init",
      import = "import",
      keys = "keys",
      lazy = "lazy",
      loaded = "loaded",
      not_loaded = "not loaded",
      plugin = "plugin",
      runtime = "runtime",
      source = "source",
      start = "start",
      task = "task",
      list = {
        "o",
        "=>",
        "*",
        "-"
      }
    }
  }
})
