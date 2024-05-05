init:
	cp -i .env.example .env
	ln -i -s docker-compose.local.yml docker-compose.yml

init-prod:
	cp -i .env.example .env
	ln -i -s docker-compose.prod.yml docker-compose.yml

up:
	docker compose up -d

start: up

down:
	docker compose down --remove-orphans

stop: down

restart: stop start

logs:
	docker compose logs

tail:
	docker compose logs -f

laravel-logs:
	docker compose exec mixpost tail -f /var/www/html/storage/logs/laravel.log

login:
	docker compose exec mixpost bash

build:
	docker compose build --no-cache