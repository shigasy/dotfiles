# dotfiles
動かすには`$HOME/dotfiles`を消す必要がある。zsh関連などテキストの変更くらいなら、`git pull`で変更できる。もし、installからやり直したいときは消す。

### mac
```
curl -LSfs https://raw.githubusercontent.com/shigasy/dotfiles/main/install.sh | bash -s i
```

### linux
GCEは検証済み。gitは動かす前にインストールする必要がある。
curlやpythonなど、OSに近いAPIを使うから、Dockerの軽いimageとかは使えない

分岐が面倒だったから、インストールするファイルを分けた。
```
curl -LSfs https://raw.githubusercontent.com/shigasy/dotfiles/main/install_linux.sh | bash -s i
```

