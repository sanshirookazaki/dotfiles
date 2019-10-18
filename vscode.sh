#!/bin/bash

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
