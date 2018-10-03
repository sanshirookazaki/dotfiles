#!/bin/bash

cd ~ 
wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

mv ~/git-completion.bash ~/.git.bash
mv ~/git-prompt.sh ~/.git.sh

git clone https://github.com/syndbg/goenv.git ~/.goenv

git clone https://github.com/riywo/anyenv ~/.anyenv

git clone https://github.com/tmux-plugins/tpm ~/tmux/plugins/tpm

set -eux

for dotfile in .bash_profile .bashrc .vimrc .vim .gitconfig .gitcommit_template .gitignore_global .tmux.conf 
do
  cp ~/dotfiles/$dotfile ~/$dotfile
done

