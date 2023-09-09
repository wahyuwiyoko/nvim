# Neovim

My simple Neovim configuration with no patched fonts included.

![Neovim](https://raw.githubusercontent.com/wahyuwiyoko/dotfiles/main/screenshots/neovim.png)

## Requirements

- [Neovim stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Git, `gcc` or `clang`, and `make` installed
- [ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` of Telescope
- [Node.js](https://nodejs.org/) for installing several LSP through Mason

For the linter to work, `shellcheck` (for shell scripts), `selene` (for Lua),
and `markdownlint` (for Markdown) need to be installed manually through Mason.

## Tips

### Packages From Repositories

Some of these packages may be available in several official repositories in
each Linux distribution. Although it can also be installed with Mason.

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

### Lazy Load Plugins

To know list of events that is available for lazy loading plugins,
enter `:help events`.

## File Structure

```
.
├── init.lua
└── lua
    ├── core
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   ├── options.lua
    │   └── settings.lua
    ├── modules
    │   ├── editor
    │   │   ├── autopairs.lua
    │   │   ├── cmp.lua
    │   │   ├── colorscheme.lua
    │   │   ├── comment.lua
    │   │   ├── gitsigns.lua
    │   │   ├── indent_blankline.lua
    │   │   ├── lualine.lua
    │   │   ├── maximize.lua
    │   │   ├── oil.lua
    │   │   ├── surround.lua
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
```

- `core` => Base editor for Vim options, keymaps, and plugins manager.
- `modules` => All Neovim plugins within the sub-directories.
  - `editor` => Any plugins for editor functionality just like an IDE.
  - `lsp` => For manage and configure LSP.
  - `tools` => Very useful editor functionality like linter, formatter, and Telescope.
- `settings` => Every languages server configuration.

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
