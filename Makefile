.PHONY: web app help
.DEFAULT_GOAL := help
web: ## webコンテナをリビルド
	docker compose up web --build
app: ## appコンテナをリビルド
	docker compose up app --build
up: ## webコンテナとappコンテナを起動してGoを起動
	docker compose up
ps: ## コンテナのステータスを確認
	docker compose ps
rebuild: ## webコンテナとappコンテナをリビルドして起動
	docker compose up --build
down: ## webコンテナとappコンテナを停止
	docker compose down
run: ## `go run`して表示確認
	docker compose exec -it app go run main.go
exec: ## appコンテナに接続
	docker compose exec -it app sh
test: ## 設定ファイルの構文チェック(nginxコンテナが起動した状態でないと使えない)
	docker compose exec -it web nginx -t
copy: ##設定ファイルをコンテナにコピー(nginxコンテナが起動した状態でないと使えない)
	docker cp ./web/default.conf go-nginx-sample-web-1:/etc/nginx/conf.d/default.conf
conf-reload: ## 設定ファイルの読み込み(nginxコンテナが起動した状態でないと使えない)
	docker compose exec -it web nginx -s reload
reload: ##設定ファイルをコンテナにコピーして再読み込み
	make copy && make conf-reload
network: ## ネットワークの一覧を表示
	docker network ls
inspect: ## ネットワークの詳細を表示
	docker network inspect go-nginx-sample_default
help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
