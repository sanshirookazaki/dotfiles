# setup

```
sh setup.sh
sh vscode.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'

# brew
brew bundle --global

sudo cp .motd /etc/motd
exec $SHELL -l
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors

# coc.nvim
vim -c 'CocInstall -sync coc-lists coc-yaml coc-json coc-phpls|q'
```
