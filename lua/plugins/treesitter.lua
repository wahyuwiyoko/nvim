local treesitter = { "nvim-treesitter/nvim-treesitter" }

treesitter.version = false

treesitter.event = { "BufReadPre", "BufNewFile" }

treesitter.build = ":TSUpdate"

treesitter.main = "nvim-treesitter.configs"

treesitter.opts = {
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "regex",
    "comment",
    "diff",
    "xml",
    "bash",
    "go",
    "gomod",
    "markdown",
    "markdown_inline",
    "html",
    "css",
    "javascript",
    "typescript",
    "svelte",
    "json",
    "yaml",
    "toml",
    "dockerfile",
    "hurl",
    "gitcommit",
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 10000
    end,
  },
  indent = { enable = true },
}

return treesitter
