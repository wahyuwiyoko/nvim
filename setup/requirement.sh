#!/bin/bash

sudo apt update -y

declare -A programs

programs[git]="git"
programs[gcc]="build-essential"
programs[rg]="ripgrep"
programs[fdfind]="fd-find"
programs[wget]="wget"
programs[tar]="tar"
programs[unzip]="unzip"

has_executable() {
  [ -x "$(command -v "$1")" ]
}

for program in "${!programs[@]}"; do
  if ! has_executable "$program"; then
    sudo apt install -y "${programs[$program]}"
  fi
done

is_dir_exists() {
  [ -d "$1" ]
}

if ! is_dir_exists "$HOME/.local/bin"; then
  # Local binary directory
  mkdir -p "$HOME/.local/bin"
fi

if ! is_dir_exists "$HOME/software"; then
  # For runtime that have libraries
  mkdir -p "$HOME/software"
fi

if ! has_executable nvim; then
  wget -c --show-progress https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar xzf nvim-linux64.tar.gz
  rm nvim-linux64.tar.gz
  mv nvim-linux64 "$HOME/software/nvim"
  ln -s "$HOME/software/nvim/bin/nvim" "$HOME/.local/bin"
fi

if ! has_executable node; then
  wget -c --show-progress https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz
  tar -xvf node-v20.11.1-linux-x64.tar.xz -C "$HOME/software"
  rm node-v20.11.1-linux-x64.tar.xz
  mv "$HOME/software/node-v20.11.1-linux-x64" "$HOME/software/node"
  ln -s "$HOME/software/node/bin/"* "$HOME/.local/bin"
fi
