#!/bin/bash

has_executable() {
  [ -x "$(command -v "$1")" ]
}

# Create local binary directory
mkdir -p "$HOME/.local/bin"

if ! has_executable stylua; then
  wget -c --show-progress https://github.com/JohnnyMorganz/StyLua/releases/download/v0.20.0/stylua-linux-x86_64.zip
  unzip stylua-linux-x86_64.zip
  rm stylua-linux-x86_64.zip
  mv stylua "$HOME/.local/bin"
fi
