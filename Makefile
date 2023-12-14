.PHONY: web app help
.DEFAULT_GOAL := help
web: ## webコンテナを起動
	docker compose up web
app: ## appコンテナを起動
	docker compose up app
up: ## webコンテナとappコンテナを起動
	docker compose up
rebuild: ## webコンテナとappコンテナをリビルドして起動
	docker compose up --build
exec: ## appコンテナに接続
	docker-compose exec -it app sh
run: ## go runする(確認用)
	docker-compose exec -it app go run main.go
help: ## ヘルプを表示する
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
