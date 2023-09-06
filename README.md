# Neovim

My simple Neovim configuration with no patched fonts included.

<!-- ![Neovim](https://raw.githubusercontent.com/wahyuwiyoko/dotfiles/main/screenshots/neovim.png) -->

## Requirements

- [Neovim stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Git, `gcc` or `clang`, and `make` installed
- `shellcheck` and `lua-check` installed for linter
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Node.js](https://nodejs.org/)
- [efm-langserver](https://github.com/mattn/efm-langserver)

## Notes

Some of these packages may be available in several official repositories in
each Linux distribution:

- LSP
  - `efm-langserver`
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

To know list of events that is available for lazy loading plugins,
enter `:help events`.

## Structure

```
.
├── init.lua
└── lua
    ├── core
    │   ├── keymaps.lua
    │   ├── options.lua
    │   ├── plugins.lua
    │   └── settings.lua
    ├── modules
    │   ├── editor
    │   │   ├── cmp.lua
    │   │   ├── colorscheme.lua
    │   │   ├── comment.lua
    │   │   ├── gitsigns.lua
    │   │   ├── maximize.lua
    │   │   ├── mini.lua
    │   │   ├── todo_comments.lua
    │   │   ├── treesitter.lua
    │   │   └── trouble.lua
    │   ├── lsp
    │   │   ├── lspconfig.lua
    │   │   ├── lsp_signature.lua
    │   │   └── mason.lua
    │   └── tools
    │       ├── efmls.lua
    │       └── telescope.lua
    └── settings
        ├── gopls.lua
        ├── jsonls.lua
        ├── lua_ls.lua
        └── servers.lua
```

- `core` => Base editor for Vim options, keymaps, and plugins manager.
- `modules` => All Neovim plugins within the sub-directories.
  - `editor` => Any plugins for editor functionality just like an IDE.
  - `lsp` => For manage and configure LSP.
  - `tools` => An everyday used tools like linter, formatter, and Telescope.
- `settings` => Every languages server configuration.

Reference: [dope](https://github.com/nvimdev/dope) 

## Special Thanks

- [Christian Chiarulli](https://github.com/ChristianChiarulli)
- [Josean Martinez](https://github.com/josean-dev)
- [ThePrimeagen](https://github.com/ThePrimeagen)
