return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c", "lua", "vim", "bash",
      "html", "css", "javascript",
      "go", "gomod",
      "json", "yaml", "toml", "dockerfile", "hurl",
      "markdown", "markdown_inline",
      "gitcommit", "gitignore", "git_config",
      "luadoc", "vimdoc", "query", "regex", "diff", "comment"
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
      disable = function (_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 10000
      end
    },
    indent = { enable = true }
  }
}
