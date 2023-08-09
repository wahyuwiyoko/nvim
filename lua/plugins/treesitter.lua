local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "lua",
    "bash",
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "markdown_inline",
    "gitcommit",
    "gitignore",
    "git_config"
  },
  sync_install = false,
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true }
})
