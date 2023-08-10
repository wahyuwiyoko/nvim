# Neovim

My simple Neovim configuration with no patched fonts included.

![Neovim](https://raw.githubusercontent.com/wahyuwiyoko/dotfiles/main/screenshots/neovim.png)

## Structure

```
.
├── init.lua
└── lua
    ├── core
    │   ├── init.lua
    │   ├── keymaps.lua
    │   ├── options.lua
    │   └── plugins.lua
    ├── modules
    │   ├── completions
    │   │   ├── init.lua
    │   │   └── nvim_cmp.lua
    │   ├── editor
    │   │   ├── autopairs.lua
    │   │   ├── colorscheme.lua
    │   │   ├── comment.lua
    │   │   ├── gitsigns.lua
    │   │   ├── indent_blankline.lua
    │   │   ├── init.lua
    │   │   ├── lualine.lua
    │   │   ├── nvim_tree.lua
    │   │   ├── surround.lua
    │   │   ├── todo_comments.lua
    │   │   ├── treesitter.lua
    │   │   └── trouble.lua
    │   ├── init.lua
    │   ├── lsp
    │   │   ├── init.lua
    │   │   ├── lspconfig.lua
    │   │   └── mason.lua
    │   └── tools
    │       ├── efmls.lua
    │       ├── init.lua
    │       └── telescope.lua
    └── settings
        ├── jsonls.lua
        └── lua_ls.lua
```

- `core` => Base editor for Vim options, keymaps, and plugins manager.
- `modules` => All Neovim plugins within the sub-directories.
  - `completions` => Code completions plugins.
  - `editor` => Any plugins for editor functionality just like an IDE.
  - `lsp` => For manage and configure LSP.
  - `tools` => An everyday used tools like linter, formatter, and Telescope.
- `settings` => Every languages server configuration.

Reference: [dope](https://github.com/nvimdev/dope) 

## Special Thanks

- [Christian Chiarulli](https://github.com/ChristianChiarulli)
- [Josean Martinez](https://github.com/josean-dev)
- [ThePrimeagen](https://github.com/ThePrimeagen)
