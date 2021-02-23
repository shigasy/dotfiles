#! /bin/env bash

# このスクリプトを実行している位置にカレントディレクトリが来る

deploy() {

  echo "deploy"

}

initialize() {

  echo "initialize"

}

DOTDIR=$HOME/.dotfiles
REPOSITORY=shigasy/dotfiles

# ===========================
# dotfilesがディレクトリとして存在するかチェック
# echo "Checking dotfiles..."
if [ -d "$DOTDIR" ]; then
    echo "$DOTDIR: already exists"
    exit 1
fi

# ===========================
# HomeBrewとzshのインストール
# macであり、type brew が実行出来なかったら
echo "Checking HomeBrew..."
if !(type brew > /dev/null 2>&1); then
  echo "Installing HomeBrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Installing zsh..."
  brew install zsh
fi
echo "Checked HomeBrew"

# ===========================
# gitインストール
# macであり、 and type git が実行出来なかったら（出力は捨てる）
echo "Checking Git..."
if !(type git > /dev/null 2>&1); then
  echo "Installing Git..."
  brew install git 2> /dev/null
fi
echo "Checked Git"

# ===========================
# dotfileを$DOTDIRにダウンロード
echo "Downloading dotfiles..."
git clone --recursive https://github.com/$REPOSITORY.git $DOTDIR
echo "Donwloaded dotfiles"

# ===========================
# シンボリックリンクを貼る
# zsh
ln -s $DOTDIR/zsh/.zshenv $HOME/.zshenv
# tig
ln -s $DOTDIR/tig/.tigrc $HOME/.tigrc
# vim
ln -s $DOTDIR/vim/.vimrc $HOME/.vimrc

# deploy or d
if [ "$1" = "deploy" -o "$1" = "d" ]; then
    deploy
# init or i
elif [ "$1" = "init" -o "$1" = "i" ]; then
    initialize
fi

# ===========================
# brew install
echo "Installing package..."
cat $DOTDIR/brew | while read package
do
  brew install $package
done
echo "installed package"


# ===========================
# cask install
echo "Installing macOS apps..."
cat $DOTDIR/cask | while read app
do
  brew install $app
done
echo "Installed macOS apps"

# sh -c とは
## cmdstring をシェルの入力行であるかのように実行し、次に終了 します。これは、単一コマンドのためにシェルを呼び出す プログラム (例えば、エディター) によって使用されます。

# change shell
# /etc/shelss とは 
## ログインシェルにできるプログラムをフルパスで記述する。ここに登録されていないプログラムをログインシェルにすることはできない。
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
# ログインshell 切り替え
sudo chsh -s /usr/local/bin/zsh

echo "finish"