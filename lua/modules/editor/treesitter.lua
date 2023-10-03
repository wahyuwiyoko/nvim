return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "luadoc", "vimdoc", "query", "regex", "diff",
      "c", "lua", "vim", "bash",
      "json", "yaml", "toml",
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
