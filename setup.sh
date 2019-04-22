#!/bin/bash
mkdir ~/.cache

git clone https://github.com/anyenv/anyenv ~/.anyenv

git clone https://github.com/tmux-plugins/tpm ~/tmux/plugins/tpm

cp -r ~/dotfiles/.vim/rc ~/.vim/rc

for dotfile in .bash_profile .bashrc .zshrc .vimrc .gitconfig .gitcommit_template .gitignore_global .tmux.conf 
do
  cp ~/dotfiles/$dotfile ~/$dotfile
done

# vscode
code --list-extensions > ./vscode/extensions
cat ./vscode/extensions | while read line 
do
  code --install-extension $line
done

cd ~/Library/Application\ Support/Code/User/
rm settings.json
ln -s ~/dotfiles/vscode/settings.json ./settings.json
rm keybindings.json
ln -s ~/dotfiles/vscode/keybindings.json ./keybindings.json
