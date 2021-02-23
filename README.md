# dotfiles
動かすには`$HOME/dotfiles`を消す必要がある。zsh関連などテキストの変更くらいなら、`git pull`で変更できる。もし、installからやり直したいときは消す。

### mac
```
curl -LSfs https://raw.githubusercontent.com/shigasy/dotfiles/main/install.sh | bash -s i
```

### linux
GCEのDebian系では検証済み。動かす前にGitをインストールする必要がある。
curlやpythonなど、OSに近いコマンドを使うからDockerなどの軽いimage内では使えない

分岐が面倒だったから、インストールするファイルを分けた。
```
curl -LSfs https://raw.githubusercontent.com/shigasy/dotfiles/main/install_linux.sh | bash -s i
```

