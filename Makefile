help:
	@echo "Commands:"
	@echo "  start			Build and run containers"
	@echo "  restart		Restart all containers"
	@echo "  stop			Stop all containers"
	@echo "  down			Stop and remove all containers"

start:
	@echo "Start all containers"
	docker compose --env-file=".env" --file=".docker/compose/docker-compose.yml" up -d 

restart:
	@echo "Restart all containers"
	docker compose --env-file=".env" --file=".docker/compose/docker-compose.yml" restart

stop:
	@echo "Stop all containers"
	docker compose --env-file=".env" --file=".docker/compose/docker-compose.yml" stop

down:
	@echo "Stop and remove all containers"
	docker compose --env-file=".env" --file=".docker/compose/docker-compose.yml" down
