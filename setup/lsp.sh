#!/bin/bash

# Create local binary directory
# mkdir -p "$HOME/.local/bin"

declare -A lsp

lsp[bash-language-server]="bash-language-server"
lsp[typescript-language-server]="typescript-language-server"
lsp[svelteserver]="svelte-language-server"
lsp[yaml-language-server]="yaml-language-server"

vscode_lsp=(
  vscode-html-language-server
  vscode-css-language-server
  vscode-json-language-server
)

has_executable() {
  [ -x "$(command -v "$1")" ]
}

if ! has_executable bun; then
  echo "Bun is not installed." >&2
  exit 1
fi

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
  has_executable "${vscode_lsp[0]}" &&
  has_executable "${vscode_lsp[1]}" &&
  has_executable "${vscode_lsp[2]}"
  ); then
  bun install --global vscode-langservers-extracted
fi
