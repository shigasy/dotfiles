#! /bin/env zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zoptions
if [[ -s "${ZDOTDIR:-$HOME}/.zoptions" ]]; then
    source "${ZDOTDIR:-$HOME}/.zoptions"
fi

# functions
for func (${ZDOTDIR:-$HOME}/functions/*) source $func:a

# # zsh completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
alias cdd='fzf-cdr'
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    # ${変数名/置換前文字列/置換後文字列}
    # ~はcliでしか使えない。shellスクリプトは$HOMEを使うから置換が必要。
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

eval "$(nodenv init -)"
eval "$(starship init zsh)"