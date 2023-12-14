.PHONY: web app help
.DEFAULT_GOAL := help
web: ## webコンテナを起動
	docker compose up web
app: ## appコンテナを起動
	docker compose up app
up: ## webコンテナとappコンテナを起動
	docker compose up
reload: ## 設定ファイルの再読み込み(webコンテナのリビルド)
	docker compose up web --build
rebuild: ## webコンテナとappコンテナをリビルドして起動
	docker compose up --build
down: ## webコンテナとappコンテナを停止
	docker compose down
run: ## `go run`して表示確認
	docker compose exec -it app go run main.go
exec: ## appコンテナに接続
	docker compose exec -it app sh
help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
