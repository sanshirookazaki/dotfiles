#!/bin/bash
mkdir -p  ~/.cache

git clone https://github.com/anyenv/anyenv ~/.anyenv

git clone https://github.com/tmux-plugins/tpm ~/tmux/plugins/tpm

for dotfile in .bash_profile .bashrc .zshrc .vim .vimrc .gitconfig .gitcommit_template .gitignore_global .tmux.conf
do
  if [ -e ~/$dotfile ]; then
    rm -fr ~/$dotfile
  fi
  ln -nfs $PWD/$dotfile ~/$dotfile
done
