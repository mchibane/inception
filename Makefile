COMPOSE = srcs/docker-compose.yml

all: run

run: 
	@echo "Building volume directories ..."
	@sudo mkdir -p ~/data/wordpress
	@sudo mkdir -p ~/data/mysql
	@echo "Building containers ..."
	@docker compose -f $(COMPOSE) --verbose up --build

up: 
	@echo "Building volume directories ..."
	@sudo mkdir -p /home/mchibane/data/wordpress
	@sudo mkdir -p /home/mchibane/data/mysql
	@echo "Building containers ..."
	@docker compose -f $(COMPOSE) up -d --build

#up: 
#	@echo "Building volume directories ..."
#	@sudo mkdir -p /home/mlebard/data/wordpress
#	@sudo mkdir -p /home/mlebard/data/mysql
#	@echo "Building containers ..."
#	@docker compose -f $(COMPOSE) --verbose up

clean: 	
	@echo "Stopping containers ..."
	@docker compose -f $(COMPOSE) down
	@docker system prune -a -f --volumes
	@sudo rm -rf ~/data/wordpress
	@sudo rm -rf ~/data/mysql
