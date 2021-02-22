#! /bin/env zsh

# functions
for func (${ZDOTDIR:-$HOME}/functions/*) source $func:a

# # zsh completion
# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi

# zsh site-functions
# fpath=(/usr/local/share/zsh/site-functions $fpath)

eval "$(nodenv init -)"
eval "$(starship init zsh)"