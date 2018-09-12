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

# setup
```
sh setup.sh
```
