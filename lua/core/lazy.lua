local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  defaults = {
    lazy = true,
  },
  spec = "plugins",
  lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
  ui = {
    pills = false,
    icons = {
      cmd = "command",
      config = "config",
      event = "event",
      ft = "filetype",
      init = "init",
      import = "import",
      keys = "keys",
      lazy = "",
      loaded = "",
      not_loaded = "",
      plugin = "plugin",
      runtime = "runtime",
      require = "require",
      source = "source",
      start = "start",
      task = "task",
      list = {
        "o",
        "->",
        "*",
        "-",
      },
    },
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
