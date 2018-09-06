# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export GOPATH=$HOME/go
# User specific aliases and functions
PATH=$PATH:$HOME/go/bin:/usr/local/go/bin

PS1="\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

if [ -f $HOME/.git.bash ]; then
    source $HOME/.git.bash
fi
if [ -f $HOME/.git.sh ]; then
    source $HOME/.git.sh
fi

function repo {
    pushd $GOPATH/src
    local dir="$( ls -1d */*/* | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    else
        popd
    fi
}
bind -x '"\C-p": repo'

if [ -d $HOME/.anyenv ] ; then
        export PATH="$HOME/.anyenv/bin:$PATH"
        eval "$(anyenv init -)"
        for D in `ls $HOME/.anyenv/envs`
        do
                export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
        done
fi


