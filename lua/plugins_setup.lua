-- Automatically install packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand will reload plugins whenever this file saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins_setup.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")

  -- Editor
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("lewis6991/gitsigns.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")
  use("akinsho/toggleterm.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/which-key.nvim")

  -- Autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")

  -- Miscellaneous
  use("nvim-telescope/telescope.nvim")
  use("numToStr/Comment.nvim")
  use("windwp/nvim-autopairs") -- Integrates with both completion and treesitter
  use("kylechui/nvim-surround")
  use("folke/todo-comments.nvim")

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
