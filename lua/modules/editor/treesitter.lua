return {
  "nvim-treesitter/nvim-treesitter",
  version = "0.x.x",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c", "lua", "vim", "bash",
      "html", "css", "javascript",
      "go", "gomod",
      "json", "yaml", "toml", "dockerfile",
      "markdown", "markdown_inline",
      "gitcommit", "gitignore", "git_config",
      "luadoc", "vimdoc", "query", "regex", "diff", "comment"
    },
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true }
  },
}
