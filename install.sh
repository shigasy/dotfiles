#!/bin/bash

# このスクリプトを実行している位置にカレントディレクトリが来る

deploy() {

  echo "deploy"

}

initialize() {

  echo "initialize"

}

# deploy or d
if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
# init or i
elif [ "$1" = "init" -o "$1" = "i" ]; then
    initalize
fi

# DOTPATHが空文字の場合、$HOMEが入る。DOTPATHに$HOMEを保存しない
DOTPATH=${DOTPATH:-$HOME/.dotfiles}
REPOSITORY=shigasy/dotfiles

echo $DOTPATH
echo "install...."