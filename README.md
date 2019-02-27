# setup
```
sh setup.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'
brew install wget coreutils peco ghq ccat
sudo cp .motd /etc/motd
cp -r .vim/rc ~/.vim/
exec $SHELL -l
anyenv install goenv
goenv install 1.11.0
goenv global 1.11.0
goenv rehash
go get github.com/peco/peco/cmd/peco
```
