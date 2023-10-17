# Neovim

My simple Neovim configuration with no patched fonts included.

![Neovim](https://raw.githubusercontent.com/wahyuwiyoko/dotfiles/main/screenshots/neovim.png)

## Requirements

- [Neovim stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Git, `gcc` or `clang`, and `make` installed
- [ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` of Telescope
- [Node.js](https://nodejs.org/) for installing several LSP through Mason

For the linter to work, run `MasonInstallLinters` command in Neovim to
install all linter through Mason.

## Tips

### Packages From Repositories

Some of these packages may be available in several official repositories in
each Linux distribution. Although it can also be installed with Mason.

- LSP
  - `gopls`
- Linter
  - `shellcheck`
  - `lua-check`
  - `go-staticcheck`
  - `eslint`
  - `jsonlint`
  - `yamllint`
  - `gitlint`
- Formatter
  - `shfmt`

### Lazy Load Plugins

To know list of events that is available for lazy loading plugins,
enter `:help events`.

## File Structure

```
.
├── init.lua
└── lua
    ├── core
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   ├── options.lua
    │   └── settings.lua
    ├── languages
    │   ├── gopls.lua
    │   ├── jsonls.lua
    │   └── lua_ls.lua
    └── modules
        ├── editor
        │   ├── auto_pairs.lua
        │   ├── colorscheme.lua
        │   ├── comment.lua
        │   ├── completion.lua
        │   ├── escape.lua
        │   ├── git.lua
        │   ├── maximize.lua
        │   ├── oil.lua
        │   ├── surround.lua
        │   └── treesitter.lua
        ├── lsp
        │   ├── config.lua
        │   └── mason.lua
        └── tools
            ├── linting.lua
            └── telescope.lua
```

- `core` => Base editor for Vim options, keymaps, and plugins manager.
- `modules` => All Neovim plugins within the sub-directories.
  - `editor` => Any plugins for editor functionality just like an IDE.
  - `lsp` => For manage and configure LSP.
  - `tools` => Very useful editor functionality like linter, formatter, and Telescope.
- `languages` => Every languages server configuration.

## References

Some of these are references I took to create a custom Neovim configuration:

- Vim options and keymaps: [Neovim from scratch](https://github.com/lunarvim/neovim-from-scratch)
- File structure: [dope](https://github.com/nvimdev/dope)
- Lazy load: [LazyVim](https://github.com/LazyVim/LazyVim)
- Plugins: [Josean Martinez](https://github.com/josean-dev/dev-environment-files)

## Special Thanks

- [Christian Chiarulli](https://github.com/ChristianChiarulli)
- [Josean Martinez](https://github.com/josean-dev)
- [ThePrimeagen](https://github.com/ThePrimeagen)
