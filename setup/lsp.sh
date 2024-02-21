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
      npm install -g typescript typescript-language-server
      continue
    fi

    npm install -g "${lsp[$server]}"
  fi
done

if ! (
  has_executable vscode-html-language-server &&
  has_executable vscode-css-language-server &&
  has_executable vscode-json-language-server
  ); then
  npm install -g vscode-langservers-extracted
fi

is_dir_exists() {
  [ -d "$1" ]
}

if ! is_dir_exists "$HOME/.local/bin"; then
  # Local binary directory
  mkdir -p "$HOME/.local/bin"
fi

if ! is_dir_exists "$HOME/software"; then
  # For LSP that have libraries
  mkdir -p "$HOME/software"
fi

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

if ! has_executable marksman; then
  wget -c --show-progress https://github.com/artempyanykh/marksman/releases/download/2023-12-09/marksman-linux-x64
  chmod +x marksman-linux-x64
  mv marksman-linux-x64 "$HOME/.local/bin/marksman"
fi
