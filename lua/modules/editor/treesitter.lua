return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "c", "lua", "luadoc", "vim", "vimdoc", "bash",
      "query", "regex", "comment", "diff", "xml",
      "go", "gomod", "markdown", "markdown_inline",
      "html", "css", "javascript", "typescript", "svelte",
      "json", "yaml", "toml", "dockerfile", "hurl",
      "gitcommit", "gitignore", "git_config"
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
