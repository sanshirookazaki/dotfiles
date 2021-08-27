#!/bin/bash
mkdir -p ~/.cache ~/.config

for dotfile in .bash_profile .bashrc .zshrc .vim .vimrc .gitcommit_template .gitignore_global .tmux.conf .config/starship.toml
do
  if [ -e ~/$dotfile ]; then
    rm -fr ~/$dotfile
  fi
  ln -nfs $PWD/$dotfile ~/$dotfile
done
