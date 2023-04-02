
DOCK_COM = sudo docker-compose
DOCK = sudo docker
USER = asaadi
RM = sudo /usr/bin/rm -rf
YML = ./srcs/docker-compose.yaml

all: setup build create_start

setup:
	@/bin/bash ./srcs/script.sh

build:
	@echo " ---->\033[1;34m\tBuilding images... \033[0m"
	@$(DOCK_COM) -f $(YML) build
	@echo " \033[1;32m\tdone\033[0m"

create_start:
	@echo " ---->\033[1;34m\tCreating and starting containers... \033[0m"
	@$(DOCK_COM) -f $(YML) up -d
	@echo " \033[1;32m\tdone\033[0m"
	

stop:
	$(DOCK_COM) -f $(YML) stop

restart:
	@echo " ---->\033[1;34m\tRestarting containers... \033[0m"
	@$(DOCK_COM) -f $(YML) restart
	@echo " \033[1;32m\tdone\033[0m"

display:
	@echo " ---->\033[1;34m\tDisplaying containers and images... \033[0m "
	@$(DOCK_COM) -f $(YML) ps -a
	@echo "\n"
	@$(DOCK_COM) -f $(YML) images
	@echo "\n"
	@sudo docker ps
	@echo "\n"
	@sudo docker images
	@echo " \033[1;32m\tdone\033[0m"

clean:
	@echo " ---->\033[1;34m\tStoping and removing containers, networks, images... \033[0m"
	@$(DOCK_COM) -f $(YML) down -v
	@$(DOCK_COM) -f $(YML) rm
	@echo "y" | $(DOCK) system prune -a
	@echo " \033[1;32m\tdone\033[0m"

fclean: clean
	@echo " ---->\033[1;34m\tRemoving host-volumes... \033[0m"
	@$(RM) ~/data/wp-data/*
	@$(RM) ~/data/db-data/*
	@$(RM) ~/data/influxdb-data/*
	@echo " \033[1;32m\tdone\033[0m"

re: fclean all