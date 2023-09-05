return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
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
    })
  end
}
