# setup

```
sh setup.sh

# brew
brew bundle --global

exec $SHELL -l
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
curl -O https://raw.githubusercontent.com/Arc0re/Iceberg-iTerm2/master/iceberg.itermcolors

go get github.com/nametake/golangci-lint-langserver
```
