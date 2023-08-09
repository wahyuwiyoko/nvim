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

  -- Telescope
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Miscellaneous
  "numToStr/Comment.nvim",
  "windwp/nvim-autopairs",
  "kylechui/nvim-surround",
  "folke/todo-comments.nvim",
  "folke/trouble.nvim"
}

local opts = {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤",
      list = {
        "●",
        "➜",
        "★",
        "‒"
      }
    }
  },
  checker = { enabled = true, frequency = 259200 } -- Check for updates every 3 day
}

local status_ok, lazy = pcall(require, "lazy")

if not status_ok then
  return
end

lazy.setup(plugins, opts)
