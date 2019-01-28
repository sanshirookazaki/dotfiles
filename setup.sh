#!/bin/bash
mkdir ~/.cache

git clone https://github.com/syndbg/goenv.git ~/.goenv

git clone https://github.com/riywo/anyenv ~/.anyenv

git clone https://github.com/tmux-plugins/tpm ~/tmux/plugins/tpm

cp -r ~/dotfiles/.vim/rc ~/.vim/rc

for dotfile in .bash_profile .bashrc .zshrc .vimrc .gitconfig .gitcommit_template .gitignore_global .tmux.conf 
do
  cp ~/dotfiles/$dotfile ~/$dotfile
done
