# Centos vim version 8.x

```
sudo yum update -y
sudo yum install -y git gcc ncurses-devel
git clone https://github.com/vim/vim.git
cd ~/vim
make
sudo make install
sudo yum remove vim -y
exec $SHELL -l
```

# Ubuntu vim version 8.x
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

# setup
```
sh setup.sh
brew install zsh
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s '/usr/local/bin/zsh'
brew install wget coreutils peco 
sudo cp .motd /etc/motd
cp -r .vim/rc ~/.vim/
exec $SHELL -l
anyenv install goenv
goenv install 1.11.0
goenv global 1.11.0
goenv rehash
go get github.com/peco/peco/cmd/peco
```
