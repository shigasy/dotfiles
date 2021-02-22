#!/bin/bash

# このスクリプトを実行している位置にカレントディレクトリが来る

deploy() {

  echo "deploy"

}

initialize() {

  echo "initialize"

}

DOTDIR=$HOME/.dotfiles
REPOSITORY=shigasy/dotfiles

# HomeBrewとzshのインストール
# macであり、type brew が実行出来なかったら
if [[ $(uname) == 'Darwin' && ! -x $(type brew > /dev/null 2>&1) ]]; then
  echo "Installing HomeBrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install zsh
fi

# gitインストール
# macであり、 and type git が実行出来なかったら 出力は捨てる
if [[ $(uname) == 'Darwin' && ! -x $(type git > /dev/null 2>&1) ]] ; then
  echo "Downloading Git..."
  brew install git 2> /dev/null
fi

# dotfileを$DOTDIRにダウンロード
echo "Downloading dotfiles..."
git clone --recursive https://github.com/$REPOSITORY.git $DOTDIR

# deploy or d
if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
# init or i
elif [ "$1" = "init" -o "$1" = "i" ]; then
    initialize
fi



echo "install..."