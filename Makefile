start:
	-  docker compose --env-file ./.env up

stop:
	- docker compose down