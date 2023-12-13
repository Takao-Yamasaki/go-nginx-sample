.PHONY: web app
web:
	docker compose up web
app:
	docker compose up app
up:
	docker compose up -d
exec:
	docker-compose exec -it app sh
run:
	docker-compose exec -it app go run main.go
