# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
PATH=$PATH:$HOME/go/bin:/usr/local/go/bin

PS1="\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

if [ -f $HOME/.git.bash ]; then
    source $HOME/.git.bash
fi
if [ -f $HOME/.git.sh ]; then
    source $HOME/.git.sh
fi

