#!/bin/bash

declare -A lsp

lsp[bash-language-server]="bash-language-server"
lsp[typescript-language-server]="typescript-language-server"
lsp[svelteserver]="svelte-language-server"
lsp[yaml-language-server]="yaml-language-server"

has_executable() {
  [ -x "$(command -v "$1")" ]
}

for server in "${!lsp[@]}"; do
  if ! has_executable "$server"; then
    if [ "${lsp[$server]}" == "typescript-language-server" ]; then
      bun install --global typescript typescript-language-server
      continue
    fi

    bun install --global "${lsp[$server]}"
  fi
done

if ! (
  has_executable vscode-html-language-server &&
  has_executable vscode-css-language-server &&
  has_executable vscode-json-language-server
  ); then
  bun install --global vscode-langservers-extracted
fi

# Create local binary directory
mkdir -p "$HOME/.local/bin"

# Create directory for LSP that have libraries
mkdir -p "$HOME/software"

if ! has_executable lua-language-server; then
  mkdir -p "$HOME/software/lua-language-server"
  wget -c --show-progress -O - https://github.com/LuaLS/lua-language-server/releases/download/3.7.4/lua-language-server-3.7.4-linux-x64.tar.gz | tar -xzf - -C  "$HOME/software/lua-language-server"
  ln -s "$HOME/software/lua-language-server/bin/lua-language-server" "$HOME/.local/bin"
fi

if ! has_executable gopls; then
  if has_executable go; then
    go install golang.org/x/tools/gopls@latest
  fi
fi

if ! has_executable clangd; then
  wget -c --show-progress https://github.com/clangd/clangd/releases/download/17.0.3/clangd-linux-17.0.3.zip
  unzip clangd-linux-17.0.3.zip -d "$HOME/software"
  mv "$HOME/software/clangd_17.0.3" "$HOME/software/clangd"
  ln -s "$HOME/software/clangd/bin/clangd" "$HOME/.local/bin"
  rm clangd-linux-17.0.3.zip
fi

if ! has_executable marksman; then
  wget -c --show-progress https://github.com/artempyanykh/marksman/releases/download/2023-12-09/marksman-linux-x64
  chmod +x marksman-linux-x64
  mv marksman-linux-x64 "$HOME/.local/bin/marksman"
fi
