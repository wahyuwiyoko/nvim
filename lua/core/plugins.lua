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

local plugins = {
  -- Dependencies
  "nvim-lua/plenary.nvim",

  -- Editor
  { "rose-pine/neovim", name = "rose-pine" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "lewis6991/gitsigns.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",

  -- Autocompletion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",

  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "ray-x/lsp_signature.nvim",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Miscellaneous
  { "creativenull/efmls-configs-nvim", version = "v0.1.4" },
  "numToStr/Comment.nvim",
  "windwp/nvim-autopairs",
  "kylechui/nvim-surround",
  "folke/todo-comments.nvim",
  "folke/trouble.nvim"
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

local lazy_setup, lazy = pcall(require, "lazy")

if not lazy_setup then
  return
end

lazy.setup(plugins, opts)
