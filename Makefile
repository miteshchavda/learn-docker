APP_NAME=$(shell basename $(CURDIR))
DEST_NOTEBOOK_PATH="/home/notebooks"

create_network:
	docker network create -d bridge my-local-network

build:
	docker build -t $(APP_NAME) -f Dockerfile .

up: build
	docker run -it -p 8888:8888 -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) ${ARG}

down:
	docker stop $(APP_NAME)

shell: build
	docker run -it -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) bash

notebook: build
	docker run -it --network my-local-network -p 8888:8888 --env-file .env -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) jupyter lab --no-browser --ip 0.0.0.0 --port 8888  --allow-root /home/notebooks

build_postgres:
	docker pull postgres:12.2-alpine

start_local_db: build_postgres
	docker run -it --rm -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword --env-file .env --network my-local-network postgres:12.2-alpine
