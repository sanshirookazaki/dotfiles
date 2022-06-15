# .zshrc

# vim
alias vim='/usr/local/bin/vim'

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

# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history

# auto
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed

# alias
alias ls='lsd'
alias ll='lsd -al'
alias rm='rm -i'
alias cat='ccat -G Keyword="darkred" -G Decimal="darkblue" -G Plaintext="glay" -G Punctuation="blue" -G Type="green"'

# go
export GOPATH=$HOME/go:$HOME/.ghq
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

eval "$(pyenv init -)"

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

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^X' peco-cdr

# direnv
eval "$(direnv hook zsh)"

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(starship init zsh)"
