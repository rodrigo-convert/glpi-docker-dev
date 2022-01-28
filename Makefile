.PHONY: build
build: ## Build all docker images. Build a specific image by providing the service name via: make build CONTAINER=<service>
	docker-compose -f docker-compose.yml build && \
	docker-compose up -d --force-recreate

.PHONY: up
up: ## Start all docker containers. To only start one container, use CONTAINER=<service>
	docker-compose up -d

.PHONY: down
down: ## Stop all docker containers. To only stop one container, use CONTAINER=<service>
	docker-compose down

.PHONY: ipaddress
ipaddress: ## Get IP address of all containers.
	docker network inspect -f '{{json .Containers}}' glpi_bridge | jq '.[] | .Name + ":" + .IPv4Address'
