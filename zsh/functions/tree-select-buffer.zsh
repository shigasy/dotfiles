# ref: https://petitviolet.hatenablog.com/entry/20190708/1562544000
# treeの一覧からheadしながらファイルを選択する
function tree_select() {
  tree -N -a --charset=o -f -I '.git|.idea|resolution-cache|target/streams|node_modules' |
    fzf --preview 'f() {
      set -- $(echo -- "$@" | grep -o "\./.*$");
      if [ -d $1 ]; then
        ls -lh $1
      else
        head -n 100 $1
      fi
    }; f {}' |
    sed -e "s/ ->.*\$//g" |
    tr -d '\||`| ' |
    tr '\n' ' ' |
    sed -e "s/--//g" |
    xargs echo
}

# treeで選択したファイル名を入力する
function tree_select_buffer() {
  local SELECTED_FILE=$(tree_select)
  if [ -n "$SELECTED_FILE" ]; then
    LBUFFER+="$SELECTED_FILE"
    CURSOR=$#LBUFFER
    zle reset-prompt
  fi
}
zle -N tree_select_buffer
bindkey "^t" tree_select_buffer

# treeから選択したファイルをvimで開く
function open_from_tree_vim() {
  local selected_file=$(tree_select)
  if [ -n "$selected_file" ]; then
    BUFFER="vim $selected_file"
  fi
  zle accept-line
}
zle -N open_from_tree_vim
bindkey "^v^t" open_from_tree_vim
