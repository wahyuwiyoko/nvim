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

### Lazy Load Plugins

To know list of events that is available for lazy loading plugins,
enter `:help events`.

## Directory Structure

```
.
├── after
│   └── ftplugin
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

- `after/ftplugin` => Store various settings for specific file types.
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
