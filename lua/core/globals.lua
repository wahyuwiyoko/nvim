local g = vim.g

-- Set <leader> to space key
g.mapleader = " "
g.maplocalleader = " "

-- Disable some built-in plugins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1
g.loaded_tar = 1
g.loaded_zipPlugin = 1
g.loaded_zip = 1
g.loaded_spellfile_plugin = 1

-- Disable "expandtab" for markdown
g.markdown_recommended_style = 0

-- Disable providers
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
