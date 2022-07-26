COMP_DIR	=	srcs/docker-compose.yml
DOCK_COMP	=	docker compose

all: build

build: 
	@echo "Building local volume directories ..."
	@sudo mkdir -p /home/mchibane/data/wordpress
	@sudo mkdir -p /home/mchibane/data/mysql
	@echo "Building containers ..."
	@$(DOCK_COMP) -f $(COMP_DIR) --verbose up --build

stop:
	@echo "Stopping containers ..."
	@$(DOCK_COMP) -f $(COMP_DIR) stop 
	@echo "Containers stopped!"

clean: 	
	@echo "Stopping containers ..."
	@$(DOCK_COMP) -f $(COMP_DIR) down
	@echo "Deleting all containers, images, networks and volumes..."
	@docker system prune -a -f --volumes
	@echo "Deleting local volume directories ..."
	@sudo rm -rf /home/mchibane/data/wordpress
	@sudo rm -rf /home/mchibane/data/mysql
