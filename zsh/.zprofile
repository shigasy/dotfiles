#! /bin/env zsh

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# fzf
if (( $+commands[fzf] )); then
    export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
    export FZF_COMPLETION_OPTS='+c -x'

    # Use ag instead of the default find command for listing candidates.
    # - The first argument to the function is the base path to start traversal
    # - Note that ag only lists files not directories
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
        ag -g "" "$1"
    }
fi

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    $path
)

# openssl
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
# brew
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
