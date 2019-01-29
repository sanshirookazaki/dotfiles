# .zshrc

# general
export LANG=ja_JP.UTF-8
export KCODE=u
autoload -Uz colors
colors
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
setopt print_eight_bit
setopt prompt_subst 
setopt ignoreeof
setopt combining_chars
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

# vcs
autoload -Uz vcs_info
# vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'    
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'  
# vcs_info call
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}    
#add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{blue}localhost%f:%1(v|%F{red}%1v%f|) $ "
RPROMPT='[%F{green}%d%f]'

# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history 

# auto
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed 

# alias
alias ls='gls --color=auto'
alias l='ls'
alias ll='ls -l'
alias rm='rm -i'

# go
export GOPATH=$HOME/go
PATH=$PATH:$HOME/go/bin:/usr/local/go/bin
# anyenv
if [ -d $HOME/.anyenv ] ; then
        export PATH="$HOME/.anyenv/bin:$PATH"
        eval "$(anyenv init -)"
        for D in `ls $HOME/.anyenv/envs`
        do
                export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
        done
fi
#goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

#pect
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src
bindkey '^P' peco-src
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# k8s 
export KUBE_EDITOR=vim
