all: 
	@docker-compose -f ./src/docker-compose.yml up -d --build

down:
	@docker-compose -f ./src/docker-compose.yml down

re: clean
	@docker-compose -f ./src/docker-compose.yml down
	@docker-compose -f ./src/docker-compose.yml up -d --build

volumes:
	mkdir -p /home/pvital-m/data/wp_data/;
	mkdir -p /home/pvital-m/data/db_data/;

clean:
	- sudo rm -rf /home/pvital-m/data/wp_data/*; sudo rm -rf /home/pvital-m/data/db_data/*;

fclean:
	- docker stop $$(docker ps -a -q)
	- docker rm $$(docker ps -a -q)
	- docker rmi $$(docker images -q)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $$(docker network ls -q)