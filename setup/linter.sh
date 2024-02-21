#!/bin/bash

has_executable() {
  [ -x "$(command -v "$1")" ]
}

if ! has_executable shellcheck; then
  sudo apt install -y shellcheck
fi
