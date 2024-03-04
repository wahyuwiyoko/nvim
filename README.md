# Neovim

Minimalist Neovim configuration with no patched fonts included.

![Neovim](https://github.com/wahyuwiyoko/nvim/assets/137708513/27191900-94f2-45c9-8466-4691e7c7364c)

## Requirements

- [Neovim stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Git, `gcc`, and `make` installed
- [ripgrep](https://github.com/BurntSushi/ripgrep) for `:grep` command
- [fd](https://github.com/sharkdp/fd) for `:Fd` command
- [Node.js](https://nodejs.org/) for install and run LSP server

## Installation

Installing packages can be done by running some of these scripts:

- [`./setup/requirement.sh`](setup/requirement.sh) to install the required software
- [`./setup/lsp.sh`](setup/lsp.sh) to install LSP servers
- [`./setup/linter.sh`](setup/linter.sh) to install linters
- [`./setup/formatter.sh`](setup/formatter.sh) to install formatters

## Documentation

- User manual: [`:help user-manual`](https://neovim.io/doc/user/usr_toc.html)
- Starting Vim: [`:help starting`](https://neovim.io/doc/user/starting.html)
- Lua guide: [`:help lua-guide`](https://neovim.io/doc/user/lua-guide.html)
- For more tips: [`:help tips`](https://neovim.io/doc/user/tips.html)
- Available events for lazy loading plugins: [`:help events`](https://neovim.io/doc/user/autocmd.html#events)
- Available key notation for creating keymaps: [`:help key-notation`](https://neovim.io/doc/user/intro.html#key-notation)
- Insert mode completion: [`:help ins-completion`](https://neovim.io/doc/user/insert.html#ins-completion)
- Differences between Neovim and Vim: [`:help vim-differences`](https://neovim.io/doc/user/vim_diff.html)
- Default options settings in Neovim: [`:help nvim-defaults`](https://neovim.io/doc/user/vim_diff.html#nvim-defaults)
- Deprecated features: [`:help deprecated`](https://neovim.io/doc/user/deprecated.html)

## Acknowledgements

- [Christian Chiarulli](https://github.com/ChristianChiarulli)
- [Josean Martinez](https://github.com/josean-dev)
- [ThePrimeagen](https://github.com/ThePrimeagen)
- [TJ DeVries](https://github.com/tjdevries)
- [VonHeikemen](https://github.com/VonHeikemen)
