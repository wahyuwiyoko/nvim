local setup, treesitter = pcall(require, "nvim-treesitter.configs")

if not setup then
  return
end

treesitter.setup({
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
