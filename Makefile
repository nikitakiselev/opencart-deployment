up:
	docker compose up -d

stop:
	docker compose down

restart:
	docker compose down && docker compose up -d

stats:
	docker compose stats

deploy:
	git fetch origin && \
	git reset --hard origin/master && \
	docker compose up --build -d

ssh:
	docker compose exec -w /web web bash

rebuild:
	docker compose down -v && \
	docker compose up -d --build