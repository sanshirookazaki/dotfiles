#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

cd "$(dirname "$0")"

mkdir -p ~/.cache ~/.config
touch ~/.zshrc.local

for dotfile in .zshrc .vim .vimrc .gitcommit_template .gitignore_global .config/starship.toml
do
  if [ -e ~/$dotfile ]; then
    rm -fr ~/$dotfile
  fi
  ln -nfs $PWD/$dotfile ~/$dotfile
done
