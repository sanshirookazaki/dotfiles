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
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{red}localhost%f:%1(v|%F{cyan}%1v%f|) $ "
RPROMPT='[%F{green}%d%f]'

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
alias ls='gls --color=auto'
alias lg='lazygit'
alias l='ls'
alias ll='ls -l'
alias rm='rm -i'
alias cat='ccat -G Keyword="darkred" -G Decimal="darkblue" -G Plaintext="glay" -G Punctuation="blue" -G Type="green"'

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
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
export PATH="$PATH:$GOENV_ROOT/bin"
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

# Docker
export DOCKER_BUILDKIT=1
export BUILDKIT_HOST=tcp://0.0.0.0:1234

# k8s
export KUBE_EDITOR=vim
export KUBE_PS1_CTX_COLOR=yellow
export KUBE_PS1_NS_COLOR=magenta
source <(kubectl completion zsh)
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT

if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^X' peco-cdr

# gcp
export PATH=$PATH:$HOME/Downloads/google-cloud-sdk/bin

# direnv
eval "$(direnv hook zsh)"

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'
alias f='find . -type f | fzf --preview "highlight -O ansi -l {} || head -100 {} | head -100"'
alias vimf='vim $(f)'

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# podman
alias podman='podman --url "$CONTAINER_HOST"'
