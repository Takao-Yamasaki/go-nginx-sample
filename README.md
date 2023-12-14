# go-nginx-sample
- Nginxの設定ファイルの書き方を学ぶためのサンプルです

## 課題
- webコンテナ(Nginx)からappコンテナ(Go)に転送されるように、`default.conf`を設定してください

## エンドポイント
- Nginx
```
http://localhost:80
```
- Go
```
http://localhost:8080
```

## 起動方法
- webコンテナ(Nginx)とappコンテナ(Go)を起動するコマンドです
```
make up
```
- その他必要そうなコマンドはMakefileに記載していますので、以下のコマンドで確認してみてください
```
make help
```