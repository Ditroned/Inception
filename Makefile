SRCS 			=	./srcs
DOCKER			=	sudo docker
COMPOSE 		=	cd srcs/ && sudo docker-compose
DATA_PATH 		=	/home/ppizzo/data

all		:
			$(COMPOSE) build
			sudo mkdir -p $(DATA_PATH) $(DATA_PATH)/wordpress $(DATA_PATH)/database
			sudo chmod 777 /etc/hosts
			sudo echo "127.0.0.1 ppizzo.42.fr" >> /etc/hosts
			sudo echo "127.0.0.1 www.ppizzo.42.fr" >> /etc/hosts
			$(COMPOSE) up -d

fclean	:	clean
			$(DOCKER) system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			$(DOCKER) network prune --force
			echo docker volume rm $(docker volume ls -q)
			$(DOCKER) image prune --force

re		:	fclean all

.PHONY : all fclean re