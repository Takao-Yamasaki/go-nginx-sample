# go-nginx-sample
- nginxの設定ファイルの書き方を学ぶためのサンプルです

## 課題
- webコンテナ(nginx)からappコンテナ(Go)に転送されるように、`default.conf`を設定してください
- 成功すれば、`Demon Slayer!!`と表示されます
## エンドポイント
- Nginx
```
http://localhost:83
```
- Go
```
http://localhost:3006
```

## 課題の実施手順
1. webコンテナ(nginx)とappコンテナ(Go)を起動
```
make up
```
2.(ターミナルで別タブを開いた後)Goのプログラムを起動
```
make run
```
3.以下のURL(appコンテナ)にアクセスすると、`Demon Slayer!!`が表示されます
```
http://localhost:3006
```
4.以下のURL(webコンテナ)にアクセスすると、`502 Bad Gateway`とエラー表示されます
```
http://localhost:83
```
5.web/default.confを変更して、webコンテナ経由でappコンテナに転送するように設定します
6.設定ファイルの変更が終わったら、以下のコマンドでリロードしてみます
```
make reload
```
7.その他必要そうなコマンドについては、Makefileに記載していますので、ご参考までに
```
make help
```

## MEMO
- Goのサーバーは、今回触らないので、`Dockerfile`でビルドしておいて、サーバーを起動状態にしておけばいい
- `docker network`を確認して、使用しているIPアドレスを指定してもいい
- localなので、`Dockerfile`で設定ファイルを`COPY`せずとも、`compose.yaml`で`volume`を使って、設定ファイルを`reload`すればいい
