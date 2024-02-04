# Neovim

My simple Neovim configuration with no patched fonts included.

![Neovim](https://github.com/wahyuwiyoko/nvim/assets/137708513/27191900-94f2-45c9-8466-4691e7c7364c)

## Requirements

- [Neovim stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Git, `gcc` or `clang`, and `make` installed
- [ripgrep](https://github.com/BurntSushi/ripgrep) for `live_grep` of Telescope
- [Node.js](https://nodejs.org/) for installing several LSP through Mason

> [!IMPORTANT]
> For the linter to work, run `MasonInstallTools` command in Neovim to
> install all linter through Mason.

## Installation

These have two ways, the
[override way](#override-configuration) and backup your Neovim configuration,
and the
[safe way to load different configuration](#load-different-configuration).

### Override Configuration

First off, if you have your own configuration, you need to backup the `nvim`
directory:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Then clone the repository:

```sh
git clone https://github.com/wahyuwiyoko/nvim.git ~/.config/nvim
```

Run `nvim` and wait until all plugin and parser installed.

### Load Different Configuration

If you want to keep your own Neovim configuration and want to try this Neovim
configuration, you can do by following steps below.

Create an alias to load different Neovim configuration:

```sh
alias wnvim="NVIM_APPNAME=wnvim nvim"
```

Clone the repository:

```sh
git clone https://github.com/wahyuwiyoko/nvim.git ~/.config/wnvim
```

Run and load the configuration:

```sh
wnvim
```

## Tips

### Packages From Repositories

Some of these packages may be available in several official repositories in
each Linux distribution. Although it can also be installed with Mason.

- LSP
  - `gopls`
  - `efm-langserver`
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

### Documentation

- User manual: [`:help user-manual`](https://neovim.io/doc/user/usr_toc.html)
- Lua guide: [`:help lua-guide`](https://neovim.io/doc/user/lua-guide.html)
- For more tips: [`:help tips`](https://neovim.io/doc/user/tips.html)
- Available events for lazy loading plugins: [`:help events`](https://neovim.io/doc/user/autocmd.html#events)
- Available key notation for creating keymaps: [`:help key-notation`](https://neovim.io/doc/user/intro.html#key-notation)
- Insert mode completion: [`:help ins-completion`](https://neovim.io/doc/user/insert.html#ins-completion)
- Differences between Neovim and Vim: [`:help vim-differences`](https://neovim.io/doc/user/vim_diff.html)
- Deprecated features: [`:help deprecated`](https://neovim.io/doc/user/deprecated.html)

## Directory Structure

```
.
├── after
│   ├── ftplugin
│   └── plugin
├── lua
│   ├── core
│   ├── custom
│   ├── languages
│   └── modules
│       ├── completion
│       ├── editor
│       ├── lsp
│       └── tools
└── snippets
```

- `after` => Loaded configuration after opened Neovim.
  - `ftplugin` => Store various settings for specific file types.
  - `plugin` => Store various settings for specific plugins.
- `snippets` => Snippets with LuaSnip for each languages.
- `core` => Base editor for Vim options, keymaps, and plugin manager.
- `custom` => Custom functionality and UI such as status line and tab line.
- `languages` => Every languages server configuration.
- `modules` => All Neovim plugins within the sub-directories.
  - `completion` => Completion sources with snippets.
  - `editor` => Any plugins for editor functionality just like an IDE.
  - `lsp` => For manage and configure LSP.
  - `tools` => Any tools like linter, formatter, and Telescope.

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
- [TJ DeVries](https://github.com/tjdevries)
