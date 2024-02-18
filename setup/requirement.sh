#!/bin/bash

sudo apt update -y

declare -A programs

programs[git]="git"
programs[gcc]="build-essential"
programs[rg]="ripgrep"

has_executable() {
  [ -x "$(command -v "$1")" ]
}

for program in "${!programs[@]}"; do
  if ! has_executable "$program"; then
    sudo apt install -y "${programs[$program]}"
  fi
done

if ! has_executable bun; then
  curl -fsSL https://bun.sh/install | bash
fi
