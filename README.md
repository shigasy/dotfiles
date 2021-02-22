# dotfiles
現在はmacのみで動くようになっているが、その他の環境でも動かせるようにしたい

動かすには`$HOME/dotfiles`を消す必要があり、もし変更したのなら`git push`した後にdotfilesを消す必要ありそう
```
curl -LSfs https://raw.githubusercontent.com/shigasy/dotfiles/main/install.sh | bash -s i
```
