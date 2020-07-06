# setup

```
sh setup.sh
sh vscode.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'
brew tap tkengo/highway skanehira/docui chmouel/tektoncd-cli cjbassi/gotop
brew install vim wget coreutils peco ghq ccat highway kubernetes-cli kubectx kube-ps1 stern skaffold derailed/k9s/k9s c-bata/kube-prompt/kube-prompt docui tektoncd-cli tfenv pandoc fzf lazygit gotop highlight zsh-syntax-highlighting
sudo cp .motd /etc/motd
exec $SHELL -l
anyenv install goenv
goenv install 1.13.0
goenv global 1.13.0
goenv rehash
go get github.com/peco/peco/cmd/peco
go get -d github.com/skanehira/docui
go get -u golang.org/x/tools/cmd/gopls
git clone https://github.com/skanehira/gtran.git $HOME; cd gtran; go install
cd $GOPATH/src/github.com/skanehira/docui
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors

# coc.nvim
vim -c 'CocInstall -sync coc-lists coc-yaml coc-json coc-phpls|q'
```
