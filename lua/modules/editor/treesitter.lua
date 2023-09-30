return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c", "lua", "luadoc", "vim", "vimdoc", "query", "regex",
      "bash", "json", "yaml",
      "html", "css", "javascript",
      "go", "gomod",
      "markdown", "markdown_inline",
      "gitcommit", "gitignore", "git_config"
    },
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true }
  },
}
