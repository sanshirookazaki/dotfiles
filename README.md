# setup
```
sh setup.sh
sh vscode.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'
brew tap tkengo/highway skanehira/docui chmouel/tektoncd-cli
brew install wget coreutils peco ghq ccat highway kubernetes-cli kubectx kube-ps1 stern skaffold derailed/k9s/k9s c-bata/kube-prompt/kube-prompt docui tektoncd-cli tfenv
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

#buildkit
wget https://github.com/moby/buildkit/releases/download/v0.6.0/buildkit-v0.6.0.darwin-amd64.tar.gz buildkit-v0.6.0.darwin-amd64.tar.gz
tar zxvf buildkit-v0.6.0.darwin-amd64.tar.gz
mv ./bin/buildctl /usr/local/bin/
rm buildkit-v0.6.0.darwin-amd64.tar.gz ; rmdir bin

docker run --name buildkit -d --privileged -p 1234:1234 moby/buildkit --addr tcp://0.0.0.0:1234
```
