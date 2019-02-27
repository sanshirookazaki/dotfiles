# setup
```
sh setup.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'
brew tap tkengo/highway
brew install wget coreutils peco ghq ccat highway
sudo cp .motd /etc/motd
cp -r .vim/rc ~/.vim/
exec $SHELL -l
anyenv install goenv
goenv install 1.11.0
goenv global 1.11.0
goenv rehash
go get github.com/peco/peco/cmd/peco
go get -d github.com/skanehira/docui
cd $GOPATH/src/github.com/skanehira/docui
GO111MODULE=on go install
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
```
