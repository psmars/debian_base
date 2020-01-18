# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/root/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
zstyle ':completion:*' menu select
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '→' && return
    echo '$'
}
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' stagedstr '%F{cyan}●'
zstyle ':vcs_info:*' unstagedstr '%F{red}●'
zstyle ':vcs_info:*' check-for-changes true
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{cyan}%b %c%u%F{cyan}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{cyan}%b %c%u%F{cyan}●%F{cyan}]'
    }
    vcs_info
}
# precmd () { vcs_info }
setopt prompt_subst
PROMPT="
%{%F{cyan}%}%n%{%f%}%F{gray}@%{%F{cyan}%}%m %{%F{red}%}%d %F{cyan}\$vcs_info_msg_0_
%f%}$(prompt_char) "
source ~/.alias
umask 22
